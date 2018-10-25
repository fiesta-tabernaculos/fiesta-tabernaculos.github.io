
# Makefile to build fiesta-tabernaculos.github.io git pages web site.

BASE_DIR = .

HTM_DIR = $(BASE_DIR)/html_snippets

CAT = cat
RM = rm
SED = sed

SED_MINI_LOGO = 's?<!-- PUT_HERE_MINI_LOGO -->?<a class="navbar-brand" href="index.html"><img src="images/the_logo_small.png" alt=""></a>?'

SED_HOME_MENU = 's?<!-- PUT_HERE_HOME_MENU -->?<li class="active"> <a href="index.html">Home</a> </li>?'


ALL_BUILT_HTML = \
$(BASE_DIR)/index.html\
$(BASE_DIR)/about.html

default_rule: $(ALL_BUILT_HTML)
	@echo "Finished building fiesta-tabernaculos.github.io git pages web site."

#---------------------------------------------------------
# executables
#

$(BIN_DIR)/$(EXE_NAM): $(ALL_OBJS) 
	@echo "Building executable "$(EXE_NAM)" ..."
	$(CPP) $(ALL_OBJS) $(LNK_FLAGS) -o $(BIN_DIR)/$(EXE_NAM)

help:
	@echo "Type 'make'"

#---------------------------------------------------------
# clean rule
#

clean: 
	find . -name "*~" -type f -exec rm '{}' \;
	$(RM) $(ALL_BUILT_HTML)
	$(RM) $(HTM_DIR)/top_normal.txt
	$(RM) $(HTM_DIR)/top_home.txt

#---------------------------------------------------------
# generate each html
#

$(BASE_DIR)/index.html: \
	$(HTM_DIR)/top_home.txt \
	$(HTM_DIR)/index.txt \
	$(HTM_DIR)/bottom_normal.txt \

	$(CAT) \
	$(HTM_DIR)/top_home.txt \
	$(HTM_DIR)/index.txt \
	$(HTM_DIR)/bottom_normal.txt \
	> $(BASE_DIR)/index.html

$(HTM_DIR)/top_home.txt: \
	$(HTM_DIR)/top_common.txt \
	$(HTM_DIR)/top_home_rest.txt \

	$(CAT) \
	$(HTM_DIR)/top_common.txt \
	$(HTM_DIR)/top_home_rest.txt \
	> $(HTM_DIR)/top_home.txt

$(HTM_DIR)/top_normal.txt: \
	$(HTM_DIR)/top_common.txt \
	$(HTM_DIR)/top_normal_rest.txt \

	$(CAT) \
	$(HTM_DIR)/top_common.txt \
	$(HTM_DIR)/top_normal_rest.txt \
	> $(HTM_DIR)/top_normal.txt\

	$(SED) -i $(SED_MINI_LOGO) $(HTM_DIR)/top_normal.txt\

	$(SED) -i $(SED_HOME_MENU) $(HTM_DIR)/top_normal.txt

$(BASE_DIR)/about.html: \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/about.txt \
	$(HTM_DIR)/bottom_normal.txt \

	$(CAT) \
	$(HTM_DIR)/top_normal.txt \
	$(HTM_DIR)/about.txt \
	$(HTM_DIR)/bottom_normal.txt \
	> $(BASE_DIR)/about.html

