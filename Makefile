DESTDIR ?= /

build:

all:

boot:
	install -d -m755 -oroot -groot $(DESTDIR)/boot/firmware $(DESTDIR)/boot/firmware/overlays
	cp -r boot/* $(DESTDIR)/boot/firmware
	cp extra/System7l.map $(DESTDIR)/boot/System.map-5.4.73-v7l+
	cp boot/kernel7l.img $(DESTDIR)/boot/vmlinuz-5.4.73-v7l+

extra:
	install -d -m755 -oroot -groot $(DESTDIR)/boot
	cp -r extra/* $(DESTDIR)/boot

modules:
	install -d -m755 -oroot -groot $(DESTDIR)/lib/modules
	cp -r modules/* $(DESTDIR)/lib/modules/

hardfp:
	install -d -m755 -oroot -groot $(DESTDIR)/usr/bin $(DESTDIR)/usr/lib
	cp -r hardfp/opt/vc/bin/* $(DESTDIR)/usr/bin/
	cp -r hardfp/opt/vc/lib/* $(DESTDIR)/usr/lib/

install: boot extra modules hardfp

.PHONY: all boot extra modules hardfp install
