Return-Path: <SRS0=f0Xt=IC=fujitsu.com=tan.shaopeng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730C6C433DB
	for <soc@archiver.kernel.org>; Thu,  4 Mar 2021 10:35:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4DA1564F2B; Thu,  4 Mar 2021 10:35:54 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Thu, 04 Mar 2021 10:35:53 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6628C64F2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=tan.shaopeng@fujitsu.com
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com [68.232.151.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6628C64F2C;
	Thu,  4 Mar 2021 10:35:53 +0000 (UTC)
IronPort-SDR: FHIIXuun2kM/sPDy83c5eBMXUYvy03o7hv3r0JE1HzW97eomuhnvfAmppkMwdwJNG6xa92+WYG
 7VoK76dMZF9GYxzWWTA8xMCmRMvEoQbGb6yhzSFRmEExFatERooCUSVer28PUl+XITvO98R4YM
 P5q6WOpic16+ofTGvHnuPzNs2E2hdoz8Qy4Wl7329/jgpRIer5vt+NrJUyRJ9UVhnRm06vn0Qf
 SLz8KsR6qkObv33I5N0n06VrbZhd3sI7hcwnilmxqPDnHvhF8oETZZk/YGXS7B2VywMx22jif8
 mF8=
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="35179012"
X-IronPort-AV: E=Sophos;i="5.81,222,1610377200"; 
   d="scan'208";a="35179012"
Received: from mail-os2jpn01lp2055.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.55])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 19:34:47 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6ovH2bPW0rrg/djR2r2ndskFCxnUKmmOH/sM7jFQ503L0scr0cPrwffK1su/mNsBmtzKUrwof90YoUktBPNz52v+396WOZcJpXP4cD6SoGK59ppk0fgm4OMjJW3URBZed6DmkBSfEa3zEIU4AbfgTl+38/HWAkV3UcNvaxaWf8pl73tl/U7MAtlcfuFZO64SWT2HHOWIGdBAmDr+AwS2w4Z6AFRUCo9stGfvz7yqu9qSBi2EjWWt8+Pitm/ZdscD9sgHHAOCC/c3YHK7S00EROmanCXtys9SG8+l5GyJ6s73Yb8cG9LCMjYqM6JNrpKL+oaU6PIpGjraAPPknfHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTr1/GKBZidKlJxEDayivnQ5so87qYboXmdd5IXfdIQ=;
 b=OS3y664EFnriH8OLC1H4dTXYRu+obqc9tBHehft0VgwuBo4KFVv6VDen/K0JfYBPHabSmQ+GdxZgq1caeI/0yuwV3raJUeYUV5/tT3O6+K9MLDZJ1sCT7AFu9MfOyp2/m8WpXoU0SS4TfMfpJb6zULGAaiWbX6X8lRYqnJEn5eeDFNNhyUEJsWv9qAq0RSLGiZ56UfSNEyGiHGgFBz0VgBtPMnzIakHCq3K6/2mmPlKBBH/49V2L1kqLnN1lRbuElDjd3yetE41pSskBs4MELjtmfMCFgdsrALXKTFjV5UTd3NmCah3aF1XJfSd9TLItEms0QXsWLi4x/dXa2Jm7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTr1/GKBZidKlJxEDayivnQ5so87qYboXmdd5IXfdIQ=;
 b=hxZaxZ/BpS6AwqjtUQn3nIIO8VKLCd+cqxqUVoJAe4FjVn3KPOTIDxTQS1mKXdV8APFnzT6xQCDkA7nMiWh3n8N0NxUjE6JGavW4biKxFlweclqFB34hpffv8DbVC733+TuVCoVhUBZzO87qhyJcIDK7jfIIxcDPWli0I0lQWAI=
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com (2603:1096:603:15::15)
 by OSBPR01MB2374.jpnprd01.prod.outlook.com (2603:1096:604:19::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 10:34:44 +0000
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d]) by OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d%6]) with mapi id 15.20.3890.030; Thu, 4 Mar 2021
 10:34:44 +0000
