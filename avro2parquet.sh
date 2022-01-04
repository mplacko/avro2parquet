#!/bin/sh


on_error() {
  printf "\n\nAn error occurred!\n";
  exit 1;
}
trap on_error ERR


keytabUser=<REPLACE>
keytab=/etc/security/keytabs/<REPLACE>.keytab
appClass=eu.placko.examples.spark.Avro2Parquet

appVersion="0.1.0"
appArtifact="/<REPLACE>/avro2parquet/target/scala-2.11/avro2parquet_2.11-$appVersion.jar /user/<REPLACE>/avro2parquet/avro /user/<REPLACE>/avro2parquet/parquet"
log4j_setting="-Dlog4j.configuration=file:///<REPLACE>/avro2parquet/conf/log4j.xml"

echo "Start kinit"
kinit -kt $keytab $keytabUser
echo "Kinit done"

# only for "testing/debugging" purposes  --deploy-mode client \
spark-submit \
    --master yarn \
    --deploy-mode cluster \
    --class $appClass \
    --conf spark.executor.memory=12G \
    --conf spark.driver.memory=4G \
    --conf spark.dynamicAllocation.minExecutors=1 \
    --conf spark.dynamicAllocation.maxExecutors=5 \
    --conf spark.executor.cores=5 \
    --conf "spark.driver.extraJavaOptions=${log4j_setting}" \
    --conf "spark.executor.extraJavaOptions=${log4j_setting}" \
    $appArtifact

exit 0;
