Return-Path: <SRS0=gEjD=VO=toradex.com=marcel.ziswiler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F90C433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 15:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A5F8C385A9; Fri,  6 May 2022 15:46:15 +0000 (UTC)
Received: from de-smtp-delivery-213.mimecast.com (de-smtp-delivery-213.mimecast.com [194.104.109.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81C99C385A8
	for <soc@kernel.org>; Fri,  6 May 2022 15:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81C99C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=toradex.com
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2047.outbound.protection.outlook.com [104.47.22.47]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-em1xDHG_Pya2PH8WaI-YsQ-1; Fri, 06 May 2022 17:46:09 +0200
X-MC-Unique: em1xDHG_Pya2PH8WaI-YsQ-1
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 GVAP278MB0151.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:3f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Fri, 6 May 2022 15:46:08 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::c52f:2a3f:8cf5:6144]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::c52f:2a3f:8cf5:6144%4]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 15:46:08 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
CC: "linux-imx@nxp.com" <linux-imx@nxp.com>, "soc@kernel.org"
	<soc@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"ariel.dalessandro@collabora.com" <ariel.dalessandro@collabora.com>,
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
	"olof@lixom.net" <olof@lixom.net>, "stefan@agner.ch" <stefan@agner.ch>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "sebastian.reichel@collabora.com"
	<sebastian.reichel@collabora.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "tharvey@gateworks.com" <tharvey@gateworks.com>,
	"cniedermaier@dh-electronics.com" <cniedermaier@dh-electronics.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [PATCH v1 00/24] ARM: dts: imx7-colibri: device tree improvements
Thread-Topic: [PATCH v1 00/24] ARM: dts: imx7-colibri: device tree
 improvements
