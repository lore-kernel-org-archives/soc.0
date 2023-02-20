Return-Path: <SRS0=aCTw=6Q=probiztec.com=cynthia.coleman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4056FC61DA3
	for <soc@archiver.kernel.org>; Mon, 20 Feb 2023 21:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AE5DC4339B; Mon, 20 Feb 2023 21:21:25 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01hn2214.outbound.protection.outlook.com [52.100.218.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BFA7C433D2
	for <soc@kernel.org>; Mon, 20 Feb 2023 21:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2BFA7C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=probiztec.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=probiztec.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmwAC6X8ILT6bmD/dWYuwCY/mmw5MzX1s4v4wsroyeokHS4Pe2/wQMv4p4yarRWMkbJoUQt0E+OOR7BfEPo7c/I0bd6KbpvA//WnHL+JaFAK4NG8PmPpuX2PbBYjMsq5Jb1K/Q1PvXUPijKIsLWBnOdRSYn+fAet23qhUl6ScGRYnscdIPRBttUHHkE+Yy16nQ8j94NJNuueYdUTR/wf380n2eDGkBuHktM5nHvLUpL7Hd9P6NS+7Tu/ekQ5uILq2EmLCbU14eTwEo0DlZ+Zujv5n4norax0rS73BCOo7r+t5OEamx40px3gR1O76qPsD6SGjrIogXA9Y+mxlzGo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7JB2O9bRldHIj/Otjat9j60TbfQLZApvEOYYVLbcgw=;
 b=GVdp8M/bj04l7sV+jlvheA6gLOS6JxLAw1koJkfy5vvXyhLT9TTIkRAwHk9Wv3DH9Jgi9NqhwBRXOUAr2K41PLp2FTwb4FQEcAop9o9up/d9XkbbB2JKzjg4g68kNUiqaWNsf3Ou2+b4hNurTfVa6XuNCYmH8AiAYaojIygNPc3Fv+N7yPbaugOCbgZamvwwExe/ox2Tyk/eSmPO73Fm2ED/NdYbwgHs61uVBRSTCpGacQRtilctwl2jNqZZ41gXzO7iBEA+dN1xPG2EvtahpBExdJCcZwRvkl04SseiY6b8dsyOmW75uzCFNXTk+odDbRmpPNxy6uKRS4u1iV4QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=probiztec.com; dmarc=pass action=none
 header.from=probiztec.com; dkim=pass header.d=probiztec.com; arc=none
Received: from PN0PR01MB7935.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:35::10)
 by PNZPR01MB8169.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.14; Mon, 20 Feb
 2023 21:21:19 +0000
Received: from PN0PR01MB7935.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a3ff:85e4:d8a0:579d]) by PN0PR01MB7935.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a3ff:85e4:d8a0:579d%9]) with mapi id 15.20.6134.016; Mon, 20 Feb 2023
 21:21:19 +0000
From: Cynthia Coleman <cynthia.coleman@probiztec.com>
List-Id: <soc.lore.kernel.org>
To: "soc@kernel.org" <soc@kernel.org>
Subject: Adobe Captivate Customers List
Thread-Topic: Adobe Captivate Customers List
Thread-Index: AdlFbjUfUxD7dBuFTfG+bqNPECf2yQ==
Date: Mon, 20 Feb 2023 21:20:46 +0000
Message-ID:
 <PN0PR01MB7935EFEEEB6E650C032D541CF2A49@PN0PR01MB7935.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=probiztec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB7935:EE_|PNZPR01MB8169:EE_
