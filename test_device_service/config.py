import logging

from starlette.config import Config

config = Config()

DEBUG = config("DEBUG", cast=bool, default=False)
LOG_LEVEL = logging.DEBUG if DEBUG else logging.INFO
