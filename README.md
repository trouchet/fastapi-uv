# FastAPI + Docker + UV

This is a minimal FastAPI project to test the usage of library `uv` for instalation of other packages inside a Docker container.

## 🚀 Features
- FastAPI server
- Docker support with a `Dockerfile`
- Optional `docker-compose.yml` for easier container management

## 📂 Project Structure
```
fastapi-uv-test/
│── main.py
│── Dockerfile
│── docker-compose.yml
│── README.md
```

## 🛠️ Installation and Usage

### 1️⃣ **Build and Run with Docker**
#### **Without Docker Compose**
```bash
docker build -t fastapi-uv .
docker run -p 8000:8000 fastapi-uv-test
```

#### **With Docker Compose**
```bash
docker-compose up --build
```

### 2️⃣ **Access the API**
After starting the container, visit:
- **FastAPI Root Endpoint:** [http://localhost:8000/](http://localhost:8000/)

Or test using `curl`:
```bash
curl http://localhost:8000/
```

Expected response:
```json
{"message": "FastAPI is running!"}
```

## 📜 Files Overview

<details>
<summary>

</summary>

### `main.py`
Minimal FastAPI app that verifies `uv` installation:
```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    return {"message": "FastAPI is running!"}
```

### `requirements.txt`
Lists dependencies for installation:
```
fastapi
uv
uvicorn
```

### `Dockerfile`
Defines how to build the FastAPI app with `uv` installed:
```dockerfile
FROM python:3.10-slim
WORKDIR /app
RUN pip install uv
COPY . .
RUN uv sync
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

```

### `docker-compose.yml` (Optional)

Allows easier management of the container:
```yaml
version: "3.8"
services:
  fastapi-app:
    build: .
    ports:
      - "8000:8000"
```

</details>

## 📌 Notes

- Ensure **Docker** and **Docker Compose** are installed on your system.
- Modify the `Dockerfile` as needed.

## 🛠️ Troubleshooting

### "ModuleNotFoundError: No module named 'uv'"

- Rebuild the container: `docker-compose up --build` or `docker build -t fastapi-uv .`

## 🏆 Contributing
Feel free to open issues or contribute improvements to this project!
