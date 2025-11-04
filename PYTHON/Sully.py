from os import system

def main():
    i = 5

    if not "Sully.py" in __file__:
        i -= 1

    if i < 0:
        return

    input_file = f"Sully_{i}.py"

    with open(input_file, "w") as f:
        model = "from os import system{1}{1}def main():{1}    i = {5}{1}{1}    if not {0}Sully.py{0} in __file__:{1}        i -= 1{1}{1}    if i < 0:{1}        return{1}{1}    input_file = f{0}Sully_{2}i{3}.py{0}{1}{1}    with open(input_file, {0}w{0}) as f:{1}        model = {0}{4}{0}{1}        f.write(model.format(chr(34), chr(10), chr(123), chr(125), model, i,)){1}    {1}    system(f{0}python3 {2}input_file{3}{0}){1}{1}if __name__ == {0}__main__{0}:{1}    main()"
        f.write(model.format(chr(34), chr(10), chr(123), chr(125), model, i,))
    
    system(f"python3 {input_file}")

if __name__ == "__main__":
    main()