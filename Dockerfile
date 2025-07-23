# ─── Use the official prebuilt Langflow image ─────────────────────────────
FROM langflowai/langflow:latest

# ─── Tell Render which port we’ll use ────────────────────────────────────
ENV PORT=7860
EXPOSE 7860

# ─── Launch Langflow bound to all interfaces ─────────────────────────────
ENTRYPOINT ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
