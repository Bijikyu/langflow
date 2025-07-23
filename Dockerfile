FROM langflowai/langflow:latest

ENV PORT=7860
EXPOSE 7860

ENTRYPOINT ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
