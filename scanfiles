#!/bin/bash

rm -f _objs

echo -e "OBJSX = \\" >> _objs
find src -name "*.java" -printf "	\$(OBJECT_DIR)/%P \<newLine>" | sed 's/.java/\'$'.class/g' | sed 's/<newLine>/\'$'\n/g' >> _objs
echo -e "\n\nbuild_objs:" >> _objs

echo -e -n "	@\$(COMP_CLASS) \$(CFLAGS) " >> _objs
find src -name "*.java" -printf " \$(SOURCE_DIR)/%P " >> _objs
