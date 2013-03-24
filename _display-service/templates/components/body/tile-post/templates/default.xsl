<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:php="http://php.net/xsl"
>
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/component">
		<xsl:text disable-output-escaping="yes"> --&gt;</xsl:text><div class="tile {data/size}">
			<div class="tile-frame {data/style}">
				<xsl:if test="data/href">
					<xsl:attribute name="data-href">
						<xsl:value-of select="data/href" />
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="data/image">
					<xsl:attribute name="style">
						min-height: 50px; padding-top: 90px; background: url(<xsl:value-of select="$H_BASE_PATH" />/<xsl:value-of select="data/image" />) no-repeat top center
					</xsl:attribute>
				</xsl:if>
				<div class="caption">
					<xsl:apply-templates select="data/text" />
				</div>
			</div>
		</div><xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text>
	</xsl:template>

	<xsl:template match="text">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>
</xsl:stylesheet>
