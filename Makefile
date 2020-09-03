generate:
	npm run prepublishOnly
	$(MAKE) prepend-imports
	npm run less
	$(MAKE) replace-font-urls
	ls ./styles/_fonts/seti

prepend-imports:
	echo "@import \"../ui-variables.less\";\n@import \"../ui-mixins.less\";\n@import \"../components/icons/mapping.less\";\n" >> ./styles/_fonts/seti.less.new
	cat ./styles/_fonts/seti.less >> ./styles/_fonts/seti.less.new
	mv ./styles/_fonts/seti.less.new ./styles/_fonts/seti.less

replace-font-urls:
	sed -i.bak 's/atom:\/\/seti-ui\/styles\/_fonts\/seti/\./g' styles/_fonts/seti/seti.css