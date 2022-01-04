# avro2parquet
Spark/Scala example for converting Avro file to Parquet file on HDFS

# HOW TO CONFIGURE THE PROJECT
path: avro2parquet.sh
entries:
  keytabUser=<REPLACE>
  keytab=/etc/security/keytabs/<REPLACE>.keytab
  appArtifact="/<REPLACE>/avro2parquet/target/scala-2.11/avro2parquet_2.11-$appVersion.jar /user/<REPLACE>/avro2parquet/avro /user/<REPLACE>/avro2parquet/parquet"
  log4j_setting="-Dlog4j.configuration=file:///<REPLACE>/avro2parquet/conf/log4j.xml"

path: /avro2parquet/conf/log4j.xml
entry:
<param name="file"
			value="/<REPLACE>/avro2parquet/log/log.out" />

INPUT: /user/<REPLACE>/avro2parquet/avro/episodes.avro
note: downloaded from https://github.com/apache/hive/blob/master/data/files/episodes.avro

# HOW TO BUILD
./sbt/bin/sbt compile
./sbt/bin/sbt package

# HOW TO EXECUTE
./avro2parquet.sh

OUTPUT: user/<REPLACE>/avro2parquet/parquet/episodes.parquet