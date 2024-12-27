RM = del /s/q
NAME = svc
CFLAGS = /Wall /WX
 

DIRECTORI_SOURCE = srcs
SOURCES = main.cpp

all:
	@echo "Hola corazon de melon"
print:
	@type .\srcs\main.cpp
	@echo $(CC)
	@echo $(SOURCES)

fclean:
	del $(NAME)
.PHONY: