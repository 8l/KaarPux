<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
 
<xsl:output method="text"/>

<xsl:template match="/moduleset/repository">
	<xsl:text>&#xa;</xsl:text>REPO¤<xsl:value-of select="@name" />¤<xsl:value-of select="@href" />¤
</xsl:template>

<xsl:template match="/moduleset/metamodule">
	<xsl:text>&#xa;</xsl:text>METAMODULE¤<xsl:value-of select="@id" />¤
	<xsl:apply-templates select="dependencies">
		<xsl:with-param name="tag">METADEP</xsl:with-param>
		<xsl:with-param name="parent" select="@id" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="/moduleset/systemmodule">
	<xsl:text>&#xa;</xsl:text>SYSTEMMODULE¤<xsl:value-of select="@id" />¤<xsl:value-of select="branch/@version" />¤
</xsl:template>

<xsl:template match="/moduleset/autotools">
	<xsl:text>&#xa;</xsl:text>MODULE¤<xsl:value-of select="@id" />¤autotools¤<xsl:value-of select="branch/@hash" />¤<xsl:value-of select="branch/@module" />¤<xsl:value-of select="branch/@repo" />¤<xsl:value-of select="branch/@version" />¤<xsl:value-of select="@autogenargs" />¤<xsl:value-of select="@makeargs" />¤
	<xsl:apply-templates select="dependencies">
		<xsl:with-param name="tag">DEPENDENCY</xsl:with-param>
		<xsl:with-param name="parent" select="@id" />
	</xsl:apply-templates>
	<xsl:apply-templates select="suggests">
		<xsl:with-param name="tag">SUGGESTS</xsl:with-param>
		<xsl:with-param name="parent" select="@id" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="/moduleset/cmake">
	<xsl:text>&#xa;</xsl:text>MODULE¤<xsl:value-of select="@id" />¤cmake¤<xsl:value-of select="branch/@hash" />¤<xsl:value-of select="branch/@module" />¤<xsl:value-of select="branch/@repo" />¤<xsl:value-of select="branch/@version" />¤¤¤
	<xsl:apply-templates select="dependencies">
		<xsl:with-param name="tag">DEPENDENCY</xsl:with-param>
		<xsl:with-param name="parent" select="@id" />
	</xsl:apply-templates>
	<xsl:apply-templates select="suggests">
		<xsl:with-param name="tag">SUGGESTS</xsl:with-param>
		<xsl:with-param name="parent" select="@id" />
	</xsl:apply-templates>
</xsl:template>


<xsl:template match="dependencies">
	<xsl:param name="tag" />
	<xsl:param name="parent" />
	<xsl:apply-templates select="dep">
		<xsl:with-param name="tag" select="$tag" />
		<xsl:with-param name="parent" select="$parent" />
	</xsl:apply-templates>
	<xsl:apply-templates select="if">
		<xsl:with-param name="tag" select="$tag" />
		<xsl:with-param name="parent" select="$parent" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="suggested">
	<xsl:param name="tag" />
	<xsl:param name="parent" />
	<xsl:apply-templates select="dep">
		<xsl:with-param name="tag" select="$tag" />
		<xsl:with-param name="parent" select="$parent" />
	</xsl:apply-templates>
	<xsl:apply-templates select="if">
		<xsl:with-param name="tag" select="$tag" />
		<xsl:with-param name="parent" select="$parent" />
	</xsl:apply-templates>
</xsl:template>


<xsl:template match="dep">
	<xsl:param name="tag" />
	<xsl:param name="parent" />
	<xsl:text>&#xa;</xsl:text><xsl:value-of select="$tag" />¤<xsl:value-of select="$parent" />¤<xsl:value-of select="@package" />¤
</xsl:template>

<xsl:template match="if">
	<xsl:param name="tag" />
	<xsl:param name="parent" />
	<xsl:variable name="cond" select="@condition-set" />
	<xsl:if test="$cond='linux'">
		<xsl:apply-templates select="dep">
			<xsl:with-param name="tag" select="$tag" />
			<xsl:with-param name="parent" select="$parent" />
		</xsl:apply-templates>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>

