package = "lualmfit"
version = "1.0-1"
source = {
   url = "..." -- not online yet!
}
build = {
   type = "builtin",
   modules = {
      lmfit =
      	{sources = {"lualmfit.c","lmfit/lmmin.c"},

         incdirs = {"lmfit"},
         libdirs = {"lmfit"} 
}
   }
}