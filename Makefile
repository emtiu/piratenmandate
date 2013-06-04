all: analysis

analysis: validation
	xsltproc analyses.xsl piratenmandate.xml

validation:
	xmllint --noout --valid piratenmandate.xml
