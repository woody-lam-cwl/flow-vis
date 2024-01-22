FC=gfortran
FFLAGS= 
LIBS=

TARGETS = deltagen tblock
DELTAGEN04_OBJS = deltagen-ras224.o
TBLOCK29_OBJS = tblock-ras224.o

all: $(TARGETS)

deltagen: $(DELTAGEN04_OBJS)
	$(LINK.f) -o $@ $(DELTAGEN04_OBJS) $(LIBS)

tblock: $(TBLOCK29_OBJS)
	$(LINK.f) -o $@ $(TBLOCK29_OBJS)

clean:
	$(RM) ./*.o core core.*

distclean:
	$(RM) ./*.o core core.* ./*~ $(TARGETS) gridin out delta-multip.dat delta-tblock.dat
