Return-Path: <SRS0=s7Qv=WK=virtualdataservice.com=mary.chloe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68929C433EF
	for <soc@archiver.kernel.org>; Fri,  3 Jun 2022 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AA14C385A9; Fri,  3 Jun 2022 21:50:58 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com (mail-ma1ind01on2101.outbound.protection.outlook.com [40.107.138.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67671C385B8
	for <soc@kernel.org>; Fri,  3 Jun 2022 21:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67671C385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=virtualdataservice.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtualdataservice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cORb+6TT8SnjF0YdYR2lj/eldVYgKq9eSYnkgfLR3c3D6r+nn66YOHCkjLNUuIf/iGSLz8PJ2Th0tyaV/GGXBCzVLE82TqkWXZe+Ew7+wO0hVwjJw3hBrtsJCdfvnfcDDJ9a3K2ZFUXxM7acoKIiM7uL+VHwES6MFf2lK4R2LVUYyY50X4czYd5gs8OwotJZWLWJ1XiGV6LTfMgHKJo4W8zi46yNwJH2CNl9EcKAefdniC02dJg3soKra3ItopxvRGL+L46lqzxzXNVen4cebxfTNgTSExJ9kHJ32PPI1kI0TugubYJnT/Ex2U7V3VVVNJ96N2F19G6iG6lV4kViRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP2uq+YqBJTBpqzqqvaMcF3Un74l/KOyDFTiZo05bX4=;
 b=FjZFOCo6qTffaiiPJiUcrNYfQbCqgBL9XhWi92HZP011+kGX/2IhAZKsUDVIs7VBaCC5Xz76fw51IChebS/nMzevz+I78RSRX/u5sBaj9gqB/O9e6K8AqqdTOwMJVwCc9EINlbvOS7FlgRsa1Rxv40pvwcqlmsKe7OFU7+zqH807ft/xZmDbfs+jL9aUpGO9P3o55aWi20PsB1ry3XxwL1XQuwimkvYzStwjhPLTEe2rcT0MwrNxMd7WGpymnthxiOhMc2k36lxF4Po2VD/e5Hnew063Dni/XXdtmu+R0Y70ykUV8wxYkjGgIap6j5rpO72OXpGnNuSYwVS9MO4M7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtualdataservice.com; dmarc=pass action=none
 header.from=virtualdataservice.com; dkim=pass
 header.d=virtualdataservice.com; arc=none
Received: from BMXPR01MB2214.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:35::23)
 by MAZPR01MB7729.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 21:50:53 +0000
Received: from BMXPR01MB2214.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd53:c243:7085:8daf]) by BMXPR01MB2214.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bd53:c243:7085:8daf%4]) with mapi id 15.20.5314.016; Fri, 3 Jun 2022
 21:50:53 +0000
From: Mary Chloe <mary.chloe@virtualdataservice.com>
List-Id: <soc.lore.kernel.org>
To: "soc@kernel.org" <soc@kernel.org>
Subject: B2B Users Contact Records
Thread-Topic: B2B Users Contact Records
Thread-Index: Adh3k92NXqgXMqJjQTaFATR5Li58gA==
Date: Fri, 3 Jun 2022 21:50:15 +0000
Message-ID:
 <BMXPR01MB2214046FB3517F327762E7F1FDA19@BMXPR01MB2214.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtualdataservice.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85165be0-a74e-41b4-951f-08da45ab219e
