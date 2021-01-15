Return-Path: <SRS0=eJPh=GS=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A70C433E0
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 11:12:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 14CC2236FB; Fri, 15 Jan 2021 11:12:51 +0000 (UTC)
X-Greylist: delayed 65 seconds by postgrey-1.34 at mail.kernel.org; Fri, 15 Jan 2021 11:12:50 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D665235F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D665235F9;
	Fri, 15 Jan 2021 11:12:49 +0000 (UTC)
IronPort-SDR: P5EwokHdyUs9UzVMuaYnmPYFv8gJfVgoLOi5HVIFrE+Hfm5QYvfbWio5k51dE6PDR4WIMqTXs9
 AclIxqiIPwFNqYvgoAeGWHVvI+sLXsb2rIjGnfUDCH6ZwERjcpXmWAEljdA0R/Swks80KTnZvz
 luqrytK8jBC9DkWix8AeVP9/xfPopC9NufbvHbLDXh/o2xGI/ecvXukvuDk7TMjr6BIz1C7I7h
 37P5rk9XJ4FJbDn03mI2nsYbL/Lo8RcfDdbkGe3ESrTvhVeBCqV3odbYaH83XfuoSFymtgUsxT
 tFY=
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="24545174"
X-IronPort-AV: E=Sophos;i="5.79,349,1602514800"; 
   d="scan'208";a="24545174"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 20:11:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMaUuT5dxGnIKdoP7zs2btqIaYFbpwtrPSVZbWPl2Pl6AOBTU/5987Z6pzFlX2XHOofndlgkmv4g/vva1l20wrdVO4TH781zVqjtBeMRo9zpia3sf9kUtusAjMjfM9cx5B9+FXbJ0aBJS5uZaL9Q5243zZg5meHtROsx36tlCMV6E0fmgS6uZp5XJb+M8UCYqXHj97iLqwWQIYngqLd3V7nv1RHjephSMfARAud/LANv5Y0oFTllXMJWEJ3lTxj6yJ14mqmOiDsFabMks2HRlmjkO0AeRppmOeo7trfhCH4Ma/O88omvJE3y+19C0K79jYBXf5jKzlPwCzjkutF2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a497YMnWWA5UqgJjAMTgrSxHtPSr/Y12pDoUP0e1wMk=;
 b=SNd+PI+f393UiCfNt6c525LtD1+R7rPN+cB2/be8RkEVBwBSKWOlG6/XEh3DQohKr3ahzonPswZTiC3/gpkm/Np5wv9y/l7DBzeLdMqbEx4YU884AAR8/cHuwfgvD+BXEGdKPLaTZmQaTr8kT9ZEK9TaFJIHQBQ3+CehwAUGX4gdwJutzG5QCb8qBY3o+kkH0ryAy9t3+JUpMF3p5B6nYH76mNzQhDnzYWTAMKlHhq2XRyDJ8RP5PZW8brC2cr24STumKmZpQJ/ZinmS5eZYlWwKBWnDUcE+YBC2mefnVeY5C9FEz7hhbZnNAr7WizQjdLvuC075ScYMbBss0Pr5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a497YMnWWA5UqgJjAMTgrSxHtPSr/Y12pDoUP0e1wMk=;
 b=EylLg1XqITU0zHja95WpPOPiUgyn7w/XeGjHZk12lhftCXeagV84QyXarfYkBT7181/leu8ccDFz5oDtgGmXlzIjq08ouuv7C1YMVYKaRHN1kviVYH2cLiEpv7+1cxmXrIPTMWZvImGDW9jGEiq9ZBNwc4TCSE8vc6rB22K8yVc=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSBPR01MB1576.jpnprd01.prod.outlook.com (2603:1096:603:6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 11:11:39 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 11:11:39 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>, Olof
 Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8IAATzYAgAE118A=
Date: Fri, 15 Jan 2021 11:10:13 +0000
Deferred-Delivery: Fri, 15 Jan 2021 11:11:12 +0000
Message-ID:
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
In-Reply-To:
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: 41dd7f68a53248baace3fccdee57a88c
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.176]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40e78fe4-6697-44f1-ed4c-08d8b94654cd
x-ms-traffictypediagnostic: OSBPR01MB1576:
x-microsoft-antispam-prvs:
 <OSBPR01MB157665666629618AEE1DA174E5A70@OSBPR01MB1576.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 J8X2ksida/jWlUES2/M9dQ3mxyNTUFNvkg5HVsXXtXwx95xO3EvzK4pFElRGCwLS5btGKtD5RFwvVv5JOovjAHTC0AdRN7rEkw3CPaWrxrUuCMgLhchtdpOA18d08dWfiIIVIRJu3clG8Wy+te91uIilQgZguorYmPvicsd6ZaFdx3Fp+vcAJNnEfE2eBYxNLWSrOHXIhTM9o/TUPLy9mGkfXoBeBh+zlUy/5S+EP6cl09Ytz4QdwMhiFr8Xh+DsmvrLeBywO7/zFivN93Qpr9uXt/hIbhqAxl0rOPjS2w6Q+dUtQnpxVz9MZ+VPWcmnquTSnolx2IL/k4+0hPIDaqeHsSAtRSSFKYAhhpsvjwxf618lKGTYLaOeKSExf6CjQzNaO9AfEcTMgfP8tb1CKkiPFNQXG142GekbajaLaADf7lAW2V6X2cTr/JFRgOuf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(83380400001)(7696005)(66556008)(6666004)(478600001)(5660300002)(76116006)(66446008)(66946007)(4326008)(6506007)(66476007)(8936002)(64756008)(9686003)(33656002)(54906003)(86362001)(8676002)(53546011)(316002)(85182001)(52536014)(186003)(2906002)(26005)(55016002)(6916009)(71200400001)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?b2R0NjQyYWFxa0srVXVjS2VKQTlJWjBCcDNxeXg1d2ZLcTBtM3ZES2ZwNXFB?=
 =?utf-8?B?SElFdk8vRXlRQ0hhak1WRVRzRGpRZ2ZpWUhUUjZNVXhFb2RpSG96bDZkdlpW?=
 =?utf-8?B?MFRiejFnby9BdzE2SWR4bGVJbVoxUGlrdGVWbHdyWGU2YUNPRzJFK3dDRVcr?=
 =?utf-8?B?SFVZSDd3NnM2YjhUVXRKbnlwdDR6ajQ0S0J1RlNUUG5HaEtJSGlEbFdsRElq?=
 =?utf-8?B?S1B6OVZ6Nk95WG5PazJoNFZtaCtXMXRvTTh4OTFtZGV2Nzk4MEdKQnMxQUc2?=
 =?utf-8?B?VXJYMlIvQmhsQlAveTl3VXROZEhSd0svejYvVkxLV09sS2x5eGtoL0w5MFFF?=
 =?utf-8?B?WXJzK1Ercjd2K3d5ZTVJbnQ0cTB3SDhTYnN5TXpHNzNiQ05iR3o1MldJMHNP?=
 =?utf-8?B?bWhaaFRNZGJ4allhTVBGWStTZ1J4ZmtnRXlVbXlFYWdxcUFDZVB1dlBoa0kz?=
 =?utf-8?B?Tmw5MXFabmdaRDBFNWhiQlA4RTAybGovWEJ3Wmoxa3NBbCtrS2Vlck9Ybzdv?=
 =?utf-8?B?TVNERS9meWZNWndCS096WnNYamZlZyt5ZGV4MjZNVzdIb2VuQWVxR3F1cUJR?=
 =?utf-8?B?d0tCVXJwc0Z0SjRaS21LYXpXWGNqVjlXZ2s4M25NOW1kMC9SUE5XWDRFMEpq?=
 =?utf-8?B?Rm0yS2JZSHF1a3FUVks2MWRYUlJTOVN0NG96blZZeGNuMis4NEpzQ0ppUW8v?=
 =?utf-8?B?blNzTWQwWWV5R1pxaXYrVFZRY0hiSjBHdlVkTFpVdm1pRGpzeSt6S2RKRHM4?=
 =?utf-8?B?VlhzUm5Oc2pOb2dKVm8rOGxjNTE4T0NtTk5hOFJOYnV2V3J1UUp4a1MrN2Vt?=
 =?utf-8?B?WHFHVXRYMVhON2FBZGM0SHFuUXFmcWFsWENIK1VMMXdmWVVtMHNzOFh6K0pi?=
 =?utf-8?B?Z0g0MGxURitNaHBXa1V3UDBlYzdsd1docWRLM3BwUGFIMll0ZFprYW1Hd1pV?=
 =?utf-8?B?cGNNa1FNSjBjTFEyU0g2c0pJQUNyNkVuYUdaZEU4UVRrRVJDM25YQnJnQng5?=
 =?utf-8?B?V2s1bjVwTlhCOHh2c1RHcWROYU1pdVQ2WkowM24rQVFyVFlXZTI4VTgzN1dC?=
 =?utf-8?B?TVA3Y2VTUERUUGpHbmUzQUdPSk8xb2xoOVZOOUJjb09hMld3YWFZWHNBVTZ3?=
 =?utf-8?B?RURqdzBsLzg2NlloUFVEQ3hCS3dyWlBHSzErUkE1Uit0YVhwcjZhOTRTVzNI?=
 =?utf-8?B?M0FVMUpjTStNaEZYN0VsVHFNVlh3cW5ram9ybEtXWlV0WFFsVmRBZHUzeWFw?=
 =?utf-8?B?eVhzWTJibVB3QWg4NzVJSW9zRkE1TTZsQ2lXMHhZTStENU1lQS9oaHh4UlQz?=
 =?utf-8?Q?EWOjw1mGmjYSs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e78fe4-6697-44f1-ed4c-08d8b94654cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 11:11:39.3786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6mgJZQf1ZfSXjW8eU6bxrEvygm4JZzuOOh0H8AklkN212Azf0/kLLskK4NQyzc2zQ4mQyQPgvS1b481RUsEUOG45LKxmi7Aj6njVgN4fEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1576

