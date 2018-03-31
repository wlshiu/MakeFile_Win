

TARGET = app.exe
OUT_PATH = out

###############################
# definitions
###############################
if_exist = $(if $(wildcard $(srctree)/$(1)), $(1))
if_mk_exist = $(if $(wildcard $(srctree)/$(1)/Makefile), $(1))
if_include=$(if $($(1):y=),,$(call if_exist, $(2)))

###############################
# Specify compiler
CROSS_COMPILE ?=arm-none-eabi-
# CROSS_COMPILE ?=
CC := $(CROSS_COMPILE)gcc

# Specify linker
LINK=$(CROSS_COMPILE)gcc

###############################
# cflag options
###############################
CFLAGS=-LC:/gcc-arm-none-eabi-4_8-2014q3-win32/arm-none-eabi/lib -lc -lnosys --specs=nosys.specs -lstdc++
# CFLAGS=-LC:/gcc-arm-none-eabi-4_9-2015q3-win32/arm-none-eabi/lib --specs=rdimon.specs -lc -lm -lrdimon
# CFLAGS=-LD:/codeblocks-17.12mingw/MinGW/lib

###############################
# include dir or not
###############################
CONFIG_DIR_HELLO=n

###############################
# include path
###############################
INCLUDES = -I./Hello/include

###############################
# add source directory
###############################
srctree := $(CURDIR)
srctree += $(call if_include,CONFIG_DIR_HELLO,Hello/src)



###############################
# get *.c in target source directory 
###############################
SOURCES = $(wildcard $(addsuffix /*.c,$(srctree)))

OBJECTS := $(addprefix $(OUT_PATH)/,$(patsubst %.s,%.o,$(SOURCES:.c=.o)))

.PHONY : all
all : $(OUT_PATH)/$(TARGET)

# Link the object files into a binary
$(OUT_PATH)/$(TARGET): $(OBJECTS)
	@echo "    LD      "$@
	@echo "    MAP     "$(OUT_PATH)/$(TARGET).map
	@$(CROSS_COMPILE)gcc $(CFLAGS) -Wl,-Map=$(OUT_PATH)/$(TARGET).map -o $@ $^

# Compile the source files into object files
$(OUT_PATH)/%.o: %.c
	@mkdir -p $(dir $@)
	@echo "    CC      "$@
	@$(CROSS_COMPILE)gcc $(CFLAGS) -MMD -MF $@.d -o $@ -c $(INCLUDES) $<

# Clean target
.PHONY : clean
clean :
	rm -fr $(OUT_PATH)


# arm-none-eabi-gcc --specs=rdimon.specs  -Wl,--start-group -lgcc -lc -lm -lrdimon -Wl,--end-group -o test test.c
