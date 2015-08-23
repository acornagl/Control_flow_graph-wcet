with Ada.Directories;  use Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Indefinite_Vectors; use Ada.Containers;

package Extract_List_Files is

   -- Simple vector of Strings
   package String_Vector is new Indefinite_Vectors (Natural, String);

   -- Print the xml list files in a specified folder
   function Print_List(Path_To_Files : String) return String;

   -- Return the xml list files that are contained in a folder
   function Get_List(Path_To_Files : String) return String_Vector.Vector;
end Extract_List_Files;
