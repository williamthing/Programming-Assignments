<answer>
  { 
      for $x in doc("mondial.xml")/mondial/country[normalize-space(name)="Peru"]/province[count(city)>1]/name
      return <big-province> { fn:string($x) } </big-province>
  }
</answer>