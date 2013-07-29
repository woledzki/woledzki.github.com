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
						min-height: 100px; background-image: url(<xsl:value-of select="$H_BASE_PATH" />/<xsl:value-of select="data/image" />)
					</xsl:attribute>
				</xsl:if>
				<xsl:apply-templates select="data/caption" />
				<xsl:apply-templates select="data/text" />
				<xsl:apply-templates select="data/footer" />
			</div>
		</div><xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text>
	</xsl:template>

	<xsl:template match="caption">
		<div class="caption">
			<xsl:value-of select="." disable-output-escaping="yes" />
		</div>
	</xsl:template>
	<xsl:template match="text">
		<div class="text">
			<xsl:value-of select="." disable-output-escaping="yes" />
		</div>
	</xsl:template>
	<xsl:template match="footer">
		<div class="footer">
			<xsl:value-of select="." disable-output-escaping="yes" />
		</div>
	</xsl:template>
</xsl:stylesheet>
