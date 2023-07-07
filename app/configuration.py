import os
from pathlib import Path

from dotenv import load_dotenv
from sqlalchemy import URL

base_dir = Path(__file__).absolute().parent.parent
load_dotenv(dotenv_path=base_dir / '.env')

class Config:
    ENV = os.getenv('ENV')

    # Directories
    BASE_DIR = base_dir
    DATA_DIR = BASE_DIR / 'temp'

    # Databases
    tpch_database = URL.create(
        'postgresql',
        username=os.getenv('pg_user'),
        password=os.getenv('pg_pw'),
        host=os.getenv('host'),
        database='TPC-H',
        )
    