with Ada.Text_IO; use Ada.Text_IO;
with Extract_List_Files; use Extract_List_Files;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Parser_Xml; use Parser_Xml;

procedure Main is
   Return_From_Call_String : Unbounded_String;
   Return_From_Call_Vector : Parser_Xml.String_Vector.Vector;
begin
   -- Print the list of xml files
   -- Put_Line(Extract_List_Files.Print_List("obj/xml"));

   -- Return_From_Call_Vector := Get_List("obj/xml");
   -- Put_Line(Integer'Image(Integer(Return_From_Call_Vector.Length)));

   --
   --Return_From_Call_String :=
   --  Extract_Nodes(File_Name   => "obj/xml/xml_test.xml",
   --                Parent_Name => "lillo");

   Return_From_Call_Vector :=
     Get_Nodes_Value_From_Xml_Tree(Xml_Tree          =>
                                     Get_Xml_Tree_From_File(
                                       File_Name   => "obj/xml/xml_test.xml",
                                       Description => "Addresses list"),
                                   Value_Description => "addr");
   for Index in 0 .. (Integer(Return_From_Call_Vector.Length) - 1) loop
      Put_Line(Return_From_Call_Vector.Element(Integer(Index)));
   end loop;


end Main;
