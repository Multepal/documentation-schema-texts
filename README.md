# documentation-schema-texts
Development space for the TEI ODD and TEI headers used to validate all source texts to be ingested by Multepal/aanalte.

## Basic Documentation for the Multepal.odd

Every new rule, element, module, or attribute declaration must be inside [text/body/schemaSpec]

` 
<text>
    <body>
        <schemaSpec>
            <!-- All edits to the schema should go in here. -->
        </schemaSpec>
    </body>
</text>
`

To add, change or delete an element, you must edit its information within elementSpec. 

`
<elementSpec iden="elementName" mode="add, change, replace, or delete">
<gloss>One or two words for what the element stands for.</gloss>
<desc>A brief sentence describing the element's purpose.</desc>
</elementSpec>
`
