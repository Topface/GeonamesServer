test:
	bash ./resources/scripts/test.sh
	./node_modules/.bin/mocha --timeout 5000

install:
	bash ./resources/scripts/install.sh
	bash ./resources/scripts/server.sh

import:
	bash ./resources/scripts/import.sh

server:
	bash ./resources/scripts/server.sh

index:
	bash ./resources/scripts/index.sh

clean:
	rm -rf ./resources/data
	rm -rf ./resources/sources
	rm -rf ./node_modules

.PHONY: test

