# ============================================================================== #
#                                 CONFIGURATION                                  #
# ============================================================================== #

# 📛 Program name
COLLEEN_OUT := Colleen
GRACE_OUT := Grace

# 📂 Directories
SRCS_DIR := srcs/
BUILD_DIR := build/

# 📦 Assembler & Flags
AS := nasm
CC := cc
LD := ld
ASMFLAGS := -f elf64

# 📁 Sources & Objets
COLLEEN_SRCS :=	$(addprefix srcs/, \
		Colleen.asm \
)
GRACE_SRCS :=	$(addprefix srcs/, \
		Grace.asm \
)
COLLEEN_OBJS := $(patsubst %.asm, $(BUILD_DIR)%.o, $(COLLEEN_SRCS))
GRACE_OBJS := $(patsubst %.asm, $(BUILD_DIR)%.o, $(GRACE_SRCS))

# 🛠 Utilitaires
RM := rm -rf


# ============================================================================== #
#                               RULES - BUILD FLOW                               #
# ============================================================================== #

all: colleen grace	

colleen: $(BUILD_DIR) $(COLLEEN_OBJS)
	$(CC) -o $(COLLEEN_OUT) -no-pie $(COLLEEN_OBJS)

grace: $(BUILD_DIR) $(GRACE_OBJS)
	$(LD) $(GRACE_OBJS) -o $(GRACE_OUT) -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2

# 🔨 Assembling of .s to .o
$(BUILD_DIR)%.o: %.asm
	mkdir -p $(dir $@)
	$(AS) $(ASMFLAGS) $< -o $@


# ============================================================================== #
#                            DIRECTORY & LIBRARY SETUP                           #
# ============================================================================== #

# 📁 Création du dossier de build
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)


# ============================================================================== #
#                                   CLEAN RULES                                  #
# ============================================================================== #

clean:
	$(RM) $(BUILD_DIR)

fclean: clean
	$(RM) $(COLLEEN_OUT) $(GRACE_OUT)*

re: fclean all


# ============================================================================== #
#                                  PHONY & DEPS                                  #
# ============================================================================== #

# 📌 Phony targets
.PHONY: all clean fclean re