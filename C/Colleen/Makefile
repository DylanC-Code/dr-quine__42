# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dcastor <dcastor@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/09 14:36:04 by dcastor           #+#    #+#              #
#    Updated: 2025/08/22 10:47:29 by dcastor          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ============================================================================== #
#                                 CONFIGURATION                                  #
# ============================================================================== #

# 📛 Nom du programme
NAME := Colleen

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
SRCS := $(addprefix $(SRCS_DIR), \
		main.c \
)
OBJS := $(patsubst %.c, $(BUILD_DIR)%.o, $(SRCS))

DEPS := $(OBJS:.o=.d)


# ============================================================================== #
#                               RULES - BUILD FLOW                               #
# ============================================================================== #

# 🎯 Règle principale
all: $(NAME)

# 🧱 Construction de l'exécutable
$(NAME): $(BUILD_DIR) $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $(NAME) $(OBJS)

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
	$(RM) $(NAME)

re: fclean all

# ============================================================================== #
#                                    TEST RULES                                  #
# ============================================================================== #

test_leak: $(NAME)
	valgrind --leak-check=full --show-leak-kinds=all --track-fds=yes --track-origins=yes --log-fd=1 --trace-children=yes ./$(NAME) test.cub

# ============================================================================== #
#                                  PHONY & DEPS                                  #
# ============================================================================== #

# 📌 Cibles qui ne sont pas des fichiers
.PHONY: all clean fclean re

# 📎 Inclusion des dépendances générées automatiquement
-include $(DEPS) $(DEPS_BONUS)