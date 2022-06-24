<?xml version="1.0" encoding="UTF-8"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude">
   <teiHeader>
      <fileDesc>
         <titleStmt>
            <title>Popol Wuj: Versión Poética K'iche'</title>
            <author>Colop, Sam</author>
            <tei:respStmt xmlns:tei="http://www.tei-c.org/ns/1.0">
               <tei:resp>Worked on transitioning the TEI paragraphs edition to be CTS-compliant</tei:resp>
               <tei:orgName ref="http://multepal.spanitalport.virginia.edu/">Multepal</tei:orgName>
               <tei:persName role="principal">Aldo Barriente</tei:persName>
               <tei:persName role="editor">Allison Bigelow</tei:persName>
               <tei:persName role="editor">Rafael Alvarado</tei:persName>
            </tei:respStmt>
         </titleStmt>
         <publicationStmt>
            <publisher>Cholsamaj</publisher>
            <pubPlace>Iximulew</pubPlace>
         </publicationStmt>
         <sourceDesc>
            <p/>
         </sourceDesc>
      </fileDesc>
      <encodingDesc>
         <tei:editorialDecl xmlns:tei="http://www.tei-c.org/ns/1.0">
            <tei:p>This text is the Castellano column of the Ximenez edition of the Popol Wuj. Because of nature of CTS's unique identifiers
                    us to separate it from the K'iche' column, which is stored as another "work" of the text according to CTS structure.</tei:p>
         </tei:editorialDecl>
         <tei:p xmlns:tei="http://www.tei-c.org/ns/1.0">The following text is encoded in accordance with TEI standards and with the CTS/CITE Architecture</tei:p>
         <tei:refsDecl xmlns:tei="http://www.tei-c.org/ns/1.0" n="CTS">
            <tei:cRefPattern n="paragraph"
                             matchPattern="(\w+)"
                             replacementPattern="#xpath(/tei:TEI/tei:text/tei:body/tei:div/tei:p[@n='$1'])">
               <tei:p>pointer pattern extracting paragraph</tei:p>
            </tei:cRefPattern>
         </tei:refsDecl>
         <tei:refsDecl xmlns:tei="http://www.tei-c.org/ns/1.0">
            <tei:refState unit="paragraph"/>
         </tei:refsDecl>
      </encodingDesc>
      <profileDesc>
         <langUsage>
            <language ident="quc">K'iche'</language>
            <language ident="spa">Español</language>
         </langUsage>
      </profileDesc>
   </teiHeader>
   <text n="urn:cts:mayaLit:lit0001.pw0002.colop-pk">
                    Popol Wuj
                    Versión Poética K'iche'
                
                    Sam Colop    
                
                <div type="nimatasik"/>
      <div type="nimatasik"/>
      <div type="nimatasik"/>
      <div type="nimatasik"/>
      <body n="urn:cts:mayaLit:lit0001.pw0002.colop-pk">
         <div type="nimatasik"/>
         <div type="nimatasik"/>
         <div type="nimatasik"/>
         <div type="nimatasik"/>
         <div type="nimatasik"/>
      </body>
      <div type="nimatasik"/>
   </text>
</TEI>
