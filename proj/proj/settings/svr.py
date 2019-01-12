from .defaults import *

DEBUG = True

DATABASES = {
    'default': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'sa',
        'USER': 'sa',
        'PASSWORD': 'Password-123',
        'HOST': 'mssql',
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 13 for SQL Server',
        },
    },
}