althttpd:	althttpd.c
	cc -Os -Wall -Wextra -o althttpd althttpd.c

# Build with Termux-specific temp directory compiled in
althttpd-termux:	althttpd.c
	cc -Os -Wall -Wextra -DDEFAULT_TMP_DIR='"/data/data/com.termux/files/usr/tmp"' -o althttpd althttpd.c

clean:	
	rm -f althttpd
