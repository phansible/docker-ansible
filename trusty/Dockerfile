FROM ansible/ansible:ubuntu1404

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean && \
    apt-get -y update && \
    apt-get -y install curl

RUN pip install ansible

COPY test.sh /test.sh
COPY ansible.cfg /etc/ansible/ansible.cfg

ENV PLAYBOOK=test.yml
WORKDIR /roles

ENTRYPOINT ["/test.sh"]
CMD ["syntax"]