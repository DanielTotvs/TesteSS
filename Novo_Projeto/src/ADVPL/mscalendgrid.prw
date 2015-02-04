#include "TOTVS.CH"

User Function MsCalendGrid()  

Private ntasks := 1

DEFINE DIALOG oDlg TITLE "Exemplo MsCalendGrid" FROM 180,180 TO 660,900 PIXEL	    
// Cria Calendário    
nResolution := 4    
oMsCalendGrid := MsCalendGrid():New( oDlg, 01, 01, 380,184,;
            date(), nResolution, ,{|x,y| Alert(x) },;
            RGB(255,255,196), {|x,y|Alert(x,y)}, .T. )                          

// Adiciona periodos    
oMsCalendGrid:Add('caption 01', ntasks, 10, 20, RGB(255,000,0), 'Descricao 01')
ntasks++
oMsCalendGrid:Add('caption 02', ntasks, 20, 30, RGB(255,255,0), 'Descricao 02')
ntasks++
oMsCalendGrid:Add('caption 03', ntasks, 01, 05, RGB(255,0,255), 'Descricao 03')
ntasks++

oTask:= tPanel():Create(oDlg,184,000,"",,,,CLR_YELLOW,CLR_BLUE,084,025)
cTaskDesc := Space(10)
oTaskDesk := TGet():New( 001,0001,{|x| if(!Empty(x), cTaskDesc := x , cTaskDesc) },oTask,040,009,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTaskDesc,,,, )
cTaskIni := "000"
oTaskIni := TGet():New( 001,0041,{|x| if(!Empty(x), cTaskIni := x , cTaskIni) },oTask,010,009,"@R 999",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTaskIni,,,, )
cTaskFin := "000"
oTaskFin := TGet():New( 001,0061,{|x| if(!Empty(x), cTaskFin := x , cTaskFin) },oTask,020,009,"@R 999",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTaskFin,,,, )
nColor := CLR_HRED
oTaskAdd:= TButton():New( 013, 001, "Add Tarefa"  ,oTask,{|| oMsCalendGrid:Add(cTaskDesc, ntasks, val(cTaskIni), val(cTaskFin), nColor , 'Descricao 01'), If(val(cTaskIni)>0,( aAdd(aTasks,Alltrim(Str(ntasks))),oTasks:SetItems(aTasks),ntasks++),.F.)     }	,60,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
oTaskCor:= TButton():New( 013, 061, "Cor"  ,oTask,{|| TColorTriangle(@nColor) }	,20,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )

oTask2:= tPanel():Create(oDlg,184,090,"",,,,CLR_YELLOW,CLR_BLUE,064,050)
aTasks	:= {'1','2','3'}
nTask 	:= 1
cTask	:= Alltrim(Str(nTask))
oTasks := TComboBox():New(001,001,{|u|if(PCount()>0,cTask:=u,cTask)},aTasks,30,20,oTask2,,{|| nTask := aScan(aTasks,cTask)},,,,.T.,,,,,,,,,'cTask')
cTaskInter := "000"
oTaskInter := TGet():New( 001,031,{|x| if(!Empty(x), cTaskInter := x , cTaskInter) },oTask2,30,009,"@R 999",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTaskInter,,,, )
TButton():New( 013,001, "Del Tarefa"  ,oTask2,{|| If(Val(cTask)>0 .and. oMsCalendGrid:Delete(Val(cTask),Val(cTaskInter)), ( aDel(aTasks,nTask), aSize(aTasks, Len(aTasks)-1),if(Len(aTasks)==0,(aTasks:={'0'},ntasks 	:= 1),.F.),oTasks:SetItems(aTasks), nTask:=1 ) ,.F.)	}	,60,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
TButton():New( 023, 001, "ChangeColor"  ,oTask2,{|| oMsCalendGrid:ChangeColor( Val(cTask), Val(cTaskInter), nColor )	}	,40,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
TButton():New( 023, 041, "Cor"  ,oTask2,{|| TColorTriangle(@nColor) }	,20,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
TButton():New( 033, 001, "GetEscala"  ,oTask2,{|| Alert(oMsCalendGrid:GetIntervalTime(Val(cTask),Val(cTaskInter)))	}	,60,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )

oTask3:= tPanel():Create(oDlg,184,180,"",,,,CLR_YELLOW,CLR_BLUE,068,060)
TButton():New( 001, 001, "GoPrev"  	,oTask3,{|| oMsCalendGrid:GoPrev() }	,30,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
TButton():New( 001, 031, "GoNext"  	,oTask3,{|| oMsCalendGrid:GoNext() }	,30,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
TButton():New( 011, 001, "Reset"  	,oTask3,{|| oMsCalendGrid:Reset() }		,60,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
TButton():New( 021, 001, "SetDefColor"  	,oTask3,{|| oMsCalendGrid:SetDefColor(nColor),oMsCalendGrid:Refresh() }		,40,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
TButton():New( 021, 041, "Cor"  	,oTask3,{|| TColorTriangle(@nColor) }		,20,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )

cTaskDataIni := "  /  /    "
oTaskInter := TGet():New( 032,000,{|x| if(!Empty(x), cTaskDataIni := x , cTaskDataIni) },oTask3,30,009,"@",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTaskDataIni,,,, )
TButton():New( 033, 031, "SetDateIni"  	,oTask3,{|| oMsCalendGrid:SetDateIni(cTod(cTaskDataIni)) }		,30,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )

cTaskResolu := "000"
oTaskInter := TGet():New( 044,000,{|x| if(!Empty(x), cTaskResolu := x , cTaskResolu) },oTask3,30,009,"@R 999",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cTaskResolu,,,, )
TButton():New( 045, 031, "SetResolution"  	,oTask3,{|| oMsCalendGrid:SetResolution(Val(cTaskResolu)) }		,30,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )

oTask4:= tPanel():Create(oDlg,184,260,"",,,,CLR_YELLOW,CLR_BLUE,068,060)
TButton():New( 001, 001, "Horas"  	,oTask4,{|| oMsCalendGrid:SetTimeUnit(0) }	,30,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )
TButton():New( 001, 031, "Dias"  	,oTask4,{|| oMsCalendGrid:SetTimeUnit(1) }	,30,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )

cLine := "01"
oLine := TGet():New( 012,000,{|x| if(!Empty(x), cLine := x , cLine) },oTask4,30,009,"@R 99",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cLine,,,, )
TButton():New( 013, 031, "nLineAtu"  	,oTask4,{|| oMsCalendGrid:nLineAtu := Val(cLine) }		,30,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )

cZoom := "100"
oLine := TGet():New( 022,000,{|x| if(!Empty(x), cZoom := x , cZoom) },oTask4,30,009,"@R 999",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cZoom,,,, )
TButton():New( 023, 031, "nZoom"  	,oTask4,{|| oMsCalendGrid:nZoom := Val(cZoom) }		,30,10,,,.F.,.T.,.F.,,,{|| .T.},,.F. )

/*
oMsCalendGrid:cTopMsg

oMsCalendGrid:nZoom
*/
ACTIVATE DIALOG oDlg CENTERED 
Return

Static Function TColorTriangle(nColor)  
DEFINE DIALOG oDlg TITLE "Exemplo TColorTriangle" FROM 180,180 TO 350,580 PIXEL	    
// Usando New         
oTColorTriangle2 := tColorTriangle():New(0,0,oDlg,200,80)    
oTColorTriangle2:SetColorIni( nColor )  
//ACTIVATE DIALOG oDlg CENTERED 
oDlg:Activate(,,,.T.,{||nColor := oTColorTriangle2:RetColor()},,{|| } )
Return 