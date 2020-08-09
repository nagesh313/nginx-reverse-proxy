FROM nginx
USER root
COPY --from=openjdk:8-jdk-alpine / /
VOLUME /tmp
RUN curl -L https://github.com/nagesh313/nginx-reverse-proxy/releases/download/1.0.0/admin-0.0.1-SNAPSHOT.jar >> admin.jar
RUN curl -L https://github.com/nagesh313/nginx-reverse-proxy/releases/download/1.0.0/service-0.0.1-SNAPSHOT.jar >> service.jar
RUN curl -L https://raw.githubusercontent.com/nagesh313/nginx-reverse-proxy/master/start-services.sh >> start-services.sh 
COPY start-services.sh start-services.sh
# RUN rm -rf /build
RUN curl -Ls https://github.com/nagesh313/nginx-reverse-proxy/releases/download/1.0.0/multiservice-react-app.tar.gz | tar -xz --directory /usr/share/nginx/html
RUN curl -L https://raw.githubusercontent.com/nagesh313/nginx-reverse-proxy/master/nginx.conf >> nginx.conf 
COPY nginx.conf /etc/nginx/nginx.conf
RUN ["chmod", "777", "start-services.sh"]
# COPY *.jar /
RUN ls
RUN useradd nginx
USER root
# RUN  ["sh", "start-services.sh"]
ENTRYPOINT ["./start-services.sh"]
# COPY --from=nginx / /
