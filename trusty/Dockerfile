FROM ansible/ansible:ubuntu1404

RUN pip install ansible

COPY test.sh /test.sh
COPY ansible.cfg /etc/ansible/ansible.cfg

ENV PLAYBOOK=test.yml
WORKDIR /roles

ENTRYPOINT ["/test.sh"]
CMD ["syntax"]