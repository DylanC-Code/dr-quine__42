# ============================================================================== #
#                                 CONFIGURATION                                  #
# ============================================================================== #

# 📛 Program name
COLLEEN_OUT := Colleen

# 📂 Directories
SRCS_DIR := srcs/
BUILD_DIR := build/

# 📦 Assembler & Flags
AS := nasm
CC := cc
ASMFLAGS := -f elf64

# 📁 Sources & Objets
COLLEEN_SRCS :=	$(addprefix srcs/, \
		Colleen.asm \
)
COLLEEN_OBJS := $(patsubst %.asm, $(BUILD_DIR)%.o, $(COLLEEN_SRCS))

# 🛠 Utilitaires
RM := rm -rf


# ============================================================================== #
#                               RULES - BUILD FLOW                               #
# ============================================================================== #

all: $(BUILD_DIR) colleen

colleen: $(COLLEEN_OBJS)
	$(CC) -o $(COLLEEN_OUT) -no-pie $(COLLEEN_OBJS)

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
	$(RM) $(COLLEEN_OUT)

re: fclean all


# ============================================================================== #
#                                  PHONY & DEPS                                  #
# ============================================================================== #

# 📌 Phony targets
.PHONY: all clean fclean re