<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <!-- *START TEI header*  -->
    
    <!-- matches ?xml -->
    <xsl:template match="/">
        <xsl:copy />
        <xsl:apply-templates /> 
    </xsl:template> 
    
    <!-- matches root TEI element -->
    <xsl:template match="tei:TEI">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <!-- matches TEI header -->
    <xsl:template match="tei:teiHeader">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:fileDesc">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:titleStmt">
        <xsl:copy>
            <xsl:copy-of select="tei:title" />
            
            <xsl:for-each select="author">
                <xsl:copy-of select="node()" />
            </xsl:for-each>
            
            <tei:respStmt>
                <tei:resp>Worked on transitioning the TEI paragraphs edition to be CTS-compliant</tei:resp>
                <tei:orgName ref="http://multepal.spanitalport.virginia.edu/">Multepal</tei:orgName>
                <tei:persName role="principal">Aldo Barriente</tei:persName> 
                <tei:persName role="editor">Allison Bigelow</tei:persName>
                <tei:persName role="editor">Rafael Alvarado</tei:persName>
            </tei:respStmt>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:publicationStmt">
        <xsl:copy>
            <xsl:copy-of select="node()" />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:sourceDesc">
        <xsl:copy>
            <xsl:copy-of select="node()" />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:encodingDesc">
        <xsl:copy>
            <tei:editorialDecl>
                <tei:p>This text is the Castellano column of the Ximenez edition of the Popol Wuj. Because of nature of CTS's unique identifiers
                    us to separate it from the K'iche' column, which is stored as another "work" of the text according to CTS structure.</tei:p>
            </tei:editorialDecl>
            
            <tei:p>The following text is encoded in accordance with TEI standards and with the CTS/CITE Architecture</tei:p>
            
            <tei:refsDecl n="CTS">
                <tei:cRefPattern n="paragraph" 
                    matchPattern="(\w+)" 
                    replacementPattern="#xpath(/tei:TEI/tei:text/tei:body/tei:div/tei:p[@n='$1'])">
                    <tei:p>pointer pattern extracting paragraph</tei:p>
                </tei:cRefPattern>
            </tei:refsDecl>
            <tei:refsDecl>
                <tei:refState unit="paragraph"/>
            </tei:refsDecl>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:profileDesc">
        <xsl:copy>
            <xsl:copy-of select="node()" />
        </xsl:copy>
    </xsl:template>
    
    <!-- END TEI HEADER -->
    
    <!-- START TEXT -->
    
    <xsl:template match="tei:text">
        <xsl:copy>
            <xsl:attribute name="n">urn:cts:mayaLit:lit0001.pw0001.popolwuj-quc</xsl:attribute>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:copy>
            <xsl:attribute name="n">urn:cts:mayaLit:lit0001.pw0001.popolwuj-quc</xsl:attribute>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:div[@xml:lang='quc']">
            <xsl:copy>
                <xsl:attribute name="type">column</xsl:attribute>
                <xsl:apply-templates />
            </xsl:copy>
    </xsl:template>
    
    <!-- Added to prevent output of Spanish column -->
    <xsl:template match="tei:div[@xml:lang='spa']" />
    
    <xsl:template match="tei:p">
        <xsl:copy>
            <xsl:attribute name="n">
                <xsl:value-of select="translate(@xml:id, 'p', '')" />
            </xsl:attribute>
            <xsl:copy-of select="node()" />
        </xsl:copy>
    </xsl:template>
    
    <!--  END TEXT  -->
    
</xsl:stylesheet>