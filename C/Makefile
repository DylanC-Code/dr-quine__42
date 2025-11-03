# ============================================================================== #
#                                 CONFIGURATION                                  #
# ============================================================================== #

# 📛 Nom du programme
COLLEEN_OUT := Colleen

# 📂 Répertoires
SRCS_DIR := srcs/
BUILD_DIR := build/
INCLUDE_DIRS := -Iincludes

# 📦 Compiler & Flags
CC := cc
CFLAGS := -Wall -Wextra -Werror -g3
CPPFLAGS := -Iincludes

# 🛠 Utilitaires
MAKE := make
RM := rm -rf

# 📁 Sources & Objets
COLLEEN_SRCS := $(addprefix $(SRCS_DIR), \
		Colleen.c \
)
COLLEEN_OBJS := $(patsubst %.c, $(BUILD_DIR)%.o, $(COLLEEN_SRCS))

DEPS := $(COLLEEN_OBJS:.o=.d)


# ============================================================================== #
#                               RULES - BUILD FLOW                               #
# ============================================================================== #

# 🎯 Règle principale
all: colleen

# 🧱 Construction de l'exécutable
colleen: $(BUILD_DIR) $(COLLEEN_OBJS)
	$(CC) $(CFLAGS) $(COLLEEN_OBJS) -o $(COLLEEN_OUT)

# 🔨 Compilation des .c vers .o
$(BUILD_DIR)%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -MMD -MP $(INCLUDE_DIRS) -c $< -o $@


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

# 📌 Cibles qui ne sont pas des fichiers
.PHONY: all clean fclean re

# 📎 Inclusion des dépendances générées automatiquement
-include $(DEPS) $(DEPS_BONUS)