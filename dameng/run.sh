#!/bin/sh

# 安装 License
if [[ -r $DM_KEY_PATH ]]; then
  # 备份旧的 key 文件
  if [[ -f /opt/dmdbms/bin/dm.key ]]; then
    mv -v /opt/dmdbms/bin/dm.key{,.bak}
  fi
  cp -v $DM_KEY_PATH /opt/dmdbms/bin/dm.key
fi

DB_PATH="/data"
if [[ -z $DB_NAME ]]; then
  DB_NAME="DAMENG"
fi

args="PATH=${DB_PATH}"
if [[ -n $DM_CHARSET ]]; then
  args=$args" CHARSET=${DM_CHARSET}"
fi
if [[ -n $DM_SYSDBA_PWD && ${#DM_SYSDBA_PWD} -ge 6 ]]; then
  args=$args" SYSDBA_PWD=${DM_SYSDBA_PWD}"
fi
if [[ -n $DM_SYSAUDITOR_PWD && ${#DM_SYSAUDITOR_PWD} -ge 6 ]]; then
  args=$args" SYSAUDITOR_PWD=${DM_SYSAUDITOR_PWD}"
fi
if [[ -n $DM_DB_NAME ]]; then
  args=$args" DB_NAME=${DM_DB_NAME}"
fi
if [[ -n $DM_INSTANCE_NAME ]]; then
  args=$args" INSTANCE_NAME=${DM_INSTANCE_NAME}"
fi
if [[ -n $DM_SYSSSO_PWD && ${#DM_SYSSSO_PWD} -ge 6 ]]; then
  args=$args" SYSSSO_PWD=${DM_SYSSSO_PWD}"
fi
if [[ -n $DM_SYSDBO_PWD && ${#DM_SYSDBO_PWD} -ge 6 ]]; then
  args=$args" SYSDBO_PWD=${DM_SYSDBO_PWD}"
fi
if [[ -n $DM_TIME_ZONE ]]; then
  args=$args" TIME_ZONE=${DM_TIME_ZONE}"
fi

cd /opt/dmdbms/bin
if [[ -f "${DB_PATH}/${DB_NAME}/dm.ini" ]]; then
  # 数据库已经初始化过了
  echo "db has inited"
else
  # 初始化数据库
  chown -Rv dmdba:dinstall /data
  echo dminit $args
  ./dminit $args
fi

# 启动数据库
./dmserver path="${DB_PATH}/${DB_NAME}/dm.ini"
