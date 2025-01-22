from sqlalchemy import Column, Integer, String, Text, ForeignKey, TIMESTAMP
from app.database import Base

class Project(Base):
    __tablename__ = "projects"

    project_id = Column(Integer, primary_key=True, index=True)
    applicant_id = Column(Integer, ForeignKey("applicants.applicant_id"), nullable=False)
    project_name = Column(String(100), nullable=False)
    project_path = Column(String(255), nullable=False)
    description = Column(Text, nullable=True)
    created_at = Column(TIMESTAMP)
