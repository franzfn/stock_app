FROM python:3.9.9-slim
WORKDIR /app
# ADD . ./
# COPY . /app
ADD requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
# EXPOSE 80
EXPOSE 2222 80
RUN mkdir ~/.streamlit
RUN cp .streamlit/config.prod.toml ~/.streamlit/config.toml
RUN cp .streamlit/credentials.prod.toml ~/.streamlit/credentials.toml
WORKDIR /app
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]