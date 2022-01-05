# avro2parquet
Spark/Scala example for converting Avro file to Parquet file on HDFS

### HOW TO CONFIGURE THE PROJECT
- `avro2parquet.sh`
```sh
  keytabUser=<REPLACE>
  keytab=/etc/security/keytabs/<REPLACE>.keytab
  appArtifact="/<REPLACE>/avro2parquet/target/scala-2.11/avro2parquet_2.11-$appVersion.jar /user/<REPLACE>/avro2parquet/avro /user/<REPLACE>/avro2parquet/parquet"
  log4j_setting="-Dlog4j.configuration=file:///<REPLACE>/avro2parquet/conf/log4j.xml"
```
- `avro2parquet/conf/log4j.xml`
```sh
<param name="file" value="/<REPLACE>/avro2parquet/log/log.out" />
```

- `INPUT`
```sh
HDFS: /user/<REPLACE>/avro2parquet/avro/episodes.avro
note: downloaded from https://github.com/apache/hive/blob/master/data/files/episodes.avro
```

### HOW TO BUILD
```sh
./sbt/bin/sbt compile
./sbt/bin/sbt package
```

### HOW TO EXECUTE
```sh
./avro2parquet.sh
```

- `OUTPUT`
```sh
HDFS: /user/<REPLACE>/avro2parquet/parquet/episodes.parquet
```