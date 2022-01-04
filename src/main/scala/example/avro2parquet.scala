package eu.placko.examples.spark

import org.apache.spark.sql.{SaveMode, SparkSession}
import org.apache.hadoop.fs.{Path}

object Avro2Parquet {
def main(args: Array[String]) {
  if (args.length != 2) {
    println("wrong input! usage: /user/<REPLACE>/avro2parquet/avro /user/<REPLACE>/avro2parquet/parquet")
    return
  }

  val avroPath = new Path(args(0))
  val parquetPath = new Path(args(1))

  val spark: SparkSession = SparkSession.builder()
    //.master("local[1]")
    //.master("yarn")
    .appName("Avro2Parquet")
    .getOrCreate()

  spark.sparkContext.setLogLevel("ERROR")

  try {
    //read avro file
    val df = spark.read.format("avro")
      .load(avroPath + "/" + "episodes.avro")
    df.show()
    df.printSchema()

    //convert to parquet
    df.write.mode(SaveMode.Overwrite)
      .parquet(parquetPath + "/" + "episodes.parquet")
  } catch {
    case e: Exception => println("Exception: " + e);
  }
}
}
