package HELLOREST::Service

public Object HelloRestMap inherits RESTIMPL::RESTAPIMap

	override Boolean	fEnabled = TRUE
	override List 		fMap = { 
	 	{ "POST | api/v1/chunking",
		 "hello|ActionChunking" }
	 }

end
