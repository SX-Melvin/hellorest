package HELLOREST::Utils

public Object Utils inherits HELLOREST::HelloRestRoot
	
	// Append Content From A File To Another
	public function void AppendContentToChunk(string targetPathstring, string contentToAddPath)
		File targetFile = File.Open( targetPathstring, File.WriteBinMode )
		File contentFile = File.Open( contentToAddPath, File.ReadBinMode )
		
		if ( !IsError( contentFile ) )
			Bytes s = File.ReadBytes( contentFile, 10485760 )
	        File.WriteBytes(targetFile, s)
		    File.Close( contentFile ) 
		end

        File.Close( targetFile ) 
	end
	
	// Get File Extension
	function string GetFileExtension(string fileName, boolean withoutDot = false)
		string result = fileName
		List names = Str.Elements(fileName, ".")
		if(Length(names) > 1)
			if(withoutDot)
				result = names[Length(names)]
			else
				result = Str.Format(".%1", names[Length(names)])
			end
		end

		return result
	end
end
