.PHONY: test

update:
	git submodule add --force git@github.com:mineko-gmbh/npm-package-skeleton.git skeleton
	git submodule update --remote skeleton
	rm skeleton/.setup/package*
	cp -Rf skeleton/.setup/{,.[^.]}* .
	git submodule deinit -f skeleton
	rm -rf skeleton
	printf 'update is done \nyou can review the changes and solve any conflicts before commiting'
	git add skeleton

install:
	npm ci

build:
	npm run-script build

test:
	npm test

publish:
	npm publish

analyse:
	npm run-script analyse
