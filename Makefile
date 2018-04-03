PRJ=cyd_gmc

ASM6809=asm6809 -v

.PHONY: all
all: $(PRJ).bin

# lazy rule: target depends on all source files present
$(PRJ).bin: *.s
	$(ASM6809) -D -l $(PRJ).lst -o $@ $(PRJ).s

%.cas %.wav: %.bin
	#bin2cas.pl -r 22050 -o $@ -D $<
	bin2cas.pl --autorun -z --fast -r 22050 -o $@ -D $<

.PHONY: clean
clean:
	rm -f $(PRJ).bin
	rm -f $(PRJ).cas
	rm -f $(PRJ).wav
	rm -f $(PRJ).lst

