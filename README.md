# WSDLGenerator
A tool to generate a WSDL file from a C# DLL which contains one more Microsoft WebServices.

## Info
The project is build using VS2017 and uses .NET Framework 4.0

WSDLGenerator uses ServiceDescriptionReflector code to retrieve all information from an assembly (dll) to generate a wsdl file.

## Usage

```
WSDLGenerator (0.0.0.13)

Usage:
        -i, --input... Input assembly or file which contains the WebServices
        -o, --outputfolder... Output directory
        -w, --wsdl[optional]... Generate wsdl file
        -s, --spwsdl[optional]... Generate SharePoint compatible *wsdl.aspx file
        -d, --spdisco[optional]... Generate SharePoint compatible *disco.aspx file
        -n, --servicename[optional]... Specifies the fully qualified name of a service to be exported (when omitted, all services are exported)
        -v, --verbose[optional]... Verbose messages
```

### Examples
```
1. WSDLGenerator.exe --input MyWebServices.dll --outputfolder ..\..\Temp --wsdl
2. WSDLGenerator.exe --input MyWebServices.dll --outputfolder ..\..\Temp --wsdl --spwsdl --spdisco
```
