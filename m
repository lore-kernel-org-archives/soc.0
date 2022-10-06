Return-Path: <SRS0=qPP2=2H=globeinfo-db.com=erica.turner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A26C433FE
	for <soc@archiver.kernel.org>; Thu,  6 Oct 2022 21:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8501BC433D7; Thu,  6 Oct 2022 21:04:34 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2067.outbound.protection.outlook.com [40.107.239.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEB18C433C1
	for <soc@kernel.org>; Thu,  6 Oct 2022 21:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DEB18C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=globeinfo-db.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=globeinfo-db.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyuBC4dE5JFyZNXQ38V4oObcRvNJqxVAPCCPTY5x0DxZjzXvIlu7UNJQbYB8yWcKxzwuFgUVbV2969kMfg5CsTHBxc8X7SxbEjdtuyLZAncF+K/pd6cR/AGdJ8m2c3HqZhfj/XrFSs0ezDRgBp9wGsa90Akv86vb0hsgJdGOwFl9BS5qlMvKBZFIT9Aj5IFvTg4aGS5UEVwp3MDiM1Cr4gS2HlM6nCaoVnNaw8I2A2/NfzCC/sTMbuzEh5v/bkFt3wvlkTw5x1CHRG0jbZTvmWcZpQtVds++iuhS1fmp3seCMvtA18sHitE5tTyiIQAJHgGyzLVTRefdIjp5mcylJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsLCk4V1Ob1I51z6JyKHSUOZqirOrdIOKtUS8o0e+QE=;
 b=ct9XVUJQS3grWf4zCJYHuX5q3ACDV2fZNweJGDHIgNUG8L39fRL9DIgWbazqkpzK1xTwD3xSgjFnFFNyNta1Ff4irlbQnwXCX3iVKHDg7UdXUV9Y9gIelCBcCCiHaaPYl3PLKIvUf/0OI5ASKbgUP/wPk8rhtXXEX/12GpDIGXdy3bV96U80jxWSjqTYqNrcl+OhSMAQ1YWJWkvwNdYsz/3cafEgBKVVDiYuPulPlyUua6YalONlYCAd2blf6Fs0yGERE8FXxCSWvlHfSMy42O7VYtMTR7blafhHwE7D1FpWUTEooPZ6k41vZVSBylrHidlPVBOKQF9IEbRzssZfug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=globeinfo-db.com; dmarc=pass action=none
 header.from=globeinfo-db.com; dkim=pass header.d=globeinfo-db.com; arc=none
Received: from BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6a::22)
 by PN3PR01MB7581.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Thu, 6 Oct
 2022 21:04:29 +0000
Received: from BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a135:b82f:f92d:ad96]) by BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a135:b82f:f92d:ad96%5]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 21:04:29 +0000
From: Erica Turner <erica.turner@globeinfo-db.com>
List-Id: <soc.lore.kernel.org>
To: "soc@kernel.org" <soc@kernel.org>
Subject: Linux Customers List
Thread-Topic: Linux Customers List
Thread-Index: AdjZxdcceRgR25bnRNSyQJXUmgHrpw==
Date: Thu, 6 Oct 2022 20:56:54 +0000
Message-ID:
 <BM1PR01MB3346BC76543991668245E4F0AB5C9@BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=globeinfo-db.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BM1PR01MB3346:EE_|PN3PR01MB7581:EE_
