(: William Thing (1266987)
   CSE 414
   Homework 5
:)

(: Problem 1. :)

<result>
<country>
<name>Peru</name>
  {
	for $x in doc("mondial.xml")/mondial/country[name/text() = "Peru"]//city/name
	order by $x/text()
	return <city>{ $x/text() }</city>
  }
</country>
</result>

(: Results
	<?xml version="1.0" encoding="UTF-8"?>
	<result>
	  <country>
	    <name>Peru</name>
	    <city>Abancay</city>
	    <city>Arequipa</city>
	    <city>Ayacucho</city>
	    </country>
	</result>
:)