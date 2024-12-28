RM = del /s/q
NAME = svc
CFLAGS = /Wall /WX -nologo
 
DIRECTORI_UTILS = obj
DIRECTORI_SOURCE = srcs

SOURCES = main.cpp hola.cpp

FILES_CPPS = $(patsubst %, $(DIRECTORI_SOURCE)/%, $(SOURCES))
OBJECTS = $(patsubst %, $(DIRECTORI_SOURCE)/%, $(SOURCES:.cpp=.obj))
DEPENDENCIES = $(patsubst %, $(DIRECTORI_SOURCE)/%, $(SOURCES:.cpp=.d))

all:
	mkdir $(DIRECTORI_UTILS)
	echo "Hola corazon de melon"

$(OBJECTS): $(FILES_CPPS)
	$(CPP) $(CFLAGS) $< /Fo$(DIRECTORI_UTILS)$(@F)
print:
	@type .\srcs\main.cpp
	@echo $(CC)
	@echo $(SOURCES)
	@echo $(OBJECTS)
	@echo $(@F)
	@echo $(basename $(OBJECTS))
	@echo $(FILES_CPPS)
	@echo $(OBJECTS)
	@echo $(DEPENDENCIES)

fclean:
	del $(NAME)

.PHONY:
#.SILENT: