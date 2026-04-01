FROM mcr.microsoft.com/azureml/minimal-py312-inference:latest

USER root

RUN apt-get update -y && apt-get install -y libxcb1

USER dockeruser

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN --mount=type=cache,target=/home/dockeruser/.cache/pip,uid=1000,gid=1000 pip install azureml-inference-server-http==1.5.1 'gunicorn<25.1' opencv-python-headless~=4.6.0 &&\
    pip install torch==2.11.0 torchvision==0.26.0 --index-url https://download.pytorch.org/whl/cpu &&\
    pip install ultralytics==8.4.31  --no-deps
