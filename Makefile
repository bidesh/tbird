#####################################################################
#
#
# 
#
#
#
#
########################################################################


# define the C compiler to use
CC = gcc

# define any compile-time flags
# add -DDEBUG for debug mode
CFLAGS = -Wall -pthread

# define any directories containing header files
INCLUDES = -I/includes

#define src folder
SRC_FOLDER = src

#define docs folder
DOCS_FOLDER = docs

#define src files
SRC = $(wildcard $(SRC_FOLDER)/*.c)

#define object folder
OBJ_FOLDER = obj

#define obj files
OBJ = $(patsubst %.c,$(OBJ_FOLDER)/%.o,$(notdir $(wildcard $(SRC_FOLDER)/*.c)))


# define binary path
BIN_FOLDER = bin

# define the executable file 
MAIN = $(BIN_FOLDER)/T-bird

#compile object files
$(OBJ_FOLDER)/%.o: $(SRC_FOLDER)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

all: makefolders  $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(MAIN)

run: all
	$(MAIN)

.PHONY: makefolders

makefolders:
	@mkdir -p $(DOCS_FOLDER)
	@mkdir -p $(OBJ_FOLDER)
	@mkdir -p $(BIN_FOLDER)


.PHONY: docs

#generate docs
docs:
	@doxygen Doxyfile


#cleaning 
.PHONY: clean

clean:
	@rm -f $(OBJ_FOLDER)/%.o
	@rm -f $(BIN_FOLDER)/*
	@rm -rf $(DOCS_FOLDER)/html 
	@rm -rf $(DOCS_FOLDER)/latex 
