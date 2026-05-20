from fastapi import FastAPI
from datetime import datetime, timezone
import os

app = FastAPI(title="LineTen SRE Assessment")

APP_VERSION = os.getenv("APP_VERSION", "1.0.0")


@app.get("/")
def root():
    return {
        "message": "Hello LineTen",
        "service": "lineten-sre-assessment",
        "version": APP_VERSION,
        "status": "running"
    }


@app.get("/health")
def health():
    return {
        "status": "healthy",
        "timestamp": datetime.now(timezone.utc).isoformat()
    }


@app.get("/ready")
def ready():
    return {
        "status": "ready"
    }


@app.get("/version")
def version():
    return {
        "version": APP_VERSION
    }
