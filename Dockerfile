FROM  python:3.9.16-alpine as build

WORKDIR /data

COPY . .

RUN pip install -r requirements.txt

RUN mkdocs build

FROM nginx:alpine-slim

COPY --from=build /data/site /usr/share/nginx/html
