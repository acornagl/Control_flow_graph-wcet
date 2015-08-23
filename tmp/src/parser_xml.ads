with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Indefinite_Vectors; use Ada.Containers;
-- XML includes libraries
with Input_Sources.File; use Input_Sources.File;
with Sax.Readers;        use Sax.Readers;
with DOM.Readers;        use DOM.Readers;
with DOM.Core;           use DOM.Core;
with DOM.Core.Documents; use DOM.Core.Documents;
with DOM.Core.Nodes;     use DOM.Core.Nodes;
with DOM.Core.Attrs;     use DOM.Core.Attrs;

package Parser_Xml is

   -- Simple vector of Strings
   package String_Vector is new Indefinite_Vectors (Natural, String);

   function Extract_Nodes (File_Name : String;
                           Parent_Name : String)
                           return Unbounded_String;

   function Get_Xml_Tree_From_File (File_Name : String;
                                    Description : String)
                                    return Document;

   function Get_Nodes_Value_From_Xml_Tree (Xml_Tree : Document;
                                           Value_Description : String)
                                           return String_Vector.Vector;

end Parser_Xml;
