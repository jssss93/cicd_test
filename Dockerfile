FROM ubuntu:22.10
USER root
#RUN apt-get update -qq \
#    && apt-get install -qq -y software-properties-common uidmap \
#    && add-apt-repository -y ppa:projectatomic/ppa \
#    && apt-get update -qq \
#    && apt-get -qq -y install podman \
#    && apt-get install -y iptables \ 
#    &&rm -rf /var/lib/apt/lists/*
RUN apt -y update
RUN apt -y install podman


#RUN mkdir -p /home/jenkins
#RUN useradd jenkins
RUN echo root:100000:65536 >/etc/subuid
RUN echo root:100000:65536 >/etc/subgid
#USER jenkins


ENTRYPOINT ["podman", "--storage-driver=vfs"]
CMD ["info"]

#docker tag podman:1.0.0 nexus.dspace.kt.co.kr/icis/podman-agent:1.1.0 
#docker push nexus.dspace.kt.co.kr/icis/podman-agent:1.1.0 