Thread-Index: AQHYYV34eY43c5Of3k+8s0HH0JFx8a0R/hCA
Date: Fri, 6 May 2022 15:46:08 +0000
Message-ID: <92cbf17c1b09ee2d6b97e4ce2203f419c1144c84.camel@toradex.com>
References: <20220506152809.295409-1-marcel@ziswiler.com>
In-Reply-To: <20220506152809.295409-1-marcel@ziswiler.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c77d82d-dd3a-42c0-ce62-08da2f778978
x-ms-traffictypediagnostic: GVAP278MB0151:EE_
x-microsoft-antispam-prvs: <GVAP278MB01511AE1C0FA65EA0DD99FF5FBC59@GVAP278MB0151.CHEP278.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: NqXBRm43cDv4cvuu3Y2GygDLMODbb638PbROrBitj4e7CF7Ll4y8bxs88gXGhq3Cl2rxy9N1xV/7SuKKxS6b7yvcrYm0BXZbWJ2sneX2A8nvBoDfe0ykf0JSHL6TFngd4+hQz/rwgXtVz/cO+IL+wil3uG5chDR4kQ7M03VFFakqBACi7sKvPP0AqzeNMWVgM5lUwPpMmQxD80qZSLKJaypCO16XEGkBXc8aXKqRriUbqONIyA3G3hVBxufeh2vRGUBx5uio6pct6mk+XxlOiNl5itbQkcoUIBISpmVm1jB1c4in4rCvg2wGqo9xX2bGp8Nx6PIGgSs1h6pWSA/BQKdfrVL+d5606JcJBFt/1bbHRgeVBgOBB0qKLtK/0Ks5Di/sJPZ0pRKxA4AIK+Imj3d3tQ6+a3xQSCZcrPmvBK9wo53PWw5WNLH7ffISDNcGnfPdYOIisryZ+YKZArvylQTVnPcY05zu2lS9xvYIxZaUEdlX9kMRPcH0FwipX12yYKTPMoSmCET7qNNOxikv40qXwu8G26JyiXdxozhvLjA852VyyRCFu37g1g9cnXDuBBZEjgzTAzTbirm657MjXVg1VLONIFqChEthQq6xZmVbIh3cv3VKK9SvcceWkOvno9c/U+eiUdt7Nquxjt5aXq791GpK57tUYN3SdboPbqe709iCLaqwJ1NLjA8czUIU+mbnECdffrHxFtVOascEwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(122000001)(38100700002)(508600001)(5660300002)(86362001)(54906003)(6916009)(71200400001)(186003)(4270600006)(6486002)(44832011)(36756003)(316002)(558084003)(66946007)(4326008)(6506007)(2616005)(66556008)(83380400001)(8676002)(76116006)(2906002)(7416002)(66476007)(8936002)(38070700005)(6512007)(66446008)(64756008)(26005);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3piQnZPbE92VFA4VHpidGMySEtoN2hIcVFVem8rMVgyUUh2ZXBSMVMzZ1pw?=
 =?utf-8?B?QUxIRFFaRnVRc0VtR09ZZVlWZGx6R2RIck9GbzhhQjcvV25CbzFUR1pFNnhm?=
 =?utf-8?B?VDd6WkVqMjZkK2Zvc3lKYm52NTNwcW55YmZsall5dlAvYTFMNDlJYXJUN1J2?=
 =?utf-8?B?QWd2VUFEN3o5c09idHViYm5Zd0Y2QVBJNXlXL0szNTNoQkQwcXVUK2dnTFdl?=
 =?utf-8?B?VmFLNXdzSm81SHlmZUZvS2R2cnp5dmg1RUVrU1ViOVlVNEJUK3FZeG5pTkdQ?=
 =?utf-8?B?VEhkNGxSUFNnM1RnRG44NU1MZVBpTkxqY1FwUVk1cWN5cTRuNm5vQ1VacnBG?=
 =?utf-8?B?dFF0MWlNWlNpWTZIYlFKTzRIK0lQMmF6U1Z5TjVoSHBJdGxhWmFCeWdWaU5r?=
 =?utf-8?B?MlpCUm80UmVZNTcvZGc5a3EyN0xFbGp4elVFalNESjN5OGlJbTBSK1lSWUpt?=
 =?utf-8?B?QjJwNS95RjdRK1pnYUI0L2Y1Q0ZyME03OXo2emR5UitPUmJGQTd6OWJrK0Zj?=
 =?utf-8?B?RWUxektQcnlndlQ5RkI0RHF4UWFnSjNtTXh6cEg2Sm9yek9pUndTNHJTOEVq?=
 =?utf-8?B?emFWSTF0ZGFJMWJXMVlsSGNIQXMyYzFrQ1pNU0dlUHRnemdvVXBBRkJHR3F2?=
 =?utf-8?B?ZzlOaGlVSk9RN0Jaakp2Q01kclNLbk16ZUVaR21NcFFMNmF6ckFkc00yY2FV?=
 =?utf-8?B?MmV6dHJrLzNHRzU2cEVjLzdZTTk1RWY3WVh6Rzh0V3RwdytzMGx1K0ZOSTRH?=
 =?utf-8?B?UkVzallDd0Y5emt2SVkyZ1BZWTM4SlV6U0ZmRUlKcEZnbzEyYTVvV0xpVUhH?=
 =?utf-8?B?Rk1hZXJDWlU5TmN0SFlHUmdqb0wzK0Q5Qm5Dd0dVMlkyVlZuRU9TWi9oc0Rz?=
 =?utf-8?B?dHFzUnlvaWk5cVBVUmlCNHZpOEFpTSs4NHlIVG9iS2ZXTS9pNm1tMm0xck9n?=
 =?utf-8?B?Nk9UdWFJcHkyb0lCRXhsa3F2clFJK3hUVlpyTTlxVm5pTXg5S3crbXFRQlJt?=
 =?utf-8?B?OXpDVXpwbkRzaDBRYUtGTzRHUkZiUmkwa2MxcG9TTG9ZM2FUNjZYR3cvd0w0?=
 =?utf-8?B?RlRqcnZLQXRxRmE4dlk4SUlHbmorOU5wZzl5c3FxS1Y1YWJzSGY3dTJUczNk?=
 =?utf-8?B?NUZUZ2ZBemlxN0UvcGZFSE9sL20rb3ZBMzlWenk2TGNDZ2w0VnBUbEVZUUNk?=
 =?utf-8?B?cVVsenZSOVVpTGtUOUJNUGNOU1VPUUU3OG5Hb2FjaTBVNHJWcGFyWjlNSmZo?=
 =?utf-8?B?Y09EcmVyaXBxcUEzTU5UbHNCcWdlcVFCNnRGTnlVcjRWWHNac005WW9tUElB?=
 =?utf-8?B?WVR2Qm91N3BMYmpVVURSTUFaZW9XY2ZXVkFnR2hzR0JCNm1tTS9kOG5obFpx?=
 =?utf-8?B?bGc2QjdXNldUYnljTzZ5dnQ2MDYvb2JVWHhRZDZ2cWdLcnF1b0R6cHExMVRI?=
 =?utf-8?B?dnJCTUV6WmtOR0tneHBlZXFwcDg0NFNyZW1MQUtwMHZDSjkwTE4vSkZWc1A0?=
 =?utf-8?B?OFltTm5XaHVVUVRuT1ZJTHhpeDZqNGVDT2hxRzlpRUNaaXNxRWh1MXhZNlJK?=
 =?utf-8?B?MFZ3dlBKRGZKWURQc0RHTE5Mc1JtOUl5NFZUbDB3dFpBUXQ3VlBHSW9hOXpQ?=
 =?utf-8?B?N01Hb3BlM1ZSb1hCQklBYXhOSGZtQVB0bmFXWGhxanZldUtHOEhudngrNDZR?=
 =?utf-8?B?dnRNaEFXQ2ZOOU5qWWdUNkxWK0JRZVBiTVFtSlhtb3N4S2JCSVp3ejhOUTc4?=
 =?utf-8?B?eU5kZ1hGaDNpWVMxZkhMRkw5bE1DTHBSR2tSMjJrUVdqR0pia3NFSHE1bDdo?=
 =?utf-8?B?QitieGxkZm5HaTdqSGtMNmNsT0hOWkRPYk0yRm9TN0dCakhZL3M0KzlCWmli?=
 =?utf-8?B?a2tmU1pKTVhrTnI5NlJxY3ZmNGtKSzZMRExGYzlQOEJvVXVJWk5jdjhacEE1?=
 =?utf-8?B?cFZYMDNPSDJoZ3NlcERIbHhhK0NGS3B0OFFWQ0FpZE81dTFzQ2pGSnArSTky?=
 =?utf-8?B?Sml6N0NaU0xYc0NNYUhYTmJCQklYN2RJUUlFR0s2cVA0bGY2K3RJVmxES3Fq?=
 =?utf-8?B?N2JQOHVRTmRaUkZjY1NLZ1NFUC8zQWc4WkR6ZE9jdWhRVDZXdlk4NHZvZDlO?=
 =?utf-8?B?WUNCOU1iQkdsL0hpMFI2VUlDRElnVVJ1TDNGS2ZHWHVUeFRtNjZrWGJlRDhs?=
 =?utf-8?B?MEE2dnhqbUFjRFlhRnNuZFdkc09sYUFIK1JpTWN6dWV0M2pSaFF4ZzRmL0xP?=
 =?utf-8?B?T21Jd0FkbUNLTDRBT2pxd0Rvb0F1cVlGT0JDZXJRZEFWSWs1MGQ0aHNIWEZi?=
 =?utf-8?B?SENKNE1jRU1vU1BiVkFrUFFUZzgvMTg5ZE0wcWkwcFI4dExyZTZHanJONXRR?=
 =?utf-8?Q?8DyfGXyrc/D7q0IZWZ1bNHXeYsQDAWSq7ej1q?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c77d82d-dd3a-42c0-ce62-08da2f778978
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 15:46:08.0199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keV8kd5/eytp9WafpFb9aVJDa57wnGXEWIdFawg1QOqn4ZkIKBcqkZ2hPCIFwaitClENRlpPY0bXb8zOUxe5rbMChC7AGUnZNGXK3hCwYoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0151
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CDE13A77 smtp.mailfrom=marcel.ziswiler@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <849AC5BDE57C5747A4D119A6AFF29EED@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

U29ycnksIHJ1biBpbnRvIHNvbWUgZW1haWwgc2Vzc2lvbiBsaW1pdCBhZ2Fpbi4gV2lsbCBzZW5k
IHRoZSByZXN0IHNob3J0bHkuDQo=

