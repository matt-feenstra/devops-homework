sudo mv -f agent.log agent.log.$(date +%Y-%m-%d_%H.%M.%S)
sudo nohup nomad agent -dev -bind 0.0.0.0 -log-level INFO 1>>agent.log 2>>agent.log &
