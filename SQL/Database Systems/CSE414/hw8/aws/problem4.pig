-- William Thing
-- CSE414
-- problem4.pig


register s3n://uw-cse344-code/myudfs.jar

-- load the test file into Pig
--raw = LOAD 's3n://uw-cse344-test/cse344-test-file' USING TextLoader as (line:chararray);
-- later you will load to other files, example:
raw = LOAD 's3n://uw-cse344' USING TextLoader as (line:chararray);

-- parse each line into ntriples
ntriples = FOREACH raw GENERATE FLATTEN(myudfs.RDFSplit3(line)) AS (subject:chararray,predicate:chararray,object:chararray);

-- group the n-triples by subject column
subjects = GROUP ntriples BY (subject);

-- generate a intermediate state that hold tuples; each contains a subject and # of tuples associated with it
count_by_subject = FOREACH subjects GENERATE FLATTEN($0), COUNT($1) AS tuple_count;

-- group the count_by_subject by # of tuples
group_subject_by_count = GROUP count_by_subject BY (tuple_count);

-- generate the (x, y) we want, ((x,y): y subjects each had x tuples associated with them after we group by subject)
count_subject_by_count = FOREACH group_subject_by_count GENERATE FLATTEN($0) AS tuple_count, COUNT($1) AS num_subject;

-- sort the result by the # of tuples
count_subject_by_count_ordered = ORDER count_subject_by_count BY (tuple_count);

-- store the result
STORE count_subject_by_count_ordered INTO '/user/hadoop/example-results-4' USING PigStorage();
