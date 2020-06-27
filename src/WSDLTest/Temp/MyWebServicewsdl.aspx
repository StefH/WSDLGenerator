<%@ Page Language="C#" Inherits="System.Web.UI.Page" %>
<%@ Assembly Name="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint.Utilities" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<% Response.ContentType = "text/xml"; %>
<wsdl:definitions xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://tempuri.org/" xmlns:s1="http://microsoft.com/wsdl/types/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" targetNamespace="http://tempuri.org/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://tempuri.org/">
      <s:import namespace="http://microsoft.com/wsdl/types/" />
      <s:element name="GetParentType">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="pt" type="tns:MyParentType" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="MyParentType">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Child" type="tns:MyChildType" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="MyChildType" />
      <s:element name="GetParentTypeResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetParentTypeResult" type="tns:MyParentType" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetComplexType">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ct" type="tns:MyComplexType" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="MyComplexType">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="C" type="s1:char" />
          <s:element minOccurs="1" maxOccurs="1" name="B" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="I" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="L" type="s:long" />
          <s:element minOccurs="1" maxOccurs="1" name="S" type="s:short" />
          <s:element minOccurs="0" maxOccurs="1" name="Str" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetComplexTypeResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetComplexTypeResult" type="tns:MyComplexType" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetComplexTypeList">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ctList" type="tns:ArrayOfMyComplexType2" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfMyComplexType2">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="MyComplexType2" nillable="true" type="tns:MyComplexType2" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="MyComplexType2">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="C" type="s1:char" />
          <s:element minOccurs="1" maxOccurs="1" name="B" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="I" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="L" type="s:long" />
          <s:element minOccurs="1" maxOccurs="1" name="S" type="s:short" />
          <s:element minOccurs="0" maxOccurs="1" name="Str" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetComplexTypeListResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetComplexTypeListResult" type="tns:ArrayOfMyComplexType2" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetComplexTypeArray">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ctArray" type="tns:ArrayOfMyComplexType3" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfMyComplexType3">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="MyComplexType3" nillable="true" type="tns:MyComplexType3" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="MyComplexType3">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="C" type="s1:char" />
          <s:element minOccurs="1" maxOccurs="1" name="B" type="s:boolean" />
          <s:element minOccurs="1" maxOccurs="1" name="I" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="L" type="s:long" />
          <s:element minOccurs="1" maxOccurs="1" name="S" type="s:short" />
          <s:element minOccurs="0" maxOccurs="1" name="Str" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetComplexTypeArrayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetComplexTypeArrayResult" type="tns:ArrayOfMyComplexType3" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetMyEmptyType">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ct" type="tns:MyEmptyType" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="MyEmptyType" />
      <s:element name="GetMyEmptyTypeResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetMyEmptyTypeResult" type="tns:MyEmptyType" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="NoParam">
        <s:complexType />
      </s:element>
      <s:element name="NoParamResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddStringList">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="user" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfString">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="string" nillable="true" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="AddStringListResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddStringArray">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="user" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddStringArrayResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddString">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="user" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddStringResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddChar">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="chr" type="s1:char" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddCharResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddLongListArrays">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="longList" type="tns:ArrayOfLong" />
            <s:element minOccurs="0" maxOccurs="1" name="longArray" type="tns:ArrayOfLong" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfLong">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="long" type="s:long" />
        </s:sequence>
      </s:complexType>
      <s:element name="AddLongListArraysResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddIntListArrays">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="intlist" type="tns:ArrayOfInt" />
            <s:element minOccurs="0" maxOccurs="1" name="intArray" type="tns:ArrayOfInt" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfInt">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="int" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:element name="AddIntListArraysResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddCharListArrays">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="charlist" type="tns:ArrayOfChar" />
            <s:element minOccurs="0" maxOccurs="1" name="charArray" type="tns:ArrayOfChar" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfChar">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="char" type="s1:char" />
        </s:sequence>
      </s:complexType>
      <s:element name="AddCharListArraysResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddBoolListArrays">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="boollist" type="tns:ArrayOfBoolean" />
            <s:element minOccurs="0" maxOccurs="1" name="boolArray" type="tns:ArrayOfBoolean" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfBoolean">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="boolean" type="s:boolean" />
        </s:sequence>
      </s:complexType>
      <s:element name="AddBoolListArraysResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddShortListArrays">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="shortlist" type="tns:ArrayOfShort" />
            <s:element minOccurs="0" maxOccurs="1" name="shortArray" type="tns:ArrayOfShort" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfShort">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="short" type="s:short" />
        </s:sequence>
      </s:complexType>
      <s:element name="AddShortListArraysResponse">
        <s:complexType />
      </s:element>
      <s:element name="AddUser">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="user" type="s:string" />
            <s:element minOccurs="1" maxOccurs="1" name="id" type="s:long" />
            <s:element minOccurs="1" maxOccurs="1" name="number" type="s:int" />
            <s:element minOccurs="1" maxOccurs="1" name="valid" type="s:boolean" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddUserResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="AddUserResult" type="s:boolean" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetLong">
        <s:complexType />
      </s:element>
      <s:element name="GetLongResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetLongResult" type="s:long" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetInt">
        <s:complexType />
      </s:element>
      <s:element name="GetIntResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetIntResult" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBool">
        <s:complexType />
      </s:element>
      <s:element name="GetBoolResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetBoolResult" type="s:boolean" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetString">
        <s:complexType />
      </s:element>
      <s:element name="GetStringResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetStringResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetStringList">
        <s:complexType />
      </s:element>
      <s:element name="GetStringListResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetStringListResult" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetStringArray">
        <s:complexType />
      </s:element>
      <s:element name="GetStringArrayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetStringArrayResult" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
    <s:schema elementFormDefault="qualified" targetNamespace="http://microsoft.com/wsdl/types/">
      <s:simpleType name="char">
        <s:restriction base="s:unsignedShort" />
      </s:simpleType>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetParentTypeSoapIn">
    <wsdl:part name="parameters" element="tns:GetParentType" />
  </wsdl:message>
  <wsdl:message name="GetParentTypeSoapOut">
    <wsdl:part name="parameters" element="tns:GetParentTypeResponse" />
  </wsdl:message>
  <wsdl:message name="GetComplexTypeSoapIn">
    <wsdl:part name="parameters" element="tns:GetComplexType" />
  </wsdl:message>
  <wsdl:message name="GetComplexTypeSoapOut">
    <wsdl:part name="parameters" element="tns:GetComplexTypeResponse" />
  </wsdl:message>
  <wsdl:message name="GetComplexTypeListSoapIn">
    <wsdl:part name="parameters" element="tns:GetComplexTypeList" />
  </wsdl:message>
  <wsdl:message name="GetComplexTypeListSoapOut">
    <wsdl:part name="parameters" element="tns:GetComplexTypeListResponse" />
  </wsdl:message>
  <wsdl:message name="GetComplexTypeArraySoapIn">
    <wsdl:part name="parameters" element="tns:GetComplexTypeArray" />
  </wsdl:message>
  <wsdl:message name="GetComplexTypeArraySoapOut">
    <wsdl:part name="parameters" element="tns:GetComplexTypeArrayResponse" />
  </wsdl:message>
  <wsdl:message name="GetMyEmptyTypeSoapIn">
    <wsdl:part name="parameters" element="tns:GetMyEmptyType" />
  </wsdl:message>
  <wsdl:message name="GetMyEmptyTypeSoapOut">
    <wsdl:part name="parameters" element="tns:GetMyEmptyTypeResponse" />
  </wsdl:message>
  <wsdl:message name="NoParamSoapIn">
    <wsdl:part name="parameters" element="tns:NoParam" />
  </wsdl:message>
  <wsdl:message name="NoParamSoapOut">
    <wsdl:part name="parameters" element="tns:NoParamResponse" />
  </wsdl:message>
  <wsdl:message name="AddStringListSoapIn">
    <wsdl:part name="parameters" element="tns:AddStringList" />
  </wsdl:message>
  <wsdl:message name="AddStringListSoapOut">
    <wsdl:part name="parameters" element="tns:AddStringListResponse" />
  </wsdl:message>
  <wsdl:message name="AddStringArraySoapIn">
    <wsdl:part name="parameters" element="tns:AddStringArray" />
  </wsdl:message>
  <wsdl:message name="AddStringArraySoapOut">
    <wsdl:part name="parameters" element="tns:AddStringArrayResponse" />
  </wsdl:message>
  <wsdl:message name="AddStringSoapIn">
    <wsdl:part name="parameters" element="tns:AddString" />
  </wsdl:message>
  <wsdl:message name="AddStringSoapOut">
    <wsdl:part name="parameters" element="tns:AddStringResponse" />
  </wsdl:message>
  <wsdl:message name="AddCharSoapIn">
    <wsdl:part name="parameters" element="tns:AddChar" />
  </wsdl:message>
  <wsdl:message name="AddCharSoapOut">
    <wsdl:part name="parameters" element="tns:AddCharResponse" />
  </wsdl:message>
  <wsdl:message name="AddLongListArraysSoapIn">
    <wsdl:part name="parameters" element="tns:AddLongListArrays" />
  </wsdl:message>
  <wsdl:message name="AddLongListArraysSoapOut">
    <wsdl:part name="parameters" element="tns:AddLongListArraysResponse" />
  </wsdl:message>
  <wsdl:message name="AddIntListArraysSoapIn">
    <wsdl:part name="parameters" element="tns:AddIntListArrays" />
  </wsdl:message>
  <wsdl:message name="AddIntListArraysSoapOut">
    <wsdl:part name="parameters" element="tns:AddIntListArraysResponse" />
  </wsdl:message>
  <wsdl:message name="AddCharListArraysSoapIn">
    <wsdl:part name="parameters" element="tns:AddCharListArrays" />
  </wsdl:message>
  <wsdl:message name="AddCharListArraysSoapOut">
    <wsdl:part name="parameters" element="tns:AddCharListArraysResponse" />
  </wsdl:message>
  <wsdl:message name="AddBoolListArraysSoapIn">
    <wsdl:part name="parameters" element="tns:AddBoolListArrays" />
  </wsdl:message>
  <wsdl:message name="AddBoolListArraysSoapOut">
    <wsdl:part name="parameters" element="tns:AddBoolListArraysResponse" />
  </wsdl:message>
  <wsdl:message name="AddShortListArraysSoapIn">
    <wsdl:part name="parameters" element="tns:AddShortListArrays" />
  </wsdl:message>
  <wsdl:message name="AddShortListArraysSoapOut">
    <wsdl:part name="parameters" element="tns:AddShortListArraysResponse" />
  </wsdl:message>
  <wsdl:message name="AddUserSoapIn">
    <wsdl:part name="parameters" element="tns:AddUser" />
  </wsdl:message>
  <wsdl:message name="AddUserSoapOut">
    <wsdl:part name="parameters" element="tns:AddUserResponse" />
  </wsdl:message>
  <wsdl:message name="GetLongSoapIn">
    <wsdl:part name="parameters" element="tns:GetLong" />
  </wsdl:message>
  <wsdl:message name="GetLongSoapOut">
    <wsdl:part name="parameters" element="tns:GetLongResponse" />
  </wsdl:message>
  <wsdl:message name="GetIntSoapIn">
    <wsdl:part name="parameters" element="tns:GetInt" />
  </wsdl:message>
  <wsdl:message name="GetIntSoapOut">
    <wsdl:part name="parameters" element="tns:GetIntResponse" />
  </wsdl:message>
  <wsdl:message name="GetBoolSoapIn">
    <wsdl:part name="parameters" element="tns:GetBool" />
  </wsdl:message>
  <wsdl:message name="GetBoolSoapOut">
    <wsdl:part name="parameters" element="tns:GetBoolResponse" />
  </wsdl:message>
  <wsdl:message name="GetStringSoapIn">
    <wsdl:part name="parameters" element="tns:GetString" />
  </wsdl:message>
  <wsdl:message name="GetStringSoapOut">
    <wsdl:part name="parameters" element="tns:GetStringResponse" />
  </wsdl:message>
  <wsdl:message name="GetStringListSoapIn">
    <wsdl:part name="parameters" element="tns:GetStringList" />
  </wsdl:message>
  <wsdl:message name="GetStringListSoapOut">
    <wsdl:part name="parameters" element="tns:GetStringListResponse" />
  </wsdl:message>
  <wsdl:message name="GetStringArraySoapIn">
    <wsdl:part name="parameters" element="tns:GetStringArray" />
  </wsdl:message>
  <wsdl:message name="GetStringArraySoapOut">
    <wsdl:part name="parameters" element="tns:GetStringArrayResponse" />
  </wsdl:message>
  <wsdl:portType name="MyWebServiceSoap">
    <wsdl:operation name="GetParentType">
      <wsdl:input message="tns:GetParentTypeSoapIn" />
      <wsdl:output message="tns:GetParentTypeSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetComplexType">
      <wsdl:input message="tns:GetComplexTypeSoapIn" />
      <wsdl:output message="tns:GetComplexTypeSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetComplexTypeList">
      <wsdl:input message="tns:GetComplexTypeListSoapIn" />
      <wsdl:output message="tns:GetComplexTypeListSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetComplexTypeArray">
      <wsdl:input message="tns:GetComplexTypeArraySoapIn" />
      <wsdl:output message="tns:GetComplexTypeArraySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMyEmptyType">
      <wsdl:input message="tns:GetMyEmptyTypeSoapIn" />
      <wsdl:output message="tns:GetMyEmptyTypeSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="NoParam">
      <wsdl:input message="tns:NoParamSoapIn" />
      <wsdl:output message="tns:NoParamSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddStringList">
      <wsdl:input message="tns:AddStringListSoapIn" />
      <wsdl:output message="tns:AddStringListSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddStringArray">
      <wsdl:input message="tns:AddStringArraySoapIn" />
      <wsdl:output message="tns:AddStringArraySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddString">
      <wsdl:input message="tns:AddStringSoapIn" />
      <wsdl:output message="tns:AddStringSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddChar">
      <wsdl:input message="tns:AddCharSoapIn" />
      <wsdl:output message="tns:AddCharSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddLongListArrays">
      <wsdl:input message="tns:AddLongListArraysSoapIn" />
      <wsdl:output message="tns:AddLongListArraysSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddIntListArrays">
      <wsdl:input message="tns:AddIntListArraysSoapIn" />
      <wsdl:output message="tns:AddIntListArraysSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddCharListArrays">
      <wsdl:input message="tns:AddCharListArraysSoapIn" />
      <wsdl:output message="tns:AddCharListArraysSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddBoolListArrays">
      <wsdl:input message="tns:AddBoolListArraysSoapIn" />
      <wsdl:output message="tns:AddBoolListArraysSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddShortListArrays">
      <wsdl:input message="tns:AddShortListArraysSoapIn" />
      <wsdl:output message="tns:AddShortListArraysSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddUser">
      <wsdl:input message="tns:AddUserSoapIn" />
      <wsdl:output message="tns:AddUserSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetLong">
      <wsdl:input message="tns:GetLongSoapIn" />
      <wsdl:output message="tns:GetLongSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetInt">
      <wsdl:input message="tns:GetIntSoapIn" />
      <wsdl:output message="tns:GetIntSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBool">
      <wsdl:input message="tns:GetBoolSoapIn" />
      <wsdl:output message="tns:GetBoolSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetString">
      <wsdl:input message="tns:GetStringSoapIn" />
      <wsdl:output message="tns:GetStringSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetStringList">
      <wsdl:input message="tns:GetStringListSoapIn" />
      <wsdl:output message="tns:GetStringListSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetStringArray">
      <wsdl:input message="tns:GetStringArraySoapIn" />
      <wsdl:output message="tns:GetStringArraySoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="MyWebServiceSoap" type="tns:MyWebServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetParentType">
      <soap:operation soapAction="http://tempuri.org/GetParentType" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetComplexType">
      <soap:operation soapAction="http://tempuri.org/GetComplexType" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetComplexTypeList">
      <soap:operation soapAction="http://tempuri.org/GetComplexTypeList" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetComplexTypeArray">
      <soap:operation soapAction="http://tempuri.org/GetComplexTypeArray" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMyEmptyType">
      <soap:operation soapAction="http://tempuri.org/GetMyEmptyType" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="NoParam">
      <soap:operation soapAction="http://tempuri.org/NoParam" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddStringList">
      <soap:operation soapAction="http://tempuri.org/AddStringList" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddStringArray">
      <soap:operation soapAction="http://tempuri.org/AddStringArray" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddString">
      <soap:operation soapAction="http://tempuri.org/AddString" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddChar">
      <soap:operation soapAction="http://tempuri.org/AddChar" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddLongListArrays">
      <soap:operation soapAction="http://tempuri.org/AddLongListArrays" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddIntListArrays">
      <soap:operation soapAction="http://tempuri.org/AddIntListArrays" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddCharListArrays">
      <soap:operation soapAction="http://tempuri.org/AddCharListArrays" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddBoolListArrays">
      <soap:operation soapAction="http://tempuri.org/AddBoolListArrays" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddShortListArrays">
      <soap:operation soapAction="http://tempuri.org/AddShortListArrays" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddUser">
      <soap:operation soapAction="http://tempuri.org/AddUser" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetLong">
      <soap:operation soapAction="http://tempuri.org/GetLong" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetInt">
      <soap:operation soapAction="http://tempuri.org/GetInt" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBool">
      <soap:operation soapAction="http://tempuri.org/GetBool" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetString">
      <soap:operation soapAction="http://tempuri.org/GetString" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetStringList">
      <soap:operation soapAction="http://tempuri.org/GetStringList" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetStringArray">
      <soap:operation soapAction="http://tempuri.org/GetStringArray" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="MyWebServiceSoap12" type="tns:MyWebServiceSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetParentType">
      <soap12:operation soapAction="http://tempuri.org/GetParentType" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetComplexType">
      <soap12:operation soapAction="http://tempuri.org/GetComplexType" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetComplexTypeList">
      <soap12:operation soapAction="http://tempuri.org/GetComplexTypeList" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetComplexTypeArray">
      <soap12:operation soapAction="http://tempuri.org/GetComplexTypeArray" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMyEmptyType">
      <soap12:operation soapAction="http://tempuri.org/GetMyEmptyType" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="NoParam">
      <soap12:operation soapAction="http://tempuri.org/NoParam" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddStringList">
      <soap12:operation soapAction="http://tempuri.org/AddStringList" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddStringArray">
      <soap12:operation soapAction="http://tempuri.org/AddStringArray" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddString">
      <soap12:operation soapAction="http://tempuri.org/AddString" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddChar">
      <soap12:operation soapAction="http://tempuri.org/AddChar" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddLongListArrays">
      <soap12:operation soapAction="http://tempuri.org/AddLongListArrays" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddIntListArrays">
      <soap12:operation soapAction="http://tempuri.org/AddIntListArrays" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddCharListArrays">
      <soap12:operation soapAction="http://tempuri.org/AddCharListArrays" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddBoolListArrays">
      <soap12:operation soapAction="http://tempuri.org/AddBoolListArrays" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddShortListArrays">
      <soap12:operation soapAction="http://tempuri.org/AddShortListArrays" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddUser">
      <soap12:operation soapAction="http://tempuri.org/AddUser" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetLong">
      <soap12:operation soapAction="http://tempuri.org/GetLong" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetInt">
      <soap12:operation soapAction="http://tempuri.org/GetInt" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBool">
      <soap12:operation soapAction="http://tempuri.org/GetBool" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetString">
      <soap12:operation soapAction="http://tempuri.org/GetString" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetStringList">
      <soap12:operation soapAction="http://tempuri.org/GetStringList" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetStringArray">
      <soap12:operation soapAction="http://tempuri.org/GetStringArray" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="MyWebService">
    <wsdl:port name="MyWebServiceSoap" binding="tns:MyWebServiceSoap">
      <soap:address location=<% SPHttpUtility.AddQuote(SPHttpUtility.HtmlEncode(SPWeb.OriginalBaseUrl(Request)),Response.Output); %> />
    </wsdl:port>
    <wsdl:port name="MyWebServiceSoap12" binding="tns:MyWebServiceSoap12">
      <soap12:address location=<% SPHttpUtility.AddQuote(SPHttpUtility.HtmlEncode(SPWeb.OriginalBaseUrl(Request)),Response.Output); %> />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>