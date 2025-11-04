# 🧠 Dr Quine

> *A self-replicating program challenge — where your code becomes its own source.*

---

## 📁 Project Structure

```
Dr-Quine/
├── ASM/
│   ├── Makefile
│   ├── .gitignore
│   └── srcs/
│       ├── Colleen.asm
│       ├── Grace.asm
│       └── Sully.asm
│
├── C/
│   ├── Makefile
│   ├── .gitignore
│   └── srcs/
│       ├── Colleen.c
│       ├── Grace.c
│       └── Sully.c
│
├── PYTHON/
│   ├── Colleen.py
│   ├── Grace.py
│   └── Sully.py
│
└── README.md
```

---

## 🧩 Overview

**Dr Quine** is one of the most conceptually elegant projects of the 42 curriculum.  
Its goal: write programs that **replicate their own source code**, without reading it from disk.

This repository contains **three implementations** — in **C**, **Assembly (NASM)**, and **Python** — each exploring self-replication from a different angle: string formatting, macro expansion, and recursive code generation.

---

## 🧱 Programs

| Program | Description | Goal |
|----------|--------------|------|
| **Colleen** | A basic self-replicating program | Prints its own source |
| **Grace** | A macro-based quine | Writes its own source into a new file |
| **Sully** | A recursive quine | Generates, compiles, and executes new instances while decrementing a counter |

---

## 🛠️ Build & Run

### 🧩 Assembly version (NASM + LD)

```bash
cd ASM
make            # Builds Colleen, Grace, and Sully
make colleen    # Builds only Colleen
make grace      # Builds only Grace
make sully      # Builds only Sully
```

Run the binaries:

```bash
./Colleen
./Grace
./Sully
```

---

### ⚙️ C version (GCC)

```bash
cd C
make
./Colleen
./Grace
./Sully
```

All programs are self-contained and require **no input**.

---

### 🐍 Python version

```bash
cd PYTHON
python3 Colleen.py
python3 Grace.py
python3 Sully.py
```

---

## 🔍 Implementation Highlights

- Strictly follows the **42 project rules** (no file reads, limited defines/macros).
- Handles **nested escaping** and **format specifiers** (`%1$c`, `%2$c`, `%3$s`, etc.).
- `Sully` dynamically:
  - Decrements an internal counter `i`.
  - Generates `Sully_N.asm` / `.c` / `.py` files.
  - Compiles or runs them recursively until `i == 0`.
- **Assembly version** uses:
  - libc calls (`fopen`, `fprintf`, `sprintf`, `system`, …)
  - x86-64 System V calling conventions
  - NASM macros for compact self-replication

---

## 💡 Key Learnings

- Understanding **self-reference** and **quine theory**.
- Mastering **format string escaping** in multiple languages.
- Implementing **variadic functions** and register conventions in Assembly.
- Writing **deterministic**, **side-effect-free**, and **reproducible** code.

---

## 🧑‍💻 Author

**Dylan C**  
Student @ 42 Paris  
[GitHub → DylanC-Code](https://github.com/DylanC-Code)

---

## 🧠 Fun Fact

> A “quine” is a program that takes **no input** and produces a **copy of its own source code** as output.  
>  
> Dr Quine is named after philosopher **Willard Van Orman Quine**, who studied self-reference and logical recursion — the same paradox this project turns into executable art.
