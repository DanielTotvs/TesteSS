User Function WTJob1
	Local nVolta:=0
	ConOut( dtoc( Date() )+" "+Time()+" Iniciando o job...." )   
	While !KillApp()
		nVolta++
		ConOut( dtoc( Date() )+" "+Time()+" Executando os comandos SFDASDFSADFSD" )
		If nVolta > 10
			volta:=0
			ConOut( dtoc( Date() )+" "+Time()+" Fim do Job" ) // Joga a mensagem no console
			Exit
		Endif

	Enddo
Return