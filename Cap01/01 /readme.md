# Vagrant - funcionalidades

## Neste documento são mostrados alguns exemplos de comandos do Vagrant

>Os comandos devem ser executados dentro do Vagrant CLI

- Forward de porta:

    ```vagrant
    config.vm.network "forward_port", guest: 80, host:8080, host_ip: "127.0.0.1"
    ```

- Diretório Compartilhado
    ```vagrant
    config.vm.synced_folder "/data", "/data"
    ```

- Script de provisionamento

   ```vagrant
    config.vm.provision "shell", inline <<-SHELL
        apt update
        apt install -y apache2
    SHELL
   ```
- 