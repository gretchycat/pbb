validate:
	xmllint --noout --schema core/v1/pbb-core.xsd examples/schema-demo.xml

json:
	xsltproc xslt/pbb-to-json.xslt examples/schema-demo.xml
