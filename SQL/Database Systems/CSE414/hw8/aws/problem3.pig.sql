-- William Thing
-- CSE414
-- Homework 414

-- problem3.pig

register s3n://uw-cse344-code/myudfs.jar

-- load the test file into Pig
-- raw = LOAD 's3n://uw-cse-344-oregon.aws.amazon.com/cse344-test-file' USING TextLoader as (line:chararray);
-- later you will load to other files, example:
raw = LOAD 's3n://uw-cse344/btc-2010-chunk-000' USING TextLoader as (line:chararray); 

-- parse each line into ntriples
ntriples = foreach raw generate FLATTEN(myudfs.RDFSplit3(line)) as (subject:chararray,predicate:chararray,object:chararray);

-- filter the data to the tuples we care about
tmp = filter ntriples by subject matches '.*rdfabout\\.com.*';

-- remove the context
rdfabout = foreach tmp generate subject, predicate, object;
rdfabout2 = foreach rdfabout generate subject as subject2, predicate as predicate2, object as object2;

-- join
j = join rdfabout by object, rdfabout2 by subject2; 

-- remove duplicates
dist = DISTINCT j;

-- order by
ordered = order dist by predicate;

store ordered into '/user/hadoop/example-results-3' using PigStorage();