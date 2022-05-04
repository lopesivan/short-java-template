# Ignore isso...
space:=$(empty) $(empty)

# Binários
JAVAC=$$(jenv which javac)
JAVA=$$(jenv which java)
JAR=$$(jenv which jar)

# Diretórios...
BINDIR=bin
JARDIR=jars

# Adicione qualquer classpath externo que você precise
USERCLASSPATH=.

# Criando classpath dinâmico
TMPCLASSPATH=$(USERCLASSPATH):$(realpath $(BASE)$(BINDIR))
ifneq (,$(wildcard $(jars)/*))
	CLASSPATH=$(TMPCLASSPATH):$(subst $(space),:,$(foreach jar,$(wildcard $(JARDIR)/*.jar),$(realpath $(jar))))
endif

# Flags de compilação
JCFLAGS=-g -d $(BASE)$(BINDIR) -classpath $(CLASSPATH)
# Flags de execução
JFLAGS=-classpath $(CLASSPATH)

%.class: %.java
	$(eval BASE=$(dir $<))
	rm -rf $(BASE)$(BINDIR) && mkdir $(BASE)$(BINDIR)
	$(JAVAC) $(JCFLAGS) $*.java

%: %.class
	echo $*
	cd $(BASE)$(BINDIR) && $(JAVA) $(JFLAGS) $(subst /,.,$*)

%.jar: %.class
	-mkdir -p $(JARDIR)
	$(JAR) cfe $(JARDIR)/$(subst /,-,$*.jar) $(subst /,.,$*) -C $(BASE)$(BINDIR)/ .

clean:
	-find . -type d -name $(BINDIR) | xargs -I{} rm -rf {}
	-rm -rf $(JARDIR)

PHONY: clean
