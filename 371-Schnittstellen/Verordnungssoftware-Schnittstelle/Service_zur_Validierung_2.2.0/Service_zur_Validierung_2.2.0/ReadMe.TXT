java -jar validator_cli_6.7.8.jar `
-version 4.0.1 `
-no-extensible-binding-warnings `
-display-issues-are-warnings `
-best-practice ignore `
-html-output ("output\validation_{0}.html" -f (Get-Date -Format "yyyyMMdd_HHmmss")) `
-ig kbv.ita.for#1.3.0 `
-ig de.basisprofil.r4#1.5.2 `
-ig de.ihe-d.terminology `
-ig kbv.all.st `
-ig kbv.basis#1.7.0 `
-ig de.gematik.epa#1.2.0 `
-ig de.gematik.epa.medication#1.2.0 `
-ig de.fhir.medication#1.0.2 `
-ig hl7.fhir.uv.extensions.r4#5.2.0 `
-ig kbv.ita.erp-prerelease `
-ig rendered `
-ig kbv.ita.vos `
examples

