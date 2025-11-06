from pydantic import BaseModel
from typing import Optional

class TaskBase(BaseModel):
    title: str
    description: Optional[str] = None

class TaskCreate(TaskBase):
    pass

class TaskUpdate(BaseModel):
    title: Optional[str]
    description: Optional[str]
    done: Optional[bool]

class Task(TaskBase):
    id: int
    done: bool

    class Config:
        orm_mode = True
