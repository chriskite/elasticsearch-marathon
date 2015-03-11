FROM barnybug/elasticsearch:1.4.4

RUN apt-get -y update
RUN apt-get -y install curl ruby

ADD ./elasticsearch-marathon-bootstrap.sh /usr/local/bin/
ADD ./elasticsearches.rb /usr/local/bin/

CMD "/usr/local/bin/elasticsearch-marathon-bootstrap.sh"
