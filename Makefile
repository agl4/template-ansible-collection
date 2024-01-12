PHONY: dev clean-ansible clean-pipenv

install :
ifeq (,$(wildcard ./ansible.cfg))
	$(error Missing ansible.cfg)
endif
ifeq (,$(wildcard ./vault_pass.txt))
	$(error Missing vault_pass.txt)
endif
	asdf install
	pipenv install
	pipenv run ansible-galaxy install -r ./requirements.yml

dev :
	pipenv install --dev

clean-ansible :
	rm -rf ./.cache

clean-pipenv :
	pipenv --rm

clean :
	rm -rf ./.cache
	pipenv --rm
