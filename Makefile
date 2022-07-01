#
# 'make'        build executable file 'main'
# 'make clean'  removes all .o and executable files
#

# define the C compiler to use
CC = gcc

# define any compile-time flags
CFLAGS	:= -Wextra -g

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like:
LFLAGS =

# define output directory
OUTPUT	:= output

# define source directory
SRC		:= src
# define source directory
TESTSRC		:= test

# define include directory
INCLUDE	:= include
TEST_INCLUDE := cunit_include
# define lib directory
LIB		:= lib

ifeq ($(OS),Windows_NT)
MAIN	:= main.exe
SOURCEDIRS	:= $(SRC)
TEST_SOURCEDIRS	:= $(TESTSRC)
INCLUDEDIRS	:= $(INCLUDE)
TEST_INCLUDEDIRS	:= $(TEST_INCLUDE)
LIBDIRS		:= $(LIB)
FIXPATH = $(subst /,\,$1)
RM			:= del /q /f
MD	:= mkdir
else
MAIN	:= main
SOURCEDIRS	:= $(shell find $(SRC) -type d)
TEST_SOURCEDIRS	:= $(shell find $(TESTSRC) -type d)
INCLUDEDIRS	:= $(shell find $(INCLUDE) -type d)
TEST_INCLUDEDIRS	:= $(shell find $(TEST_INCLUDE) -type d)
LIBDIRS		:= $(shell find $(LIB) -type d)
FIXPATH = $1
RM = rm -f
MD	:= mkdir -p
endif

# define any directories containing header files other than /usr/include
INCLUDES	:= $(patsubst %,-I%, $(INCLUDEDIRS:%/=%))

# define the C libs
LIBS		:= $(patsubst %,-L%, $(LIBDIRS:%/=%))

# define the C source files
SOURCES		:= $(wildcard $(patsubst %,%/*.c, $(SOURCEDIRS)))

# define the C object files 
OBJECTS		:= $(SOURCES:.c=.o)

# c unit specific define
ifeq "${TEST}" "y"
SOURCES		+= $(wildcard $(patsubst %,%/*.c, $(TEST_SOURCEDIRS)))
OBJECTS		:= $(SOURCES:.c=.o)
INCLUDES    += $(patsubst %,-I%, $(TEST_INCLUDEDIRS:%/=%))
CFLAGS	:= -Wl,--wrap=ten_times -Wextra -g -DLIME_UNIT_TEST
endif


#
# The following part of the makefile is generic; it can be used to 
# build any executable just by changing the definitions above and by
# deleting dependencies appended to the file from 'make depend'
#

OUTPUTMAIN	:= $(call FIXPATH,$(OUTPUT)/$(MAIN))

all: $(OUTPUT) $(MAIN)
	@echo Executing 'all' complete!

testall: $(OUTPUT) $(MAIN)
	@echo Executing 'test all' complete!

$(OUTPUT): clean
	$(MD) $(OUTPUT)

$(MAIN): $(OBJECTS)
	@echo Generate main output!
	$(CC) $(CFLAGS) $(INCLUDES) -o $(OUTPUTMAIN) $(OBJECTS) $(LFLAGS) $(LIBS) -lcunit

# this is a suffix replacement rule for building .o's from .c's
# it uses automatic variables $<: the name of the prerequisite of
# the rule(a .c file) and $@: the name of the target of the rule (a .o file) 
# (see the gnu make manual section about automatic variables)
.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

.PHONY: clean
clean:
	$(RM) $(OUTPUTMAIN)
	$(RM) $(call FIXPATH,$(OBJECTS))
	@echo Cleanup complete!

test: testall
	./$(OUTPUTMAIN)

run: all
	./$(OUTPUTMAIN)
	@echo Executing 'run: all' complete!