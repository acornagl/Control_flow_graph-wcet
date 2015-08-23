-- XML includes libraries
with Input_Sources.File; use Input_Sources.File;
with Sax.Readers;        use Sax.Readers;
with DOM.Readers;        use DOM.Readers;
with DOM.Core;           use DOM.Core;
with DOM.Core.Documents; use DOM.Core.Documents;
with DOM.Core.Nodes;     use DOM.Core.Nodes;
with DOM.Core.Attrs;     use DOM.Core.Attrs;
with Ada.Text_IO; use Ada.Text_IO;

package body Parser_Xml is

   -------------------
   -- Extract_Nodes --
   -------------------

   function Extract_Nodes
     (File_Name : String;
      Parent_Name : String)
      return Unbounded_String
   is
      Return_String 	: Unbounded_String;

      -- XML variables
      Input  		: File_Input;
      Reader 		: Tree_Reader;
      Xml_Tree 		: Document;
      Xml_Nodes_List   	: Node_List;
      Xml_Sub_Nodes_List   	: Node_List;
      Xml_Node		: DOM.Core.Node;
      -- Xml_Sub_Node      : DOM.Core.Node;
      --

   begin
      -- Open the XML file
      Set_Public_Id (Input, "Xml file under analysis");
      Open (File_Name, Input);

      -- Parse, load and close the XML file
      Parse (Reader, Input);
      Close (Input);

      -- Generate the XML DOM tree from the loaded structure
      Xml_Tree := Get_Tree (Reader);

      -- Load all the principal nodes in one XML elements list
      Xml_Nodes_List := Get_Elements_By_Tag_Name (Xml_Tree, "addr");

      -- Inspect one node per time in order to retrive its information
      for Index in 1 .. Length(Xml_Nodes_List) loop
         -- Select the node
         Xml_Node := Item(Xml_Nodes_List, Index - 1);
         --Xml_Sub_Nodes_List := Get_Elements_By_Tag_Name (Xml_Node, "addr");
         Put_Line(Value(First_Child(Xml_Node)));
         -- Open it and extract relevant information from sub-nodes
         --Xml_Sub_Nodes_List := Get_Elements_By_Tag_Name (Xml_Node, "addr");
         --
         -- It is expected only one element
         --for Sub_Index in 1 .. Length(Xml_Sub_Nodes_List) loop
         --   Xml_Sub_Node := Item(Xml_Sub_Nodes_List, Index - 1);
         --   Put_Line(Node_Value (First_Child (Xml_Sub_Node)));
         --end loop;
      end loop;

      ------
      --List := Get_Elements_By_Tag_Name (Doc, "pref");
      --
      --for Index in 1 .. Length (List) loop
      --   N := Item (List, Index - 1);
      --   A := Get_Named_Item (Attributes (N), "name");
      --   Put_Line ("Value of """ & Value (A) & """ is "
      --             & Node_Value (First_Child (N)));
      --end loop;
      ------

      return To_Unbounded_String("aaaa");
   end Extract_Nodes;

   function Get_Xml_Tree_From_File (File_Name : String;
                                    Description : String)
                                    return Document
   is
      Input  	: File_Input;
      Reader 	: Tree_Reader;
      Xml_Tree 	: Document;
   begin

      -- Open the XML file
      Set_Public_Id (Input, "Xml file under analysis");
      Open (File_Name, Input);

      -- Parse, load and close the XML file
      Parse (Reader, Input);
      Close (Input);

      -- Generate the XML DOM tree from the loaded structure
      Xml_Tree := Get_Tree (Reader);

      -- Return the Xml tree
      return Xml_Tree;

   end Get_Xml_Tree_From_File;

   function Get_Nodes_Value_From_Xml_Tree (Xml_Tree : Document;
                                           Value_Description : String)
                                           return String_Vector.Vector
   is
      Xml_Node		: DOM.Core.Node;
      Xml_Nodes_List 	: Node_List;
      Node_Value     	: Unbounded_String;
      Return_List 	: String_Vector.Vector;
   begin
      -- Load all the principal nodes in one XML elements list
      Xml_Nodes_List := Get_Elements_By_Tag_Name (Xml_Tree, "addr");

      -- Inspect one node per time in order to retrive its information
      for Index in 1 .. Length(Xml_Nodes_List) loop
         -- Select the node
         Xml_Node := Item(Xml_Nodes_List, Index - 1);

         -- Extract the node value
         Node_Value := To_Unbounded_String(Value(First_Child(Xml_Node)));

         -- Append the node value to the result list
         Return_List.Append(To_String(Node_Value));
      end loop;

      return Return_List;

   end Get_Nodes_Value_From_Xml_Tree;


end Parser_Xml;
