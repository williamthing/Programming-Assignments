(: William Thing (1266987)
   CSE 414
   Homework 5
:)

(: Problem 3. :)

<result>
	<country> <name>United States</name> 
	{
		for $x in doc("mondial.xml")/mondial/country[name = "United States"]/province
		let $p := $x/population
		let $a := $x/area
		let $r := $p div $a
		order by $r descending
		return 
			<state> 
				<name> {$x/name/text()} </name>
				<population_density> {$r} </population_density>
			</state>
	}
	
	</country>
</result

(: Results
	<?xml version="1.0" encoding="UTF-8"?>
	<result>
	  <country>
	    <name>United States</name>
	    <state>
	      <name>Distr. Columbia</name>
	      <population_density>2955.106145251397</population_density>
	    </state>
	    <state>
	      <name>New Jersey</name>
	      <population_density>399.28842721142405</population_density>
	    </state>
	    <state>
	      <name>Rhode Island</name>
	      <population_density>314.56801529149413</population_density>
	    </state>
	      </country>
	</result>
:)