x-ms-traffictypediagnostic: MAZPR01MB7729:EE_
x-microsoft-antispam-prvs:
 <MAZPR01MB77299002F9AF4EB842D31291FDA19@MAZPR01MB7729.INDPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 alZ78v5x/mXd3WlGaPPEWvKyzSeNxtKDOBAzwhDkFHFgueCoaClHI/QWeUDfLsJj6v12ssspqFnjIXLR00Qt3iYrG1z8o8hIHcClofbka/xlhJG1xFPF3JjyuV5gL6Hpfl17QR1zjxfgLAa3ASUeThOjm7d8vsrrYSvyO71dV9Xz1w0/CGVpES0FoZqHeQd/kKjNKovbvPY0/ioaKtOnLmRFKNpKF2/sehOlNki5/5qv674HpaAPVmkaKvF2XHfAauiuaKRzdVF6DCXGJV8cjA6qTbyble8bHR/vZ/J9Wuc7Ouy6ZlohwD69HmnRyDpVfO4NAjNjOY3gH10oeykscMuLWlpivCxsdJLR1pPXL3iB5j1Ng6bwJru1N4qKuoDwN2Lf+JdvZch1vTaj1P2M+8c+PMsnBHqB2ZyZx9winxjH1uipfqN3GTMbQ2f8L4GJlMVb0tg7Z6S0/vLXijQqtTPDkeXl6rA9Kq96IDZXHrmifY8MtEAD0ZfPDgDq3+opngfC+WcWk3pijEXzOHy49Io/FGfb5gAy50FnRkg2FUVtO7ujU6syEG2VvJ4lJjkwUkVe4BkYoOqWkoAGLHA3S3iYHvYWZkB4F2k1dv5sBJMVKwHAqzMyn1TOybp9bKCb9i9NGGwYDBWi/8rnk3qCbOb63mWSU5dS5FoP329JTX2hVGarT00m9zmdExpnkl/zvFGg78jbNhb/BgQC6o0MwLGUaNnx9eOBOTLApk8x6rQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2214.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(346002)(376002)(396003)(136003)(366004)(39840400004)(6506007)(26005)(8676002)(76116006)(41300700001)(9686003)(7696005)(6666004)(6916009)(83380400001)(86362001)(2906002)(186003)(66946007)(316002)(33656002)(5660300002)(55016003)(66556008)(66446008)(64756008)(66476007)(71200400001)(38100700002)(9326002)(8936002)(508600001)(52536014)(122000001)(44832011)(38070700005)(437434003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yjVH70S2AwapCCa2fH8YpecFv402o7+ycOr9tr8fJpZON1zT/3zjM9SxYEGA?=
 =?us-ascii?Q?smz+Io+ARXeE/qNiro8rtoYLD1wHjmTm3kxYJsbhVwgUb5AHOxTs7Kf3qs4r?=
 =?us-ascii?Q?80u4cg6cfjXDeqjZZAcOMrt5tNorKNccO3Om7bCAQBpvAhBLUsYCTEtD1QrF?=
 =?us-ascii?Q?RUvPiggdX6TotkCoyBoQH7QBbpLZB56MpZvHF3KwpqIxRas82gYaNFJNJ0gt?=
 =?us-ascii?Q?h0ryRAs5wpeQjEIMV9nJ0BLfiwR3QFqOF8Qj99crELLEmR0zRck3KiXhRbNY?=
 =?us-ascii?Q?pcuWOJb6HQVOGQTxIrzJh+QBG02uYKrhfcg0EmPdW4dxkXZcKrZDnpPaCoRF?=
 =?us-ascii?Q?x/M4WRusoFIxaOEt7Bv80NpBRchvbfDyMR+/ovKZEQSQBxgaYAFWRsMdgOJN?=
 =?us-ascii?Q?iopf69ljhS/sPT8CdlIkraF1D9ic2T2mH2+mfagzt6hpYrk4neEpPgIqQPVN?=
 =?us-ascii?Q?X9lcTM1D8ZmXNo5hpnlAc2EoPWpnI5wV8toapCsg7bYy1eRiTkLY+tes6BBS?=
 =?us-ascii?Q?MOpPWoitv+iY3Te9hAI5nXDBCHrmKPX3J5If0AJTi8mWS4dw0eC4H4gfQTAF?=
 =?us-ascii?Q?/53y/oQpad3H4W7l2YnUnBIvLG+SeXfT7N3GRlhIB6yh3gW/f83BU1G1jpFZ?=
 =?us-ascii?Q?tvny0ImRmE4+Cx+4U0SRqnX/LGTc32am1Ngxuj4tnJIdOLc4nlH0RdKzTZjI?=
 =?us-ascii?Q?5+7XU5FxyKHgrZBYQ3KirN5SN8Np43dookkVEZdsfI3xWwTGWdKUnz/knb9U?=
 =?us-ascii?Q?/UZjneItdXtuLBuxPAKwtPW6ajWWtTRSxcGylqVbmyv8eYjMwzzodtwuY8Pc?=
 =?us-ascii?Q?iqn4D9W+tb3DE49zUs+CAx7ICnxLkytGR5Cjgo1lxb/z8lxrLQkuRhFOEMC+?=
 =?us-ascii?Q?nqNsJdv6GOOfy41XHXZ3OV2bQAj0GJ0SenNC7hNxRI2m5vVfshqUVJ5vYVzT?=
 =?us-ascii?Q?GFSsKLHbHGDpR/2stJVqOhNxIJUyTDX07Doz43g75ZxqvyJETkXaHVElEzq+?=
 =?us-ascii?Q?clpgqTUv3RhSTq+ZFtDLk0R5FNyI7BxZGr3Z4RvzCU9kpDC/0kCT9DY5PMyG?=
 =?us-ascii?Q?VwhFNk4qakcayjb3Y8+m8jXJ3OEFDjqUCmirmZGo5FiTu/uywL9Q+Z9zYFKs?=
 =?us-ascii?Q?87MZTZkZPYDgryuJ3wIoDW6OQIhx7qnYA5fxQx8Fp2jBl8tHVQtyLFZw08Fi?=
 =?us-ascii?Q?91hidbV1bP3OVOa6oXohNOJ+eVFSn1D2FrikxADYGci7sTvGXTxCSiamUNwM?=
 =?us-ascii?Q?wyhMikg0eKWLRXBFdrBd/gGDJ1MinxvI4xqP70VZOT2bCJmbNQRd1jVA+DbE?=
 =?us-ascii?Q?VZVhlRukBRzNew6vKrBd/SxhArVXYS9D4W6SVsvOdrZCkkqfucbZh6fBN7XM?=
 =?us-ascii?Q?mS+gTBK8zmpL1oCBcxbA1JWwr4FI1humSAjyRiZue4eKAiC2AMyFiixyyuw0?=
 =?us-ascii?Q?zbLeS6MVU/PAAFNtc5vZJRLH+vEnvO6grG1lnaQKqyruFg6z4Hps7IoPu7gD?=
 =?us-ascii?Q?oLdw0EYOUO5N5dIn8kwalkAK1yJK0J0LneVhs+xd1Lj8U2bIbAOooF3McCf6?=
 =?us-ascii?Q?IueYPxvWhFtgD/Dw9Rk58RIyYo7pJ0/HW3n4ay0Yyp0pgikgCX67oFjHyPFL?=
 =?us-ascii?Q?1HWLKvkLGoJL/1D9yFhvXANIYb/hALAlAwwacNQv7MVu7W/USqXIeFx9ViFw?=
 =?us-ascii?Q?fwL7EgSuQGt4m5kvBqr5RuzZZZENA20BC1WVIHFzlzgx5adCLNI8nZ0tIRi4?=
 =?us-ascii?Q?v/iRDp/kj2CH0ddDas1MgYq9Vu6egqvYGSaOW0BBSCdhQFefIQIw?=
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2214046FB3517F327762E7F1FDA19BMXPR01MB2214INDP_"
MIME-Version: 1.0
X-OriginatorOrg: virtualdataservice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2214.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 85165be0-a74e-41b4-951f-08da45ab219e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 21:50:15.4012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0df1d8-6c3b-4fa4-9eec-c12a70d5c0d4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sq6NANzGTAy7hWtFB1cNIYBmWaeAOylIOsKxfiPzGdzI10bfqeZyOtEY7nl9tUQ7zCKCB+ZAVincdcHaDbXA8FwIIt/lKKZo0Ujc4JRsW6FrfTZsZh64RxufMx/rSfGf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7729

--_000_BMXPR01MB2214046FB3517F327762E7F1FDA19BMXPR01MB2214INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,



I just reviewed your profile and wanted to check if you would you intereste=
d in B2B Users Contacts for your marketing campaign.

Can I send you a sample of one of our B2B email lists? We suggest email lis=
ts based on your

requirements.



I'll come up with the data counts, costs & 5 to 10 samples for your review.



All Industrial Sectors: Technology | Logistics | Oil & Gas | Automotive | E=
nergy| Transportation | Construction | Pharmaceuticals | Veterinary | Trave=
l & Tourism |Telecommunications | Retail | Banking | Manufacturing |Health =
Care| Interior Designers | Facility Management | Education & E-Learning |Ar=
chitects | Food & Beverages | Real Estate| HR | Hospitality | Aviation and =
more... etc.



We can provide you users across any Country, State, Tech Industry, along wi=
th Niche Titles/Departments, B2B Users etc.



We can also provide you the technologies users of: Dell Technologies, IBM, =
Oracle, Lenovo, NetApp, Supermicro, Hitachi Vantara, Huayun Data Internatio=
nal etc.



Titles we can provide: CEO, CTO, CIO, President, Owner, IT VP, IT Director,=
 Decision makers and IT Manager. You can name the title and we can provide =
you those contacts with brief information.

Let us know in if you are interested and we will provide you with more info=
rmation concerning the same.



Thanks,



Mary Chloe

Marketing Executive



"If this doesn't concern you, please forward this email to the right indivi=
dual or reply Not relevant to me"


--_000_BMXPR01MB2214046FB3517F327762E7F1FDA19BMXPR01MB2214INDP_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
<p class=3D"MsoNoSpacing">Hi,<o:p></o:p></p>
<p class=3D"MsoNoSpacing"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNoSpacing">I just reviewed your profile and wanted to check =
if you would you interested in
<b>B2B Users Contacts</b> for your marketing campaign.<o:p></o:p></p>
<p class=3D"MsoNoSpacing"><o:p></o:p></p>
<p class=3D"MsoNoSpacing">Can I send you a sample of one of our B2B email l=
ists? We suggest email lists based on your
<o:p></o:p></p>
<p class=3D"MsoNoSpacing">requirements.<o:p></o:p></p>
<p class=3D"MsoNoSpacing"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNoSpacing">I&#8217;ll come up with the data counts, costs &a=
mp; 5 to 10 samples for your review.<o:p></o:p></p>
<p class=3D"MsoNoSpacing"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNoSpacing"><b>All Industrial Sectors</b>: Technology | Logis=
tics | Oil &amp; Gas | Automotive | Energy| Transportation | Construction |=
 Pharmaceuticals | Veterinary | Travel &amp; Tourism |Telecommunications | =
Retail | Banking | Manufacturing |Health Care|
 Interior Designers | Facility Management | Education &amp; E-Learning |Arc=
hitects | Food &amp; Beverages | Real Estate| HR | Hospitality | Aviation a=
nd more&#8230; etc.<o:p></o:p></p>
<p class=3D"MsoNoSpacing"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNoSpacing">We can provide you users across any Country, Stat=
e, Tech Industry, along with Niche Titles/Departments, B2B Users etc.<o:p><=
/o:p></p>
<p class=3D"MsoNoSpacing"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNoSpacing">We can also provide you the technologies users of=
: Dell Technologies, IBM, Oracle, Lenovo, NetApp, Supermicro, Hitachi Vanta=
ra, Huayun Data International etc.<o:p></o:p></p>
<p class=3D"MsoNoSpacing"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNoSpacing">Titles we can provide: CEO, CTO, CIO, President, =
Owner, IT VP, IT Director, Decision makers and IT Manager. You can name the=
 title and we can provide you those contacts with brief information.<o:p></=
o:p></p>
<p class=3D"MsoNoSpacing">Let us know in if you are interested and we will =
provide you with more information concerning the same.<o:p></o:p></p>
<p class=3D"MsoNoSpacing"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNoSpacing">Thanks, <o:p></o:p></p>
<p class=3D"MsoNoSpacing"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNoSpacing"><b>Mary Chloe<o:p></o:p></b></p>
<p class=3D"MsoNoSpacing"><b>Marketing Executive <o:p></o:p></b></p>
<p class=3D"MsoNoSpacing"><b><o:p>&nbsp;</o:p></b></p>
<p class=3D"MsoNoSpacing"><span style=3D"font-size:9.0pt">&#8220;If this do=
esn&#8217;t concern you, please forward this email to the right individual =
or reply Not relevant to me&#8221;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BMXPR01MB2214046FB3517F327762E7F1FDA19BMXPR01MB2214INDP_--
