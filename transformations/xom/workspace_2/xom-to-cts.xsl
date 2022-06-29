<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all" 
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//body/div"/>
    </xsl:template>
    
    <xsl:template match="div">
        <xsl:result-document method="xml" indent="yes" href="output/lit0001.pw0001.popolwuj-{@xml:lang/string()}.xml">
            <TEI>
                <xsl:apply-templates select="root()/TEI/teiHeader"/>
                <text xml:id="{ancestor::text/@xml:id}"
                    n="urn:cts:mayaLit:lit0001.pw0001.popolwuj-{@xml:lang/string()}">
                    <body xml:id="{ancestor::text/@xml:id}" n="urn:cts:mayaLit:lit0001.pw0001.popolwuj-{@xml:lang/string()}">
                        <xsl:apply-templates/>
                    </body>
                </text>
            </TEI>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="teiHeader">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="titleStmt">
        <xsl:copy>
            <xsl:copy-of select="title" />
            
            <xsl:copy-of select="author"/>
            
            <respStmt>
                <resp>Worked on transitioning the TEI paragraphs edition to be CTS-compliant</resp>
                <orgName ref="http://multepal.spanitalport.virginia.edu/">Multepal</orgName>
                <persName role="principal">Aldo Barriente</persName> 
                <persName role="editor">Allison Bigelow</persName>
                <persName role="editor">Rafael Alvarado</persName>
            </respStmt>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="encodingDesc">
        <xsl:copy>
            <editorialDecl>
                <p>This text is the Castellano column of the Ximenez edition of the Popol Wuj. Because of nature of CTS's unique identifiers
                    us to separate it from the K'iche' column, which is stored as another "work" of the text according to CTS structure.</p>
            </editorialDecl>
            
            <p>The following text is encoded in accordance with TEI standards and with the CTS/CITE Architecture</p>
            
            <refsDecl n="CTS">
                <cRefPattern n="paragraph" 
                    matchPattern="(\w+)" 
                    replacementPattern="#xpath(/tei:TEI/tei:text/tei:body/tei:div/tei:p[@n='$1'])">
                    <p>pointer pattern extracting paragraph</p>
                </cRefPattern>
            </refsDecl>
            <refsDecl>
                <refState unit="paragraph"/>
            </refsDecl>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="profileDesc">
        <xsl:copy>
            <langUsage>
                <language ident="quc">K'iche'</language>
            </langUsage>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="div/p">
        <xsl:copy>
            <xsl:attribute name="n">
                <xsl:value-of select="tokenize(@xml:id, 'p')[last()]" />
            </xsl:attribute>
            <xsl:copy-of select="node()" />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
