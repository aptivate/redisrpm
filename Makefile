RUBYIMAGENAME  := centosruby
RUBYDOCKERFILE := centosruby.Dockerfile

RPMDOCKERFILE    := redisrpm.Dockerfile
RPMIMAGENAME     := redisrpm
RPMCONTAINERNAME := redis

centosruby:
	@docker build -t $(RUBYIMAGENAME) -f $(RUBYDOCKERFILE) .
.PHONY: centosruby

redisrpm: #centosruby
	@docker build -t $(RPMIMAGENAME) -f $(RPMDOCKERFILE) . --build-arg VERSION=$(VERSION) $(DOCKERARGS)
	@docker stop $(RPMCONTAINERNAME) && docker rm $(RPMCONTAINERNAME)
	@docker run --name $(RPMCONTAINERNAME) -t -d $(RPMIMAGENAME)
	@docker cp $(RPMCONTAINERNAME):/redis-$(VERSION).el6.x86_64.rpm .
	@docker stop $(RPMCONTAINERNAME) && docker rm $(RPMCONTAINERNAME)
.PHONY: redisrpm
