.PHONY: install
install:
	install -D media-automount $(DESTDIR)$(PREFIX)/bin/media-automount
	install -D umount_dmenu $(DESTDIR)$(PREFIX)/bin/umount_dmenu
	install -Dm644 media-automount.rules $(DESTDIR)$(PREFIX)/lib/udev/rules.d/99-media-automount.rules
	install -Dm644 media-automount@.service $(DESTDIR)$(PREFIX)/lib/systemd/system/media-automount@.service
	install -d $(DESTDIR)/etc/media-automount.d
	install -Cm644 media-automount.d/* $(DESTDIR)/etc/media-automount.d/

	# Install media-automount script in /usr/local/bin and ensure it's executable
	install -Dm755 media-automount $(DESTDIR)/usr/local/bin/media-automount

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/media-automount
	rm -f $(DESTDIR)$(PREFIX)/bin/umount_dmenu
	rm -f $(DESTDIR)$(PREFIX)/lib/udev/rules.d/99-media-automount.rules
	rm -f $(DESTDIR)$(PREFIX)/lib/systemd/system/media-automount@.service
	rm -rf $(DESTDIR)/etc/media-automount.d
	rm -f $(DESTDIR)/usr/local/bin/media-automount
