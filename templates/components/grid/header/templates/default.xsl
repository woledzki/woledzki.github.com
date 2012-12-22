<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:php="http://php.net/xsl"
>
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/component">
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="{$H_BASE_PATH}/index.page">wojtek.oledzki</a>
					<ul class="nav">
						<li class="active"><a href="#">Home</a></li>
						<!-- 
						<li><a href="#">Blog</a></li>
						 -->
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
