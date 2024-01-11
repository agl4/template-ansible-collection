install:
ifeq (,$(wildcard ./ansible.cfg))
	$(error Missing ansible.cfg)
endif
ifeq (,$(wildcard ./vault_pass.txt))
	$(error Missing vault_pass.txt)
endif
	asdf install
	pipenv install
	pipenv run ansible-galaxy install -fr ./requirements.yml

PHONY: dev
dev:
	pipenv install --dev

clean:
	rm -rf ./.cache
	pipenv --rm
