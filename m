Return-Path: <SRS0=bXzz=GP=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA6FC433DB
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 10:41:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CFBCB23105; Tue, 12 Jan 2021 10:41:47 +0000 (UTC)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com [68.232.159.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B62D222B3;
	Tue, 12 Jan 2021 10:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B62D222B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: H/o2Ajk5K+auWMdZEqUjvVEF93tMCwc6cjl92rxr9SrUeYNnllRmYzjoeHKHlNQ/Bz6+2HRbbz
 BoHUFN+nax9wDxvDY9Q2fxFOn2nFD36vrjCVc3Mkwo7aiS7nsi9t4I5a3Oq9OOMpNyhkp8Gmkm
 y2gvW/pB76GqQzwGi2xLIb1Cnzc+3gWmLsb4Nnjl1l0ExIi1Ah/wQcPRG+6iBjTgpDHQq3Vs6W
 rAxPxFGZE/qlbOnb+bcvBBoZh9CJI0jTbzzz5OqQ7qhQ7l8RkVUYDNGzqw+rCW6tPKR2E3pTBg
 mNM=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="24264050"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; 
   d="scan'208";a="24264050"
Received: from mail-os2jpn01lp2055.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.55])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 19:41:42 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfUuo32Ou4vnG8TPCZx8NvrlYgxdVAHWFBsbzKOJIgax/ITCvTdkyAnSyFMgyQlER3PhiY8D8G1lEkbReoJZU4yTRWtRZM2FYyZ3AyFOEtutFqwMSoRqx+u+EEMlCYFuUxV5o84cJS4NTem55UDfRggj+dUesetLRifmOlFzDSzq8cTwYjDyXVcE+OpgY3bDsIEIOrUMlgg1SxuMjtsTUEHwY6v0sZyhwfz8FM9ZsKJUR7ZIaUuTWGaUUaKVmtLaQSKUkZS1zhsUvbdRgQv0KF8FCqKiLHkBgVbK4ouoUbxokHcQX8FkkHPD9eTfarXTk738xfYruk6oZrywwprsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqq5CgB0bTbK3Tnz6drkUkkgCHaqQGGWOZceDRmI4G0=;
 b=UzbrjKaDuyni0CHclLWwyfv0K97PH61bAHpL+BCb3om6mqECo323xQVEx/UAkfV0H4LzKrdiwNbXjSTjexD7hMvh6bAqjMHl9rhI5JOw59uXoZWafaKmvpUtuBkJlxcrrfL9T9EKbDR4rkYhSCozEPF9sGmXxdX9RZofCyhZWwehzTN+JAFLNNvewBz1sLmXWlANRFywmlpwSY2FfdkTdSTv+i4Clrc51yHzZc2rOXU/MTzlbk48M6BruOghMfJYapIBRdW7dZx9KaDw4ZUugeUBoZDXLqmhhTgGnsxVjXQs652OB/95v21eIaVGEPCt1rWCwAzwHNK32u02vXsnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqq5CgB0bTbK3Tnz6drkUkkgCHaqQGGWOZceDRmI4G0=;
 b=SgPAwKUnxOp02KBZu/ux6MJOVAHsXHTcn+D775p9zDKkberY4AMAiK25/Zh4t2CYa0ZWzIuWIvQAHM+cPiOeaOveNkq8vpu+b3AnmjZTPxKq7pHNCjIHa4O9RvkrLQrfIc7TJmmDMnd0Dqu69ZCaTFfSbX3Fd7t3oLuF+TcZe9E=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSBPR01MB2181.jpnprd01.prod.outlook.com (2603:1096:603:26::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 10:41:40 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:41:40 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
	<olof@lixom.net>
Subject: RE: [PATCH 09/10] soc: fujitsu: hwb: Add sysfs entry
Thread-Topic: [PATCH 09/10] soc: fujitsu: hwb: Add sysfs entry
Thread-Index: AQHW5aq6N2+pwZvoo0md0aNDejRMEqoduLYAgAYaIpA=
Date: Tue, 12 Jan 2021 10:40:36 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:41:36 +0000
Message-ID:
 <OSBPR01MB45823CBE99E05753A6308264E5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-10-misono.tomohiro@jp.fujitsu.com>
 <CAK8P3a22Cc4J6pr7h357p70k2eJ2dNxkHLWYC-2bMh7A1+ZhTA@mail.gmail.com>
In-Reply-To:
 <CAK8P3a22Cc4J6pr7h357p70k2eJ2dNxkHLWYC-2bMh7A1+ZhTA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: e609471c34d74a3f8b63b81c24bff94c
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26ec27b0-28c5-4615-6e45-08d8b6e6a509
x-ms-traffictypediagnostic: OSBPR01MB2181:
x-microsoft-antispam-prvs:
 <OSBPR01MB218117C436DA9C1DECD9C773E5AA0@OSBPR01MB2181.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6KcUzG1I+pd0tcjovt2BegtavhzVWjGlm5AE5BhTG7SXfLIAbpp3eG7Glz++AIXVHXm5zDSlK/AJrNsF96oE2BnrfBV7FdZe982udHfZajBh1bfv8fho6WECXYJZVI6jNqs5z8EJGA8CD0g+pf3fXDCbtDHSxq0MBmIgSefPvrpNI7w7wlcjUMT5g1AYwccC1E8BKn1ZunSjP8OjHqWFiEz5ZicAHk7XqCU/T6L4S31x1MVnhrDnCiTCWV7ipvC8/3GAG9Uw9D67qhoj1WHHHvwjaPohIJaCcgVEUSYhCVr/qAXY42dRL0f2AowxESJ8U95Xo93SFsBZbL6lCSbDWbJa3d0fZy/oiuDC52qcGBZOZoGOUqSJlMVmdWOzvLGhavWNveziCrkOB1RWB3uR+WSL98KjKQetEStoRCiqmTUwveZGL/P5PSWmfck5Or8x
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6666004)(66476007)(76116006)(4744005)(66556008)(53546011)(7696005)(5660300002)(8936002)(52536014)(64756008)(66446008)(66946007)(55016002)(85182001)(6506007)(9686003)(2906002)(186003)(478600001)(4326008)(26005)(6916009)(316002)(33656002)(8676002)(86362001)(71200400001)(54906003)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?MVJOeVB4bW54azIxZ1BvQ1A0ME5odUMrMjc3alZsc2p1cHhGR2dJNGtDVUlP?=
 =?utf-8?B?dDVMSE41d0ZEN1MwbEQyN0xTYmpEaFNtTU1ZU091djRjMWMyZkJqOEtTcEhJ?=
 =?utf-8?B?YTBjM0hyRGNnLy83Zkw5Q0x4clpPME90YVd2S1h4N1dIaUtkR0VzVlhOMXVO?=
 =?utf-8?B?N0FkRTZpTEFmNFA5WTBOZFBwN3FpNGZBQVpONEFMcTVPSHpLaTBDSzErb2kv?=
 =?utf-8?B?MEs2NFBwNnpVeHYwSEVDbzNveElQaU52VERPa05zM1c3NUpyRktqMWVSdVVj?=
 =?utf-8?B?OU9lNmd4YVFLMkpoOFF4bW1ZaWxBMXFnSDhXVjZHeGhMUW03WUd6VWx1a2o0?=
 =?utf-8?B?YzJVQlRObXBrdmFqRGZ2b2RlVnhVTHErZW42K3IrclJDYVJrVXo5OThoNm1J?=
 =?utf-8?B?ZFlkMi9ZRW1PdFJwOTN3NlgyT21KdFdMRXdBazY1Qy9zanhhS3pUTzB6SlFo?=
 =?utf-8?B?SSs3UnhGYmIya3Q1N2J5Rkp0cldRbG5ZcHNGRFMwbzN5RkJTV2MyU2tEOFZu?=
 =?utf-8?B?cHU3ajdkR0F0ZHlLZVdHQjVPQnJTRXBEd2t3a3g5azhqK2VsMFRkUzVaKzhL?=
 =?utf-8?B?R3ZjQmVJZ3p4OGVtaGE5dS9PbGFhUlgveXkzQk9vcGV0MGdmbDFiZGtpa0xX?=
 =?utf-8?B?cDRJcWNMWFFXMDlIbUVqZUZZeGhBMC9KZ0QxODJBMWFSbExoc092OHBEaXNB?=
 =?utf-8?B?NVgrbFVCMW5pVlpoeHVoazVwaWVieG1xTHhxNk85YktXdjFMT3h6WjZlL250?=
 =?utf-8?B?UER2TjlMNjJ1WityZmVpYzE4L2ZaTEVkYVk0VitTYkJxTE1YODVpUTg4Z3Ay?=
 =?utf-8?B?NFRJYXptR0Y0OXBXYko4ZEc0SE9LdUJqL1NXWi9UT1V2OUkzRml6Q1BBUyt5?=
 =?utf-8?B?RmlVbFh5eHRWcXFlMWwwZlc4YjBrRGcxYWRLc3dHd0JrdHh5ZlFGT3BCTDht?=
 =?utf-8?B?NGk5MW5CSzFiQ21IV2g1RE5qUUkzb2Y3VHVNazczNWJuQUdkcGZqNXRENzI2?=
 =?utf-8?B?UU1NMG9tNUN6QVIxNVY3U3BQaWx0YU9PelJSaktRWVEzRVFwcE9zZVVCL1hU?=
 =?utf-8?B?NFl5Q290Yjg0bEpURVllL2ptTTZmOTdJN0FGZnhwdDVPL0w1K2FCSDFydm5j?=
 =?utf-8?B?eXZ3SUZWdzBzbGhzSHhDK25CemNyTW8vVTR5ZUhUSU0rQmNlNCtra1pWRzhG?=
 =?utf-8?B?QXhET212elROYzVrTkZuRkpjYkdwWnluVDdOMGlEbjVKMCt4YjFtRDQwL3ha?=
 =?utf-8?B?WDhvdWMzUHdYeUtOdXhRTWJxQ3p2alhOYzBJa0JWNHYyYi9FWFhsdmdIRFF4?=
 =?utf-8?Q?Y7gttedfB4XA4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ec27b0-28c5-4615-6e45-08d8b6e6a509
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:41:39.9887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFblgWkJnIW3Gf+nE2+NoAk/5g7K9nAE1rdWgkMK0OL1beiq/xVwKx5Tk1olMWeWvXGzw3nqU+a8NORI0ESGQStMvdcGPLHOnPpUY98GhHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2181

