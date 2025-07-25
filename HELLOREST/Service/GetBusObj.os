package HELLOREST::Service

public Object GetBusObj inherits HELLOREST::Service::RestAPI2

	override	String	fResource = "busobj"
	override	String	fAction = "GetBusObj"
	override	Boolean	fEnabled = TRUE
//	override	Assoc	fExtraHeaders
	override	Integer	fVersion = 2

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
		self.fResult = "asd"
	end

end
