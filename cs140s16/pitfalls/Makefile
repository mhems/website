GRIP=grip
FLAGS=--export

pages: shell.html access.html compiling.html control.html decl.html exceptions.html lambda.html null.html oop.html short.html static.html super.html generics.html testing.html types.html hello.html object.html python.html

shell.html: shell.md
	$(GRIP) $(FLAGS) --title='Shell' shell.md

access.html: access.md
	$(GRIP) $(FLAGS) --title='Access' access.md

compiling.html: compiling.md
	$(GRIP) $(FLAGS) --title='Compiling' compiling.md

control.html: control.md
	$(GRIP) $(FLAGS) --title='Control' control.md

decl.html: decl.md
	$(GRIP) $(FLAGS) --title='Variables' decl.md

exceptions.html: exceptions.md
	$(GRIP) $(FLAGS) --title='Exceptions' exceptions.md

lambda.html: lambda.md
	$(GRIP) $(FLAGS) --title='Lambda Functions' lambda.md

null.html: null.md
	$(GRIP) $(FLAGS) --title='Null' null.md

oop.html: oop.md
	$(GRIP) $(FLAGS) --title='OOP' oop.md

short.html: short.md
	$(GRIP) $(FLAGS) --title='Short Circuiting' short.md

static.html: static.md
	$(GRIP) $(FLAGS) --title='Static' static.md

super.html: super.md
	$(GRIP) $(FLAGS) --title='Super' super.md

generics.html: generics.md
	$(GRIP) $(FLAGS) --title='Generics' generics.md

testing.html: testing.md
	$(GRIP) $(FLAGS) --title='Testing' testing.md

types.html: types.md
	$(GRIP) $(FLAGS) --title='Types' types.md

hello.html: hello.md
	$(GRIP) $(FLAGS) --title='Hello World' hello.md

object.html: object.md
	$(GRIP) $(FLAGS) --title='Object' object.md

python.html: python.md
	$(GRIP) $(FLAGS) --title='Python vs. Java' python.md

clean:
	rm -f access.html compiling.html control.html decl.html exceptions.html lambda.html null.html oop.html short.html static.html super.html generics.html testing.html types.html hello.html object.html python.html
