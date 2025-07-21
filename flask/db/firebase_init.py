from firebase_admin import credentials, firestore
import firebase_admin
from google.cloud.firestore import Client
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

class Firebase:
    _instance = None
    _db: Client
    
    def __new__(cls):
        if cls._instance is None:
            key_path = os.path.join(BASE_DIR, 'firebase_key.json')
            cred = credentials.Certificate(key_path)
            firebase_admin.initialize_app(cred)
            cls._instance = super().__new__(cls)
            cls._instance._db = firestore.client() 
        return cls._instance
    
    @property
    def db(self) -> Client:
        return self._db
