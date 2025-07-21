package HELLOREST

public Object HelloRestWebModule inherits WEBDSP::WebModule

	override	Boolean	fEnabled = TRUE
	override	String	fModuleName = 'hellorest'
	override	String	fName = 'HelloRest'
	override	List	fOSpaces = { 'hellorest' }
	override	String	fSetUpQueryString = 'func=hellorest.configure&module=hellorest&nextUrl=%1'
	override	List	fVersion = { '1', '0', 'r', '0' }

end
