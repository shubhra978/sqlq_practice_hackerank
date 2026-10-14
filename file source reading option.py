 enable ignore corrupt files via the data source option
# dir1/file3.json is corrupt from parquet's view
test_corrupt_df0 = spark.read.option("ignoreCorruptFiles", "true")\
    .parquet("examples/src/main/resources/dir1/",
             "examples/src/main/resources/dir1/dir2/")
test_corrupt_df0.show()


#pathGlobFilter is used to only include files with file names matching the pattern. The syntax follows org.apache.hadoop.fs.GlobFilter. It does not change the behavior of partition discovery.
df = spark.read.load("examples/src/main/resources/dir1",
                     format="parquet", pathGlobFilter="*.parquet")


#recursiveFileLookup is used to recursively load files and it disables partition inferring. Its default value is false. If data source explicitly specifies the partitionSpec when recursiveFileLookup is true, exception will be thrown.
recursive_loaded_df = spark.read.format("parquet")\
    .option("recursiveFileLookup", "true")\
    .load("examples/src/main/resources/dir1")
recursive_loaded_df.show()
