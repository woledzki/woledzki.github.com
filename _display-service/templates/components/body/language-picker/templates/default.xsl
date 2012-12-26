<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:php="http://php.net/xsl"
>
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/component">
		<div class="langpicker-left">
			<h2><a href="/pl">Polska Wersja</a></h2>
			<a href="/pl">
				<img class="img-shadow" src="/images/flag-pl.png" />
			</a>
		</div>
		<div class="langpicker-right">
			<h2><a href="/en">English Version</a></h2>
			<a href="/en">
				<img class="img-shadow" src="/images/flag-uk.png" />
			</a>
		</div>
	</xsl:template>

	<xsl:template match="text">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>
</xsl:stylesheet>