x-ms-office365-filtering-correlation-id: 20ae00b9-c0db-4780-faa8-08db138868db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?f643XCFiDCXoq0ojO1q7PXSa9OIC/q6QuiO14sdG7FNNqte6RhLNk6jxjqTh?=
 =?us-ascii?Q?76z0Dz7lr19pccBi8vLML9HmeuK6vSWCTaZqPPuoyP/tw21brfuY5fMkQctq?=
 =?us-ascii?Q?GYP/mWjfI70WqQo5iCEwM1P4phYrMaNdkDZtiSCIxljEsj0m6YTmUj8pEfYT?=
 =?us-ascii?Q?AOFAcNFhqZEkOYb0LItijTjqDuW3pDrgGahAXxXG8fl7Y1G9S5jBL3pKT/09?=
 =?us-ascii?Q?+177BCL6oaAgC9GM6XoaGZ7TwtunAGkbMYkGq4jWSxoKwhi1HXE1/antQ7KF?=
 =?us-ascii?Q?siis1jIogG5DOtL956lyRPPsgcC3V84sr+fiwcmRKxdqe2DTwmRuXu569tj5?=
 =?us-ascii?Q?Zvl4vJxrs2YhVQEk+JnJEhoTDMEUruYIqqfMnSdN0+Y7guZyqFpM2MYK3ZM4?=
 =?us-ascii?Q?hSoxjuNzx43Wg+f7jeshTCN4xNnMCCtiq08ghx+mbVTTxaCeDaW9NEW8QS4O?=
 =?us-ascii?Q?baXGnM5QFtF6cSD53/pGB52QmGzx/qanJ1MYOQ4luZfaKdbzsVEUKEbzTj21?=
 =?us-ascii?Q?sTXl/nvExQ7KoR0DkQrojOaWYmPaBD6u8YFo6ukwcCAoXQCYccmihEuE2oxF?=
 =?us-ascii?Q?RZqfRWpFZl5rYzz+Dhx/GQ86IuOfkqYl9W3/emH683mGAhKNAHg2MRVjDkgY?=
 =?us-ascii?Q?P/WJLsz+EAXgH7EOoDJQsbQHxPD4HmK+VLJgtZX/kjrQ3536gRy+lZwftcqj?=
 =?us-ascii?Q?V4kt3TLAfdJQ1JKm0UTbUcvvi8iEYUs5NbmRkOec98oU4SEyZ97Bq5JFo/Cr?=
 =?us-ascii?Q?XI49BXqRs5dpPaXoo/PaNggPuCQY7/sbOVcOox1osm8BxXA7reNVlhqW95G8?=
 =?us-ascii?Q?6BV9e+45stX7RxRFnnoJSPpuqQpayAE88n7hpESttyo4jDIlQMMXw44b8+y0?=
 =?us-ascii?Q?+AEtoTwEH0PgxtB58BlB1EqXZLbTKeBS//JvzViQbzkiv1R1rpMapojqoYfQ?=
 =?us-ascii?Q?KqzS1F/fpZqRaTLlDq9NOn1cjj9aC5o1HQsivkewv+8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:PN0PR01MB7935.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230025)(346002)(396003)(366004)(39850400004)(136003)(376002)(451199018)(5660300002)(86362001)(478600001)(4744005)(316002)(9686003)(186003)(33656002)(7696005)(66476007)(66446008)(52536014)(6916009)(66556008)(71200400001)(66946007)(2906002)(76116006)(8676002)(8936002)(64756008)(38070700005)(6506007)(55016003)(3480700007)(44832011)(6666004)(41300700001)(38100700002)(122000001)(48640200004);DIR:OUT;SFP:1501;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pU3UENWEMozTa47bLlnTk15ppDHDdeJoUPZOQMvuNgjdPpy5gkXbDVeii2IX?=
 =?us-ascii?Q?5iLGBnpk7pfptxdP/Rf5v9XsHwLXIbTLxPqdEbYMgK1eHppexD3j2GvE4VgY?=
 =?us-ascii?Q?0/pSuJZOLH4jyStu11bcd+TpfAehG+MMap2qimYvqzscUXmQ6w9jnUFxZO8Q?=
 =?us-ascii?Q?Ql9X2gwzs6UT2PSqiVo3D2FEw8De93to1EHAajYAGQ+4eN2a+Kva5s9JdRED?=
 =?us-ascii?Q?CjSVKx0XbmVHNyrFf0MY6FPaksD8gIMbTR07p7yN4Ib4IbmUIZII2h/wYt8L?=
 =?us-ascii?Q?+1exttV7Zjwm3N00Y5dRk2OFmG/B+PyF+OawgbNha/YEs1uULarMu6MFG9Eh?=
 =?us-ascii?Q?Ik2Pk96aU28sJUy65xg1BJRJFrwssB+V4Qg9rEk/aB5seymD7KG61jOFsECH?=
 =?us-ascii?Q?6cd0uNnt1Bm8KZ3byaHnx3qxaz3Y0h1tkTQy3e8RJ5cbBDB+F7Ke+n6qIGbG?=
 =?us-ascii?Q?uDLAsgomEwpI3SzVe6ije1ov8/Ezm2QhOhqJmiX5WUmsHmRc8IlKIcXfX2/Y?=
 =?us-ascii?Q?aKlv3KMYAc3ZsuwdfcYqYoaWVXHA8/pCHOTYI6clp9gPIW1xMhv/Hx5xGZLb?=
 =?us-ascii?Q?SjQNbTNZYL9oP7MW4PR5AolbQqOBGuUX5kRkYz9VuK4NZQHbNCBLoo8rBC8I?=
 =?us-ascii?Q?zlASEFOUt9Yqa9f4SIshNxwC7JkP5JkGqe/Ns35Aev1ainhv+JNK8/sRosr6?=
 =?us-ascii?Q?Ib7EcbK1nV7XoX3KsavIPkeLhKqKUcHgoHIBdanHZPbZgLGLc8lw2IgMaodJ?=
 =?us-ascii?Q?Xh1T5dTsoWwnXjs+CXUg/ErmOc8xL2H7dWbdz2CnqtdzAew5Lxtxa/b5teU9?=
 =?us-ascii?Q?CB2x1p7PQLZJx/KgGMJU2cOpdI/qbWAcqqPigPVMMiZkVdRrFSOKvcWNIiXc?=
 =?us-ascii?Q?+ThR3sBQhQ9JfFLx+ZUQ/I5UcE9gbBM8a7QLslPTi2RPQmyVUkVJxY5KgZcP?=
 =?us-ascii?Q?FoxRY/MILpNhswcGE8YtG78qsgbRDd+zjAZeCjcx4blPRlyf2q7LH65iksRX?=
 =?us-ascii?Q?EqBBE+SYvmkMkQg7qw9BGiEeEbsm7G9J0aYd5a9BPsoyTKu1wQ9HhJJDJ1vZ?=
 =?us-ascii?Q?hW50JkJdZPHSlnm9ZxDvV4S1jOAKig85sz/sTBgFH145YTCE9R21crBi6/oj?=
 =?us-ascii?Q?MwLnGiXeJGqqaDAmruNNRlCpST8c07qy9n2K7kt7vSmjtmaad8E+e/HrSjNa?=
 =?us-ascii?Q?MLVsLuLGqdFBJsHNHaPgFP3wsetktMUJLZzAmeQ2qJJG6HUnyAZRQxNJjnjr?=
 =?us-ascii?Q?U5X+hSUXsHbZPfZYLkPW4IXixNj2yQy23ZLL+WXRsWyMzm2ZTKg8yYWHDWOY?=
 =?us-ascii?Q?Dyh/lkE6zX7xDBnMfazVe+4rTBPGJAezn/xqJn82ArGvy3y5UZcU44pDPoEF?=
 =?us-ascii?Q?9XNDLJEoFgEywX9bdqMBfQzLCT44+9glSnGTuXi+QEWZoFXV/mjyRJPhwiAQ?=
 =?us-ascii?Q?iGii2s3xJqnD9a0VEwaax8VQkplW0fzJeCPLOwZTmT9amAvKQm0nRKXMLMB6?=
 =?us-ascii?Q?sZfePmFXAbkuBe/ydruWdQiD6BQ/ELw0LLOiWkYpbXpxghImq1c50pihv5Wf?=
 =?us-ascii?Q?l7bfigrpvXZutSQ+k+EUiGl0QPs4oRCcocmgYYaW+8C0Pk8/ASQ2OIFjH8E7?=
 =?us-ascii?Q?VnEpPHR2sO6COpkCXI8ZErXswSBDNxq2tm/AoH3S+SIJCNcjCvIP3po22DVR?=
 =?us-ascii?Q?l/4wXQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN0PR01MB7935EFEEEB6E650C032D541CF2A49PN0PR01MB7935INDP_"
