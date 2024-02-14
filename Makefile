CC      ?= gcc
CFLAGS  ?= -O0 -ggdb -pedantic -Wall

CFLAGS  += `pkg-config --cflags libdrm`
LDFLAGS += `pkg-config --libs libdrm`


OBJ = main.o framebuffer.o
PROGNAME = drm-framebuffer

exec_prefix ?= /usr
bindir ?= $(exec_prefix)/bin

all: $(OBJ)
	$(CC) $(CFLAGS) -o $(PROGNAME) $(OBJ) $(LDFLAGS) $(LDFLAGS_)

install: all
	install -d $(DESTDIR)$(bindir)
	install -m 0755 $(PROGNAME) $(DESTDIR)$(bindir)

clean:
	@echo "Clean object files"
	@rm -f $(OBJ)
	@rm -f $(PROGNAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $<
