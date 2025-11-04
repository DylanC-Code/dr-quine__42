# Outside Comment

def main():
    # Inside Comment
    model = "# Outside Comment{0}{0}def main():{0}    # Inside Comment{0}    model = {1}{2}{1}{0}    format = model.format(chr(10), chr(34), model){0}    print(format){0}{0}if __name__ == {1}__main__{1}:{0}    main()"
    format = model.format(chr(10), chr(34), model)
    print(format)

if __name__ == "__main__":
    main()
