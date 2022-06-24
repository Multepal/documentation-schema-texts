<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-skip"/>
    
    <xsl:template match="/">
        <elementSpec ident="rs" module="core" mode="change" xml:lang="quc">
            <attList>
                <attDef ident="ana" mode="replace" usage="req">
                   <valList type="closed">
                       <xsl:apply-templates/>
                   </valList>
                </attDef>
            </attList>
        </elementSpec>
    </xsl:template>

    <xsl:template match="key">
        <valItem ident="{text()}"/>
    </xsl:template>

</xsl:stylesheet>