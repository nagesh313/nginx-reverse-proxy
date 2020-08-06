FROM nginx
COPY --from=openjdk:8-jdk-alpine / /
VOLUME /tmp
RUN rm -rf /usr/share/nginx/html/*
COPY multiservice-react-app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY service/start-services.sh start-services.sh
RUN ["chmod", "777", "start-services.sh"]
COPY service/target/*.jar service.jar
COPY admin/target/*.jar admin.jar
RUN  useradd nginx
ENTRYPOINT ["./start-services.sh"]
