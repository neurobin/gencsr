
install:
	chmod +x gencsr
	install -m 755 -d "$(DESTDIR)/usr/bin/" "$(DESTDIR)/usr/share/man/man1/" "$(DESTDIR)/etc"
	install -m 755 gencsr "$(DESTDIR)/usr/bin/"
	install -m 644 gencsr.conf "$(DESTDIR)/etc/"
	install -m 644 gencsr.1 "$(DESTDIR)/usr/share/man/man1/"