MIME-Version: 1.0
X-OriginatorOrg: probiztec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB7935.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ae00b9-c0db-4780-faa8-08db138868db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 21:20:46.0941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3347e7a5-2948-46e1-bc8e-5a555887234b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 283mfMrzXqDS7Op6RiAWVTzN8J6jdrYofzvmYaWmUw+SIB/3yn29OGIbjnzQjztbWn/se5Txd0sGczzGYzgCd5I5Wu3RSX8EucnuvWjK9BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB8169

--_000_PN0PR01MB7935EFEEEB6E650C032D541CF2A49PN0PR01MB7935INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,



Would you be interested in acquiring a list of companies currently using Ad=
obe Captivate?



Information fields: Names, Title, Email, Phone, Company Name, Company URL, =
Company physical address, SIC Code, Industry, Company Size (Revenue and Emp=
loyee) and more information.



Please let me know your target geography so that I can provide you with cou=
nts and pricing information for the same.



Regards,

Cynthia Coleman

Sales Consultant

Lead Gen Marketing LLC





To opt out, please response Outs.


--_000_PN0PR01MB7935EFEEEB6E650C032D541CF2A49PN0PR01MB7935INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Cambria;
	panose-1:2 4 5 3 5 4 6 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" style=3D"word-wrap:break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNoSpacing"><a name=3D"_Hlk118386814"><span lang=3D"EN-US" st=
