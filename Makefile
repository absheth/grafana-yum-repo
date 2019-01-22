NAME=globalnoc-grafana
VERSION=1.0.0
.PHONY: dist
rpm:	dist
	rpmbuild -ta dist/globalnoc-grafana-$(VERSION).tar.gz
test:
	/usr/bin/perl -I ./lib t/TEST $(TEST_VERBOSE)
test_jenkins:
	/usr/bin/perl -I ./lib t/TEST $(TEST_VERBOSE) --formatter=TAP::Formatter::Console
clean:
	rm -rf dist
	rm -rf tap
	rm -rf cover_db
dist:
	rm -rf dist
	mkdir -p dist/globalnoc-grafana-$(VERSION)/etc/yum.repos.d
	cp -r etc/yum.repos.d/grafana.repo dist/globalnoc-grafana-$(VERSION)/etc/yum.repos.d
	cp -r etc/yum.repos.d/globalnoc.repo dist/globalnoc-grafana-$(VERSION)/etc/yum.repos.d
	cp -r globalnoc-grafana.spec dist/globalnoc-grafana-$(VERSION)/
	cd dist; tar -czvf globalnoc-grafana-$(VERSION).tar.gz globalnoc-grafana-$(VERSION)/ --exclude .svn --exclude .git
