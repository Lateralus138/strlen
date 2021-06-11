 #include <iostream>
 #include <regex>

 int main (int argc, char *argv[])
 {
   if (argc < 2) return 1;
   std::regex helpregex ("^-([hH]|-[hH][eE][lL][pP])$");
   std::string str;
   for (auto index = 1; index < argc; index++)
   {
     if (std::regex_match (argv[index], helpregex))
     {
       std::cout << "                                                  " << '\n'
                 << " \'StrLen\' - Get the character length of a string" << '\n'
                 << " in the command line.                             " << '\n'
                 << "                                                  " << '\n'
                 << " USAGE:                                           " << '\n'
                 << "     strlen [SWITCH] <STRING>                     " << '\n'
                 << "                                                  " << '\n'
                 << " SWITCH:                                          " << '\n'
                 << "     -h, --help      This help message.           " << '\n'
                 << "                                                  " << std::endl;
       return 0;
     }
     else
     {
       str.append(argv[index]);
     }
   }
   std::cout << str.length () << std::endl;
 }
