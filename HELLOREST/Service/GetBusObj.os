package HELLOREST::Service

public Object GetBusObj inherits HELLOREST::Service::RestAPI2

	override	String	fResource = "busobj"
	override	String	fAction = "GetBusObj"
	override	Boolean	fEnabled = TRUE
//	override	Assoc	fExtraHeaders
	override	Integer	fVersion = 2
	override	Boolean	fCloseSocket = TRUE
	override	Dynamic	fResult = "sda"
	override	Integer	fStatusCode = 200

	/**
	 * This method will get prototypes
	 *
	 *
	 * @param {List} The    prototypes
	 *
	 */
	override function List GetPrototypes()

		List    prototypes


		//
		// Get the parent's prototypes
		//
		// prototypes = super.GetPrototypes()

		//
		// Add object-specific prototypes (ee $WEBDSP.PrototypePkg.Documentation)
		//
		// prototypes = { @prototypes, {} }


		return prototypes

	end

	/**
	 * This method will return the result.
	 *
	 * @return {Assoc} 
	 */
	override function Assoc GetResponse()

		Assoc   response
		Assoc   checkVal
		Assoc   collection
		String  selfLink


		if ( IsDefined( this.fResult ) )

			response.results = this.fResult

		else

			response.results = Assoc.CreateAssoc()

		end


		//
		// Get references (if applicable)
		//

		if ( IsDefined( this.fReferences ) )

			response.references = this.fReferences

		end


		//
		// Get links for the current resource.
		//
		response.links = this.GetLinks()
		selfLink = response.links.data.self.href


		//
		// Get paging information (if applicable)
		//
		checkVal = this.GetPaging( selfLink )

		if ( Length( checkVal ) > 0 )

			collection.paging = checkVal

		end

		//
		// Get sorting information (if applicable)
		//
		checkVal = this.GetSorting( selfLink )

		if ( Length( checkVal ) > 0 )

			collection.sorting = checkVal

		end

		//
		// Get filtering information (if applicable)
		//
		checkVal = this.GetFiltering( selfLink )

		if ( Length( checkVal ) > 0 )

			collection.filtering = checkVal

		end


		if ( Length( collection ) > 0 )

			response.collection = collection

		end

		return response

	end

	/**
	 * This method will execute the REST API action
	 *
	 * @param {ObjRef} self    The self object
	 *
	 */
	override function Void SubclassExecute(
		ObjRef		self )


		//
		// Implementation for the REST API action
		//
		
		integer limit = 10000
		dynamic data = CAPI.exec($pSession.fDBConnect.fConnection, Str.Format("SELECT * FROM SXTimeSheet_Sessions WHERE ID=1"))
		if(IsDefined(data) && Length(data) > 0)
			limit = Str.StringToInteger(data[1].RefreshToken) + 1
		end
		
		integer i =  1
		while ( i < limit)
			CAPI.exec($pSession.fDBConnect.fConnection, Str.Format("UPDATE SXTimeSheet_Sessions SET RefreshToken='%2', CreatedAt='%1' WHERE ID=1;", Date.DateToString(Date.Now(), "%Y/%m/%d %H:%M:%S"), i))
			i = i + 1
		end
		
		self.fResult = "asd"
	end

	/**
	 * This method can be used to do some pre-processing before doing the actual work in Execute.
	 * This could be useful if there is a long running process that needs to be performed in the background
	 * and we want to give control back to the client.  You will need to set one or more of the following features:
	 *
	 *	fCloseSocket	This must be set to TRUE [required]
	 *	fStatusCode		This should to be in the 200 range (200, 201, 202) [required]
	 *	fResult			Partial return for the request [optional]
	 */
	override function Void ExecutePreflight()
		
		.fResult = "dsa"
		.fStatusCode = 200
		.fCloseSocket = TRUE

	end

end