PiBPbiBUdWUsIEphbiAxMiwgMjAyMSBhdCAxMToyNCBBTSBtaXNvbm8udG9tb2hpcm9AZnVqaXRz
dS5jb20NCj4gPG1pc29uby50b21vaGlyb0BmdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4gPiBPbiBG
cmksIEphbiA4LCAyMDIxIGF0IDE6NTQgUE0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJt
LmNvbT4gd3JvdGU6DQo+ID4gSG93ZXZlciwgSSBkb24ndCBrbm93IGFueSBvdGhlciBwcm9jZXNz
b3JzIGhhdmluZyBzaW1pbGFyDQo+ID4gZmVhdHVyZXMgYXQgdGhpcyBwb2ludCBhbmQgaXQgaXMg
aGFyZCB0byBwcm92aWRlIGNvbW1vbiBhYnN0cmFjdGlvbiBpbnRlcmZhY2UuDQo+ID4gSSB3b3Vs
ZCBhcHByZWNpYXRlIHNob3VsZCBhbnlvbmUgaGF2ZSBhbnkgaW5mb3JtYXRpb24uDQo+IA0KPiBU
aGUgc3BlY2lmaWNhdGlvbiB5b3UgcG9pbnRlZCB0byBtZW50aW9ucyB0aGUgU1BBUkM2NCBYSWZ4
LCBzbw0KPiBhdCBhIG1pbmltdW0sIGEgdXNlciBpbnRlcmZhY2Ugc2hvdWxkIGJlIGRlc2lnbmVk
IHRvIGFsc28gd29yayBvbg0KPiB3aGF0ZXZlciByZWdpc3Rlci1sZXZlbCBpbnRlcmZhY2UgdGhh
dCBwcm92aWRlcy4NCg0KVGhvc2Ugb3VyIHByZXZpb3VzIENQVXMgaGF2ZSBoYXJkd2FyZSBiYXJy
aWVyIGZ1bmN0aW9uIHRvbywgYnV0IHRoZXkgYXJlDQpub3QgY3VycmVudGx5IHVzZWQgKEkgYmVs
aWV2ZSB0aGUgaGFyZHdhcmUgZGVzaWduIHNoYXJlcyBjb21tb24gaWRlYSBhbmQgDQp0aGlzIGRy
aXZlciBsb2dpYy9pb2N0bCBpbnRlcmZhY2UgY291bGQgYmUgYXBwbGljYWJsZSB0byBib3RoKS4N
Cg0KPiA+ID4gPiBTZWNvbmRseSwgdGhlIGludGVuZGVkIHVzYWdlIG1vZGVsIGFwcGVhcnMgdG8g
ZXhwb3NlIHRoaXMgdG8gRUwwIGZvcg0KPiA+ID4gPiBkaXJlY3QgYWNjZXNzLCBhbmQgdGhlIGNv
ZGUgc2VlbXMgdG8gZGVwZW5kIG9uIHRocmVhZHMgYmVpbmcgcGlubmVkLCBidXQNCj4gPiA+ID4g
QUZBSUNUIHRoaXMgaXMgbm90IGVuZm9yY2VkIGFuZCB0aGVyZSBpcyBubyBwcm92aXNpb24gZm9y
DQo+ID4gPiA+IGNvbnRleHQtc3dpdGNoLCB0aHJlYWQgbWlncmF0aW9uLCBvciBpbnRlcmFjdGlv
biB3aXRoIHB0cmFjZS4gSSBmZWFyDQo+ID4gPiA+IHRoaXMgaXMgZ29pbmcgdG8gYmUgdmVyeSBm
cmFnaWxlIGluIHByYWN0aWNlLCBhbmQgdGhhdCBleHRlbmRpbmcgdGhhdA0KPiA+ID4gPiBzdXBw
b3J0IGluIGZ1dHVyZSB3aWxsIHJlcXVpcmUgbXVjaCBtb3JlIGNvbXBsZXhpdHkgdGhhbiBpcyBj
dXJyZW50bHkNCj4gPiA+ID4gYXBwYXJlbnQsIHdpdGggcG90ZW50aWFsbHkgaW52YXNpdmUgY2hh
bmdlcyB0byBhcmNoIGNvZGUuDQo+ID4gPg0KPiA+ID4gUmlnaHQsIHRoaXMgaXMgdGhlIG1haW4g
cHJvYmxlbSBJIHNlZSwgdG9vLiBJIGhhZCBub3QgZXZlbiByZWFsaXplZA0KPiA+ID4gdGhhdCB0
aGlzIHdpbGwgaGF2ZSB0byB0aWUgaW4gd2l0aCB1c2VyIHNwYWNlIHRocmVhZHMgaW4gc29tZSBm
b3JtLCBidXQNCj4gPiA+IHlvdSBhcmUgcmlnaHQgdGhhdCBvbmNlIHRoaXMgaGFzIHRvIGludGVy
YWN0IHdpdGggdGhlIENQVSBzY2hlZHVsZXIsDQo+ID4gPiBpdCBhbGwgYnJlYWtzIGRvd24uDQo+
ID4NCj4gPiBUaGlzIG9ic2VydmF0aW9uIGlzIHJpZ2h0LiBJIHRob3VnaHQgYWRkaW5nIGNvbnRl
eHQgc3dpdGNoIGV0Yy4gc3VwcG9ydCBmb3INCj4gPiBpbXBsZW1lbnRhdGlvbiBkZWZpbmVkIHJl
Z2lzdGVycyByZXF1aXJlcyBjb3JlIGFyY2ggY29kZSBjaGFuZ2VzIGFuZA0KPiA+IGl0IGlzIGZh
ciBsZXNzIGFjY2VwdGFibGUuIFNvLCBJIHRyaWVkIHRvIGNvbmZpbmUgY29kZSBjaGFuZ2UgaW4g
YSBtb2R1bGUgd2l0aA0KPiA+IHRoZXNlIHJlc3RyaWN0aW9ucy4NCj4gDQo+IE15IGZlZWxpbmcg
aXMgdGhhdCBoYXZpbmcgdGhlIGNvZGUgc2VwYXJhdGUgZnJvbSB3aGVyZSBpdCB3b3VsZCBiZWxv
bmcNCj4gaW4gYW4gb3BlcmF0aW5nIHN5c3RlbSB0aGF0IHdhcyBkZXNpZ25lZCBzcGVjaWZpY2Fs
bHkgZm9yIHRoaXMgZmVhdHVyZQ0KPiBlbmRzIHVwIGJlaW5nIG5vIGJldHRlciB0aGFuIHJld3Jp
dGluZyB0aGUgY29yZSBzY2hlZHVsaW5nIGNvZGUuDQo+IA0KPiBBcyBNYXJrIHNhaWQsIGl0IG1h
eSB3ZWxsIGJlIHRoYXQgbmVpdGhlciBhcHByb2FjaCB3b3VsZCBiZSBzdWZmaWNpZW50DQo+IGZv
ciBhbiB1cHN0cmVhbSBtZXJnZS4gT24gdGhlIG90aGVyIGhhbmQsIGtlZXBpbmcgdGhlIGNvZGUg
aW4gYQ0KPiBzZXBhcmF0ZSBsb2FkYWJsZSBtb2R1bGUgZG9lcyBtYWtlIG1vc3Qgc2Vuc2UgaWYg
d2UgZW5kIHVwDQo+IG5vdCBtZXJnaW5nIGl0IGF0IGFsbCwgaW4gd2hpY2ggY2FzZSB0aGlzIGlz
IHRoZSBlYXNpZXN0IHRvIHBvcnQNCj4gYmV0d2VlbiBrZXJuZWwgdmVyc2lvbnMuDQo+IA0KPiA+
IFJlZ2FyZGluZyBkaXJlY3QgYWNjZXNzIGZyb20gRUwwLCBpdCBpcyBuZWNlc3NhcnkgZm9yIHJl
YWxpemluZyBmYXN0IHN5bmNocm9uaXphdGlvbg0KPiA+IGFzIHRoaXMgZW5hYmxlcyBzeW5jaHJv
bml6YXRpb24gbG9naWMgaW4gdXNlciBhcHBsaWNhdGlvbiBjaGVjayBpZiBhbGwgdGhyZWFkcyBo
YXZlDQo+ID4gcmVhY2hlZCBhdCBzeW5jaHJvbml6YXRpb24gcG9pbnQgd2l0aG91dCBzd2l0Y2hp
bmcgdG8ga2VybmVsLg0KPiANCj4gT2ssIEkgc2VlLg0KPiANCj4gPiBBbHNvLCBJdCBpcyBjb21t
b24gdXNhZ2UgdGhhdCBlYWNoIHJ1bm5pbmcgdGhyZWFkIGlzIGJvdW5kIHRvIG9uZSBQRSBpbg0K
PiA+IG11bHRpLXRocmVhZGVkIEhQQyBhcHBsaWNhdGlvbnMuDQo+IA0KPiBJIHRoaW5rIHRoZSBl
eHBlY3RhdGlvbiB0aGF0IGFsbCB0aHJlYWRzIGFyZSBib3VuZCB0byBhIHBoeXNpY2FsIENQVQ0K
PiBtYWtlcyBzZW5zZSBmb3IgdXNpbmcgdGhpcyBmZWF0dXJlLCBidXQgSSB0aGluayBpdCB3b3Vs
ZCBiZSBuZWNlc3NhcnkNCj4gdG8gZW5mb3JjZSB0aGF0LCBlLmcuIGJ5IGFsbG93aW5nIG9ubHkg
dGhyZWFkcyB0byBlbmFibGUgaXQgYWZ0ZXIgdGhleQ0KPiBhcmUgaXNvbGF0ZWQgdG8gYSBub24t
c2hhcmVkIENQVSwgYW5kIGF1dG9tYXRpY2FsbHkgZGlzYWJsaW5nIGl0DQo+IGlmIHRoZSBDUFUg
aXNvbGF0aW9uIGlzIGNoYW5nZWQuDQo+IA0KPiBGb3IgdGhlIHVzZXIgc3BhY2UgaW50ZXJmYWNl
LCBzb21ldGhpbmcgYmFzZWQgb24gcHJvY2VzcyBJRHMNCj4gc2VlbXMgdG8gbWFrZSBtb3JlIHNl
bnNlIHRvIG1lIHRoYW4gc29tZXRoaW5nIGJhc2VkIG9uIENQVQ0KPiBudW1iZXJzLiBBbGwgb2Yg
dGhlIGFib3ZlIGRvZXMgcmVxdWlyZSBzb21lIGxldmVsIG9mIGludGVncmF0aW9uDQo+IHdpdGgg
dGhlIGNvcmUga2VybmVsIG9mIGNvdXJzZS4NCj4gDQo+IEkgdGhpbmsgdGhlIG5leHQgc3RlcCB3
b3VsZCBiZSB0byB0cnkgdG8gY29tZSB1cCB3aXRoIGEgaGlnaC1sZXZlbA0KPiB1c2VyIGludGVy
ZmFjZSBkZXNpZ24gdGhhdCBoYXMgYSBjaGFuY2UgdG8gZ2V0IG1lcmdlZCwgcmF0aGVyIHRoYW4N
Cj4gYWRkcmVzc2luZyB0aGUgcmV2aWV3IGNvbW1lbnRzIGZvciB0aGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbi4NCg0KVW5kZXJzdG9vZC4gT25lIHF1ZXN0aW9uIGlzIHRoYXQgaGlnaC1sZXZlbCBp
bnRlcmZhY2Ugc3VjaCBhcyBwcm9jZXNzDQpiYXNlZCBjb250cm9sIGNvdWxkIHNvbHZlIHNldmVy
YWwgcHJvYmxlbXMgKGkuZS4gYWNjZXNzIGNvbnRyb2wvZm9yY2UgYmluZGluZyksDQpJIGNhbm5v
dCBlbGltaW5hdGUgYWNjZXNzIHRvIElNUC1ERUYgcmVnaXN0ZXJzIGZyb20gRUwwIGFzIEkgZXhh
cGxhaW5lZA0KYWJvdmUuIElzIGl0IGFjY2VwdGFibGUgaW4geW91ciBzZW5zZT8NCg0KPiBBc2lk
ZSBmcm9tIHRoZSB1c2VyIGludGVyZmFjZSBxdWVzdGlvbiwgaXQgd291bGQgYmUgZ29vZCB0bw0K
PiB1bmRlcnN0YW5kIHRoZSBwZXJmb3JtYW5jZSBpbXBhY3Qgb2YgdGhlIGZlYXR1cmUuDQo+IEFz
IEkgdW5kZXJzdGFuZCBpdCwgdGhlIGVudGlyZSBwdXJwb3NlIGlzIHRvIG1ha2UgdGhpbmdzIGZh
c3Rlciwgc28NCj4gdG8gcHV0IGl0IGluIHBlcnNwZWN0aXZlIGNvbXBhcmVkIHRvIHRoZSBidXJk
ZW4gb2YgYWRkaW5nIGFuDQo+IGludGVyZmFjZSwgdGhlcmUgc2hvdWxkIGJlIHNvbWUgbnVtYmVy
czogV2hhdCBhcmUgdGhlIGtpbmRzIG9mDQo+IGFwcGxpY2F0aW9ucyB0aGF0IHdvdWxkIHVzZSBp
dCBpbiBwcmFjdGljZSwgYW5kIGhvdyBtdWNoIGZhc3RlciBhcmUNCj4gdGhleSBjb21wYXJlZCB0
byBub3QgaGF2aW5nIGl0Pw0KDQpNaWNyb2JlbmNobWFyayBzaG93cyBpdCB0YWtlcyBhcm91bmQg
MjUwbnMgZm9yIDEgc3luY2hyb25pemF0aW9uIGZvcg0KMTIgUEVzIHdpdGggaGFyZHdhcmUgYmFy
cmllciBhbmQgaXQgaXMgbXVsdGlwbGUgdGltZXMgZmFzdGVyIHRoYW4gc29mdHdhcmUNCmJhcnJp
ZXIgKG9ubHkgbWVhc3VyaW5nIGNvcmUgc3luY2hyb25pemF0aW9uIGxvZ2ljIGFuZCBleGNsdWRp
bmcgc2V0dXAgdGltZSkuDQpJIGRvbid0IGhhdmUgYXBwbGljYXRpb24gcmVzdWx0cyBhdCB0aGlz
IHBvaW50IGFuZCB3aWxsIHNoYXJlIHdoZW4gSSBjb3VsZCBnZXQgc29tZS4NCg0KUmVnYXJkcywN
ClRvbW9oaXJvDQo=
