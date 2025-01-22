from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import select
from app.database import get_db
from app.models.project import Project

router = APIRouter()

# Endpoint to get project paths for a specific applicant_id
@router.get("/applicant/{applicant_id}/projects")
async def get_project_paths(applicant_id: int, db: Session = Depends(get_db)):
    try:
        # Query the projects table for the given applicant_id
        query = select(Project.project_path).where(Project.applicant_id == applicant_id)
        result = db.execute(query).fetchall()

        if not result:
            raise HTTPException(status_code=404, detail="No projects found for the given applicant_id")

        # Extract project paths from the result
        project_paths = [row[0] for row in result]
        return {"applicant_id": applicant_id, "project_paths": project_paths}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
