user function tstDebug()
  local a := { 1, 2, 3}
  private cb := {|x| conout("**** " + time() + " " + x) }
  private ct := 0
      
      
  dbselect("SF2")
  dbselect("SF2")
  dbselect("SF2")
  dbselect("SF2")
  dbselect("SF2")
  dbselect("SF2")
      
  conout("func1")
  func1()
  
  aadd(a, 4)
  aadd(a, { 5, date(), time(), "alan"})
  
  conout("func2")
  func2()
  
return

static function func1()

  ct++
  eval(cb, str(ct,2))
  
return

static function func2()
  local nInd    
            
  for nInd := 1 to 5
    ct++
    eval(cb, str(ct,2) + "(" + str(nInd,2) + ")")
  next  
  
return

  