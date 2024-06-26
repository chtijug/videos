.PHONY: default
default: all

.PHONY: 1
1:
	$(MAKE) -C 1

.PHONY: 2
2:
	$(MAKE) -C 2

.PHONY: 3
3:
	$(MAKE) -C 3

.PHONY: all
all: 1 2 3

.PHONY: clean
clean:
	$(MAKE) -C 1 clean
	$(MAKE) -C 2 clean
	$(MAKE) -C 3 clean