#define your datamaker functions in .R files in the datamaker subdirectory
#each datamaker should take input seed (integer) and args (list), and output a list with names elements meta and input
#the format of the meta and input elements should be defined in the README
#
eg.datamaker = function(seed,args){

  set.seed(seed)
  
  #here insert the meat of the function that needs to be defined for each dsc to be done
  #Your function should define the variables meta (a list) and input (a list)
  
  #end of meat of function
  
  data = list(meta=meta,input=input)
  
  return(data)

}
