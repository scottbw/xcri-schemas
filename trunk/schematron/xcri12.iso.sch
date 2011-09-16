<?xml version="1.0"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" ><sch:title>Schematron rules for XCRI</sch:title><sch:ns xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:x="http://xcri.org/profiles/catalog/1.2" xmlns:xhtml="http://www.w3.org/1999/xhtml" prefix="x" uri="http://xcri.org/profiles/catalog"/><sch:ns xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:x="http://xcri.org/profiles/catalog" xmlns:xhtml="http://www.w3.org/1999/xhtml"  prefix="xhtml" uri="http://www.w3.org/1999/xhtml"/>

	<sch:pattern name="Root test"> 
          <sch:rule context="/*"> 
               <sch:assert test="name()='catalog' or name()='provider'"  flag="fatal">
                    Root element is <sch:name/> and not catalog, provider or course.
                    See guidance notes at: http://www.xcri.org/wiki/index.php/XCRI_1.2#XCRI_Documents
               </sch:assert> 

          </sch:rule> 
     </sch:pattern> 


	<sch:pattern name="catalog-class">
		<sch:rule context="x:catalog">
             
			<sch:assert test="@generated" flag="fatal">
				A generated attribute is required.The date and time at which the catalog was generated, in [ISO 8601] format. 
				If generated attribute is not contained then aggregators may process the document as if it was generated at time it was obtained!
 				See guidance notes at: http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Ccatalog.3E_element
			</sch:assert>
	
			<sch:p>
				we need to check that generated is correct date time:
				<!-- <value-of>		-->	
			</sch:p>
			
		</sch:rule>
	</sch:pattern>

	<sch:pattern name="catalog-class">
		<sch:rule context="x:catalog/*">
		
			<sch:assert test="name()='provider' or name()='hasPart' or name()='isPartOf' or name()='contributor'  or name()='date' or name()='description' or name()='identifier' or name()='subject' or name()='title' or name()='type' or name()='url'"  flag="warning">
                 <sch:name/> is a unrecognised child element of catalog. Allowed elements are all common elements and provider.
                 See guidance notes at: http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Ccatalog.3E_element
             </sch:assert> 
  
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern name="provider-class">
		<sch:rule context="x:provider">
			<sch:assert test="x:identifier" flag="warning">
				Producers SHOULD create Provider elements with a default unique identifier formatted as a URL (e.g. "http://www.bolton.ac.uk/"). Producers MAY include additional identifiers in other formats, but these SHOULD be qualified using xsi:type to a specific identifier namespace. An example would include the UK provider reference number (UKPRN) within the UKRLP:UKPRN namespace. 
 				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Cprovider.3E_element
			</sch:assert>
			
			<sch:assert test="x:title" flag="warning">
				Producers SHOULD include at least one title element for a provider, which SHOULD be the trading name of the organisation
				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Cprovider.3E_element
			</sch:assert>
			
			<sch:assert test="x:url" flag="warning">
				Producers SHOULD include one Url element for each provider, which SHOULD include a URL for its homepage, or its applications microsite, in addition to its primary domain identifier (see above).
				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Cprovider.3E_element
			</sch:assert>
			
			<sch:assert test="x:course" flag="warning">
				In almost all cases Producers SHOULD include at least one course for a provider. The capability for supporting zero courses is offered for cases where XCRI CAP is used to format course search results.
				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Cprovider.3E_element
			</sch:assert>
			
		</sch:rule>
	</sch:pattern>
	
	
	<sch:pattern name="provider-class">
		
		<sch:rule context="x:provider/*">
		
			<sch:assert test="name()='location' or name()='course' or name()='hasPart' or name()='isPartOf' or name()='contributor'  or name()='date' or name()='description' or name()='identifier' or name()='subject' or name()='title' or name()='type' or name()='url'"  flag="warning">
                 <sch:name/> is a unrecognised child element of provider. Allowed elements are all common elements and provider.
                 See guidance notes at: http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Ccatalog.3E_element
             </sch:assert> 
			</sch:rule>
			
	</sch:pattern>
	
	
	<sch:pattern name="course-class">
		<sch:rule context="x:course">
			<sch:assert test="x:identifier" flag="warning">
 				A Course SHOULD have a unique identifier formatted as a URI
 				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Ccourse.3E_element
			</sch:assert>
			
			<sch:assert test="x:title" flag="warning">
				Producers SHOULD include at least one title element for each course.
				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Ccourse.3E_element
			</sch:assert>
			
			<!--<sch:report test="x:level" flag="warning">
				This is included for compatibility with [EN 15982]. Producers SHOULD NOT use this element, and Aggregators SHOULD make use of the Qualification and Credit elements to assist users to discover courses by level.
				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Ccourse.3E_element
			</sch:report>-->
			
			<sch:assert test="x:credit" flag="warning">
				Producers SHOULD use separate credit elements for describing the credits available under each scheme, for example CATS or ECTS.
				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Ccourse.3E_element
			</sch:assert>
			
		</sch:rule>
	</sch:pattern>
	
		<sch:pattern name="course-class">
		
		<sch:rule context="x:course/*">
		
			<!-- elegant.. get out xpath book -->
			<sch:assert test="name()='level' or name()='qualification' or name()='presentation' or name()='credit' or name()='abstract' or name()='applicationProcedure' or name()='assessment' or name()='learningOutcome' or name()='objective' or name()='prerequisite' or name()='regulations' or name()='hasPart' or name()='isPartOf' or name()='contributor'  or name()='date' or name()='description' or name()='identifier' or name()='subject' or name()='title' or name()='type' or name()='url'"  flag="warning">
                 <sch:name/> is a unrecognised child element of course. Allowed elements are all common elements and provider.
                 See guidance notes at: http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Ccatalog.3E_element
             </sch:assert> 
			</sch:rule>
		</sch:pattern>
		
		
		<sch:pattern name="presentation-class">
		<sch:rule context="x:course">
			<sch:assert test="x:start" flag="warning">
 				A Producer SHOULD include a start element even if there is no specific start date as this can still be used to describe the start details- see the section on Temporal Elements.
 				http://www.xcri.org/wiki/index.php/XCRI_1.2#the_.3Cpresentation.3E_element
			</sch:assert>

		</sch:rule>
	</sch:pattern>
	
	
</sch:schema>