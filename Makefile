SHELL:=/bin/bash

.PHONY: kong_bash
kong_bash:
	docker exec -it kong /bin/bash

.PHONY: kong_reload
kong_reload:
	docker exec -it kong /bin/bash -c "kong prepare && kong reload"

.PHONY: kong_update_config
kong_update_config:
	docker cp ./configs/kong.conf kong:/etc/kong/kong.conf

.PHONY: kong_update_dbg_config
kong_update_dbg_config:
	docker cp ./configs/kong.conf.debug kong:/etc/kong/kong.conf

.PHONY: plugin_run_py_hello
plugin_run_py_hello:
	source plugins/venv/bin/activate && cd plugins/src && ./py-hello.py -p ./ --socket-name py-hello.sock
