Class {
	#name : #SoapHttpGenericError,
	#superclass : #SoapImplError,
	#instVars : [
		'errorCode',
		'errorContents'
	],
	#classVars : [
		'ResultMessageTable'
	],
	#category : #'SOAP-Client-Http'
}

{ #category : #'class initialization' }
SoapHttpGenericError class >> initResultMessageTable [
	"SoapHttpGenericError initResultMessageTable"
	ResultMessageTable := Dictionary new.
	ResultMessageTable at: '300' put: 'Multiple Choices'.
	ResultMessageTable at: '301' put: 'Moved Permanently'.
	ResultMessageTable at: '302' put: 'Moved Temporarily'.
	ResultMessageTable at: '303' put: 'See Other'.
	ResultMessageTable at: '304' put: 'Not Modified'.
	ResultMessageTable at: '305' put: 'Use Proxy'.
	ResultMessageTable at: '400' put: 'Bad Request'.
	ResultMessageTable at: '401' put: 'Unauthorized'.
	ResultMessageTable at: '402' put: 'Payment Required'.
	ResultMessageTable at: '403' put: 'Forbidden'.
	ResultMessageTable at: '404' put: 'Not Found'.
	ResultMessageTable at: '405' put: 'Method Not Allowed'.
	ResultMessageTable at: '406' put: 'Not Acceptable'.
	ResultMessageTable at: '407' put: 'Bad Request'.
	ResultMessageTable at: '408' put: 'Request Time-out'.
	ResultMessageTable at: '409' put: 'Conflict'.
	ResultMessageTable at: '410' put: 'Gone'.
	ResultMessageTable at: '411' put: 'Length Required'.
	ResultMessageTable at: '412' put: 'Precondition Failed'.
	ResultMessageTable at: '413' put: 'Request Entity Too Large'.
	ResultMessageTable at: '414' put: 'Request-URI Too Large'.
	ResultMessageTable at: '415' put: 'Unsupported Media Type'.
	ResultMessageTable at: '500' put: 'Internal Server Error'.
	ResultMessageTable at: '501' put: 'Not Implemented'.
	ResultMessageTable at: '502' put: 'Bad Gateway'.
	ResultMessageTable at: '503' put: 'Service Unavailable'.
	ResultMessageTable at: '504' put: 'Gateway Time-out'.
	ResultMessageTable at: '505' put: 'HTTP Version not supported'
]

{ #category : #'class initialization' }
SoapHttpGenericError class >> initialize [
	"SoapHttpGenericError initialize"
	self initResultMessageTable
]

{ #category : #'instance creation' }
SoapHttpGenericError class >> signal: messageText code: errorCode contents: contents [ 
	^ self new errorCode: errorCode;
		 errorContents: contents;
		 signal: messageText
]

{ #category : #exceptionDescription }
SoapHttpGenericError >> description [
	"Return a textual description of the exception."

	| desc httpErrorDesc mt |
	desc := self class name asString.
	httpErrorDesc := self errorCode printString, ' ', (ResultMessageTable at: self errorCode ifAbsent:['']).
	desc := desc, ': ', httpErrorDesc.
	^(mt := self messageText) == nil
		ifTrue: [desc]
		ifFalse: [desc, ': ', mt]
]

{ #category : #accessing }
SoapHttpGenericError >> errorCode [
	^errorCode
]

{ #category : #accessing }
SoapHttpGenericError >> errorCode: anInteger [
	errorCode := anInteger
]

{ #category : #accessing }
SoapHttpGenericError >> errorContents [
	^errorContents
]

{ #category : #accessing }
SoapHttpGenericError >> errorContents: anInteger [
	errorContents := anInteger
]
