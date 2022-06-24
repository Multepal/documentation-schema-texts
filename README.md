# documentation-schema-texts
Development space for the TEI ODD (schema), TEI headers, and XSLTs used to validate all source texts to be ingested by Multepal/aanalte.

## Basic Documentation for the Multepal.odd

Every new rule, element, module, or attribute declaration must be inside [TEI/text/body/schemaSpec]

``` 
<TEI>
    <teiHeader>...</teiHeader>
    <text>
        <body>
            <schemaSpec>
                <!-- All edits to the schema should go in here. -->
            </schemaSpec>
        </body>
    </text>
```

To add, change or delete an element, you must edit its information within elementSpec. 
This element also allows for use of `<gloss>` and `<desc>` to describe the use of
the element.

```
<elementSpec ident="elementName" mode="add | change | replace | delete">
    <gloss>One or two words for what the element stands for.</gloss>
    <desc>A brief sentence describing the element's purpose.</desc>
</elementSpec>
```
