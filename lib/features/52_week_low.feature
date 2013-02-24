Feature: Stock Quote
	In order to choose companies from a list
	As an investor
	I want to know which companies are closest to their fifty two week low

	Scenario:
		Given I have entered a list of stock symbols "APOL,AGX,BAH,CACPLA,CF,CSCO,CLCT,DELL,DLX,DMRC,DLB,GME,GNI,GTAT,HLF,IDCC,INTX,ESI,JCOM,KLIC,LPS,MANT,MAXY,MBLX,MSFT,NATR,NSU,NTI,NUS,PDLI,PETS,PBI,POOSF,POZN,QCOR,RTN,RPXC,STX,SVLC,SAVE,STRA,TNAV,TZOO,UIS,USMO,USNA,EGY,VG,WCRX"
		When I enter fifty two week low "fifty_two_week_diff"
		Then the companies will displayed in order based on smallest difference between current price and fifty two week low
