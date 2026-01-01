@echo off
rem Aufruf der Transformationsroutine
rem java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform <input-Dir> <output-Dir> <Stylesheet> <DMP-Parameter>



REM @echo on

java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EED1
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EVD1
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EED2
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EVD2
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EECO
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EVCO
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EEKHK
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EVKHK
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EEAB
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EVAB
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl EBK
java -cp jar\xalan.jar;jar\xerces.jar;jar\serializer.jar;jar\DMPTransform.jar DMPTransform .\input .\output .\xsl\EDMP_To_a.xsl FBK

pause