From: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
To: 'Arnd Bergmann' <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>,
	"misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
Subject: RE: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Topic: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Index: AQHXEBESAJcmfc8h0U6q78FjB96JBapyH1gAgAGCoFA=
Date: Thu, 4 Mar 2021 10:34:43 +0000
Message-ID:
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
In-Reply-To:
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 243a54bc-c9db-4d4d-e1f6-08d8def9202b
x-ms-traffictypediagnostic: OSBPR01MB2374:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <OSBPR01MB237400D87114AFF970D1BCAB8B979@OSBPR01MB2374.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6pNr5e9xw+BrOjz2r6nJXOFUfkYaiqRSqmgdU3t/zEcYZzQ1ZE/1vMaYg3iiqwKxxH5N00GRtkLkOlqzB3y+bzfXKh/eE8inHFSTUisxN8mhkbQfHygRPlfwrkwsKo4z0CzievYgpMmHmH2VFuxvOrOqazggQo1XjBjuxGknv2M7/wO+L++EurxI4TiR7EOa+PZyATSNFv5LbBvrSGNVtQo3TdqkWq56yHj3mAsIS/SNHaL8avFxsP9WbFzpfU7l85pUr4/R4CWL3SnTGCFJvh9g1fSbu/hgPdPcCUzu2bf4mBxJfcctNYT1g+GqAN0HkFI478KHJ84rT7z0yd58hxV1j5TAuUOIOKaqRvD86Pp12EPlpoEGBl46i51BDizXZE6R8j4v+FJ9OVt6Mbt/q43jdTpGqC14jsfsFskQMgmSxGNCtxWc7kAAclQ1gpG/NQV8hF0cnS44FdI5UwwRMmPhKdh0KAMPzDK4fS395xX/Auf0Pzrbx3HcH8zZrMVhiahZPou6YgWTjqE7gBE8uA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2146.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(83380400001)(186003)(33656002)(53546011)(4326008)(55016002)(26005)(6506007)(86362001)(107886003)(8676002)(6916009)(8936002)(7696005)(9686003)(64756008)(76116006)(66556008)(71200400001)(316002)(54906003)(478600001)(85182001)(66446008)(2906002)(5660300002)(66476007)(52536014)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ZDV6bTFmTmZLdExoaC9Ea1JYNkZ3T1VZazYweWc4NkhkeWpGUjJoOHRvdU9E?=
 =?utf-8?B?bVFaR2IzUjlvRU5iT2VIY1NUdk50T0ZObEVGVnp4ZWp5dWg5S2lDQ3dJdlE5?=
 =?utf-8?B?UndldllIRUF2eXdsaUdYU0gwQ1BDYU9KTTEwM1dRNE5rS3BlMUgyZndpREsv?=
 =?utf-8?B?dnBvT2gwQ1h4amRqNVlNLzM5ZkQ0M2ZYekdLd2ZxUE1tVW94THNPL3Rzcmxz?=
 =?utf-8?B?U1FlaHFCTThhQ2loZEJFT0J6SXNmUUl3dnVvNUV4U3dkU05OLzhaMkp0cXZM?=
 =?utf-8?B?QXIvM1lPVVRzVStHU0wvU2Z2TVkyT0tGd2dtKytZdEJRd1Bha1VQRTNhdjVD?=
 =?utf-8?B?STJKSmNBa3NiMG4zYWprdDRGOHJqTUkza2xqaUlkditGcmdQWkJRNjZ6YjIz?=
 =?utf-8?B?MFJnR1ZRaExiM2NucDZqWE9Pc3g1L1gyZWQzaWhJS0ZYbVM0RzNFb0UzNjd4?=
 =?utf-8?B?TEU0Uy9RS1ZxaDEwUzZGemlxcW52Ukd3NGJkbnZZV2lUdmtZOVdhYzAwTXEr?=
 =?utf-8?B?Q1hudHBZR2hId3BGMHdKWXBiWEsreVFiTzlpUUpyL0FLdFhxM3k5dldQZGhF?=
 =?utf-8?B?SnNxaUFCc2FnaWV3WWhIWVZNWU5xbDE0dk9KNFltQXlrMTJqZ2hvbDVaS0xq?=
 =?utf-8?B?NmZoU1gxV0FLZWhnT0o4MWltVnlmdzNwb3pLNElTUkEzTFd6NnE1QUhZaHMv?=
 =?utf-8?B?ZURaZ1FpUzFjc09YR3JraDNGWnkwVUY1M2NrbTUwbVdPcWpMd1QrZEhUUmJF?=
 =?utf-8?B?SjVDTVVwYXNQM2VCb3NMWUtaZFlXQnJRU09OM1R5ZTg0MC9PVkNuK2tFZVF6?=
 =?utf-8?B?U1hHZ3ZjdkFMRXJSVm1ZNDN1SS9pR3pSKzNJRktyVjRFYTNLYk9rYU82T2Qr?=
 =?utf-8?B?dU1pMTVTMzl5UTloYUIxdmZkSVphanhxTFJDU0ZoTTFxcWlNdUNkOGV6N0ZR?=
 =?utf-8?B?clpQSzI0anp3Vnd4SG1tTFplSHlKK1lLWERiZkNrTEhqaFpaUm5YbEJDaDJ6?=
 =?utf-8?B?L1M2S1pNNWx5d2ZablgvbCt5RzIyUzc2UHhTZlFhakUxZlQvQkIrQzNDMVU1?=
 =?utf-8?B?Z1VHcFcrYUVQVDU1MEpIMHM0MjZTTGU1M3d4T3liVEV2MDhncEl2UVo2UDZ3?=
 =?utf-8?B?SUJDRXZ2UDExSzRIS2s1SlZkU1I4Y0YxQkdtbEtnL3VBcEtiek1VajNORS9y?=
 =?utf-8?B?WU1oZi9seGFOck52Zlc3dWJqRzRHZC9sR2RUQnkvL0R1ZjFXQm41a2ltNkpo?=
 =?utf-8?B?WjhlNGZPMStYT0Y4ZkVGYkVvYkw1cS84NTlWeFNRV0M4bE9ISjBTdVFyK0xr?=
 =?utf-8?B?b25nTHk0aHY2RHJCZ25kQkZlbk9McGJNNVY3WXVJY1UzMWFEcERQWjUyZkg1?=
 =?utf-8?B?T3pzSmNha2RTdDZPMGd4UEo5UUY2SVdiNUxqSGJsSFJTMGxLVkdDM0oydzA4?=
 =?utf-8?B?VUdBNGkvR1RVMlVGRjBIU283eDFyaE1yb1lrZzdXM0hSUHBqdEpnVkJ5U25N?=
 =?utf-8?B?RXpnWTNVZ0VhakxDM0s2TFZlc1JwK2tSNDZVWjNTR1hyUjB1TTh0MkpHM042?=
 =?utf-8?B?QzFaY0JFRmc3R0JqTnpObnNZWURYMHI3ZmEwN3JRcnBWdHJ5L3JwVysyTmYw?=
 =?utf-8?B?Ull3ZWJ1Vm1PQ1VlclQrQm9KQVhXamlxS0pGQ3lzaUZSVG91WndiMXBXbnpD?=
 =?utf-8?B?dElKRjRXRVdQQkVDcXR3TFdkcmE1YWtIeHJBa0hvdFBKZEY2cVh4aWFBL1Rr?=
 =?utf-8?Q?YsKlZDA1u69c6NgWO3TiGLfKxY5ssE+UreErKqR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2146.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243a54bc-c9db-4d4d-e1f6-08d8def9202b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 10:34:43.9935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9RV6VNIbmKFhX8k7F/9LazFWbsdYTeGWEEs6iMn/W7s57qpY9C4jD9Ge6U31wfWGd01/Bjz0jyLcvF+Fq+7HWSXHU6rCvudsmjehHL3JUJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2374

