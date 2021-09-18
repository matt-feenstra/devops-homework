# This docker container shares the network subsystem with app_a.
docker run -d --net container:server_a app_b
