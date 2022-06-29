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
    
    <xsl:template match="body/div">
        <xsl:result-document method="xml" indent="yes" href="output/lit0001.pw0003.popolwuj-chel-{@xml:lang}.xml">
            <TEI>
                <xsl:apply-templates select="root()/TEI/teiHeader"/>
                
                <text n="urn:cts:mayaLit:lit0001.pw0003.popolwuj-{@xml:lang/string()}">
                    <xsl:apply-templates select="root()/TEI/text/front"/>
                    
                    <body xml:id="{ancestor::text/@xml:id}" n="urn:cts:mayaLit:lit0001.pw0003.popolwuj-chel-{@xml:lang}">
                        <div type="{@type}">
                            <xsl:apply-templates/>
                        </div>
                    </body>
                    
                    <xsl:apply-templates select="root()/TEI/text/back"/>
                </text>
            </TEI>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="body/div/div">
        <div type="{@type}" n="{tokenize(@n, '\.')[last()]}">
            <xsl:apply-templates/>
        </div>
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
            <p>The following text is encoded in accordance with TEI standards and with the CTS/CITE Architecture</p>
            
            <refsDecl n="CTS">
                <cRefPattern n="paragraph" 
                    matchPattern="(\w+).(\w+)" 
                    replacementPattern="#xpath(/tei:TEI/tei:text/tei:body/tei:div/tei:div[@n='$1']/tei:p[@n='$2'])">
                    <p>pointer pattern extracting paragraph</p>
                </cRefPattern>
                <cRefPattern n="tsúuk"
                    matchPattern="(\w+)"
                    replacementPattern="#xpath(/tei:TEI/tei:text/tei:body/tei:div/tei:div[@n='$1'])">
                    <p>pointer pattern extracting tsúuk (section)</p>
                </cRefPattern>
            </refsDecl>
            <refsDecl>
                <refState unit="paragraph"/>
                <refState unit="tsúuk"/>
            </refsDecl>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="profileDesc">
        <xsl:copy>
            <langUsage>
                <language ident="yua">Yukatek</language>
            </langUsage>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="div/p">
        <p n="{count(preceding-sibling::p) + 1}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>