PiBPbiBGcmksIEphbiA4LCAyMDIxIGF0IDExOjUyIEFNIE1pc29ubyBUb21vaGlybw0KPiA8bWlz
b25vLnRvbW9oaXJvQGpwLmZ1aml0c3UuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRoaXMgYWRkcyBz
eXNmcyBlbnRyeSBwZXIgQ01HIHRvIHNob3cgcnVubmluZyBiYXJyaWVyIGRyaXZlciBzdGF0dXMN
Cj4gPiBmb3IgZGVidWdnaW5nIHVzZXIgYXBwbGljYXRpb24uIFRoZSBmb2xsb3dpbmcgZW50cmll
cyB3aWxsIGJlIGNyZWF0ZWQ6DQo+ID4NCj4gPiAvc3lzL2NsYXNzL21pc2MvZnVqaXRzdV9od2IN
Cj4gPiAgfC0gaHdpbmZvIC4uLiBudW1iZXIgb2YgQ01HL0JCL0JXL3BlX3Blcl9jbWcgb24gcnVu
bmluZyBzeXN0ZW0NCj4gPiAgfC0gQ01HMA0KPiA+ICAgICAgfC0gY29yZV9tYXAgICAgICAuLi4g
Y3B1aWQgYmVsb25naW5nIHRvIHRoaXMgQ01HDQo+ID4gICAgICB8LSB1c2VkX2JiX2JtYXAgIC4u
LiBiaXRtYXAgb2YgY3VycmVudGx5IGFsbG9jYXRlZCBCQg0KPiA+ICAgICAgfC0gdXNlZF9id19i
bWFwICAuLi4gYml0bWFwIG9mIGN1cnJlbnRseSBhbGxvY2F0ZWQgQlcNCj4gPiAgICAgIHwtIGlu
aXRfc3luY19iYjAgLi4uIGN1cnJlbnQgdmFsdWUgb2YgSU5JVF9TWU5DIHJlZ2lzdGVyIDANCj4g
PiAgICAgIHwtIGluaXRfc3luY19iYjEgLi4uIGN1cnJlbnQgdmFsdWUgb2YgSU5JVF9TWU5DIHJl
Z2lzdGVyIDENCj4gPiAgICAgIC4uLg0KPiA+ICB8LSBDTUcxDQo+ID4gICAuLi4NCj4gDQo+IElm
IHRoaXMgaXMgbWVhbnQgYXMgYSBzdGFibGUgaW50ZXJmYWNlLCBpdCBzaG91bGQgYmUgZG9jdW1l
bnRlZCBpbg0KPiBEb2N1bWVudGF0aW9uL0FCSS8NCj4gDQo+IEhvd2V2ZXIsIGlmIGl0J3MgcHVy
ZWx5IGZvciBkZWJ1Z2dpbmcgYW5kIG1heSBub3QgZ2V0IG1haW50YWluZWQNCj4gZm9yZXZlciwg
eW91IG1pZ2h0IHdhbnQgdG8gdXNlIGRlYnVnZnMgaW5zdGVhZC4NCj4gDQoNCkFzIHlvdSBndWVz
cyB0aGlzIGlzIG9ubHkgZm9yIGRlYnVnZ2luZyBwdXJwb3NlLCBzbyBJIHdpbGwgdHJ5IGRlYnVn
ZnMuDQoNClRoYW5rcyBmb3IgcmV2aWV3LA0KVG9tb2hpcm8NCg==
