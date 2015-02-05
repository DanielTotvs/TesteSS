#include 'protheus.ch'
#include 'parmtype.ch'

user function pb(cParam)

	Local value
	
	value := getapores(cParam)
	
	return encode64(value)
	
return