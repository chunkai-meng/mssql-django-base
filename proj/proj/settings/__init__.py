from .defaults import *

DATABASES = {
    'default': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'qif',
        'USER': 'sa',
        'PASSWORD': 'Password-123',
        'HOST': '',
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    },
}