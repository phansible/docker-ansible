# Docker ansible

Ansible in a docker container
The main objective of this image is to help phansible developers to test their roles when developing
It can be used as a normal ansible image but we will not provide support for that use case

## Testing a role

The image provides a bash entrypoint to help you testing the role.
Let's use `role-apache` as our role and `ubuntu 14.04` as our environment for this example.

### Syntax check

In order to check if the syntax of your role is correct:

```
docker run --rm -it -v "$PWD:/roles/role-apache" -e "ROLE=role-apache" phansible/ansible:ubuntu1404 syntax
```

This is the default command for the image, so you can also type

```
docker run --rm -it -v "$PWD:/roles/role-apache" -e "ROLE=role-apache" phansible/ansible:ubuntu1404
```

### Run the provisioning

To test if the provision does not fail

```
docker run --rm -it -v "$PWD:/roles/role-apache" -e "ROLE=role-apache" phansible/ansible:ubuntu1404 run
```

### Idempotency check

For us, idempotency is key in our roles. To ensure that your changes are idempotent do:

```
docker run --rm -it -v "$PWD:/roles/role-apache" -e "ROLE=role-apache" phansible/ansible:ubuntu1404 idempotent
```

### Other testings

In some cases you may need to enter the container and execute a few checks manually. For that just run

```
docker run --rm -it -v "$PWD:/roles/role-apache" -e "ROLE=role-apache" phansible/ansible:ubuntu1404 bash
```

