Return-Path: <SRS0=KrAf=ID=fujitsu.com=tan.shaopeng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DB6C433DB
	for <soc@archiver.kernel.org>; Fri,  5 Mar 2021 07:49:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 707F964FD6; Fri,  5 Mar 2021 07:49:58 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Fri, 05 Mar 2021 07:49:57 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0C3164FCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=tan.shaopeng@fujitsu.com
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com [216.71.158.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0C3164FCF;
	Fri,  5 Mar 2021 07:49:57 +0000 (UTC)
IronPort-SDR: OZz6tm6eGBgCr4FKDBbdTAJeBTT/7Ovkny+C/Oqhu/T/Ps9B6SQYS8VXmyicC9Y2llkzPG+Kxd
 hLXXdWQ0XhzxkFJ+NKdPyKFlEKxr5Mte2slcQwgkZFhWNWrByrXF/NP2pO2LH2EVchNkbMg2fE
 4xmgntGunWA9yeXmaQjCOM5vWSM3hfvFKVuz6TTeSreN7yrvgbrJomjPkI3hdKjdYclL9DOJT+
 Wx0dw33rNtyzkTTczjUdfRPhwPWScHNLwvsP/2ASFclufJ7fwjSqonR7vhdc4JEpcxx/2Jm6t9
 zF0=
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="27090876"
X-IronPort-AV: E=Sophos;i="5.81,224,1610377200"; 
   d="scan'208";a="27090876"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 16:48:50 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4ltaE7bjCf7LjZS74hDvubh1GyY4eZpLxCm4sX18IAh+3pHoGDlLiHNi6FFyvCjOHnZGIhIB2VGZ6glLVccatNFrI0DYjZg7tMEJpqDUy9hgP264OFuvZi4SGlaAaU2cqifH8oKoOH0YVrhBz9ZHcl4Br+DtsXJUq/uU1WldjWlGFQ6FmaP7IlEvvNEqlb1dO1/xQ+80oMmsafKMwBtqL4EZaaZeQOZml9QU1OIAlNZcGZRmb0i8ZMoCsM0sz/BZJ96zEvhG2dTYWGQ+rdkYmtII94xMBWjomIvCnxkH0jARz3Ca67jccgACN3TlItX+ofWzDq0RQ7sGwQtAhfTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BufyKr1AAlNuOIJl2ksjqjTOEGlutumkYY881exxr1M=;
 b=c0i1mNuAc/cZVVmU8sb/VCVFdjv82ZVXS4nc67SD9Cvd/MMwuTnvKRLO5Eyz7rltqkOH5jvdtP2RIccLbPS3xRsnfCpeXwJxQn7QYPkGNM/a+MNMbvIx820v1n5MnkmKQo393ei5LTYr0P0tKaQ1hCunh2P6YDjFvpQ1iAHFndkVYRhuG72EjGTUqM7V9AKk9fN7T/t6WiRNKoQ/Hj3KB749UyYWeeYcqOkBlSbSlCnGErkqZaGSJ8c5QThBq9C5dntdHHW98cc6Fme0YlLozgMPlV+cWwkqSKIx1/8ejfsZbdDJZrz3M6fjiCI//jChW4Ou0mA0PRrKA692r4dWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BufyKr1AAlNuOIJl2ksjqjTOEGlutumkYY881exxr1M=;
 b=PLG5HGfmd7Rp0T4pMr4913W48ddzfD8DHGSIY1zthZw1NLM2gGVoIpY8mJsFIxAtNbDMGD6ti3CO/OG+D+5kIhBhmG9D0pa9lcu5Q9WOLHfZdi2DhB7bdNhWraO0hI5JG+cxTibV6kKe4KmKbfYTVr/47oQYQ9VCCjx2ii6X9BI=
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com (2603:1096:603:15::15)
 by OSAPR01MB3267.jpnprd01.prod.outlook.com (2603:1096:603:3a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 07:48:45 +0000
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d]) by OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d%6]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 07:48:45 +0000
From: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
To: 'Arnd Bergmann' <arnd@arndb.de>, Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson
	<olof@lixom.net>, James Morse <james.morse@arm.com>,
	"misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
