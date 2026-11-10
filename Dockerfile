FROM python:3.12-slim

WORKDIR /app

# 安装必要的系统工具与依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends procps bash curl openssl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py index.html ./

# 设置默认监听端口
ENV PORT=3000
EXPOSE 3000

# 强制通过 python3 启动
CMD ["python3", "app.py"]
