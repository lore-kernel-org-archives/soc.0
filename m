Return-Path: <SRS0=bXzz=GP=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6954FC433DB
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 11:03:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4242E2310D; Tue, 12 Jan 2021 11:03:47 +0000 (UTC)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com [216.71.158.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BC882310C;
	Tue, 12 Jan 2021 11:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BC882310C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: 8PqRk1ULkbO4Fny/OIFiZ1erJfGf2EwNMZTF5vw+8VsNi3zA9HTBYPr1wRCdgd4YsCUV/X38uj
 Z2rhYeVvLG0bfko9ePFQpx8MqSaRB3I3V4q5/om68koyWmYDJRxeiUZMGMkUkNYkWE1heC8VES
 vvpgK8wphPd/QPTNlQjot2fMcm/XtzKTX/QmQXPhBnmFxtMK3N3gVEkP66924ODzABgHp0SlPq
 lwvaDgiWQwEResLoUZw/XP3/rgbp5sSSXKF3jJG1EAizlc8KMxDutQbBtjaTAW3gEX99UbBwGD
 gQo=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="23991717"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; 
   d="scan'208";a="23991717"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 20:03:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsSAETP8vYvrAXYlea7ELElGawMMpW0FxsVAAtrXc4mVLyrWcH4kqHlYiRx6VvhW/A57HNJyqKdUyGSeXJISkqoyZNKJGZz86Hdhw2fmbUH0Udy3cHQvbFWafamEtdVI0Asan+cZMb3vNwL/w1ZY8Zuy+YGY3DPa8nkOWlOEbeT2HXU20koomr7v73nGfwhxcQYEFqqMe4rPDAssqU3V2W/eUx/OnZYr9vOWpu6VuBh+Jpcn+vc0wmWnymM/LiFiSnQaz0m9w84qw/4+xc0/nIW7uLBMoTLHUeMgGTXezv8Xbp2W7mlKiNb/NLpzmSFn24NEnlJAqG9YoJ4SUzDRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkyQAJuGtThckZ6yqCUxeuzWYa9j5w7dihk5PKwyHxM=;
 b=WZBxLr6SvJsb0I7OtHhJmXWfJ+LIe2cFff9C81mgjKugwqb7rbsSLdmaAn4XETJk5jvuM/ViWlE1MadWplnprnFj7h2J9TBJBqZ/Q6SYu3iMcFixRH5FnuKedTBbkpHuZdJCIk0RgLVSAtNZEBi+MLDL4VA4VVhzHb0cJxBwklsZgwTFbRwula5X4gljtvgIUNq5BuvneEok7uQSw3MkhwcpKybto3D455GWiPBoTrteWMHXtbmAQGJAkaqm8ChoP9T1Ml0BTex1136PMbpDWCNMjGAuol1yerAthQJk7rGBDuvhTTlDIOv5jjQ06yyXTadiIaF0p6pDRXWzLUeLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkyQAJuGtThckZ6yqCUxeuzWYa9j5w7dihk5PKwyHxM=;
 b=nCiFpLOkjXyARp4FQVgD0Rebqnyh3vw3JsdwdVySrkbh/ggbc18ayBFYeEjQUKqvc2oGBW7vU3WpJjBo79VT1BZybY5Il7kBS3FLwSlJ9Vrqpkl6tQ7lJr0lt6rbF0u4IeHQpUgcLNyt6bkx5gZRDfsdpzaYeuhhuBGd2dRek3g=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSAPR01MB4131.jpnprd01.prod.outlook.com (2603:1096:604:56::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:03:40 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:03:40 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
	<olof@lixom.net>
Subject: RE: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
Thread-Topic: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
Thread-Index: AQHW5aq3Sb+v2p0duE2hWbZ0o6Q4FKodt0cAgAYfDpA=
Date: Tue, 12 Jan 2021 11:02:27 +0000
Deferred-Delivery: Tue, 12 Jan 2021 11:03:26 +0000
Message-ID:
 <OSBPR01MB458227B345C445CBF342648DE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com>
 <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
In-Reply-To:
 <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: fa8d50798aa64b29ac94050062c51441
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1a6c68d-24d2-423f-c8de-08d8b6e9b7ca
x-ms-traffictypediagnostic: OSAPR01MB4131:
x-microsoft-antispam-prvs:
 <OSAPR01MB4131B6F6215F01E8647B4D23E5AA0@OSAPR01MB4131.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bi6RmjJIGjFdunnfT+TyafzMFWQG2LF3wSH7vpdolKUN6P80ORu9CE3d9GBwK6qZ5NW4V0qnyq2fPaZDuAhfSxdxuwuYVN7yLt0DVROMgR/1JaUnPLAyp3bpi+X7ugsoZL0DGErro14EaXBGaM1YjvbFctv43ookBb3QkC9Pkv7I646er6z2g1+au1bxUs8R/6TFpsL7Te45H4JFVZ0JLDGdZIJChn5mZdDo9Rm3WDtPryE3NsCOP6x5ZmawL6Wit2SuUkYVLATZprrmCxcZo46kdLBQskbROGqgzDQCtrIrEGpnGzIZ9gTYoWrQezTfK4YtsQRfvmJkT3oFvgfeW3QqghWns85770QOReyp3ACKB8kAZT9OmJNbNXUuGmPwXxGlDpj0oCH1JerdBp5mUMD4Z4SEwdp2MD6HsdpS/wqHeuCzkW5+1ClDF+obiTl7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(7696005)(478600001)(316002)(71200400001)(53546011)(5660300002)(66556008)(6916009)(85182001)(55016002)(8676002)(6506007)(26005)(52536014)(86362001)(6666004)(66476007)(66446008)(64756008)(186003)(8936002)(9686003)(83380400001)(2906002)(33656002)(4326008)(76116006)(66946007)(54906003)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?RlZ6ZjdRYkRYY290Q2xLcll1U044UllhNDkreXFyUzhIQThYbkk2OU0xR0Qz?=
 =?utf-8?B?NURrVkF1M0doVjRUa281WWcwbVpVNlh1WGtHaVhKaVg0SXB0QlhQZUFTYkZB?=
 =?utf-8?B?Y1JYSkt2ZUlJT0w3c29kN1dBVjFEakpYTEtja0NNMWRrVDh1NzJGd1hwWGpK?=
 =?utf-8?B?TkI0enppTEloU041L2NNdzJnOHRLL1l5ZjY4aXZUVXQ0WVBPMGx1bVN0NDRo?=
 =?utf-8?B?bnVuWHFkRmRNbW1CVFF2RUtrb1VtUFJ6UmtudTFCempleWhCeVRFV1VXRzRo?=
 =?utf-8?B?ZFdYdFROUTh4SWFvdFVKTVNRZXYrcytGSWIremRocGo0eW53Y3B1Q04ySE95?=
 =?utf-8?B?RlBFaUZGdXpDN2tXUUlreUpNOVE3VWptYlRkV1VSWVJFNzdQZm5zaHM4U0Uy?=
 =?utf-8?B?OWJBTENiUElwT1ZQWTA0bkFEYjU4YmRNY1RrVEMxWkhFVnY0dEhuNzFwc3F4?=
 =?utf-8?B?ZDVjb0FnekliSUMrYXFoMTZSNnA5VXBVYkxVQ0lKSTEyMlcvVWxya1BBcVhW?=
 =?utf-8?B?M1J0eFV2MmN4UGoyRlpxd2IvMk9nSGFPeStXTnYycnNnQ0s1K1BKNzRDWTF0?=
 =?utf-8?B?RGhIU1pIMTNDdGhqK1dMdk10VWMwWFgvQWFGdVQ3OHU5TGFLemdwcWZRWlp2?=
 =?utf-8?B?cjJzLzZ5cFlFUU1ya2EwckFCelQ1a3VsTmx0L2RxN1Fsemg5U0tsR050TWdj?=
 =?utf-8?B?SmRtd1JmRkhTeGpnSUV4ZkNqWEt1TC9pWTZ1anArOXdoUytQUVJkZmJOSlg3?=
 =?utf-8?B?UVFPSGk1UXpwWkJPUzFxQnRTRUZ0QUpvbEl0YjBacXFHWFRiZlp0NVlpTGt3?=
 =?utf-8?B?Vno5U3BiVVhTMmVnSWVvWkt2SXVWS2RsOVY5ZSszMVdrN1E5N3lab0xvcHlx?=
 =?utf-8?B?Q3dqbWdnVXhkU2YrVW1jclRteWlyQVNDbXlITnE5cStQVjBPQm9kcngyaitQ?=
 =?utf-8?B?SFRkU2hBbm9ZVHBDZlI1RDk5WXFOalRXZFhqYzZzdjRmREVpYWl5cVBZb0Nv?=
 =?utf-8?B?dTBuRnY1cVZXQkVrN3Z0OVZYMEJheXBEbE5LZnh6L1pJTS93Z3hXcW1zRVcz?=
 =?utf-8?B?anVNYWNESFpNb3NVRFVOdVBES1ZVTDF4dUlLMGd6ZW1EeWxBS3RKa2Y3NUJ3?=
 =?utf-8?B?VHA4SFllMTFsVThLTUJSVzJtSFY1WXNBWUVkZ0gvMkF3VWtTaEpaVWlDMmZu?=
 =?utf-8?B?RFpDNi9DMWVlbWpxSGo0S0U5Q0VyQUVwdzVka1BqVXpJVTdTM2hzU1QvQzR3?=
 =?utf-8?B?MnFuQzExaUd5cUd6NnF0NWRjWmpJSmZybTc5eXBNWW9xNUhJVFNRSWxkRWlM?=
 =?utf-8?Q?cgftCbRJDQzMA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a6c68d-24d2-423f-c8de-08d8b6e9b7ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 11:03:39.9800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRY0uU5PB35s2DNrSEExLOdaxwb8nRAA43Yqne4Cn9rOW7ELKnt0BOfaIg8fIswMn3b2islhqi/D1bjACbJFYAQ/cMtI0nH3fQzFckkD8eY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4131

PiBPbiBGcmksIEphbiA4LCAyMDIxIGF0IDExOjUyIEFNIE1pc29ubyBUb21vaGlybw0KPiA8bWlz
b25vLnRvbW9oaXJvQGpwLmZ1aml0c3UuY29tPiB3cm90ZToNCj4gDQo+ID4gK3N0YXRpYyB2b2lk
IHdyaXRlX2luaXRfc3luY19yZWcodm9pZCAqYXJncykNCj4gPiArew0KPiA+ICsgICAgICAgc3Ry
dWN0IGluaXRfc3luY19hcmdzICpzeW5jX2FyZ3MgPSAoc3RydWN0IGluaXRfc3luY19hcmdzICop
YXJnczsNCj4gPiArDQo+ID4gKyAgICAgICBzd2l0Y2ggKHN5bmNfYXJncy0+YmIpIHsNCj4gPiAr
ICAgICAgIGNhc2UgMDoNCj4gPiArICAgICAgICAgICAgICAgd3JpdGVfc3lzcmVnX3Moc3luY19h
cmdzLT52YWwsIEZIV0JfSU5JVF9TWU5DX0JCMF9FTDEpOw0KPiA+ICsgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiArICAgICAgIGNhc2UgMToNCj4gPiArICAgICAgICAgICAgICAgd3JpdGVfc3lz
cmVnX3Moc3luY19hcmdzLT52YWwsIEZIV0JfSU5JVF9TWU5DX0JCMV9FTDEpOw0KPiA+ICsgICAg
ICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgIGNhc2UgMjoNCj4gPiArICAgICAgICAgICAg
ICAgd3JpdGVfc3lzcmVnX3Moc3luY19hcmdzLT52YWwsIEZIV0JfSU5JVF9TWU5DX0JCMl9FTDEp
Ow0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgIGNhc2UgMzoNCj4gPiAr
ICAgICAgICAgICAgICAgd3JpdGVfc3lzcmVnX3Moc3luY19hcmdzLT52YWwsIEZIV0JfSU5JVF9T
WU5DX0JCM19FTDEpOw0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgIGNh
c2UgNDoNCj4gPiArICAgICAgICAgICAgICAgd3JpdGVfc3lzcmVnX3Moc3luY19hcmdzLT52YWws
IEZIV0JfSU5JVF9TWU5DX0JCNF9FTDEpOw0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsNCj4g
PiArICAgICAgIGNhc2UgNToNCj4gPiArICAgICAgICAgICAgICAgd3JpdGVfc3lzcmVnX3Moc3lu
Y19hcmdzLT52YWwsIEZIV0JfSU5JVF9TWU5DX0JCNV9FTDEpOw0KPiA+ICsgICAgICAgICAgICAg
ICBicmVhazsNCj4gPiArICAgICAgIH0NCj4gPiArfQ0KPiANCj4gKG1pbm9yIHN0eWxlIGNvbW1l
bnQNCj4gDQo+IEkgdGhpbmsgdGhpcyBjb3VsZCBiZSBzaW1wbGlmaWVkIGludG8gYSBzaW5nbGUg
d3JpdGVfc3lzcmVnX3MoKSB3aXRoIHRoZQ0KPiByZWdpc3RlciBudW1iZXIgY2FsY3VsYXRlZCBi
YXNlZCBvbiBzeW5jX2FyZ3MtPmJiLCByYXRoZXIgdGhhbiBkdXBsaWNhdGluZw0KPiB0aGUgc2Ft
ZSB0aHJlZSBsaW5lcyBzaXggdGltZXMuDQoNCkkgdGhpbmsgbXNyL21ycyBpbnN0cnVjdGlvbnMg
bmVlZHMgcmVnaXN0ZXIgbmFtZXMgYXQgY29tcGlsZSB0aW1lIHNvDQppdCBjYW5ub3QgYmUgY2Fs
Y3VsYXRlIGR5bmFtaWNhbGx5LiBPciBhbSBJIG1pc3VuZGVyc3Rvb2Q/DQoNCj4gPiArc3RhdGlj
IGludCBpb2NfYmJfYWxsb2Moc3RydWN0IGZpbGUgKmZpbHAsIHZvaWQgX191c2VyICphcmdwKQ0K
PiA+ICt7DQo+ID4gKyAgICAgICBzdHJ1Y3QgaHdiX3ByaXZhdGVfZGF0YSAqcGRhdGEgPSAoc3Ry
dWN0IGh3Yl9wcml2YXRlX2RhdGEgKilmaWxwLT5wcml2YXRlX2RhdGE7DQo+IA0KPiBBIHNsaWdo
dGx5IGJldHRlciB3YXkgdG8gd3JpdGUgdGhlIGlvY3RsIGNvbW1hbmQgc3BlY2lmaWMgZnVuY3Rp
b25zDQo+IGlzIHRvIGp1c3QgZ2l2ZSB0aGUgYXJndW1lbnQgdGhlIGNvcnJlY3QgdHlwZSAoc3Ry
dWN0DQo+IGZ1aml0c3VfaHdiX2lvY19iYl9jdGwgX191c2VyKikNCj4gaW5zdGVhZCBvZiAndm9p
ZCBfX3VzZXIgKicsIHRvIGF2b2lkIHRoZSBjYXN0Lg0KPiANCj4gU2ltaWxhcmx5LCBhcyB5b3Ug
ZG9uJ3QgdXNlICdmaWxwJyBpdHNlbGYsIGp1c3QgcGFzcyB0aGUgc3RydWN0IGh3Yl9wcml2YXRl
X2RhdGENCj4gcG9pbnRlciBhcyB0aGUgZmlyc3QgYXJndW1lbnQuDQoNCnRoYW5rcywgSSB3aWxs
IGZvbGxvdyB0aGlzIGFkdmlzZS4NCiANCj4gPiBAQCAtMTY0LDYgKzM4Niw3IEBAIHN0YXRpYyBp
bnQgZnVqaXRzdV9od2JfZGV2X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUg
KmZpbHApDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGZ1aml0c3Vf
aHdiX2Rldl9mb3BzID0gew0KPiA+ICAgICAgICAgLm93bmVyICAgICAgICAgID0gVEhJU19NT0RV
TEUsDQo+ID4gICAgICAgICAub3BlbiAgICAgICAgICAgPSBmdWppdHN1X2h3Yl9kZXZfb3BlbiwN
Cj4gPiArICAgICAgIC51bmxvY2tlZF9pb2N0bCA9IGZ1aml0c3VfaHdiX2Rldl9pb2N0bCwNCj4g
PiAgfTsNCj4gDQo+IEFsbCBkcml2ZXJzIHdpdGggYW4gaW9jdGwgaW50ZXJmYWNlIHNob3VsZCB3
b3JrIGluIGNvbXBhdCBtb2RlIGFzIHdlbGwsDQo+IHNvIHBsZWFzZSBhZGQgYQ0KPiANCj4gICAg
ICAgIC5jb21wYXRfaW9jdGwgPSBjb21wYXRfcHRyX2lvY3RsOw0KDQoNCkE2NEZYIGRvZXMgbm90
IHN1cHBvcnQgMzItYml0IG1vZGUgKGFhcmNoMzIgc3RhdGUpLg0KU28gSSB0aGluayB1bmxvY2tk
X2lvY3RsIGlzIGVub3VnaCBvciBpcyBpdCBiZXR0ZXIgdG8gdXNlIGNvbXBhdF9pb2N0bCBhbnl3
YXk/DQoNCj4gDQo+ID4gKyNkZWZpbmUgX19GVUpJVFNVX0lPQ1RMX01BR0lDICdGJw0KPiANCj4g
SXQncyBoYXJkIHRvIGZpbmQgYSBub24tY29uZmxpY3RpbmcgcmFuZ2Ugb2YgaW9jdGwgbnVtYmVy
cywgYnV0DQo+IGl0IHdvdWxkIGJlIGdvb2QgdG8gbm90ZSB0aGUgY29uZmxpY3QgaW4NCj4gDQo+
IERvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0bC1udW1iZXIucnN0DQo+IA0K
PiBUaGUgJ0YnIHJhbmdlIGlzIGFsc28gdXNlZCBpbiBmcmFtZWJ1ZmZlciBkcml2ZXJzLg0KDQpJ
IGRpZG4ndCBub3RpY2UgdGhpcywgdGhhbmtzIGZvciBwb2ludGluZyBvdXQuDQoNCkFnYWluLCB0
aGFua3MgZm9yIGFsbCB0aGUgcmV2aWV3cy9jb21tZW50cy4NClRvbW9oaXJvDQoNCj4gPiArLyog
aW9jdGwgZGVmaW5pdGlvbnMgZm9yIGhhcmR3YXJlIGJhcnJpZXIgZHJpdmVyICovDQo+ID4gK3N0
cnVjdCBmdWppdHN1X2h3Yl9pb2NfYmJfY3RsIHsNCj4gPiArICAgICAgIF9fdTggY21nOw0KPiA+
ICsgICAgICAgX191OCBiYjsNCj4gPiArICAgICAgIF9fdTggdW51c2VkWzJdOw0KPiA+ICsgICAg
ICAgX191MzIgc2l6ZTsNCj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgX191c2VyICpwZW1hc2s7
DQo+ID4gK307DQo+IA0KPiBIb3dldmVyLCB0aGlzIHN0cnVjdHVyZSBsYXlvdXQgaXMgaW5jb21w
YXRpYmxlIHdpdGggMzItYml0IHVzZXINCj4gc3BhY2UgYmVjYXVzZSBvZiB0aGUgaW5kaXJlY3Qg
cG9pbnRlci4gU2VlDQo+IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9pb2N0bC5yc3QgZm9yIGhv
dyB0byBlbmNvZGUgYQ0KPiBwb2ludGVyIGluIGEgX191NjQgbWVtYmVyLg0K
