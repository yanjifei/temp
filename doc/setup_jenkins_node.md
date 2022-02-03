# How to set up a node for Jenkins server

## Install SSH

Please follow the [instructions](https://linuxhint.com/enable-ssh-linux-mint/) to install SSH server on the node.  

## Install Java

1. Check if Java is already installed. Run command below in Terminal.

    ```bash
    java --version
    ```

1. if not, please follow [instructions](https://www.jenkins.io/doc/book/installing/linux/#installation-of-java) to install.

## Create jenkins user in the node  

1. In Terminal, create a new user called jenkins. A normal user is fine. There is no need for admin privilege.  

    ```bash
    sudo adduser jenkins --shell /bin/bash
    ```

1. Switch to jenkins user

    ```bash
    su jenkins
    ```

1. Create .ssh folder

    ```bash
    mkdir ~/.ssh && cd ~/.ssh
    ```

1. Create SSH key pair

    ```bash
    ssh-keygen -t rsa -C "SSH key for Jenkins node"
    ```

1. Add public key to authorized list

    ```bash
    cat id_rsa.pub > ~/.ssh/authorized_keys
    ```

1. Give the private key information to Jenkins administrator to import to Jenkins server

    ```bash
    cat id_rsa
    ```
