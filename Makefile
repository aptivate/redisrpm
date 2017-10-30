IMAGENAME     := redisrpm
CONTAINERNAME := redis

redisrpm:
	@docker build -t redisrpm . --build-arg VERSION=$(VERSION)
	@docker stop $(CONTAINERNAME) && docker rm $(CONTAINERNAME)
	@docker run --name $(CONTAINERNAME) -t -d $(IMAGENAME)
	@docker cp $(CONTAINERNAME):/redis-$(VERSION).el6.x86_64.rpm .
	@docker stop $(CONTAINERNAME) && docker rm $(CONTAINERNAME)
.PHONY: redisrpm
