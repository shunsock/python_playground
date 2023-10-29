import os

import sentry_sdk
from dotenv import load_dotenv


def sentry_init() -> None:
    """
    Initialize Sentry SDK.

    When you run this function, it will raise a ZeroDivisionError.
    Sentry will capture the error and send it to your Sentry project.
    """
    load_dotenv()
    sentry_sdk.init(
        dsn=os.getenv("SENTRY_DSN"),
        # Set traces_sample_rate to 1.0 to capture 100%
        # of transactions for performance monitoring.
        traces_sample_rate=1.0,
        # Set profiles_sample_rate to 1.0 to profile 100%
        # of sampled transactions.
        # We recommend adjusting this value in production.
        profiles_sample_rate=1.0,
    )
    division_by_zero = 1 / 0
    sentry_sdk.flush()  # for pass all events to sentry
    return


def hello() -> str:
    """
    A simple function that returns a string.

    Parameters
    ----------
    None

    Returns
    -------
    str
    """
    return "Hello, world!"