Subject: RE: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Topic: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Index: AQHXEBESAJcmfc8h0U6q78FjB96JBapyH1gAgAGCoFCAAAVDgIAAAz8AgAFbxNA=
Date: Fri, 5 Mar 2021 07:48:45 +0000
Message-ID:
 <OSAPR01MB214684169003710C7ECF0D9B8B969@OSAPR01MB2146.jpnprd01.prod.outlook.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <20210304104650.GA20843@willie-the-truck>
 <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
In-Reply-To:
 <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ad9ebf8-2003-4511-109d-08d8dfab1ac4
x-ms-traffictypediagnostic: OSAPR01MB3267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <OSAPR01MB3267FAEED7347FB3A2C12BE88B969@OSAPR01MB3267.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TBl8wEdZAQ0979BMR+QAegXNkcifZ6qAqUij80NksrzQGpBCdCMfzld0rCdG3pspsBOfdR/5qB9ku+qDV3peevuPGpgyNE85CGNHgE2aqlouZMllk8WOfwXgt6ueNTgd2Lq0fuClRunEtlxLLB+7dlgLz5u788rMYE5swJzyNvE3U4tbYPp7V8mK4wKWU6CYkdswi6nw/1tcvDaLix57jZud7/OPSvgCdLaRigHML1FJK6BRSS/f0jEUHImUHru+qBThgASUHI4Ltm16X+/ZtCXLHJ1HdQ87T/y1gtS0Mz3uSx0J6Kv1z+w4r06nhHjh4C8Y9iQQ6s2rkgPRc9UQGCmYDjb0TJEprIKz/AQeLEUxyL/1m+GwVNQEh7OROq7tzeZq4WnK6uqCVVPQLXFuRWvkevr1G37BA9Vx/zsLjgL/+STISS+NXRV+L5Myrv0F9FfYS9HhMYpdSrUMr0hNhHc0OXkbvrG/CNh0Pz4QldMXGvxKYoT76HtjPUjKx2f/hxeHOxoE9P6hf7/TogJ7VA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2146.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(2906002)(64756008)(5660300002)(66446008)(55016002)(66946007)(53546011)(66556008)(66476007)(9686003)(110136005)(8676002)(8936002)(54906003)(7696005)(33656002)(76116006)(52536014)(316002)(6506007)(86362001)(107886003)(85182001)(71200400001)(26005)(186003)(478600001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?V1NwL3FuVWprMHhpV2MzUUp2ZUQ3Z3B2ejJvV3VqOGJRYVhpWlk5eGF5d2x3?=
 =?utf-8?B?VUVwVnZLZDNWemtZUVp4ckdHdzhkNW9CVnV5c0lRczd6NGtsL2tVd2k5ZEFv?=
 =?utf-8?B?Smg4MFRiSHZCZlU4SjF0VnRoKzIyVmZkZGZTRXlEWHB5WEVQUTdyWC8vTVRL?=
 =?utf-8?B?ZkZ1bVlEVkJWdEw3aHZ0THJGeld4T3MrNjF4NzVoY1MzWUl2V0h6WGFta0Fm?=
 =?utf-8?B?YkJya0FWS1hsdjgwdjZsSWF6UTh1L1J6SUQ3R2NTUWhsaGhpVnpLWVlzaU8w?=
 =?utf-8?B?MEFhRFkxZmp0T253NStONW14Wld4emVOSktxYlB6bTlRaE5GZTVnczVLQ2Zx?=
 =?utf-8?B?SHhYUUlWTTFEWHErNDZUUmFCSGMvRkYvNHUwb0YzQ3BVN2VBdVVzcDR1WGFN?=
 =?utf-8?B?TVVkVGl2UUZHU2FQazdZOEJ0dEZzZUJIVytvOEhpNEVOYWE3c3pIREVndnJn?=
 =?utf-8?B?V1FlTXpLb0FMZEJZcXYzN2MyeUo2cnhka1Z1WTBqREg2YTMzK29YZTVLeXBw?=
 =?utf-8?B?MVFuelBZY3hLem5yZlhSMXpsTDA3bm9HZllvKysxMDhHNmZDMFozMTdsa1Zr?=
 =?utf-8?B?alo3UFhlR0lQT1l5LzRXWXVaSDZHM3F6akdVRFQ1cXZoMUQra0FudjNIRXVC?=
 =?utf-8?B?SGIzNHorTlAwdm9XV1QwWHlFdU1SSlk1ZmNMZU1EYWFqdXhWeWZSYm1mOVAy?=
 =?utf-8?B?a21obnlEZVBpcVp1RnAwakwvNUFjUXZ5aExFT1ZPMGFtSWgwVkZ4NTBUMG9m?=
 =?utf-8?B?QUdBMlREdE53Z2ROMTgyMDVyc2Q1b3FXZmM4L29haDFwdzV6RW5FbVBheTBI?=
 =?utf-8?B?SkFwN2xacUdPR0w2cVRFbHpHYVJzL2xiV3k2c2VEODRjSDRhbVI4YzlMOWx4?=
 =?utf-8?B?WFFWcFRUREJBMWNTbEZTbGNZZTBTeXYwKzNZTVNieXZRUm56cXN3Q2JaNmpK?=
 =?utf-8?B?VlZ2dWdSVUlVb2dtV2FWMlZvL0FEanEwbTJGWkxmdW5WbWNPSkt1c0VMNFYv?=
 =?utf-8?B?ZFFvYytlc1d6aGk3VVBQdHV1WWE4azF6U2tOUDA4aGxJbmcwU0o3Q05veE5o?=
 =?utf-8?B?UlJOeWl6RTlOL0hiV3JUZW5STWZyQVlXSGRzZVFiMHArK21EejdQdjZxWmhV?=
 =?utf-8?B?UjdhekpRTjZKOTlCQXlLSjJsRGcyYlBMdzVxME9oUCtWRS9PaFJiY3JSdUho?=
 =?utf-8?B?Q1ZtZ29ZUkJuZWRxcFFkbXh3MFFSaGpOOXlNZHpzLzlyOEE3bDlqaUpWQkJO?=
 =?utf-8?B?bnlFbHlYTlJheVV0dUtzWWl5ZzZLRU5iUTU5VytXLzhjQ1VIRDFXVjVjOEpK?=
 =?utf-8?B?cnN6b1NlTGx2YUVHd1c0aTI0ek91bWVXOEhhb2ZYK0pTQmpLSS90YzZ0czYv?=
 =?utf-8?B?YXY5eUVsSFBGeXB0RGdMY1l6aUtseWFlMTJBZ3g2OHdmOXZySG1rdzVaMmxU?=
 =?utf-8?B?bXFlRy9ROWVDbTRab0gyUGtOcGNWd3dIbHU1WGNtZUpMaUdTSjlTVFAvZzN5?=
 =?utf-8?B?LzFaS1A2c1MrT1pDaXk2WHhRTCs3R2NyakNzSEFzaFFJVWlQRHdRbml0blVQ?=
 =?utf-8?B?U0R3WlEzMkJQR2lIRHBKbkdQR2ZkWVU2a2djbWF2aU9QdkFiMS95TmVyZ243?=
 =?utf-8?B?SmQ3OUo0eEFXLzJpQkVwMWszaXVISk1teGN5YmxKTERPekVxR1VpeldYVTho?=
 =?utf-8?B?UUpITHBKbStHcTlWQmM0NVBXVWcxWWtZcS8zOS95dXZvMzVpTllYZjlaNGFY?=
 =?utf-8?Q?oGuw88PoddfZZ81ony0rEBoS7sxoMyE+lOM2mDS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2146.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad9ebf8-2003-4511-109d-08d8dfab1ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 07:48:45.3254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxW3nLwx2QUC3oYnMsLPa9NZ5qYvzKXt3yZlV+UaDS0o1ub0TRYj36hvsWQ1Ni8S7zdO5UaLr5eJM+Ipsyuf2Gs5J5MQJETA6MUjZM+6r1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3267

PiBPbiBUaHUsIE1hciA0LCAyMDIxIGF0IDExOjQ2IEFNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5l
bC5vcmc+IHdyb3RlOg0KPiA+IE9uIFRodSwgTWFyIDA0LCAyMDIxIGF0IDEwOjM0OjQzQU0gKzAw
MDAsIHRhbi5zaGFvcGVuZ0BmdWppdHN1LmNvbQ0KPiB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCBN
YXIgMywgMjAyMSBhdCAxMDozOCBBTSB0YW4uc2hhb3BlbmcNCj4gPiA+ID4gPHRhbi5zaGFvcGVu
Z0BqcC5mdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtjb25maWcg
RlVKSVRTVV9DQUNIRQ0KPiA+ID4gPiA+ICsgICAgICAgIHRyaXN0YXRlICJGVUpJVFNVIENhY2hl
IERyaXZlciINCj4gPiA+ID4gPiArICAgICAgICBkZXBlbmRzIG9uIEFSTTY0X1ZIRSB8fCBDT01Q
SUxFX1RFU1QNCj4gPiA+ID4gPiArICAgICAgICBoZWxwDQo+ID4gPiA+ID4gKyAgICAgICAgICBG
VUpJVFNVIENhY2hlIERyaXZlcg0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICAgICAgIFRo
aXMgZHJpdmVyIG9mZmVycyBjYWNoZSBmdW5jdGlvbnMgZm9yIEE2NEZYIHN5c3RlbS4NCj4gPiA+
ID4gPiArICAgICAgICAgTG9hZGluZyB0aGlzIGNhY2hlIGRyaXZlciwgY29udHJvbCByZWdpc3Rl
cnMgd2lsbCBiZSBzZXQgdG8NCj4gZW5hYmxlDQo+ID4gPiA+ID4gKyAgICAgICAgIHRoZXNlIGZ1
bmN0aW9ucywgYW5kIGFkdmFuY2VkIHNldHRpbmdzIHJlZ2lzdGVycyB3aWxsIGJlIHNldA0KPiBi
eQ0KPiA+ID4gPiBkZWZhdWx0DQo+ID4gPiA+ID4gKyAgICAgICAgIHZhbHVlcy4gQWZ0ZXIgbG9h
ZGluZyB0aGlzIGRyaXZlciwgeW91IGNhbiB1c2UgdGhlIGRlZmF1bHQNCj4gdmFsdWVzIG9mDQo+
ID4gPiA+IHRoZQ0KPiA+ID4gPiA+ICsgICAgICAgICBhZHZhbmNlZCBzZXR0aW5ncyByZWdpc3Rl
cnMgb3Igc2V0IHRoZSBhZHZhbmNlZCBzZXR0aW5ncw0KPiByZWdpc3RlcnMNCj4gPiA+ID4gPiAr
ICAgICAgICAgZnJvbSBFTDAuIFVubG9hZGluZyB0aGlzIGRyaXZlciwgY29udHJvbCByZWdpc3Rl
cnMgd2lsbCBiZQ0KPiBjbGVhciB0bw0KPiA+ID4gPiA+ICsgICAgICAgICBkaXNhYmxlIHRoZXNl
IGZ1bmN0aW9ucy4NCj4gPiA+ID4gPiArICAgICAgICAgIFdoZW4gYnVpbHQgYXMgYSBtb2R1bGUs
IHRoaXMgd2lsbCBiZSBjYWxsZWQgYXMNCj4gImZ1aml0c3VfY2FjaGUiLg0KPiA+ID4gPg0KPiA+
ID4gPiBNeSBmZWVsaW5nIGlzIHRoYXQgdGhpcyBjb2RlIHNob3VsZCBiZSBpbiBhcmNoL2FybTY0
LywgYXMgdGhlIGNhY2hlDQo+ID4gPiA+IGlzIGdlbmVyYWxseSBjb25zaWRlcmVkIHBhcnQgb2Yg
dGhlIENQVSwgcmF0aGVyIHRoYW4gcGFydCBvZiB0aGUgd2lkZXINCj4gPiA+ID4gU29DIGRlc2ln
biwgb3Igc29tZXRoaW5nIHRoYXQgY2FuIGJlIGNvbnRyb2xsZWQgc2VwYXJhdGVseSBmcm9tIHRo
ZQ0KPiA+ID4gPiBjb3JlIGtlcm5lbCBhbmQgbWVtb3J5IG1hbmFnZW1lbnQgY29kZS4NCj4gPiA+
DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgYWR2aWNlLiBJIGFsc28gd291bGQgbGlrZSB0byBoZWFy
IHRoZSBvcGluaW9ucyBmcm9tDQo+ID4gPiBvdGhlciBzb2MmYXJtIG1haW50YWluZXJzLCBhbmQg
dGhlbiBjb25zaWRlciB3aGV0aGVyIHRvIGFkZCB0aGlzIHRvDQo+ID4gPiBhcmNoL2FybTY0Ly4N
Cj4gPg0KPiA+IEdpdmVuIHRoYXQgYWxsIG9mIHRoaXMgaXMgb3V0c2lkZSBvZiB0aGUgc2NvcGUg
b2YgdGhlIGFyY2hpdGVjdHVyZSwgSSBkb24ndA0KPiA+IHRoaW5rIHRoYXQgYXJjaC9hcm02NC8g
aXMgdGhlIHJpZ2h0IHBsYWNlIGZvciBpdC4gUGVyaGFwcyB0aGlzIHdvdWxkIGZpdA0KPiA+IGlu
dG8gdGhlIHJlc2N0cmwgcmV3b3JrIHRoYXQgSmFtZXMgaGFzIGJlZW4gZG9pbmcgZm9yIE1QQU0/
DQo+IA0KPiBJbmRlZWQsIHRoYXQgc291bmRzIGxpa2UgYSBnb29kIHN0YXJ0aW5nIHBvaW50LiBJ
IGRvbid0IHVuZGVyc3RhbmQgZW5vdWdoDQo+IGFib3V0IGVpdGhlciBvZiB0aGUgdHdvIHRvIGJl
IHN1cmUsIGJ1dCBpdCBzb3VuZHMgbGlrZSB0aGVyZSBpcyBzb21lIG92ZXJsYXANCj4gaW4gZnVu
Y3Rpb25hbGl0eSwgYW5kIGlkZWFsbHkgd2Ugd291bGQgaGF2ZSBvbmUgdXNlciBpbnRlcmZhY2Ug
dGhhdCBjYW4NCj4gZGVhbCB3aXRoIGFsbCB0aGUgaGFyZHdhcmUgaW1wbGVtZW50YXRpb25zIChp
bnRlbCwgYXJtLCBmdWppdHN1IGFuZCBhbnkNCj4gZnV0dXJlIG9uZXMpLg0KDQpJIGRvbid0IGtu
b3cgcmVzY3RybCB3ZWxsIGFuZCBJ4oCZbSBub3Qgc3VyZSBpZiBpdCBjYW4gYmUgdXNlZCBmb3Ig
c2VjdG9yIGNhY2hlIG5vdy4NCkFsc28sIGl0IHNlZW1zIHRvIG1lIHRoYXQgcmVzY3RybCBoYXMg
bm8gY29udHJvbCB3aXRoIGhhcmR3YXJlIHByZWZldGNoLiANCkkgd2lsbCBsZWFybiBtb3JlIGFi
b3V0IHJlc2N0cmwuDQoNCkJlc3QgcmVnYXJkcywgDQpUYW4gU2hhb3BlbmcNCg==
