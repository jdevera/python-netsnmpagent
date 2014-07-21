#
# python-netsnmpagent module
# Copyright (c) 2013 Pieter Hollants <pieter@hollants.com>
# Licensed under the GNU Public License (GPL) version 3
#


.PHONY: tests
tests:
	@if [ `which nosetests 2>/dev/null` ] ; then \
		cd tests && \
		for FILE in test_*.py ; do \
			echo "----------------------------------------------------------------------"; \
			echo $$FILE; \
			echo "----------------------------------------------------------------------"; \
			nosetests -vx $$FILE || exit 1; \
		done \
	else \
		echo "Can't find the \"nosetests\" command, please install the \"nose\" Python module!"; \
		exit 1; \
	fi

