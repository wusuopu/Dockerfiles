#!/usr/bin/env python
# encoding: utf-8

import subprocess
import os
import sys
import datetime
import time
import cron


def mysqldump(output):
    host = os.environ.get('MYSQL_HOST', '')
    port = os.environ.get('MYSQL_PORT', '3306')
    user = os.environ.get('MYSQL_USER')
    password = os.environ.get('MYSQL_PASSWORD')
    dump_options = os.environ.get('MYSQL_DUMP_OPTIONS') or ''
    db = os.environ.get('MYSQL_DB')
    if not host or not user or not password or not db:
        print('缺少 mysql 环境变量配置')
        exit(1)
    cmd = 'mysqldump --host %s --port %s -u%s -p%s %s %s > %s' % (
        host, port, user, password, dump_options, db, output
    )
    print(cmd)
    p = subprocess.Popen(
        cmd, shell=True,
        stderr=subprocess.PIPE
    )
    ret = p.wait()
    if ret != 0:
        error = p.stderr.read()
        raise Exception(error)
    print('dump %s successfully to: %s' % (db, output))


def upload(filename):
    key = os.environ.get('ALI_ACCESS_KEY_ID')
    secret = os.environ.get('ALI_ACCESS_KEY_SECRET')
    region = os.environ.get('ALI_REGION')
    bucket = os.environ.get('ALI_BUCKET')
    if not key or not secret or not region or not bucket:
        print('缺少 oss 环境变量配置')
        exit(1)

    with open('/tmp/oss-config', 'w') as fp:
        fp.write('[Credentials]\nlanguage=EN\naccessKeyID=%s\naccessKeySecret=%s\nendpoint=http://%s.aliyuncs.com' % (
            key, secret, region
        ))
    p = subprocess.Popen(
        'gzip %s' % (filename), shell=True,
        stderr=subprocess.PIPE
    )
    ret = p.wait()
    if ret != 0:
        print('compress error')
        exit(1)

    src_file = '%s.gz' % (filename)
    dst_file = '/backup/db/%s.gz' % (os.path.basename(filename))
    cmd = 'ossutil64 cp %s oss://%s%s -c /tmp/oss-config' % (
        src_file, bucket, dst_file
    )
    print(cmd)
    p = subprocess.Popen(
        cmd, shell=True,
        stderr=subprocess.PIPE
    )
    ret = p.wait()
    if ret != 0:
        error = p.stderr.read()
        raise Exception(error)
    print('upload successfully')
    os.unlink(src_file)


def run():
    date = datetime.datetime.now().strftime('%Y%m%d%H%M')
    filename = '%s.sql' % (date)
    output = os.path.join('/tmp', filename)
    mysqldump(output)
    upload(output)


def run_schedule(CRON):
    while True:
        minutes = cron.diff(CRON)
        print('sleep: %s minutes' % (minutes))
        time.sleep(minutes * 60)
        print('start task', datetime.datetime.now())
        run()
        time.sleep(60)


def main():
    if len(sys.argv) > 1 and sys.argv[1] == '--no-cron':
        run()
        return

    CRON = os.environ.get('CRON')
    if not CRON:
        print('miss CRON env')
        return

    run_schedule(CRON)


if __name__ == '__main__':
    main()
