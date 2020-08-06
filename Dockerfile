FROM nginx
COPY --from=openjdk:8-jdk-alpine / /
VOLUME /tmp
COPY start-services.sh start-services.sh
RUN rm -rf /usr/share/nginx/html/*
COPY /build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
RUN ["chmod", "777", "start-services.sh"]
COPY target/*.jar /
RUN  useradd nginx
# RUN  ["sh", "start-services.sh"]
ENTRYPOINT ["./start-services.sh"]

# COPY --from=nginx / /
