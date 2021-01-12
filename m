Return-Path: <SRS0=bXzz=GP=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ED2C433E0
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 10:26:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC48B23109; Tue, 12 Jan 2021 10:26:18 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABE8F2310A;
	Tue, 12 Jan 2021 10:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABE8F2310A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: t6sV90CGYIrSPTV2/iF7ByLYYQ7uOkD8JIfviTASEyyJPC4UI+MZIOyHPH2F/fAM01HZcPhgqM
 YZ9jMcnky5JCnGk5AhQK28vX7linhG/dlDNMs2gEr2Ak8iP67+QMoRU15dvDhrLVtfHQe2r6bR
 bAmxGeveCSNtrUFZ38VOUxQVzFWOMjRGay8cDioMaNUuxZxmAO/erGeY1/tZHOu8ll01LX810w
 Anb0Xk3SdrHJ1A4w4d2uOA+elsb+OD9FMnwfzQhgM1ee4YgwQoe7gsTG/9oG8kSfxSfCloYcp8
 nts=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="24091845"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; 
   d="scan'208";a="24091845"
Received: from mail-ty1jpn01lp2052.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.52])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 19:26:14 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO7ZEmY8PUiNbi8d230Y5CSgwjS4UQio2fmE70eKx1yEYwzG3bZCXZI+A41u71QILQ1+YjvSoKcgBLWTZQaUIQxpnWGvQhU2F5Cps0ePAe1ngyDeGLSCCRrtpr3AK0TUvshZVZpRCmRBgQLGob0e7VuL1M1gW0p2OtPzO3IYaMA7InsC1jWbtQ7o3D/qC3axqTvO+z8BEee2p7vwkumvdcY1BbrLotVmineGPcWgGSEmH2kn7mcz9NjXl4z966TfyTsXs/f42vhtv4UtjGBD3IhuneXRWNy5DBtoXKooP3oiqOSK4aFLGY2Ms+W9WGwpBlE/0LSvLLfLSVhuAEQdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ky0eW7WE/W6Bnh3mKwZpIS4N4Cudwjyhy8NOZghFVQ=;
 b=b/9dFvoY+emQY6XqFcUrn/Wr/vlihc7hjpQ76f4lrTXDLNtAwxADHaFzVSkvIUwaSWQ4aGWk3oJVCjLNCDDwuI56OhwEWhNqITB3yOoNF8yiR2DQIIuuJU6c2cQuR2nE1sT/OEqwir276qcAchCGVcGm7Y+9KnRGsMMsR5hVNmFyDO8j+6Yw3WrPQkGdQ/kiK2Yh1X4ozWM/mH4m8RkGKldSI2SdPNyG3JZ9l40vfa18ENPA2Q5YNStnuvrfk1Xx2A3W47ndHXmaLtWnBaI+6+SWh1dIGbzJ68Qra86vtU0jLAvRc33d5g/ohkxGDR1a6twmEHYZaQX1GhYkkXNI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ky0eW7WE/W6Bnh3mKwZpIS4N4Cudwjyhy8NOZghFVQ=;
 b=VsUeGp+UXGTe9iayMHa/BNnIP/Io3G7H+rnTuA9fZ3wZuIn0HfZCIPQBnAvlgJDoD0fObuKvIgY2IZD5yOJAAF8NVpRFXpTCjM22KVs8zqky4wy8iGG2ZnErM55vP+7VT7JAONs3GoJ75/wCHM9ZOBXDY6pzc1pMnBoMoFz+9cc=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSBPR01MB2678.jpnprd01.prod.outlook.com (2603:1096:604:1d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Tue, 12 Jan
 2021 10:26:10 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:26:10 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Olof Johansson <olof@lixom.net>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8A==
Date: Tue, 12 Jan 2021 10:24:48 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:25:47 +0000
Message-ID:
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
In-Reply-To:
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: 21f1551e3e8f481280752999982dde11
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93188e02-02e4-41f9-b0ec-08d8b6e47ac1
x-ms-traffictypediagnostic: OSBPR01MB2678:
x-microsoft-antispam-prvs:
 <OSBPR01MB267809722DDC270E27EF7967E5AA0@OSBPR01MB2678.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4AGhZ2eYqxgPjXFG7HpJpAtWMvYPOEYy0AXLPXyAp2lYDInVPtR6IR64yUzHnZG7Rc/Mkglt8BTBSG121gLnpyOc4vQC2dizTTEg0Y3GzPAkhSxoTsNVXVg80VdBUWX4P5eNnU60GRti+LgTNVuccYX5XOOpT6AKcngz56rTDUea8LRVBg+G7/BaFiLgLWZAIL9hCbI/x4VD9zzs5oYFE6bkbFH6Cvpt2gFS4TxlUEpLeUXXUvbeLQ6RWQoUBKg9slU5j6beZAQaoYPd3yxheMyM+PvnitV2jwuT5YvgK3zQBpVVmG0JGvZK7OfnBNpst5+vEmO0VIzYqs5zB8OsUxLhrBB8/b7s0eXyOwqzPCzEYAqMwrgGTDLa2c8ID4AJMDHwSHoTxwJKVjGpsdAUl7xaE0Lse3S+y4DllLo4QV/+QRWRODuonMdsMbkfT8B4EBuTy3uR3tIgKfzL6+ECx52Bgk7mYALjKPAOpV7/mJJ7ymuiq4E44DIZh1m4vMnXRhgSdODqrwse9NLVr6ArRg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(478600001)(83380400001)(66476007)(26005)(55016002)(6666004)(8676002)(71200400001)(76116006)(66556008)(5660300002)(186003)(54906003)(6506007)(52536014)(85182001)(66446008)(316002)(66946007)(86362001)(7696005)(110136005)(64756008)(53546011)(9686003)(2906002)(966005)(8936002)(4326008)(33656002)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?b1JUMlVqOUdXenZPdGRWSEFIclp5eU4ySllPWVowdzVHb3VqOU9Ia3R0ZEZG?=
 =?utf-8?B?aEtDMkwvMWt2OHBDQTl2aERtc2dXQ1NadDFpeFNGMlJ2UVZBTlpmTXc1ZU9U?=
 =?utf-8?B?cWZaRGVET2loQVVBTEtpd05MQWl5Rkt0K1NidU5GSjJEa2R1dG5zeFR5dWgy?=
 =?utf-8?B?MldtZUduZFFEYlliQ0ZHUEEzQjRTNjhqTlFuUStaV0FQNXV6YkN1STMwZk9n?=
 =?utf-8?B?N29HZ2tIMUdYTlpkY1huZHZuZ1BMSTQzYitkbzNyVkdWRDlmOU93OHZ2ZlNY?=
 =?utf-8?B?YlZRNmU0dEhQS3RzTlpxa3lHMTNtR2h0empwcm9wZmpTRjBNSEtWR0dLZGcr?=
 =?utf-8?B?eUhldkpuRWhKVlc1OXJIdFFiODJ0Yks0TUlHVzVUT3NEU0JIYXAyTWRNWFdj?=
 =?utf-8?B?VlowMmp5NnFJc3ZKS2cwRkhyMlVBai85Yi92S0F1em4zMXdJdWk2SjZkSEFt?=
 =?utf-8?B?aEk5ZWVoZ1oxN0RiQng5aGtIWmVqNUpvRjhkQnBhYk5jYmdJdk9kZVZYVHJW?=
 =?utf-8?B?eVVkMUtPamhWUm1nY1ZCZzBhc0k3RUpoS1ZFRnJ2L2c1Q1oxc3J2eEdsSlB1?=
 =?utf-8?B?d0tQRE8zZGtqTWJ4aE56ZTdTMHhabzVNV3cxbzhqV3k5TEkvbkVYMExhZmxM?=
 =?utf-8?B?ak1NekRrUThRUTBZZkxsa2dCaTl2bmVhZ214V2lhK212ZUxpZ1lweEJYR3Vt?=
 =?utf-8?B?TC95M0lpbmphVExHaERBRFl4SGljZEVibVdoMk94RmpKWXhKR3hCbUJYOVFJ?=
 =?utf-8?B?ODF3RmZlbk1KWi9vWEUwWCtETTFGR2pOeFZ2OW9KVElzbTNWQ2VIVmRWSXNo?=
 =?utf-8?B?T0Y5QnMydnU3YVprdHY1K1ZBb1NwSk0yOU5NaElqK3RSWHRqY0N4b3NOWmtY?=
 =?utf-8?B?ZVFNWDZKd1RCTkw2VFlydzBDcTBqdG5XRFZIa0xRNGlURXYxWW1QcWdVYUxp?=
 =?utf-8?B?b1pJNnNwSi9xMHBFb3VGcjFDdVJIaVU5bUEzRWJUZFdPVlYwdFBueWQxdjlv?=
 =?utf-8?B?WHZkSGZVS1RhcHM0RjlHNEZ3SE0zREhxSG9VRDMrandjZjFtOXUwN1FlTHhz?=
 =?utf-8?B?dDl2c2k0bzRqenFTS1hpUWw3citRdGo1eDkrOGtsMmxNWUc3dWVHV2g5SVBS?=
 =?utf-8?B?NFo5QkMvd2NXNVFjY2tCUkI1MGxVcGZFSzh3SmlFWG5FTXlmOVYxYS9MR0RN?=
 =?utf-8?B?TWFPRTdFY2xmc2RxZzYrQzk5TStacm1wdmFSR3V1WTduNm53MWlyaWFxNkNy?=
 =?utf-8?B?UlRIRjkyMS8wUXpEOVRmL1FqNGdOMnJPb25FSHhlYk1nTUZVRmMrSGo5S2VQ?=
 =?utf-8?Q?yDUR0ewDCv6c8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93188e02-02e4-41f9-b0ec-08d8b6e47ac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:26:10.0048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tHKUNcOg4h2vgCkbE2YevY8wX3ft07J55b/jHecr4NEhWqQ4tkD/VHlxSSZmHf8EI80NUYhKUCxVvjEW9Ij5BMKmb1C2vJeIp9d7KT6cds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2678

SGksIA0KDQpGaXJzdCBvZiBhbGwsIHRoYW5rcyBhIGxvdCBmb3IgYWxsIHRoZSBjb21tZW50cyB0
byBib3RoIG9mIHlvdSAoY29udC4gYmVsb3cpLg0KDQo+IE9uIEZyaSwgSmFuIDgsIDIwMjEgYXQg
MTo1NCBQTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToNCj4gPiBP
biBGcmksIEphbiAwOCwgMjAyMSBhdCAwNzo1MjozMVBNICswOTAwLCBNaXNvbm8gVG9tb2hpcm8g
d3JvdGU6DQo+ID4gPiAoUmVzZW5kIGFzIGNvdmVyIGxldHRlciB0aXRsZSB3YXMgbWlzc2luZyBp
biB0aGUgZmlyc3QgdGltZS4gU29ycnkgZm9yIG5vaXNlKQ0KPiA+ID4NCj4gPiA+IFRoaXMgc2Vy
aWVzIGFkZHMgRnVqaXRzdSBBNjRGWCBTb0MgZW50cnkgaW4gZHJpdmVycy9zb2MgYW5kIGhhcmR3
YXJlDQo+ID4gPiBiYXJyaWVyIGRyaXZlciBmb3IgaXQuDQo+ID4gPg0KPiA+ID4gW0RyaXZlciBE
ZXNjcmlwdGlvbl0NCj4gPiA+ICBBNjRGWCBDUFUgaGFzIHNldmVyYWwgZnVuY3Rpb25zIGZvciBI
UEMgd29ya2xvYWQgYW5kIGhhcmR3YXJlIGJhcnJpZXINCj4gPiA+ICBpcyBvbmUgb2YgdGhlbS4g
SXQgaXMgYSBtZWNoYW5pc20gdG8gcmVhbGl6ZSBmYXN0IHN5bmNocm9uaXphdGlvbiBieQ0KPiA+
ID4gIFBFcyBiZWxvbmdpbmcgdG8gdGhlIHNhbWUgTDMgY2FjaGUgZG9tYWluIGJ5IHVzaW5nIGlt
cGxlbWVudGF0aW9uDQo+ID4gPiAgZGVmaW5lZCBoYXJkd2FyZSByZWdpc3RlcnMuDQo+ID4gPiAg
Rm9yIG1vcmUgZGV0YWlscywgc2VlIEE2NEZYIEhQQyBleHRlbnNpb24gc3BlY2lmaWNhdGlvbiBp
bg0KPiA+ID4gIGh0dHBzOi8vZ2l0aHViLmNvbS9mdWppdHN1L0E2NEZYDQo+ID4gPg0KPiA+ID4g
IFRoZSBkcml2ZXIgbWFpbmx5IG9mZmVycyBhIHNldCBvZiBpb2N0bHMgdG8gbWFuaXB1bGF0ZSBy
ZWxhdGVkIHJlZ2lzdGVycy4NCj4gPiA+ICBQYXRjaCAxLTkgaW1wbGVtZW50cyBkcml2ZXIgY29k
ZSBhbmQgcGF0Y2ggMTAgZmluYWxseSBhZGRzIGtjb25maWcsDQo+ID4gPiAgTWFrZWZpbGUgYW5k
IE1BSU5UQUlORVIgZW50cnkgZm9yIHRoZSBkcml2ZXIuDQo+ID4NCj4gPiBJIGhhdmUgYSBudW1i
ZXIgb2YgY29uY2VybnMgaGVyZSwgYW5kIGF0IGEgaGlnaCBsZXZlbCwgSSBkbyBub3QgdGhpbmsN
Cj4gPiB0aGF0IHRoaXMgaXMgc29tZXRoaW5nIExpbnV4IGNhbiByZWFzb25hYmx5IHN1cHBvcnQg
aW4gaXRzIGN1cnJlbnQgZm9ybS4NCj4gPiBTb3JyeSBpZiB0aGlzIGNvbWVzIGFjcm9zcyBhcyBo
YXJzaDsgSSBhcHByZWNpYXRlIHRoZSB3b3JrIHRoYXQgaGFzIGdvbmUNCj4gPiBpbnRvIHRoaXMs
IGFuZCB0aGUgZWZmb3J0IHRvIHRyeSB0byB1cHN0cmVhbSBzdXBwb3J0IGlzIGdyZWF0IC0tIG15
DQo+ID4gY29uY2VybnMgYXJlIHdpdGggdGhlIG92ZXJhbCBwaWN0dXJlLg0KPiA+DQo+ID4gQXMg
YSBnZW5lcmFsIHJ1bGUsIHdlIGF2b2lkIHRoZSB1c2Ugb2YgSU1QTEVNRU5UQVRJT04gREVGSU5F
RCBmZWF0dXJlcw0KPiA+IGluIExpbnV4LCBhcyB0aGV5IHBvc2UgYSBudW1iZXIgb2YgY29ycmVj
dG5lc3Mvc2FmZXR5IGNoYWxsZW5nZXMgYW5kDQo+ID4gY29tZSB3aXRoIGEgcG90ZW50aWFsbHkg
c2lnbmlmaWNhbiBsb25nIHRlcm0gbWFpbnRlbmFuY2UgYnVyZGVuIHRoYXQgaXMNCj4gPiBnZW5l
cmFsbHkgbm90IGp1c3RpZmllZCBieSB0aGUgZmVhdHVyZXMgdGhlbXNlbHZlcy4gRm9yIGV4YW1w
bGUsIHN1Y2gNCj4gPiBmZWF0dXJlcyBhcmUgbm90IHVzYWJsZSB1bmRlciB2aXJ0dWFsaXphdGlv
biAod2hlcmUgYSBoeXBlcnZpc29yIG1heSBzZXQNCj4gPiBIQ1JfRUwyLlRJRENQLCBvciBmYWls
IHRvIGNvbnRleHQtc3dpdGNoIHN0YXRlIHRoYXQgaXQgaXMgdW5hd2FyZSBvZikuDQo+IA0KPiBJ
IGFtIHNvbWV3aGF0IGxlc3MgY29uY2VybmVkIGFib3V0IHRoZSBmZWF0dXJlIGJlaW5nIGltcGxl
bWVudGF0aW9uDQo+IGRlZmluZWQgdGhhbiBJIGFtIGFib3V0IGFkZGluZyBhIGN1c3RvbSB1c2Vy
IGludGVyZmFjZSBmb3Igb25lDQo+IHBsYXRmb3JtLg0KPiANCj4gSW4gdGhlIGVuZCwgYW55dGhp
bmcgb3V0c2lkZSBvZiB0aGUgQ1BVIGNvcmUgdGhhdCBlbmRzIHVwIGluIGEgU29DDQo+IGlzIGlt
cGxlbWVudGF0aW9uIGRlZmluZWQsIGFuZCB0aGlzIGlzIHVzdWFsbHkgbm90IGEgcHJvYmxlbSBh
cyBsb25nDQo+IGFzIHdlIGhhdmUgYW4gYWJzdHJhY3Rpb24gaW4gdGhlIGtlcm5lbCB0aGF0IGhp
ZGVzIHRoZSBkZXRhaWxzIGZyb20NCj4gdGhlIHVzZXIsIGFuZCB0aGUgc3lzdGVtIGlzIHN0aWxs
IGZ1bmN0aW9uYWwgaWYgdGhlIGltcGxlbWVudGF0aW9uIGlzDQo+IHR1cm5lZCBvZmYgZm9yIHdo
YXRldmVyIHJlYXNvbi4NCg0KVW5kZXJzdG9vZC4gSG93ZXZlciwgSSBkb24ndCBrbm93IGFueSBv
dGhlciBwcm9jZXNzb3JzIGhhdmluZyBzaW1pbGFyDQpmZWF0dXJlcyBhdCB0aGlzIHBvaW50IGFu
ZCBpdCBpcyBoYXJkIHRvIHByb3ZpZGUgY29tbW9uIGFic3RyYWN0aW9uIGludGVyZmFjZS4NCkkg
d291bGQgYXBwcmVjaWF0ZSBzaG91bGQgYW55b25lIGhhdmUgYW55IGluZm9ybWF0aW9uLg0KDQo+
ID4gU2Vjb25kbHksIHRoZSBpbnRlbmRlZCB1c2FnZSBtb2RlbCBhcHBlYXJzIHRvIGV4cG9zZSB0
aGlzIHRvIEVMMCBmb3INCj4gPiBkaXJlY3QgYWNjZXNzLCBhbmQgdGhlIGNvZGUgc2VlbXMgdG8g
ZGVwZW5kIG9uIHRocmVhZHMgYmVpbmcgcGlubmVkLCBidXQNCj4gPiBBRkFJQ1QgdGhpcyBpcyBu
b3QgZW5mb3JjZWQgYW5kIHRoZXJlIGlzIG5vIHByb3Zpc2lvbiBmb3INCj4gPiBjb250ZXh0LXN3
aXRjaCwgdGhyZWFkIG1pZ3JhdGlvbiwgb3IgaW50ZXJhY3Rpb24gd2l0aCBwdHJhY2UuIEkgZmVh
cg0KPiA+IHRoaXMgaXMgZ29pbmcgdG8gYmUgdmVyeSBmcmFnaWxlIGluIHByYWN0aWNlLCBhbmQg
dGhhdCBleHRlbmRpbmcgdGhhdA0KPiA+IHN1cHBvcnQgaW4gZnV0dXJlIHdpbGwgcmVxdWlyZSBt
dWNoIG1vcmUgY29tcGxleGl0eSB0aGFuIGlzIGN1cnJlbnRseQ0KPiA+IGFwcGFyZW50LCB3aXRo
IHBvdGVudGlhbGx5IGludmFzaXZlIGNoYW5nZXMgdG8gYXJjaCBjb2RlLg0KPiANCj4gUmlnaHQs
IHRoaXMgaXMgdGhlIG1haW4gcHJvYmxlbSBJIHNlZSwgdG9vLiBJIGhhZCBub3QgZXZlbiByZWFs
aXplZA0KPiB0aGF0IHRoaXMgd2lsbCBoYXZlIHRvIHRpZSBpbiB3aXRoIHVzZXIgc3BhY2UgdGhy
ZWFkcyBpbiBzb21lIGZvcm0sIGJ1dA0KPiB5b3UgYXJlIHJpZ2h0IHRoYXQgb25jZSB0aGlzIGhh
cyB0byBpbnRlcmFjdCB3aXRoIHRoZSBDUFUgc2NoZWR1bGVyLA0KPiBpdCBhbGwgYnJlYWtzIGRv
d24uDQoNClRoaXMgb2JzZXJ2YXRpb24gaXMgcmlnaHQuIEkgdGhvdWdodCBhZGRpbmcgY29udGV4
dCBzd2l0Y2ggZXRjLiBzdXBwb3J0IGZvciANCmltcGxlbWVudGF0aW9uIGRlZmluZWQgcmVnaXN0
ZXJzIHJlcXVpcmVzIGNvcmUgYXJjaCBjb2RlIGNoYW5nZXMgYW5kIA0KaXQgaXMgZmFyIGxlc3Mg
YWNjZXB0YWJsZS4gU28sIEkgdHJpZWQgdG8gY29uZmluZSBjb2RlIGNoYW5nZSBpbiBhIG1vZHVs
ZSB3aXRoIA0KdGhlc2UgcmVzdHJpY3Rpb25zLiANCg0KUmVnYXJkaW5nIGRpcmVjdCBhY2Nlc3Mg
ZnJvbSBFTDAsIGl0IGlzIG5lY2Vzc2FyeSBmb3IgcmVhbGl6aW5nIGZhc3Qgc3luY2hyb25pemF0
aW9uIA0KYXMgdGhpcyBlbmFibGVzIHN5bmNocm9uaXphdGlvbiBsb2dpYyBpbiB1c2VyIGFwcGxp
Y2F0aW9uIGNoZWNrIGlmIGFsbCB0aHJlYWRzIGhhdmUNCnJlYWNoZWQgYXQgc3luY2hyb25pemF0
aW9uIHBvaW50IHdpdGhvdXQgc3dpdGNoaW5nIHRvIGtlcm5lbC4NCkFsc28sIEl0IGlzIGNvbW1v
biB1c2FnZSB0aGF0IGVhY2ggcnVubmluZyB0aHJlYWQgaXMgYm91bmQgdG8gb25lIFBFIGluIG11
bHRpLXRocmVhZGVkIA0KSFBDIGFwcGxpY2F0aW9ucy4NCg0KPiBPbmUgd2F5IEkgY2FuIGltYWdp
bmUgdGhpcyB3b3JraW5nIG91dCBpcyB0byB0aWUgaW50byB0aGUgY3B1c2V0DQo+IG1lY2hhbmlz
bSB0aGF0IGlzIHVzZWQgZm9yIGlzb2xhdGluZyB0aHJlYWRzIHRvIENQVSBjb3JlcywgYW5kDQo+
IHRoZW4gcHJvdmlkZSBhIGNwdXNldCBpbnRlcmZhY2UgdGhhdCBoYXMgdGhlIGRlc2lyZWQgYmVo
YXZpb3INCj4gYnV0IHRoYXQgY2FuIGZhbGwgYmFjayB0byBhIGdlbmVyaWMgaW1wbGVtZW50YXRp
b24gd2l0aCB0aGUgc2FtZQ0KPiBvciBzdHJvbmdlciAoYnV0IG5vcm1hbGx5IHNsb3dlcikgc2Vt
YW50aWNzLg0KDQpJJ20gbm90IHN1cmUgaWYgdGhpcyBhcHByb2FjaCBpcyBmZWFzaWJsZSwgYnV0
IEkgd2lsbCB0cnkgdG8gbG9vayBpbnRvIGl0Lg0KDQo+ID4gVGhpcmRseSwgdGhpcyByZXF1aXJl
cyB1c2Vyc3BhY2Ugc29mdHdhcmUgdG8gYmUgaW50aW1hdGVseSBmYW1pbGlhciB3aXRoDQo+ID4g
dGhlIEhXIHBsYXRmb3JtIHRoYXQgaXQgaXMgcnVubmluZyBvbiAoYm90aCBpbiB0ZXJtcyBvZiB1
c2luZyBJTVAtREVGDQo+ID4gaW5zdHJ1Y3Rpb25zIGFuZCBuZWVkaW5nIHRvIGtub3cgdGhlIHBo
eXNpY2FsIGxheW91dCksIHJhdGhlciB0aGFuIGJlaW5nDQo+ID4gZ2VuZXJpYyBhbmQgcG9ydGFi
bGUsIHdoaWNoIEkgZG9uJ3QgYmVsaWV2ZSBpcyBzb21ldGhpbmcgdGhhdCB3ZSB3aXNoIHRvDQo+
ID4gZW5jb3VyYWdlLiAgSSBhbHNvIHRoaW5rIHRoaXMgaXMgdW5saWtlbHkgdG8gYmUgc3VwcG9y
dGVkIGJ5IGdlbmVyaWMNCj4gPiBzb2Z0d2FyZSBiZWNhdXNlIG9mIHRoZSBsYWNrIG9mIHBvcnRh
YmlsaXR5LCBhbmQgY29uc2VxdWVudGx5IEkgc3RydWdnbGUNCj4gPiB0byBiZWxlaXZlIHRoYXQg
dGhpcyB3aWxsIHNlZSBzaWduaWZpY2FudCB1c2FnZS4NCj4gDQo+IEFncmVlZCBhcyB3ZWxsLg0K
DQpJdCBtYXkgYmUgcG9zc2libGUgdG8gdHJhcCBhY2Nlc3MgdG8gdGhlc2UgaW1wbGVtZW50YXRp
b24gZGVmaW5lZCByZWdpc3RlcnMgDQphbmQgZmFsbGJhY2sgc29tZSBsb2dpYyBpbiB0aGUgZHJp
dmVyLiBUaGUgcHJvYmxlbSBpcyB0aGF0IG90aGVyIHByb2Nlc3NvcnMgDQptaWdodCB1c2UgdGhl
IHNhbWUgSU1QLURFRiByZWdpc3RlcnMgZm9yIGRpZmZlcmVudCBwdXJwb3NlLg0KDQpSZWdhcmRz
LA0KVG9tb2hpcm8NCg==