x-ms-office365-filtering-correlation-id: d5bdaa76-c4f0-47da-469d-08daa7de5c33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +fGFrVHZXRZQoYvo1YnN+1ZqJreeg26MJ78uvrEYgc3gmK4DILlBq5wWEumjQ1mqwat9RZJgpRgr0aYaIih7d9K7Kkkcg76X3yzrbG1YT1j2thEyIq6ThIYWiohSMJs7pBus4HGvF9OJKKVMofpGaZ8xgSEq2CIvsNDLxZ7MGffU8czxt7XKyKjt8UWMK0utaKWf1G3bNy1JSsamcWVZbooDcHMuCJdmBnUqgCzZkm4g+Axhm8zBwCI+OGNd6pR9o+AByREExJQnB31E2lC8/lDsBK/UPz6R1XKzJaC3a6Cu4/cJGLIBrDEYoxEJRTmryBRks9MpH5bUQaybdvC2mlhh/KL9adqyX6mVrCkb+2jkiwNYFBSaNgn6DjwyGNNv4F/8o+Bj83BNzzAZlStGWAxJe39w7DtPwhJw5/hMefs5jaie/Gnyt5r5u7mMMppsjUbJjUHaVep+E9sILKLDUMOZzCe/T6QVAioQgi+jUKOBoIvOgAw2Yzvjf5No+acLL+El6WKBdc0y0zHxRbnZngLRMx5UleCsoavMkO605TwqlP3NhglE6Cj8cSYehALARCp3RvPSze7LaUyWD51WTHOBogVLipLkUKtoZitIX6Du5+Vp5SM016NGVzLiyE/dyTH8h0uiHvezVbqqHjqr9EAS6srj5IY2HoVxE+9+Ed+SC1UnE0iE33VXSF0rlWpyWl2GgH9Tk5EH3G5jbpgG5tvEX0qChGQbUriF7NgeCRqr18FBkREaRzKclECxXupi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(66899015)(38100700002)(122000001)(52536014)(38070700005)(3480700007)(86362001)(186003)(33656002)(4744005)(6506007)(26005)(9686003)(6666004)(478600001)(2906002)(44832011)(9326002)(5660300002)(7116003)(6916009)(316002)(71200400001)(41300700001)(8936002)(66946007)(66556008)(64756008)(66446008)(66476007)(7696005)(55016003)(8676002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RqfS2HgeitCKAzNm5Xj2zkeTKEJJNyooN36zmZfTudmAfv/9VAIKzhE1I1LH?=
 =?us-ascii?Q?cnE+13llYjrG1Sw+4jwrN1yhkNBK9oH4aMmJpg+NMvE3ZcQe+fGLZB6CizaK?=
 =?us-ascii?Q?4YzsmaagNQk0+M7hhKEPbvdKHomVuIx3Vta/SL+AtlPXI3OgXM0XbLTXIr4l?=
 =?us-ascii?Q?S0c1tzgbCaBtOvBHNChMgLxLV25pTB/JUEjqdIy9qvzFGqt9fUxgY1FFqYFh?=
 =?us-ascii?Q?qAgb4VXp2lMYTvNLk8IM7BovojdnYeG5LRiVDk5X65mRYYM+YXIXNW/f3Uaz?=
 =?us-ascii?Q?7fGNkR3+70oLqGmI7xGtq3nKsuErRixpdC0/JkrJahEzVbExQOeOY6z3V/QB?=
 =?us-ascii?Q?vN3WsdCSfjh+Iuphr+FeSiofXIfPA/nEhuZMnRPrUwiFCqAjcMaiVnRP1bcW?=
 =?us-ascii?Q?9htYL7d1709313gLHAE98yZ0kqqjbB4vnnx875R/Cym62Vp3GwcS4QwEBmVN?=
 =?us-ascii?Q?P1E939zdf0vvwpgraoq5mh4SUW7r0LkC3o0CwTE6/+z0wLbTJWr1rdlDwKuq?=
 =?us-ascii?Q?Jb/bTq7F+5390IGZzv3s3RT8tl1FaEw80/MDVS4xbaHVuTqFgA1Pxlz3bYL/?=
 =?us-ascii?Q?YJIpNBTUOjgosfa0I89TCBs6gm8J/Qo2o9VqpSgRmpZwjYHLYYNnkYmElYv3?=
 =?us-ascii?Q?MVOjG93zfnxCcBfmbVxCuAJAe+TNPPbXJ32IBxl7z8jjlPaEOWGz9CLqXnCa?=
 =?us-ascii?Q?u6M/D9gbMI1qMbNVdipRfz7fl7jvJ2xlc/y44oKxtroe1R4WFVxzPV8ndVMb?=
 =?us-ascii?Q?Xb8sgWFbuWxivHMn4ELwAdHsKO7qByegFjXJJJ3+F0mcvfzzXBmmhh4IYqlX?=
 =?us-ascii?Q?JAVpfBI/c6SchWpSAiGy8zPb65/suofGCnWazhQ9iZ4tqOAoxgtGAhxW3Nce?=
 =?us-ascii?Q?Irgo+9lxNWrR0Qsum/W29bj1RbJbGcPb+4yAsNi3WyxF9tUtOG+HcsHGOmG7?=
 =?us-ascii?Q?mtob98xxep+fMe67P6UNPRSm1mlWNI6Lmk86W3aOMrNwkMugnryRMKqzXmgq?=
 =?us-ascii?Q?LuckO6bAQUoQ9g3j2H8RrTP1ZVNjfLX0+1uqcyjZX3oPaIOToQ5OjRUG5DRf?=
 =?us-ascii?Q?5uexCTSkhlZ4TzJ2phlcNkVZNmNc0+BOrfvGOFY8dfn1jDnRzNSkvPTwnNek?=
 =?us-ascii?Q?4B98wrAXgrlTq04ElOMR3XA1FHXXpWG7xbHOYBWs2fFCVmcfbgrJp6xhjdaq?=
 =?us-ascii?Q?TsMvqiH8McTJQC9Iv4cd8sXU0FYazWL8xXDRR9bM74AELDrMT0RNLrMG+DWI?=
 =?us-ascii?Q?x41P22mErM9mVmqHnk3jZVTEm5qEDK5WqZQ86U6yFTMVV+WNyDRwD/vPPQN4?=
 =?us-ascii?Q?f2wc5yXlttv+/L3uwtElWivkH/X+1803uENmZosrrw7hWwssgAD2ZDRWobXb?=
 =?us-ascii?Q?DdUFYyZPCJU8yHRnEmoORrk0YzI2OMVQG4XnfO0bXO+FZRd2BSRmDm4khLZZ?=
 =?us-ascii?Q?3N+o7B65SiN9h++cuWNTzT4GjinotEWZyorqwretQSLsOc7Mwwd3rWu+0Uoi?=
 =?us-ascii?Q?A1Fyq6gN2KoQ4OQG01TTXpRv3F2OCKQlhOLaD3vZ/zdsX7+HLXRTamTnKKix?=
 =?us-ascii?Q?vhtOCgkbzroMJeqry4NhH5Ngf1h+S7LhHepuhEAcgVmk/cmapXAly0zpioAz?=
 =?us-ascii?Q?XQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB3346BC76543991668245E4F0AB5C9BM1PR01MB3346INDP_"
MIME-Version: 1.0
X-OriginatorOrg: globeinfo-db.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bdaa76-c4f0-47da-469d-08daa7de5c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 20:56:54.7966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86ddcae0-ef95-4504-93e8-2ecf0a7a58a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1irz5OCTqOLeHp1yL5LcH7Y9nTd8UyL30zfeDWWW6Z2pIy47/GiO10cjQoQh7KcQnvnPnqtea2tw+4pE4j+jPGGfNWe4XiYAM3EkUdNEboA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7581

--_000_BM1PR01MB3346BC76543991668245E4F0AB5C9BM1PR01MB3346INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Hope you are doing well.

Are you looking for Linux with email, phone and complete details?

Titles like - IT Decision Makers, CEO, CFO, IT Engineers and many more.

Let me know your geography so that I can get back with counts, pricing and =
more information on your interest.

Regards,
Erica Turner
Sales Consultant
Lead Gen Marketing LLC


To opt out, please response Outs.


--_000_BM1PR01MB3346BC76543991668245E4F0AB5C9BM1PR01MB3346INDP_
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
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
">Hope you are doing well.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
">Are you looking for
</span><b><u><span style=3D"font-family:&quot;Cambria&quot;,serif;color:bla=
ck;background:white">Linux</span></u></b><b><span style=3D"font-family:&quo=
t;Cambria&quot;,serif">
</span></b><span style=3D"font-family:&quot;Cambria&quot;,serif">with email=
, phone and complete details?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Cambria&quot;,se=
rif">Titles like</span></b><span style=3D"font-family:&quot;Cambria&quot;,s=
erif"> - IT Decision Makers, CEO, CFO, IT Engineers and many more.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
">Let me know your geography so that I can get back with counts, pricing an=
d more information on your interest.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><a name=3D"_Hlk109915644"><b><span style=3D"font-fam=
ily:&quot;Cambria&quot;,serif">Regards,<o:p></o:p></span></b></a></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><b><span =
style=3D"font-family:&quot;Cambria&quot;,serif">Erica Turner<o:p></o:p></sp=
an></b></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><a name=
=3D"_Hlk110529554"><b><span style=3D"font-family:&quot;Cambria&quot;,serif"=
>Sales Consultant<o:p></o:p></span></b></a></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><span sty=
le=3D"mso-bookmark:_Hlk110529554"><b><span style=3D"font-family:&quot;Cambr=
ia&quot;,serif">Lead Gen Marketing LLC<o:p></o:p></span></b></span></span><=
/p>
<span style=3D"mso-bookmark:_Hlk110529554"></span>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><b><span =
style=3D"font-family:&quot;Cambria&quot;,serif"><o:p>&nbsp;</o:p></span></b=
></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><span sty=
le=3D"font-size:8.0pt;color:#E7E6E6">To opt out, please response Outs.<o:p>=
</o:p></span></span></p>
<span style=3D"mso-bookmark:_Hlk109915644"></span>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BM1PR01MB3346BC76543991668245E4F0AB5C9BM1PR01MB3346INDP_--
