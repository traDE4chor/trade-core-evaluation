To setup/start the required TraDE environment (TraDE Middlware, DT Integration Middleware, Apache ODE, and supporting services) and for the execution of data transformations in form of DT Bundles through the DT Integration Middleware, Docker and Docker Compose are required.

# Install Docker and Docker Compose
Information on how to install Docker and Docker Compose can be found on the corresponding Docker websites:
* [Docker CE](https://docs.docker.com/install/)
* [Docker Compose](https://docs.docker.com/compose/install/)

Please follow the instructions there to setup Docker and Docker Compose on the system which you want to use to run the TraDE environment.

We used the following setup and versions to run the environment and the Opal case study:
* Ubuntu, version 18.04.1 LTS
* Docker, version 18.06.1-ce, build e68fc7a
* Docker Compose, version 1.22.0, build f46880fe

# Configure Docker for the DT Integration Middleware
The [DT Integration Middleware](https://github.com/traDE4chor/hdtapps-prototype) requires access to a Docker Engine through its REST API. Therefore, we assume that a local Docker daemon is installed and configured so that it exposes its API as described here: [Docker Daemon Configuration](https://docs.docker.com/engine/admin/#configure-the-docker-daemon).

For example, set/extend `/etc/docker/daemon.json` on Linux as follows:
```
{
  "hosts": ["tcp://0.0.0.0:2376", "unix:///var/run/docker.sock", ...]
}
```

Since this opens the Docker API to remote systems it is recommended to set corresponding firewall rules that only allow clients running in local Docker containers or on the host itself to access the API endpoint. Please check therefore the documentation of your underlying OS how to configure such firewall rules. To get the IP range of the containers your can execute the following command `docker network inspect bridge` that returns the subnet (e.g., 172.17.0.0) used for the containers. With this information you can create a corresponding rule that only allows connections to the Docker API from localhost and the IP range of the containers (or any other remote host you want to explicitly give access to it).

# Adaptation and Preparation
Adapt the `docker-compose.yml` file to your local setup if necessary, e.g., change potentially conflicting port mappings of the services and update the `HOST_IP` environment variable value within the `.env` file with your local IP address and the `DOCKER_PORT` variable with the port specified in `/etc/docker/daemon.json` (see above). For example, this will result in `HOST_IP=192.168.109.132` and `DOCKER_PORT=2376`.

This is really important and required so that the `hdtapps-framework` container can send commands to the Docker engine running on the host and all other services are configured correctly.

Finally, execute `docker-compose pull` in a terminal/shell within this folder to pull all required Docker images from Docker Hub.

# Start the TraDE environment
With `docker-compose up -d` all required containers (TraDE Middleware, DT Integration Middleware, Process Engine Apache ODE, TraDE WEB UI, etc.) can be created and started in the background.
Without setting `-d`the log outputs of all containers are forwarded to the current terminal which can be helpful for debugging.
To stop and destroy all running containers execute `docker-compose down -v` which removes also all related resources such as volumes, networks, etc.

A complete list of docker-compose commands and their parameters can be found in the [Docker Documentation](https://docs.docker.com/compose/reference/overview/).

After all Docker containers/services are up and running, the case study can be executed using Apache JMeter as described [here](../jmeter/README.md)