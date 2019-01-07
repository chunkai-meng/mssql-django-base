FROM ubuntu:16.04
# 中国特色，国外用回上一个
# FROM longminxiang/ubuntu:16.04

RUN apt-get update &&\
    apt-get --yes install python3 python3-pip libmysqlclient-dev curl apt-transport-https vim &&\
    apt-get clean &&\
    apt-get autoclean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    rm -f /usr/bin/python /usr/bin/pip &&\
    ln -s /usr/bin/python3 /usr/bin/python &&\
    ln -s /usr/bin/pip3 /usr/bin/pip &&\
    pip install --upgrade pip

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - &&\
    curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list &&\
    apt-get update &&\
    ACCEPT_EULA=Y apt-get --yes install msodbcsql=13.0.1.0-1 mssql-tools=14.0.2.0-1 locales unixodbc-dev-utf16 &&\
    ln -sfn /opt/mssql-tools/bin/sqlcmd-13.0.1.0 /usr/bin/sqlcmd &&\
    ln -sfn /opt/mssql-tools/bin/bcp-13.0.1.0 /usr/bin/bcp &&\
    apt-get clean &&\
    apt-get autoclean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    locale-gen en_US.UTF-8 &&\
    update-locale LANG=en_US.UTF-8

ENV PROJECT_NAME proj

COPY ./$PROJECT_NAME/requirements.txt /home/$PROJECT_NAME/

RUN (pip install -r /home/$PROJECT_NAME/requirements.txt)

EXPOSE 8888
