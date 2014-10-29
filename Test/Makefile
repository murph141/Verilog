COMPILE=iverilog
V=main.v
FILE=$(patsubst %.v,%,$V)

.PHONY: all clean run

all: $V
	$(COMPILE) -o $(FILE) $V

clean:
	@rm -f $(FILE)

run: all
	vvp $(FILE)
