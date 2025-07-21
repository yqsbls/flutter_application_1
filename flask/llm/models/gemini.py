from google import genai
from google.genai import types
from enum import Enum
from .base import BaseLLMClient

class GeminiModel(str, Enum):
    GEMINI_PRO = "gemini-pro"

class Gemini(BaseLLMClient):
    def __init__(self, api_key: str, model: str):
        super().__init__(api_key, model)
        self.client = genai.Client(api_key, http_options=types.HttpOptions(api_version='v1alpha'))
    
    def generate(self, prompt: str) -> types.GenerateContentResponse:
        response = self.client.models.generate_content(
            model=self.model, contents=prompt
        )
        return response