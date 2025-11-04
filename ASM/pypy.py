import re

input_file = "srcs/Sully.asm"
output_file = "Sully_formatted.asm"

# Lire le fichier d'origine
with open(input_file, "r", encoding="utf-8") as f:
    content = f.read()

# 0️⃣ Remplacer d'abord tous les '%' par '%5$c'
content = content.replace('%', '%5$c')

# 1️⃣ Remplacer la ligne du model
# Exemple : model = "..." devient model = "%3$s"
content = re.sub(
    r'model\s+db\s*""\s*,\s*0',
    'model           db "%3$s", 0',
    content
)

# 2️⃣ Remplacer la ligne i = 5
content = re.sub(
    r'i\s+db\s+5',
    'i               db %4$c',
    content
)

# 3️⃣ Remplacer tous les retours à la ligne par %1$c
content = content.replace("\n", "%1$c")

# 4️⃣ Remplacer ensuite tous les guillemets doubles par %2$c
content = content.replace('"', "%2$c")

# 5️⃣ Écrire dans le fichier de sortie
with open(output_file, "w", encoding="utf-8") as f:
    f.write(content)

print(f"✅ Fichier formaté écrit dans {output_file}")
