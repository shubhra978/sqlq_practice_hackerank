
#explode only works on array or map not on struct type data

df_json = spark.read\
    .format("json")\
        .option("multiline", "true")\
            .option("inferSchema", "true")\
    .load("/Volumes/spark_job_stage_creation/spark_classes/spark_volume/dept.json")
df_json = df_json.withColumn("departments", explode("departments"))\
    .withColumn("projects", explode("departments.projects"))\
        .withColumn("techStack",explode("projects.techStack"))

df_json.show()


address:struct
city:string
state:string
street:string
zipCode:string
companyName:string
departments:struct
departmentId:string
manager:struct
email:string
employeeId:string
name:string
name:string
projects:array
element:struct
budget:long
channels:array
element:string
projectId:string
techStack:array
element:string
title:string
established:long
isActive:boolean
projects:struct
budget:long
channels:array
element:string
projectId:string
techStack:array
element:string
title:string
techStack:string
+--------------------+---------------+--------------------+-----------+--------+--------------------+------------+
|             address|    companyName|         departments|established|isActive|            projects|   techStack|
+--------------------+---------------+--------------------+-----------+--------+--------------------+------------+
|{San Francisco, C...|TechCorp Global|{D101, {sarah.j@t...|       2015|    true|{250000, NULL, P-...|         AWS|
|{San Francisco, C...|TechCorp Global|{D101, {sarah.j@t...|       2015|    true|{250000, NULL, P-...|   Terraform|
|{San Francisco, C...|TechCorp Global|{D101, {sarah.j@t...|       2015|    true|{250000, NULL, P-...|      Docker|
|{San Francisco, C...|TechCorp Global|{D101, {sarah.j@t...|       2015|    true|{250000, NULL, P-...|  Kubernetes|
|{San Francisco, C...|TechCorp Global|{D101, {sarah.j@t...|       2015|    true|{115000, NULL, P-...|React Native|
|{San Francisco, C...|TechCorp Global|{D101, {sarah.j@t...|       2015|    true|{115000, NULL, P-...|  TypeScript|
|{San Francisco, C...|TechCorp Global|{D101, {sarah.j@t...|       2015|    true|{115000, NULL, P-...|    Firebase|
+--------------------+---------------+--------------------+-----------+--------+--------------------+------------+
