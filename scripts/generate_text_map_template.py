"""
Developed by Aldo Barriente 09/2025
Used for generating empty text map template for TEI encoded edition

ARGUMENTS

IN_FILE_NAME: file name of input text
OUT_FILE_NAME: file name of output text map
XPATH_TO_ID: xpath to desired level of division within text
    - should be one level above the textual unit to be used in the text map
SOURCE_ELEMENT: the desired element that will be added to the mapping for this text
TARGET_IDENTIFIER: the standardized naming for the target text in this mapping (e.g. xkom, cpk)
TARGET_ELEMENT: the element to be used along with the target identifier in the mapping

Examples

python3 generate_text_map_template.py "colop.xml" "cpk-mapa.xml" "text/body/div" "lg" "xkom" "p"
python3 generate_text_map_template.py "poopolwuuj-chel-ramirez-yukateko.xml" "cryukb-mapa.xml" "text/body/div/div" "p" "xkom" "p"

writes text map template to OUT_FILE_NAME
"""
import sys
import xml.etree.ElementTree as et
NAMESPACE = '{http://www.tei-c.org/ns/1.0}'
XML_ID_KEY = '{http://www.w3.org/XML/1998/namespace}id'

def parse_inputs():
    return {
        "in_text": sys.argv[1],
        "out_text": sys.argv[2],
        "xpath": sys.argv[3],
        "source_element": sys.argv[4],
        "target_identifier": sys.argv[5],
        "target_element": sys.argv[6]
    }
    
def format_xpath(xpath):
    delimited = xpath.split("/")
    output_path = ""
    for element in delimited:
        output_path += f"{NAMESPACE}{element}/"
        
    return output_path

def main():
    
    inputs = parse_inputs()
    
    et.register_namespace('', NAMESPACE)
    text_tree = et.parse(inputs["in_text"])
    
    root = text_tree.getroot()

    with open (inputs["out_text"], 'w', encoding='utf-8') as out:
        map_root = et.Element("joinGrp")
        target_xpath = format_xpath(inputs["xpath"])
        print(target_xpath)
        print(inputs)
        for child in root.findall(target_xpath): ## xpath to source element parent (ie one above source element) 
            print(child.attrib)
            if child.tag == f'{NAMESPACE}{inputs["source_element"]}': ## only number designated source element elements
                target = {
                    "target": f"#{child.attrib[XML_ID_KEY]} #{inputs['target_identifier']}-{inputs['target_element']}"
                }
                et.SubElement(map_root, "join", target) # create <join> element
        tree = et.ElementTree(map_root)
        et.indent(tree, space="\t", level=0)
        xml_string = et.tostring(map_root, encoding="unicode")
        out.write(xml_string)


if __name__ == "__main__":
    main()