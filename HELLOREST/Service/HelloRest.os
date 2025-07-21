package HELLOREST::Service

public Object HelloRest inherits RESTIMPL::RestAPIs

	override	Boolean	fEnabled = TRUE
	override	String	fResource = 'hello'
	override	Integer	fVersion = 1

	public List fPrototypeActionChunking = {
		{'isFinal',-1,'is this the final chunk?',false},
		{'chunkFile',-1,'the chunk file',false},
		{'part',-1,'which part is this chunk?',false},
		{'fileName',-1,'the original file name',false},
	 	{'guid',-1,'indetifier for each chunks',false}
	}
	 	
	public function Assoc ActionChunking(Object	prgCtx, Record	request)
		string pathForChunKing = "D:\Apps\Opentext\Upload\ChunKing"
		Assoc   returnData = Assoc.CreateAssoc()
		Assoc   retVal = Assoc.CreateAssoc()
		
		retVal.ok = TRUE
		returnData.message = "Hello REST World"
		retVal.data = returnData
		retVal.statusCode = 200
		
		string guidPath = Str.Format("%1\%2\", pathForChunKing, request.guid)
		string chunkFilePath = Str.Format("%1\%2.part%3", guidPath, request.guid, request.part)
		string actualFilePath = Str.Format("%1\%2", guidPath, request.fileName)
		
		// Create The Folder If Not Exist
		if(!File.Exists(guidPath))
			File.Create(guidPath)
		end
		
		// Check If The Folder Is Empty
		if(Length(File.FileList(guidPath)) == 0)
			// If Empty Then We Create The Actual File
			File.Create(actualFilePath)
		end
		
		// Create The Chunk File If Not Exist
		if(!File.Exists(chunkFilePath))
			File.Create(chunkFilePath)
		end
		
		$HelloRest.Utils.AppendContentToChunk(chunkFilePath, request.chunkFile)
		
		if(request.isFinal == "true")
			string item
			for item in File.FileList(guidPath)
				integer locate = Str.LocateI($HelloRest.Utils.GetFileExtension(item), "part")
				// Is This .part File?
				if(IsDefined(locate))
					$HelloRest.Utils.AppendContentToChunk(item, actualFilePath)
				end
			end
		end
		
//		scheduler.debugbreak()
		return retVal
	end
	
end