SGksIA0KIA0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzDQoNCj4gT24gV2VkLCBNYXIgMywgMjAy
MSBhdCAxMDozOCBBTSB0YW4uc2hhb3BlbmcNCj4gPHRhbi5zaGFvcGVuZ0BqcC5mdWppdHN1LmNv
bT4gd3JvdGU6DQo+ID4gKw0KPiA+ICtjb25maWcgRlVKSVRTVV9DQUNIRQ0KPiA+ICsgICAgICAg
IHRyaXN0YXRlICJGVUpJVFNVIENhY2hlIERyaXZlciINCj4gPiArICAgICAgICBkZXBlbmRzIG9u
IEFSTTY0X1ZIRSB8fCBDT01QSUxFX1RFU1QNCj4gPiArICAgICAgICBoZWxwDQo+ID4gKyAgICAg
ICAgICBGVUpJVFNVIENhY2hlIERyaXZlcg0KPiA+ICsNCj4gPiArICAgICAgICAgIFRoaXMgZHJp
dmVyIG9mZmVycyBjYWNoZSBmdW5jdGlvbnMgZm9yIEE2NEZYIHN5c3RlbS4NCj4gPiArICAgICAg
ICAgTG9hZGluZyB0aGlzIGNhY2hlIGRyaXZlciwgY29udHJvbCByZWdpc3RlcnMgd2lsbCBiZSBz
ZXQgdG8gZW5hYmxlDQo+ID4gKyAgICAgICAgIHRoZXNlIGZ1bmN0aW9ucywgYW5kIGFkdmFuY2Vk
IHNldHRpbmdzIHJlZ2lzdGVycyB3aWxsIGJlIHNldCBieQ0KPiBkZWZhdWx0DQo+ID4gKyAgICAg
ICAgIHZhbHVlcy4gQWZ0ZXIgbG9hZGluZyB0aGlzIGRyaXZlciwgeW91IGNhbiB1c2UgdGhlIGRl
ZmF1bHQgdmFsdWVzIG9mDQo+IHRoZQ0KPiA+ICsgICAgICAgICBhZHZhbmNlZCBzZXR0aW5ncyBy
ZWdpc3RlcnMgb3Igc2V0IHRoZSBhZHZhbmNlZCBzZXR0aW5ncyByZWdpc3RlcnMNCj4gPiArICAg
ICAgICAgZnJvbSBFTDAuIFVubG9hZGluZyB0aGlzIGRyaXZlciwgY29udHJvbCByZWdpc3RlcnMg
d2lsbCBiZSBjbGVhciB0bw0KPiA+ICsgICAgICAgICBkaXNhYmxlIHRoZXNlIGZ1bmN0aW9ucy4N
Cj4gPiArICAgICAgICAgIFdoZW4gYnVpbHQgYXMgYSBtb2R1bGUsIHRoaXMgd2lsbCBiZSBjYWxs
ZWQgYXMgImZ1aml0c3VfY2FjaGUiLg0KPiANCj4gTXkgZmVlbGluZyBpcyB0aGF0IHRoaXMgY29k
ZSBzaG91bGQgYmUgaW4gYXJjaC9hcm02NC8sIGFzIHRoZSBjYWNoZQ0KPiBpcyBnZW5lcmFsbHkg
Y29uc2lkZXJlZCBwYXJ0IG9mIHRoZSBDUFUsIHJhdGhlciB0aGFuIHBhcnQgb2YgdGhlIHdpZGVy
DQo+IFNvQyBkZXNpZ24sIG9yIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBjb250cm9sbGVkIHNlcGFy
YXRlbHkgZnJvbSB0aGUNCj4gY29yZSBrZXJuZWwgYW5kIG1lbW9yeSBtYW5hZ2VtZW50IGNvZGUu
DQoNClRoYW5rcyBmb3IgeW91ciBhZHZpY2UuIEkgYWxzbyB3b3VsZCBsaWtlIHRvIGhlYXIgdGhl
IG9waW5pb25zIGZyb20gDQpvdGhlciBzb2MmYXJtIG1haW50YWluZXJzLCBhbmQgdGhlbiBjb25z
aWRlciB3aGV0aGVyIHRvIGFkZCB0aGlzIHRvIA0KYXJjaC9hcm02NC8uIA0KDQo+ID4gK21vZHVs
ZV9wYXJhbSh0YWdhZGRyX2N0cmxfcmVnLCB1bG9uZywgMDQ0NCk7DQo+ID4gK01PRFVMRV9QQVJN
X0RFU0ModGFnYWRkcl9jdHJsX3JlZywgIkhQQyB0YWcgYWRkcmVzcyBvdmVycmlkZQ0KPiBjb250
cm9sIHJlZ2lzdGVyIik7DQo+ID4gK21vZHVsZV9wYXJhbShod3BmX2N0cmxfcmVnLCB1bG9uZywg
MDQ0NCk7DQo+ID4gK01PRFVMRV9QQVJNX0RFU0MoaHdwZl9jdHJsX3JlZywgImhhcmR3YXJlIHBy
ZWZldGNoIGFzc2lzdCBjb250cm9sDQo+IHJlZ2lzdGVyIik7DQo+ID4gK21vZHVsZV9wYXJhbShz
ZWNfY3RybF9yZWcsIHVsb25nLCAwNDQ0KTsNCj4gPiArTU9EVUxFX1BBUk1fREVTQyhzZWNfY3Ry
bF9yZWcsICJzZWN0b3IgY2FjaGUgY29udHJvbCByZWdpc3RlciIpOw0KPiA+ICttb2R1bGVfcGFy
YW0oc2VjX2Fzc2lnbl9yZWcsIHVsb25nLCAwNDQ0KTsNCj4gPiArTU9EVUxFX1BBUk1fREVTQyhz
ZWNfYXNzaWduX3JlZywgInNlY3RvciBjYWNoZSBhc3NpZ24gcmVnaXN0ZXIiKTsNCj4gPiArbW9k
dWxlX3BhcmFtKHNlY19zZXQwX2wyX3JlZywgdWxvbmcsIDA0NDQpOw0KPiA+ICtNT0RVTEVfUEFS
TV9ERVNDKHNlY19zZXQwX2wyX3JlZywgInNlY3RvciBjYWNoZSBMMiB3YXkNCj4gcmVnaXN0ZXIo
c2VjdG9yPTAsMSkiKTsNCj4gPiArbW9kdWxlX3BhcmFtKHNlY19zZXQxX2wyX3JlZywgdWxvbmcs
IDA0NDQpOw0KPiA+ICtNT0RVTEVfUEFSTV9ERVNDKHNlY19zZXQxX2wyX3JlZywgInNlY3RvciBj
YWNoZSBMMiB3YXkNCj4gcmVnaXN0ZXIoc2VjdG9yPTIsMykiKTsNCj4gDQo+IE15IGZlZWxpbmcg
aXMgdGhhdCB0aGUgYWN0dWFsIHNldHRpbmdzIG5lZWQgdG8gYmUgb24gYSBoaWdoZXIgbGV2ZWws
IG5vdCB0aWVkDQo+IHRvIHRoZSBzcGVjaWZpYyByZWdpc3Rlci1sZXZlbCBpbXBsZW1lbnRhdGlv
biBvZiB0aGlzIGNoaXAuIE5vcm1hbGx5LCAgdGhlIEwyDQo+IGNhY2hlIGlzIHNldCB1cCBieSB0
aGUgZmlybXdhcmUgYWNjb3JkaW5nIHRvIGxvY2FsIHBvbGljeSwgYW5kIHRoZSBzZXR0aW5ncw0K
PiBjYW4gZWl0aGVyIGJlIHJlYWQgYnkgdGhlIGtlcm5lbCBmcm9tIHJlZ2lzdGVycyBvciBwYXNz
ZWQgZG93biB0aHJvdWdoIHRoZQ0KPiBkZXZpY2UgdHJlZS4gSXQgc291bmRzIGxpa2UgeW91IHdh
bnQgdG8gY29udHJvbCB0aGUgcG9saWN5IGF0IHJ1bnRpbWUgaW4gdGhlDQo+IG9wZXJhdGluZyBz
eXN0ZW0gcmF0aGVyIHRoYW4gYXQgYm9vdCB0aW1lLCBzbyBmb3IgZWFjaCBzZXR0aW5nIHlvdSB3
aXNoIHRvDQo+IG92ZXJyaWRlLCB0aGVyZSBzaG91bGQgYmUgZGVzY3JpcHRpb24gb2Ygd2hhdCB0
aGUgc2V0dGluZyBkb2VzIGFuZCB3aGF0DQo+IHRoZSBwdXJwb3NlIG9mIG92ZXJyaWRpbmcgdGhl
IGZpcm13YXJlIHNldHRpbmcgaXMuDQoNCk9LLCBJIHdpbGwgY2hhbmdlIG1vZHVsZSBwYXJhbWV0
ZXIgZnJvbSBzcGVjaWZpYyByZWdpc3Rlci1sZXZlbCB0byANCmEgaGlnaGVyIGxldmVsLiBBbmQs
IEkgd2lsbCBtb2RpZnkgdGhlIGRlc2NyaXB0aW9uIG9mIG1vZHVsZSBwYXJhbWV0ZXJzLiANClRv
IGJlIGNsZWFyLCB3ZSBkb24ndCBzdXBwb3NlIHRoZXNlIHBhcmFtZXRlcnMgKEVMMSByZWdpc3Rl
cnMpIGFyZSANCm9mdGVuIGNoYW5nZWQgYXQgcnVudGltZS4NCg0KPiBMb29raW5nIGF0IHRoZSBm
aXJzdCBvbmUgaW4gdGhlIGxpc3QsIEkgc2VlIHRoZSBzcGVjaWZpY2F0aW9uIG1lbnRpb25zDQo+
IG11bHRpcGxlIGRpc3RpbmN0IGZlYXR1cmVzIHRoYXQgY2FuIGJlIGVuYWJsZWQgb3IgZGlzYWJs
ZWQsIHNvIHRoZXNlDQo+IHNob3VsZCBwcm9iYWJseSBnZXQgY29udHJvbGxlZCBpbmRpdmlkdWFs
bHkuDQoNCkl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gZW5hYmxlL2Rpc2FibGUgZXZlcnkgZmVhdHVy
ZSBpbmRpdmlkdWFsbHkuIA0KVGhlcmUgYXJlIG5vIHBsYW5zIHRvIHVzZSB0aGVzZSBmZWF0dXJl
cyBpbmRpdmlkdWFsbHkuICANCg0KPiBJIGFsc28gc2VlIHRoYXQgaXQgaXMgcG9zc2libGUNCj4g
dG8gY29udHJvbCB0aGlzIGZvciBUVEJSMSBhbmQgVFRCUjAgc2VwYXJhdGVseSwgYW5kIHdlIHBy
b2JhYmx5DQo+IGNhbm5vdCBhbGxvdyB1c2VyIHNwYWNlICh0aHJvdWdoIG1vZHVsZSBwYXJhbWV0
ZXJzIG9yIGFueSBvdGhlcg0KPiBpbnRlcmZhY2UpIHRvIGNvbnRyb2wgVFRCUjEsIHdoaWNoIGlz
IHdoZXJlIHRoZSBrZXJuZWwgcmVzaWRlcy4NCg0KVGhpcyBkcml2ZXIgZG9lcyBub3QgY2hhbmdl
IHRoZSB2YWx1ZXMgb2YgVFRCUjAgYW5kIFRUQlIxLCANCmFuZCB0aGUgdmFsdWVzIG9mIFRDUl9F
TDEuVEJJMCBhbmQgVENSX0VMMS5UQkkxLg0KVGhlIGNhY2hlIGZ1bmN0aW9ucyBjYW4gYmUgdXNl
ZCB3aGVuIFRCSSBpcyBhbHJlYWR5IGVuYWJsZWQuDQoNCj4gVGhlIFRUQlIwIHNldHRpbmdzIGlu
IHR1cm4gd291bGQgc2VlbSB0byBpbnRlcmFjdCB3aXRoDQo+IENPTkZJR19BUk02NF9NVEUsIGFu
ZCBzaG91bGQgbm90IGJlIGNvbnRyb2xsZWQgaW5kZXBlbmRlbnRseQ0KPiBidXQgdGhyb3VnaCB0
aGUgc2FtZSBpbnRlcmZhY2VzIGFzIHRoYXQgaWYgd2UgZmluZCB0aGF0IGl0IGRvZXMgbmVlZA0K
PiB0byBiZSBjb250cm9sbGVkIGF0IGFsbC4NCg0KTVRFIGlzIG5vdCBzdXBwb3J0ZWQgb24gQTY0
RlguIA0KU28sIHRoaXMgZnVuY3Rpb24gZG9lcyBub3QgY29uZmxpY3Qgd2l0aCBNVEUuDQoNCj4g
SSBoYXZlIG5vdCBsb29rZWQgYXQgYW55IGZ1cnRoZXIgZGV0YWlscywgYnV0IHRoYXQgc2hvdWxk
IGhlbHAgZ2V0IGFuDQo+IGlkZWEgb2Ygd2hhdCBJIHRoaW5rIHdvdWxkIGhhcHBlbiB3aXRoIHRo
ZSBvdGhlciByZWdpc3RlcnMuDQo+IA0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBmdWppdHN1X2Ry
dl9pbml0KHZvaWQpDQo+ID4gK3sNCj4gPiArICAgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsg
ICAgICAgaWYgKHJlYWRfY3B1aWRfaW1wbGVtZW50b3IoKSAhPSBBUk1fQ1BVX0lNUF9GVUpJVFNV
KQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPiArICAgICAgIGlmIChy
ZWFkX2NwdWlkX3BhcnRfbnVtYmVyKCkgIT0gRlVKSVRTVV9DUFVfUEFSVF9BNjRGWCkNCj4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+IA0KPiBUaGUgbW9kdWxlX2luaXQgZnVu
Y3Rpb24gc2hvdWxkIG5vdCByZXR1cm4gYW4gZXJyb3Igd2hlbiBpdCBpcyBydW5uaW5nIG9uDQo+
IGluY29tcGF0aWJsZSBoYXJkd2FyZSwgcGxlYXNlIGp1c3QgY2hhbmdlIHRoaXMgdG8gc2lsZW50
bHkgcmV0dXJuIHN1Y2Nlc3MNCj4gdG8gYXZvaWQgd2FybmluZyBhYm91dCB0aGUgZmFpbGVkIGlu
aXRjYWxsIGlmIHRoZSBkcml2ZXIgaXMgYnVpbHQgaW50byBhIGdlbmVyaWMNCj4ga2VybmVsLg0K
DQpPSywgSSB3aWxsIGNoYW5nZSB0aGVzZSBjb2RlcyB0byByZXR1cm4gc3VjY2Vzcy4gDQoNCkJl
c3QgcmVnYXJkcywgDQpUYW4gU2hhb3BlbmcgIA0KDQo=
