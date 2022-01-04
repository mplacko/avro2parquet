import sbt._

object Dependencies {
  val sparkVersion = "2.4.0"
  lazy val sparkAvro = Seq(
    "org.apache.spark" %% "spark-sql" % sparkVersion,
    "org.apache.spark" %%  "spark-avro" % sparkVersion
)}
