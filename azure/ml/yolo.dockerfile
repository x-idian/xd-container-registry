FROM mcr.microsoft.com/azureml/minimal-py312-inference:latest

RUN pip install numpy pip ultralytics>=8.4.31
