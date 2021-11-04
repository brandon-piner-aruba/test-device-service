from fastapi import FastAPI

from test_device_service import config
from test_device_service.api.router import router
from test_device_service.util.logging import configure_logging


def create_app() -> FastAPI:
    configure_logging()

    app = FastAPI()
    app.debug = config.DEBUG

    # Set up routes
    app.include_router(router)

    return app


app = create_app()
