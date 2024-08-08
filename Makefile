YAMLS := $(wildcard docker-compose.*.yml)
docker-compose.yml: $(YAMLS)
	yq ea '. as $$item ireduce ({}; . * $$item )' $(YAMLS) > docker-compose.yml
clean:
	rm docker-compose.yml
.PHONY: clean