yle=3D"font-family:&quot;Cambria&quot;,serif">Hi,<o:p></o:p></span></a></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><span =
lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">&nbsp;<o:p><=
/o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><span =
lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">Would you be=
 interested in acquiring a list of companies currently using
<b><u>Adobe Captivate</u>?</b><o:p></o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><b><sp=
an lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">&nbsp;</s=
pan></b></span><span style=3D"mso-bookmark:_Hlk118386814"><span lang=3D"EN-=
US" style=3D"font-family:&quot;Cambria&quot;,serif"><o:p></o:p></span></spa=
n></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><b><sp=
an lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">Informati=
on fields:</span></b></span><span style=3D"mso-bookmark:_Hlk118386814"><spa=
n lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">
 Names, Title, Email, Phone, Company Name, Company URL, Company physical ad=
dress, SIC Code, Industry, Company Size (Revenue and Employee) and more inf=
ormation.<o:p></o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><span =
lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">&nbsp;<o:p><=
/o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><span =
lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">Please let m=
e know your target geography so that I can provide you with counts and pric=
ing information for the same.<o:p></o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><span =
lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">&nbsp;<o:p><=
/o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><b><sp=
an lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">Regards,<=
/span></b></span><span style=3D"mso-bookmark:_Hlk118386814"><span style=3D"=
font-family:&quot;Cambria&quot;,serif"><o:p></o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><b><sp=
an lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">Cynthia C=
oleman</span></b></span><span style=3D"mso-bookmark:_Hlk118386814"><span st=
yle=3D"font-family:&quot;Cambria&quot;,serif"><o:p></o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><b><sp=
an lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">Sales Con=
sultant</span></b></span><span style=3D"mso-bookmark:_Hlk118386814"><span l=
ang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif"><o:p></o:p></=
span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><b><sp=
an lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif">Lead Gen =
Marketing LLC</span></b></span><span style=3D"mso-bookmark:_Hlk118386814"><=
span lang=3D"EN-US" style=3D"font-family:&quot;Cambria&quot;,serif"><o:p></=
o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><b><sp=
an lang=3D"EN-US">&nbsp;</span></b></span><span style=3D"mso-bookmark:_Hlk1=
18386814"><span lang=3D"EN-US"><o:p></o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><span =
lang=3D"EN-US">&nbsp;<o:p></o:p></span></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"mso-bookmark:_Hlk118386814"><span =
lang=3D"EN-US" style=3D"font-size:8.0pt;color:#E7E6E6">To opt out, please r=
esponse Outs.</span></span><a name=3D"m_-1360458556238830876_m_908598366870=
492"></a><span style=3D"mso-bookmark:_Hlk118386814"><span lang=3D"EN-US"><o=
:p></o:p></span></span></p>
<span style=3D"mso-bookmark:_Hlk118386814"></span>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PN0PR01MB7935EFEEEB6E650C032D541CF2A49PN0PR01MB7935INDP_--
