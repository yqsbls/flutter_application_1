from abc import ABC, abstractmethod

class BaseLLMClient(ABC):
    def __init__(self, api_key: str, model: str):
        self.api_key = api_key
        self.model = model

    @abstractmethod
    def generate(self, prompt: str):
        pass
