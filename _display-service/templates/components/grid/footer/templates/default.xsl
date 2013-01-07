<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:php="http://php.net/xsl">
	<xsl:output
		method="html"
		encoding="utf-8"
		indent="yes" />

	<xsl:template match="/component">
		<div class="container">
			<div class="page-footer">
				copyright 2012 - Wojtek Olędzki.
				<span class="pull-right">
					<xsl:for-each select="data/link">
						<a href="{@href}"><xsl:value-of select="." /></a>
					</xsl:for-each>
				</span>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
