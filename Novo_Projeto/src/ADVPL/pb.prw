#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} function_method_class_name
(long_description)
@author author
@since Feb 19, 2015
@version version
@param param
@return return, return_description
@example
(examples)
@see (links_or_references)
/*/
user function pb(cParam)

	Local value
	ConOut("text")
	ConOut("text")
	ConOut("text")
	ConOut("text")
	ConOut("text")
	ConOut("text")
	ConOut("text")
	ConOut("text")

	value := getapores(cParam)
	
return encode64(value)
	
