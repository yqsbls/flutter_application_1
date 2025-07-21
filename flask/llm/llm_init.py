from .models.base import BaseLLMClient

class LLM:
    def __init__(self, model: BaseLLMClient):
        self.model = model
        
    def generate(self, prompt: str):
        return self.model.generate(prompt)