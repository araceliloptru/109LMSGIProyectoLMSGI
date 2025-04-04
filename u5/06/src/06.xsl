<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/network" mode="#all">
        <xsl:variable name="newLine" select="'&#10;'"/>
        <xsl:variable name="newTab" select="'    '"/>
        <xsl:value-of select="concat(name(current()), ':')"/>
        <xsl:for-each select="ethernets">
            <xsl:value-of select="concat($newLine,$newTab,name(current()),':')"/>
            <xsl:value-of select="concat($newLine,$newTab,$newTab,name,':')"/>
            <xsl:value-of select="concat($newLine,$newTab,$newTab,$newTab,name(addresses),':')"/>
            <xsl:value-of select="concat($newLine,$newTab,$newTab,$newTab,$newTab,addresses)"/>
            <xsl:if test="gateway4">
                <xsl:value-of select="concat($newLine,$newTab,$newTab,$newTab,'routes:')"/>
                <xsl:value-of select="concat($newLine,$newTab,$newTab,'to:default')"/>
                <xsl:value-of select="concat($newLine,$newTab,$newTab,'via:',gateway4)"/>
            </xsl:if> <!--  Puerta de enlace -->
            <xsl:if test="nameservers">
                <xsl:value-of select="concat($newLine,$newTab,$newTab,$newTab,name())"/>
                <xsl:value-of select="concat($newLine,$newTab,$newTab,'addresses:')"/>
                <xsl:for-each select="nameservers/addresses">
                    <xsl:value-of select="concat($newLine,$newTab,$newTab,$newTab,current())"/>
                </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>