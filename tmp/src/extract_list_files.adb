with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Indefinite_Vectors; use Ada.Containers;
--with Ada.Containers.Vectors;     use Ada.Containers;

package body Extract_List_Files is

   ----------------
   -- Print_List --
   ----------------
   -- The current function assumes as root of the relative path the root
   -- of the project.

   function Print_List (Path_To_Files : String) return String is
      Result : String := "";
      Search_Result_List : Search_Type;
      Files_Relative_Path : String := Path_To_Files;
      Dir_Ent : Directory_Entry_Type;
      Count_Elements : Integer := 0;
      Line_Result : Unbounded_String;
   begin
      -- Print the root of the project
      Put_Line(Ada.Directories.Containing_Directory("."));

      -- Search all the files that end with ".xml"
      Start_Search (Search_Result_List, Files_Relative_Path, "*.xml");

      -- Print to shell all the found files
      while More_Entries (Search_Result_List) loop
         Count_Elements := Count_Elements + 1;
         Line_Result :=
           To_Unbounded_String(Integer'Image(Count_Elements));

         Get_Next_Entry (Search_Result_List, Dir_Ent);

         Append(Line_Result, ") ");
         Append(Line_Result, Simple_Name(Dir_Ent));
         Put_Line(To_String(Line_Result));
      end loop;

      End_Search (Search_Result_List);

      return "Everyting went all right";
   end Print_List;

   --------------
   -- Get_List --
   --------------
   -- The current function treats assumes as root of the relative path the root
   -- of the project.

   function Get_List (Path_To_Files : String) return String_Vector.Vector is
      Result_List : String_Vector.Vector;
      Search_Result_List : Search_Type;
      Files_Relative_Path : String := Path_To_Files;
      Dir_Ent : Directory_Entry_Type;
      Count_Elements : Integer := 0;
      Line_Result : Unbounded_String;
      Translate_To_String : Unbounded_String;
   begin
      -- Print the root of the project
      Put_Line(Ada.Directories.Containing_Directory("."));

      -- Search all the files that end with ".xml"
      Start_Search (Search_Result_List, Files_Relative_Path, "*.xml");

      -- Print to shell all the found files
      while More_Entries (Search_Result_List) loop
         Get_Next_Entry (Search_Result_List, Dir_Ent);
         --Translate_To_String := To_Unbounded_String(Dir_Ent);
         Result_List.Append(Simple_Name(Dir_Ent));
      end loop;

      End_Search (Search_Result_List);

      Put_Line("Xml list files generated successfully!");

      return Result_List;
   end Get_List;

end Extract_List_Files;
