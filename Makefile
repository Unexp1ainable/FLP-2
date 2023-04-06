SCRIPT = xrepka07.pl
EXECUTABLE = flp22-log

all: $(SCRIPT)
	swipl --goal=main --toplevel=halt --stand_alone=true  --foreign=save  -o $(EXECUTABLE) -c $(SCRIPT)

clean:
	rm -f $(EXECUTABLE)
