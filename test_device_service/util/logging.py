"""helper function to configure logging"""

import sys
from logging import basicConfig

from test_device_service import config


def configure_logging() -> None:
    """helper function to configure logging"""
    log_format = "[%(asctime)s] [%(levelname)s] [%(name)s] %(message)s"
    log_datefmt = "%Y-%m-%d %H:%M:%S %z"
    log_level = config.LOG_LEVEL

    basicConfig(stream=sys.stdout, level=log_level, format=log_format, datefmt=log_datefmt)
