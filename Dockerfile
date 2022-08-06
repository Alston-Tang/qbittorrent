FROM ubuntu:22.04
RUN apt update
RUN apt install -y software-properties-common dumb-init
RUN add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
RUN apt install -y qbittorrent-nox
COPY docker-qbittorrent/qBittorrent.conf /default/qBittorrent.conf
COPY docker-qbittorrent/entrypoint.sh /
RUN chmod go+x /entrypoint.sh

ENTRYPOINT ["dumb-init", "/entrypoint.sh"]
CMD ["qbittorrent-nox", "--profile=/"]

