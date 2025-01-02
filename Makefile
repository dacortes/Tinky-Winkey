RM = del /s/q
RMDIR = rmdir /s /q
NAME = svc
CFLAGS = /Wall /WX -nologo

DIRECTORY_OBJ = obj
DIRECTORIES = obj
DIRECTORY_SOURCE = srcs

SOURCES = main.cpp
FILES_CPPS = $(patsubst %, $(DIRECTORY_SOURCE)/%, $(SOURCES))
OBJECTS = $(patsubst %, $(DIRECTORY_OBJ)/%, $(SOURCES:.cpp=.obj))

all: dir objs $(NAME)

dir:
    @for %D in ($(DIRECTORIES)) do ( \
        @if not exist %D ( \
            @echo Creatin directory: %D && mkdir %D \
        ) else ( \
            @echo Directory %D already exists \
        ) \
    )

objs:
    @for %F in ($(FILES_CPPS)) do $(CC) /c %F /Fo$(DIRECTORY_OBJ)\%~nF.obj

$(NAME): $(OBJECTS)
    $(CC) $(CFLAGS) $(OBJECTS) /Fe$(NAME).exe

print:
    @echo $(OBJECTS)
    @echo $(DEPENDENCIES)
    @echo $(DIRECTORY_OBJ)

clean:
    @for %D in ($(DIRECTORIES)) do ( \
        @if exist %D ( \
            @echo Deletin directory: %D && $(RMDIR) %D \
        ) else ( \
            @echo Directory %D not exist \
        ) \
    )
fclean: clean
    del $(NAME).exe

.PHONY: clean fclean all dir objs print
.SILENT: