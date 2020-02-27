FROM ubuntu:18.04

EXPOSE 18232

RUN apt-get update

RUN apt-get -y install wget

WORKDIR /usr/src

RUN wget https://github.com/dashpay/dash/releases/download/v0.15.0.0/dashcore-0.15.0.0-x86_64-linux-gnu.tar.gz
RUN tar -xzvf dashcore-0.15.0.0-x86_64-linux-gnu.tar.gz
RUN chmod +x dashcore-0.15.0/bin/dashd dashcore-0.15.0/bin/dash-cli
RUN ln -s /usr/src/dashcore-0.15.0/bin/dashd /usr/bin/dashd
RUN ln -s /usr/src/dashcore-0.15.0/bin/dash-cli /usr/bin/dash-cli

ADD init-node.sh /tmp
RUN chmod 777 /tmp/init-node.sh

CMD /tmp/init-node.sh
