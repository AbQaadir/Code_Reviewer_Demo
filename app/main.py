from fastapi import FastAPI
from app.database import engine, Base
from app.routers import project

# Create database tables
Base.metadata.create_all(bind=engine)

# FastAPI app
app = FastAPI()

# Root endpoint
@app.get("/")
async def root():
    return {"message": "Database connection API is up and running"}

# Include routers
app.include_router(project.router)
