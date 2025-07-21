from ..firebase_init import Firebase
#python -m db.models.user

class UserModel:
    def __init__(self):
        db = Firebase().db
        self.collection = db.collection('users')
    
    def create_user(self, data: dict):
        _, doc_ref = self.collection.add(data)
        return doc_ref.id
    
    def query_user_all(self):
        return [{**doc.to_dict(), "id": doc.id} for doc in self.collection.stream()]
    
    def query_user_by_id(self, user_id: str):
        doc = self.collection.document(user_id).get()
        return doc.to_dict() if doc.exists else None
    
    def update_user(self, user_id, updates):
        self.collection.document(user_id).update(updates)
        
    def delete_user(self, user_id):
        self.collection.document(user_id).delete()
  
# user = UserModel()
# user.create_user({
#     'name': 'ox', 
#     'age': 12
# })
# print(user.query_user_all())
# [{'name': 'ox', 'age': 12, 'id': '0U4vly6rQQh6WHZYfiuu'}, ...]
