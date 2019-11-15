FROM wusuopu/dameng:dm8-base

COPY ./run.sh /

VOLUME ["/data"]

EXPOSE 5236

    # 字符集选项。0 代表 GB18030,1 代表 UTF-8,2 代表韩文字符集 EUC-KR
ENV DM_CHARSET=1 \
    #初始化时设置 SYSDBA 的密码，默认为 SYSDBA
    DM_SYSDBA_PWD="" \
    # 初始化时设置 SYSAUDITOR 的密码， 默认为 SYSAUDITOR
    DM_SYSAUDITOR_PWD="" \
    # 初始化数据库名字，默认是 DAMENG
    DM_DB_NAME="" \
    # 初始化数据库实例名字，默认是 DMSERVER
    DM_INSTANCE_NAME="" \
    # 初始化时设置 SYSSSO 的密码，默认为 SYSSSO
    DM_SYSSSO_PWD="" \
    # 初始化时设置 SYSDBO 的密码，默认为 SYSDBO
    DM_SYSDBO_PWD="" \
    # 初始化时区
    DM_TIME_ZONE="00:00" \
    # dm.key 的文件路径，留空则为试用版
    DM_KEY_PATH=""


CMD ["bash", "/run.sh"]
