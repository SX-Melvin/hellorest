package HELLOREST::Service

public Object HelloRestMap inherits RESTIMPL::RESTAPIMap

	override Boolean	fEnabled = TRUE
	override List 		fMap = { 
	 	{ "POST | api/v1/chunking", "hello|ActionChunking" },
		{ "POST | api/v2/GetBusObj", "busobj|GetBusObj" }
	 }

end
