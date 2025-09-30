# Usa la imagen base de Ubuntu
FROM ubuntu:latest

# Instala el servidor SSH
RUN apt-get update && apt-get install -y openssh-server

# Expone el puerto 22 para el tráfico SSH
EXPOSE 22

# Establece la contraseña para el usuario 'root' (¡cambia 'tu_contraseña' por una segura!)
RUN echo 'root:tu_contraseña' | chpasswd

# Habilita el inicio de sesión como root por SSH (no recomendado para producción)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Crea el directorio para el servicio SSH
RUN mkdir /var/run/sshd

# Inicia el servicio SSH
CMD ["/usr/sbin/sshd", "-D"]

