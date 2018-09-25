# Lispy Test

Build with Java 8 to see Lispy work in Cider. Build with Java 10 to see it fail.

Currently with Emacs version 25.2.2.

To avoid building the images more than once, use a different tag when building the Java 8 vs Java 10 versions:

     docker build -t java8 .
     docker run -it java8
