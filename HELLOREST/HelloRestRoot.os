package HELLOREST

/**
 * 
 *  This is a good place to put documentation about your OSpace.
 */
public Object HelloRestRoot

	public		Object	Globals = HELLOREST::HelloRestGlobals



	/**
	 *  Content Server Startup Code
	 */
	public function Void Startup()

		//
		// Initialize globals object
		//

		Object	globals = $HelloRest = .Globals.Initialize()

		//
		// Initialize objects with __Init methods
		//

		$Kernel.OSpaceUtils.InitObjects( globals.f__InitObjs )

	end

end
