FROM python:3.10

ENV directory /new_directory

WORKDIR $directory

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["python", "main.py"]