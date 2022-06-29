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
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <!-- *START TEI header*  -->
    
    <!-- matches ?xml -->
    <xsl:template match="/">
        <xsl:result-document method="xml" indent="yes" href="output/lit0001.pw0002.popolwuj-colop-pk.xml">
            <xsl:copy />
            <xsl:apply-templates />
        </xsl:result-document>
    </xsl:template> 
    
    <!-- matches root TEI element -->
    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <!-- matches TEI header -->
    <xsl:template match="teiHeader">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="fileDesc">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="titleStmt">
        <xsl:copy>
            <xsl:copy-of select="title" />
            
            <xsl:copy-of select="author" />
            
            <!-- UPDATE BEFORE RUNNING -->
            <respStmt>
                <resp>Encoding and maintenance of Luis Enrique Sam Colop's 1999 Versión Poética K'iche' </resp>
                <orgName ref="http://multepal.spanitalport.virginia.edu/">Multepal</orgName>
                <persName role="principal">Aldo Barriente</persName> 
                <persName role="editor">Allison Bigelow</persName>
                <persName role="editor">Rafael Alvarado</persName>
            </respStmt>
            <!-- END UPDATE -->
            
        </xsl:copy>
    </xsl:template>
    
    <!-- UPDATE BEFORE RUNNING - TEXT STRUCTURE -->
    <xsl:template match="encodingDesc">
        <xsl:copy>
            
            <p>The following text is encoded in accordance with TEI standards and with the CTS/CITE Architecture</p>
            
            <refsDecl n="CTS">
                <cRefPattern n="l" 
                    matchPattern="(\w+).(\w+).(\w+)" 
                    replacementPattern="#xpath(/TEI/text/body/div[@n='$1']/lg[@n='$2']/l[@n='$3'])">
                    <p>pointer pattern extracting line</p>
                </cRefPattern>
                <cRefPattern n="lg"
                    matchPattern="(\w+).(\w+)"
                    replacementPattern="#xpath(/TEI/text/body/div[@n='1']/lg[@n='$2'])">
                    <p>pointer pattern extracting line group</p>
                </cRefPattern>
                <cRefPattern n="div"
                    matchPattern="(\w+)"
                    replacementPattern="#xpath(/TEI/text/body/div[@n='$1'])">
                    <p>pointer pattern extracting part</p>
                </cRefPattern>
                
            </refsDecl>
            <refsDecl>
                <refState unit="line"/>
                <refState unit="lg"/>
                <refState unit="div"/>
            </refsDecl>
        </xsl:copy>
    </xsl:template>
    
    <!-- END UPDATE -->
    
    <!-- END TEI HEADER -->
    
    <!-- START TEXT -->
    
    <xsl:template match="text">
        <text n="urn:cts:mayaLit:lit0001.pw0002.popolwuj-colop-pk">
            <xsl:apply-templates />
        </text>
    </xsl:template>

    <xsl:template match="body">
        <body n="urn:cts:mayaLit:lit0001.pw0002.popolwuj-colop-pk">
            <xsl:apply-templates />
        </body>
    </xsl:template>
    
    <!-- ADD @n values here -->
    <xsl:template match="body/div">
        <div type="nimatasik" n="{count(preceding-sibling::node())}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="div/lg">
        <lg type="{@type}" xml:id="{@xml:id}" n="{tokenize(@xml:id, '\.')[last()]}">
            <xsl:apply-templates/>
        </lg>
    </xsl:template>
    
    <!--  END TEXT  -->
    
    
</xsl:stylesheet>
    
    
