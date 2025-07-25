package HELLOREST::Service

public Object HelloRest inherits RESTIMPL::RestAPIs

	override	Boolean	fEnabled = TRUE
	override	String	fResource = 'hello'
	override	Integer	fVersion = 1

	public List fPrototypeActionChunking = {
//		{'isFinal',-1,'is this the final chunk?',false},
//		{'chunkFile',-1,'the chunk file',false},
//		{'fileName',-1,'the original file name',false},
//	 	{'guid',-1,'indetifier for each chunks',false}
	}
	 	
	public function Assoc ActionChunking(Object	prgCtx, Record	request)
//		string pathForChunKing = "D:\Apps\Opentext\Upload\ChunKing"
		Assoc   returnData = Assoc.CreateAssoc()
		Assoc   retVal = Assoc.CreateAssoc()
		
		retVal.ok = TRUE
		returnData.message = "Hello REST World"
		retVal.data = returnData
		retVal.statusCode = 200
		
		return retVal
	end
	
end
