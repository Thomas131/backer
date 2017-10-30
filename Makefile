TO_BACK := $(wildcard */)

all: $(TO_BACK)

$(TO_BACK):
	-$(MAKE) -C $@

.PHONY: * $(TO_BACK)
