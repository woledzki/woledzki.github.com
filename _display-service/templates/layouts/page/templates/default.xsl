<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:php="http://php.net/xsl"
>
<xsl:output method="html" 
	encoding="utf-8"
	media-type="text/html" 
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	cdata-section-elements="script style"
	indent="yes"
/>
	
	<xsl:template match="/component">
		<!--
		<xsl:variable name="head">
			<xsl:value-of disable-output-escaping="yes" select="php:function('get_head')" />
		</xsl:variable>
		-->
		<html>
			<head>
				<meta http-equiv="content-type" content="text/html; charset=utf-8" />
				<title><xsl:value-of select="data/title" /></title>
				<meta name="keywords" content="" />
				<meta name="description" content="" />

				<link rel="shortcut icon" href="{$H_BASE_PATH}/favicon.ico" type="image/x-icon" />
				<link rel="icon" href="{$H_BASE_PATH}/favicon.ico" type="image/x-icon" />

				<link rel="stylesheet" type="text/css" media="all" 
					href="{$H_BASE_PATH}/static/styles/css/main.css"
				/>
			</head>
			<body>
				<xsl:value-of select="$H_SUB_COMPONENTS" disable-output-escaping="yes" />
				<script src="{$H_BASE_PATH}/static/scripts/app.js" type="text/javascript"></script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
