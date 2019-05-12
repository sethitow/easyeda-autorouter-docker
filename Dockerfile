FROM debian:stretch

RUN apt-get update && \
	apt-get install -y unzip wget && \
    wget https://image.easyeda.com/files/EasyEDA-Router-v0.8.10.zip && \
    unzip -d autorouter EasyEDA-Router-v0.8.10.zip && \
    sed -i s^127.0.0.1^0.0.0.0^g autorouter/config/local/main.json && \
    chmod +x autorouter/lin64.sh

WORKDIR autorouter 

EXPOSE 3579
CMD ["./lin64.sh"]
