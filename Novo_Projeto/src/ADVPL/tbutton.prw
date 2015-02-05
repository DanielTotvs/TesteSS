#include "TOTVS.CH"
User Function TButton()  
	
	DEFINE DIALOG oDlg TITLE "Exemplo TButton" FROM 180,180 TO 550,700 PIXEL
	
	dbselect("SF2")	    
	
	// Usando o New    
	
	oPanel:= tPanel():New(01,01,,oDlg,,,,CLR_YELLOW,CLR_BLUE,35,15)
	oTButton1 := TButton():New( 002, 002, "Botão &A",oPanel,{||alert("Botão A")}, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )    
	TButton():New( 002, 035, "Hide",oDlg,{||oTButton1:lVisible := .F. }, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )
	TButton():New( 002, 065, "Show",oDlg,{||oTButton1:lVisible := .T.}, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )
	TButton():New( 002, 095, "HidePanel",oDlg,{||oPanel:lVisible := .F.}, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )
	TButton():New( 002, 125, "ShowPanel",oDlg,{||oPanel:lVisible := .T.}, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )
	
	oTButton2 := TButton():New( 022, 002, "Botão &B",oDlg,{||alert("Botão B")}, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )    
	TButton():New( 022, 035, "Hide",oDlg,{||oTButton2:lVisible := .F. }, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )
	TButton():New( 022, 065, "Show",oDlg,{||oTButton2:lVisible := .T.}, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )
	oTButton3 := TButton():New( 042, 002, "Botão &C",oDlg,{||alert("Botão C")}, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )
	TButton():New( 042, 035, "Hide",oDlg,{||oTButton3:lVisible := .F. }, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )
	TButton():New( 042, 065, "Show",oDlg,{||oTButton3:lVisible := .T.}, 30,10,,,.F.,.T.,.F.,,.F.,,,.F. )

	ACTIVATE DIALOG oDlg CENTERED 
Return