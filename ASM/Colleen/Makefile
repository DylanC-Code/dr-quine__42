# ============================================================================== #
#                                 CONFIGURATION                                  #
# ============================================================================== #

# 📛 Program name
NAME := Colleen

# 📂 Directories
SRCS_DIR := srcs/
BUILD_DIR := build/

# 📦 Assembler & Flags
AS := nasm
LD := ld
ASMFLAGS := -felf64

# 📁 Sources & Objets
SRCS :=	$(addprefix srcs/, \
		main.asm \
)
OBJS := $(patsubst %.asm, $(BUILD_DIR)%.o, $(SRCS))

# 🛠 Utilitaires
RM := rm -rf


# ============================================================================== #
#                               RULES - BUILD FLOW                               #
# ============================================================================== #

all: $(BUILD_DIR) $(NAME)

$(NAME): $(OBJS)
	$(LD) -o $(NAME) $(OBJS)

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
	$(RM) $(NAME)

re: fclean all


# ============================================================================== #
#                                  PHONY & DEPS                                  #
# ============================================================================== #

# 📌 Phony targets
.PHONY: all clean fclean re