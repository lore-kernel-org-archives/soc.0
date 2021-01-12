Return-Path: <SRS0=bXzz=GP=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE347C433DB
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 10:41:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 89B45222B3; Tue, 12 Jan 2021 10:41:09 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Tue, 12 Jan 2021 10:41:08 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDDD23109
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com [216.71.158.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDDD23109;
	Tue, 12 Jan 2021 10:41:08 +0000 (UTC)
IronPort-SDR: t7YVbxDl9T1cev17OKzlGQrEMQIWWl2rDLmqeT81zszMi7LNOoGAuXpnn0Oir/xnpbz3MXqjxz
 tOPQEOiA7CNzdKCCRR86H0cGma3e0VgLW9k1Ud+WRe2YIiGBJtqHifCpRh6coN1iIBLmFTRXBF
 +QKomaXoDtDAjCNAkTThlJWFn1bnQJ68PHlER6vGznftcmlcT2tpcIP6RB23DvB05h4M5mdlvp
 Djz9jWdlXQKPZSXm1Lp3pcsFeH9a14kFiv+Gf7m2mmgeprW3/i6HhTneZQzzQSwOVYlxMuF+N8
 3NY=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="23990011"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; 
   d="scan'208";a="23990011"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 19:39:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeDfVyArKJhYwTE/hENZuqnVIZtj7rmL7TSEPBONXhoc/xBJLMDVq/rT/BzjJPgs/MVJT5ScCiDMoE2EWD7aTyFQjcXZFbgCMeQ9e+7u3ZowYr9hGSYV4ZzMkdV9E9qGZNPZSk8eWN5tz7at5CZn/A8Kgo2xeg1Ih4PsYxUCTMOe951d+slQNSefUxyoOoVzXZWmG/4vqV4rtyHNapafwtx5DMzV14sPubzl1XGC4F3QKDV7ey2kVQT+aUg+4AN0cgGCqIPIejp7s//LppzxzX4MUkoyIt4JsrtMjzTvk2UsGzJ7/lqoD1PC7mrjXRvZULjD0NLj7tz2ShdoECnxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iAO/dI+WOc6Jen3DZ98FQlJ/MmTitc+eNxb70H5w0I=;
 b=jYA21poRS4UB9NJMLenHQFbl5fpw5FQMEuk0cR/z0ECGOTRkxJOAppgPqxzJetgvsltat7IrgwB4FU5Qp79GJ7773MInxtJucOy/NuDXiK1BmprIei61wUO7zOYwJ+fetvcg/3sz8E2gDbJZ30N+ELh9mv2nE63dCsQEF5rQR3+UFvoNJmBmQ9Ezearck3f5wdOIrgzoBPG/CJ2dGwp6BCpLSvlyUgQ+q5ql/MxpqD1yO/ZGid5GCbWJ28J93fltjNKPp3/jvYcV+ax2xNGG9dzpuAMfx7W4wqGPJx4ltQ23cFqkWY2FXHIpFYVLF4GLtEV8IePFWvFpQk2vXkBWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iAO/dI+WOc6Jen3DZ98FQlJ/MmTitc+eNxb70H5w0I=;
 b=T/woSvtDPK0wVEzhN/N7P6enY/tAzxCr9xhVcyt0EMC6kaQky878ud07exuML+yy0ECMVwOIOA1awvhIe2Y33dlBDdvvOzjuo82le48Cm9qbKQGpf9KbbztSpFkOTI20mIoI4O/57ylENPg6JyOpW4J4a5x4Rx6xX8uz4OuHZcY=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSAPR01MB4692.jpnprd01.prod.outlook.com (2603:1096:604:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Tue, 12 Jan
 2021 10:39:40 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:39:40 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
	<olof@lixom.net>
Subject: RE: [PATCH 08/10] soc: fujitsu: hwb: Add release operation
Thread-Topic: [PATCH 08/10] soc: fujitsu: hwb: Add release operation
Thread-Index: AQHW5aq53SivcjqQTk+g1x5ARmM1bqoduAoAgAYaS6A=
Date: Tue, 12 Jan 2021 10:38:25 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:39:25 +0000
Message-ID:
 <OSBPR01MB4582A17C4EB43EB45B93FD61E5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-9-misono.tomohiro@jp.fujitsu.com>
 <CAK8P3a1Gga_5-TX4r7D_4HF6MgiXDqmYn26VV6WQk=b4RyD=2Q@mail.gmail.com>
In-Reply-To:
 <CAK8P3a1Gga_5-TX4r7D_4HF6MgiXDqmYn26VV6WQk=b4RyD=2Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: 016281abe04b4bd586251c5efeff77ba
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 582d5bc2-a6a4-40a5-4170-08d8b6e65d8f
x-ms-traffictypediagnostic: OSAPR01MB4692:
x-microsoft-antispam-prvs:
 <OSAPR01MB4692E7862DAB2D82DBC26858E5AA0@OSAPR01MB4692.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jILo1ZCqonD65R91hSLvQ0qd3lFsQjc8qm2cyAZqmzbFb9d4w6DVpbQHoifqPYBr5joWcM827ZTtgznELzAGqkaM09dtQ2aEPvszYfwK+RoWoCo4B89GeT/xmoIyuGc5V3Fsi1XM5yroPO6IhUIJC8QMCZa8JnqyOM5811aom5eRmoivg4WROmNnRfU5PmtemcZSplr8OZ8o/hVIAKijiDX7VUx/aIOUOGhXKNJKBycTZYGJ+mPpAkN2FK+ocMdAGunGaR67eqAZ9FemA1IB3W5u3MJDSUVmPVTk8i6ta8C3tcd/yEyI33PinfbC6CXgiSHzPTHzuogDP06bPTJ0Ki3c6eH0CaHDg/ymNguoLMarHWfFnuwnmD4LI3snCRnDVbmguxyUIMfJZOMqQbwKgcKHBdznXg88If+IAweFI0Qhf3ux5Q7bhXPe9qB2MyH0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(26005)(54906003)(53546011)(5660300002)(66476007)(478600001)(2906002)(6506007)(316002)(6916009)(4326008)(86362001)(83380400001)(8676002)(9686003)(55016002)(66556008)(186003)(85182001)(52536014)(76116006)(33656002)(64756008)(66946007)(66446008)(7696005)(4744005)(71200400001)(6666004)(8936002)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?cWZJb1dTSEZoaG1iZnM2QzZIVTNIZDZlYVVTeW9lTit5K29Yazl4NHk2Siti?=
 =?utf-8?B?NjUvc1pGUUhKNVFhbHVEWWJRRURITEJmcFFmYXc5TjdoZWFXNlJmS3lwK09H?=
 =?utf-8?B?Yi8rN0UxUEo1Y3dtcG1HV280alJ6VVh0TGpaY0JBd3R5MGc1MmhBQUxwZjBa?=
 =?utf-8?B?L0xSRFIwWCs1QkVnK1Iyckd6ZHJYV2s4MGY3U1hBZFJwT1lCdVA4eWFWd2RB?=
 =?utf-8?B?eFVqTHJPOGFMUUNaWjZLYXgxNDFKSkp0Y2dYVG1pRVRyUW55K0orNHlQdVBV?=
 =?utf-8?B?VnBuK2cyYy9jTGJ0d1JYQmc1T3psQm1Xb3RZcVpJSXN2VnlMblEwbHdlMytm?=
 =?utf-8?B?OGdIMXg0dTRkakJMTENOckRsT1hrQmUvWmt6N2RLaXdrMlRoTjZWdWdYUGpl?=
 =?utf-8?B?ekpEOWkweDJoVytpemZTdHY1RG5OSERaQSs0RHNaQ0JOaVhwSmNlRDJkdHd0?=
 =?utf-8?B?QU83bnorVzQzUlphR1I0bll5RHNnSlEwSnFDb0c5MjBWb3daWGNOM3RPbzJD?=
 =?utf-8?B?NldmNy9GeFg5clFtaitFSWp2WlM2eldUTEkwTUtET1NlRnNWRElLSEJCREtj?=
 =?utf-8?B?U0xWSUY4d1JNR3dYU1VVZWRuNVpYd1VKOC9sTkxVSnEvUXJJQ0poYTJBQi92?=
 =?utf-8?B?ZzVPeHZuSDBRNkRlc20vYzR6SUJBVXRTejE2Z2V3RXNiV052S3pXZEFvT3I1?=
 =?utf-8?B?R3hSVjNLVTVNdzVkRi83bnZCSzdKenA3RUlaMUc3ai9RNG9HbVpXTHY4K0hN?=
 =?utf-8?B?bzhtNzBiUDRQL0liUmlGUjlCemlJUUpHeTMzWnQ2cTJNdTZXZDQ0TVV4Ykhp?=
 =?utf-8?B?YXljS0NsaTlKVEtFMDl1WFl1SWI0TDVSNTR3azBzbXE1T1pWeDdmb251WVJG?=
 =?utf-8?B?Q1JiK0lNZnNRVnBTSlp1WW5TUWtzbUxlQjF3cHhwWDBZdGZteDVZTHhSTElx?=
 =?utf-8?B?VGdtd3dFZ285UzdnaGY3NUFNb1IwR05IaFJRa2U5RllpOE9lWU1aWnJ1cVMx?=
 =?utf-8?B?THFNbHZOZGFreUh4SkpHWWl1QnZGNk1UUTA2enhSVVJjTGRFdlgwUjJ0NmY2?=
 =?utf-8?B?TGwxWWZ2azBDWnZUbzZHaDQ1QjQ5NktTN3JvdVV5L3FZN2N0ODdhdzdNb0lH?=
 =?utf-8?B?eHpkenJ5OTNCbm1ZWkEwdlcyaHpXZ3diWjNLcW1ITVZOMzBCUWFVUXdtRDA2?=
 =?utf-8?B?MGpRYStxZWt5OUhlcFlwcW9ROWU2WkdGSE9zMC9HRHFqUnFJOHZGRXJmWWZx?=
 =?utf-8?B?RzdUNWplRXJLdzdJdVhhczY1dTgzQmhLenpLdkEzOHI5QnF6RTNFTEw1Kzhv?=
 =?utf-8?Q?v2+RpAzvOavP0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582d5bc2-a6a4-40a5-4170-08d8b6e65d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:39:39.9928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omvdFBwTkvgdzB6crWYo5oI/uUdK2wrzE0j7jLya11mQZ7aHtf49aVYvPxZ5oPrJFPqexwt7yKxMJHTdQV3kxOAZPsD0dxuUVSYVPfvICio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4692

PiBPbiBGcmksIEphbiA4LCAyMDIxIGF0IDExOjUyIEFNIE1pc29ubyBUb21vaGlybw0KPiA8bWlz
b25vLnRvbW9oaXJvQGpwLmZ1aml0c3UuY29tPiB3cm90ZToNCj4gPg0KPiA+IFVwb24gcmVsZWFz
ZSwgd2UgY2xlYW51cCByZW1haW5pbmcgcmVzb3VyY2VzL3JlZ2lzdGVycyBpZiBuZWNlc3Nhcnku
DQo+ID4gVGhpcyBoYXBwZW5zIHdoZW4gdXNlciBkb2VzIG5vdCBjYWxsIElPQ19CQl9GUkVFIHBy
b3Blcmx5IGFuZCB0aGUNCj4gPiBmdW5jdGlvbiB3aWxsIGRvIGVmZmVjdGl2ZWx5IHRoZSBzYW1l
IG9wZXJhdGlvbiBhcyBJT0NfQkJfRlJFRS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pc29u
byBUb21vaGlybyA8bWlzb25vLnRvbW9oaXJvQGpwLmZ1aml0c3UuY29tPg0KPiANCj4gV2hhdCBp
cyB0aGUgYmVuZWZpdCBvZiBjYWxsaW5nIElPQ19CQl9GUkVFIGluc3RlYWQgb2YgYWx3YXlzIHJl
bHlpbmcNCj4gb24gY2xvc2UoKSB0byBkbyB0aGlzPyBXb3VsZCBpdCBiZSBlYXNpZXIgdG8ganVz
dCBub3QgaW1wbGVtZW50IElPQ19CQl9GUkVFPw0KPiANCg0KVGhpcyBpcyB1cCB0byBhcHBsaWNh
dGlvbnMuDQpXaGVuIHRoZSBhcHBsaWNhdGlvbiB3YW50IHRvIHJldXNlIGJhcnJpZXIgZHJpdmVy
IHJlc291cmNlIHdpdGggZGlmZmVudA0KYmFycmllciBzZXR0aW5ncyAoaS5lLiB3aGVuIGNoYW5n
aW5nIHdoaWNoIFBFcyBqb2luaW5pbmcgc3luY2hyb25pemF0aW9uKSwNCml0IGNhbiB1c2UgSU9D
X0JCX0ZSRUUgcmF0aGVyIHRoYW4gY2xvc2UgYW5kIG9wZW4gZGV2aWNlIGZpbGUgYWdhaW4uDQoN
ClJlZ2FyZHMsDQpUb21vaGlybw0K
