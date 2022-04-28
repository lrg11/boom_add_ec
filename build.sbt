organization := "edu.berkeley.cs"
version := "3.0"
name := "boom"
scalaVersion := "2.12.10"

unmanagedBase := baseDirectory.value / "libs"

libraryDependencies ++= Seq(
  "org.scala-lang" % "scala-reflect" % scalaVersion.value,
  "org.json4s" %% "json4s-jackson" % "3.6.1",
  "org.scalatest" %% "scalatest" % "3.2.0" % "test"
)

scalacOptions ++= Seq("-deprecation","-unchecked","-Xsource:2.11")

// Chisel3
val chiselVersion = "3.4.1"
lazy val chiselLib = "edu.berkeley.cs" %% "chisel3" % chiselVersion
libraryDependencies += chiselLib

// other compiler plugins
addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % chiselVersion cross CrossVersion.full)
addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full)
