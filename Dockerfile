FROM java:7

RUN apt-get update && apt-get install -y wget git curl zip && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/traccar/

WORKDIR /usr/share/traccar/

RUN https://github.com/tananaev/traccar/releases/download/v3.2/traccar-windows-64-3.2.zip

RUN unzip traccar-windows-64-3.2.zip

RUN ./traccar.run

#RUN /opt/traccar/bin/traccar start

VOLUME /opt/traccar/conf

EXPOSE 8080

ENTRYPOINT /opt/traccar/bin/traccar start && tail -f /opt/traccar/logs/tracker-server.log
