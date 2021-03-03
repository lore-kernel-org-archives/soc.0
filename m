Return-Path: <SRS0=KGfb=IB=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907EEC433DB
	for <soc@archiver.kernel.org>; Wed,  3 Mar 2021 11:22:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3C69F64E2E; Wed,  3 Mar 2021 11:22:54 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Wed, 03 Mar 2021 11:22:52 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D01CD64ED9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com [68.232.151.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D01CD64ED9;
	Wed,  3 Mar 2021 11:22:52 +0000 (UTC)
IronPort-SDR: YLgEskd/p6zl9sHYpp0OgkNdoBvtIq56vlyeEBmzxppymaTkhVSzjp5Up9B6jDNcj+WNed8vGM
 or10VoqtRBx453G2wueFjw6EDtlpQrg2Dh+UP5rVUno9dYMFT/NTKwdpCdhRxvIGz3BFNM4vv3
 chU2MZtziZj6/k3i5Ju+96NMzuaYYzY2pj4nDjXuBUY9rQAC04CXftUegVmHJS3pdMFIppWPgz
 N19TuWj2qaAuizDW/nyD10XKYWGzrdz/Gpk6mWDUDnW0dDVCTzEUQbkWRen7kjSOMXWYkZxCLf
 ZEU=
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="35100324"
X-IronPort-AV: E=Sophos;i="5.81,219,1610377200"; 
   d="scan'208";a="35100324"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 20:21:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBdQF0VPuPyBN9vONpog9gmeRROwZ3eO/fV5LpVoDAPbPGYFD43SlsnwDPFgDGvLyNeZmBtLciiKBX17g6CLzFzsDmo/tj42Q7AgZBiRDmw9Fq4stZS9SUKBEhFTc3xHJD0xi22q+Ndv+UFE5VyW6Ttw9VUHA5ctJJDkt4aAsApo4wtWjZfDNkK9D68QjIofmg9dNDAgT8NsNVaQT1T50BeazBNZz838J+dWwB4DDbhwP108atAbLWORtXGVj4LOEUpELxtIblm7ocX53mYdHSiDqis1X1yeNtiJQNF38eHy+JuZlL2jmWpx5/dpZgidKAQoq43xU9MDXpZwTvkWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FSJJw1Lpxn2xkVEXOM1a+X98pgs+L+9s+cJyVn8ih4=;
 b=SnNoZr6uaXyqpyzcGFBymDnEli6vjxz8oSrS2p51hRshhL9JtOPUX2GE1mHNh9zriDocrmVdkjvmJDzX9a1vACREUR5nGAb37u1uvgNu874NBd0rZTAFC6/TE+8SiTkmMKiXX/yQNp3g6gPeTcvJ8sQvH7gya3FJgjs0gxdSvPCIL3p2/qHxaSwHTWts8iZiUGn1kv0AijMc4OFo5a22R4HVzrvCv7W94FTJiM5zolbl3uKrzCOsEND5fkWdFfP3e7DJMezo1WEUqqu3DlR7ScgqUk0xrbOi1HKsQcXZjwax+cXiqVwhypGbKlvG1Jz9drGkW1mvUil/uJ3qC9VpUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FSJJw1Lpxn2xkVEXOM1a+X98pgs+L+9s+cJyVn8ih4=;
 b=OLPTlC2ZQkm4W+e+VPUTWVNNLDI9xaDw6V9EOX3n8ZiYd3DbLo6JCJG12vIrkg6UV82gEF4fsPFKZnblbdS3U/awJRda2sssqLuvGx+YB3lKdRWQv8p/XHYfX93mgA50/l9XymqjbkfgccVsw+3DXTC6H8W2v+URq+VGZC3Jtrc=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSBPR01MB3704.jpnprd01.prod.outlook.com (2603:1096:604:49::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Wed, 3 Mar
 2021 11:21:41 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056%6]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 11:21:41 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, SoC Team <soc@kernel.org>, Olof Johansson
	<olof@lixom.net>, Will Deacon <will@kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index:
 AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8IAATzYAgAE118CAA2BUgIA1QadggBLz3YCAAYCFwA==
Date: Wed, 3 Mar 2021 11:20:23 +0000
Deferred-Delivery: Wed, 3 Mar 2021 11:21:22 +0000
Message-ID:
 <OSBPR01MB458224BBD6E110002DEA7085E5989@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
 <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
In-Reply-To:
 <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: d6c3619228dd452db4ef2230721b8bb3
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 708b29f7-b8ba-473c-2940-08d8de36854f
x-ms-traffictypediagnostic: OSBPR01MB3704:
x-microsoft-antispam-prvs:
 <OSBPR01MB37049EF0FBA0FCF638418CF2E5989@OSBPR01MB3704.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +/L5c+E1Zivg87NtuLXGZ36o+MmzxMWmHLgWVQMWcgv2v42HvfKV+J5GpamQkoIP5QprpeAfGw8VE5QpJkXuw5Or3IroEPmuUFU27joh4axjFoupasw9xZQXA6xMHkeObhi8yIjHR+BIZs8HkLs5QghgUZ+PWS5p7pmBNYNHzdtcH3gKFxCP8R/N7BIv6vfOTngtPm8pEA70GnMpaZbsfCnATfApl02hwOqq/1WZ3TMsD9IZlmXrvZYE3SnU7xXxXdg3hxpQqYLY1NrBtLNDDbMsACdhymodg0t0ZbC+qLvu4CYkozFJ2TjZv4EWhUD+v7C8Q+R1h6aIVCEBq2rZptQZqvMkI16rgUE34TqHO1Qp9qu5JRjHm+ZTtuxeShk4RVJ9shk/1WwkUzgmTMdx1Cm64pEnTRuY7NYycszbD3nQQrY2UVHYgW/RuEKWUM0PXw9XXPwzX8tyKxtMTRkC8aMqNMpLNZ9BamU5fnOhQ7HhwhLfSC8+uQd+y6R60+Lvxr1k3/SaWgvOkLcs3LsN+BmOLVxCeUYsTLRfGjvGSguaAa2DCKcdbjJFVNsebh09GeODVnBa4GOtmGlmhHFj/f44xHTcr5gfHrfeS3uRJcE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(55016002)(26005)(33656002)(2906002)(186003)(478600001)(66446008)(71200400001)(966005)(52536014)(9686003)(66556008)(64756008)(66476007)(53546011)(6666004)(5660300002)(7696005)(76116006)(66946007)(6506007)(8676002)(83380400001)(316002)(54906003)(85182001)(4326008)(86362001)(6916009)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?OHFXc2JQOVJJeUQ5WE1uSWpLcElaaUt5Y2tFbFZqcTRXbnNoSGpnZEc4NEdF?=
 =?utf-8?B?dGw5TmVYVzVaWUVtOWpmSi9ZMkYveTFMeHJxWXFqckVNcCtIWmVRak1GRXFR?=
 =?utf-8?B?TkY4Vy9kZDlqc0FyUC9PeUpiS0tsUjd4ejAwMnpzbWw4djFYd2x1TjJiT3hN?=
 =?utf-8?B?NXlyVGdwOG9TSHdWSDZKaEl6M2lidUJmQWVXazRhamNKcW5SNFF0RXpXKzBt?=
 =?utf-8?B?Tm4vT2Y5b1R6VzBLMW9aWnZ3cFErMmFEdnFYUklDM3l0ekRONThWdHF2OVBk?=
 =?utf-8?B?QXFxcE5zNDBKUlE3ZzZ0dUJmQ0swU29UNUc5dFhxdlBESnB1T0xBMDJWcGo3?=
 =?utf-8?B?YWNyMFA2MjRoNFROeGRuR1YyV1F2VWtFN0FxU1VISWFEdVZ0VXZUUlE1Y0Fo?=
 =?utf-8?B?S091L1VZZHA0bWcyUWtqMVBIODJVMHUya2pRLzdLcnl0U0ZCODYzQTY4L21Z?=
 =?utf-8?B?TTdpR0RzTXIvQU8ya2xPdnE0eStyRHJ5VzRQSHVUdmUrTFhsaFZ2K2xQb1Yw?=
 =?utf-8?B?UHhxc1owR1BnZ3pmVHJVWGN6b0ExQU5UOGhvSWFjRTFsczg0ZVRjZVkxcm9h?=
 =?utf-8?B?RkN3bThKb0tiM0thMlJJYzRvUno2aEF0UG95R3FMRTJKcEtSVWRCcE9VeFlu?=
 =?utf-8?B?eHh6YjRCOVIyTFNRSncyOWgyNzljWjdGUDl2T1RVWk9BUkoyTUdnZ3Y2cFJW?=
 =?utf-8?B?UzlEaDZNbWI3WmtESTlJQXk3KzR6dXdoemxqdmorSzRaOEU0ZEFLVjQ2SkdK?=
 =?utf-8?B?UVJTc3p6UEw2N2NPSDNPZHlNaXNKV0J5UjMvZWppTHpiTW5XQnFhRlQxQjB2?=
 =?utf-8?B?Z0MrdkZDUFRRT2xqNlJhZTVib1RVVUJtQTRjUmx2cDNScU02a0tNNnkwdlpy?=
 =?utf-8?B?ajBzUEJ4QnRCYnIrUU5YYTIwZVJPK050d0VpN2JLRkpzMnJBdG11UGNQY1po?=
 =?utf-8?B?RmFjMUthS3YvRlNFejRrZDFsRktYR0JaRHFYbUo4WFlQQ2ZGVWZwT0M4VmF4?=
 =?utf-8?B?aVNiTXR3Zlg3MlgzaXhLREdxOWFydWNabmMvV0VqNjNNQU80SWRoaURKbGxk?=
 =?utf-8?B?UEEzMWRwV1hlUEJPQ2twTnkrMVVLMmk5RW5DbitFSUV5MmRSbFdJTG94Z0hO?=
 =?utf-8?B?NE4vUEljRWxlRVFMYmpQVmJTeTZGemt5bmlmTlhKcGlENHpoYjNWQStjSWRj?=
 =?utf-8?B?NVVJQnRqUmkrSGhpQlMrQk5JVU1sNXJzdXBTRDlPYklRaUkyWFRaamdkcFcy?=
 =?utf-8?B?TVgzUitPWnZRS3dlVDZqRnd6OWpzU2I2OGNGYUpXVjRLWGNaYUVXcnhsUUo2?=
 =?utf-8?B?bjZMSFltMWtmLzlhR0pKbDRVRm03TWsraUI2R2lHVS9EQlBwNGFkNDR6Ni9l?=
 =?utf-8?B?c2d6L0swY2dVNXdxOU9XaTRkUENFemo3L2kyQm83WEZvRWJjajBMcm8rQmhz?=
 =?utf-8?B?ZVAxODYzN3lpdnBpaWwyQTJGRjVjQ1lzRTBUUm83UXByK0RKOU5PbXlKaXNI?=
 =?utf-8?B?U0JHOGR3cGtpdnFLYitSTDFhc0FtSWk5N1o5ckwrWEozZ1gxcy9JclFacjcw?=
 =?utf-8?B?Qk9KdjNYYlgxcVQ1UVNZZHBlMkM4VkxwTzZ1ZEduYlpTTEdRaFY0d2VCNUov?=
 =?utf-8?B?MFEvckhxTzRSWmh4Z3k3SzFjOUdLY1ZNZ1JQdUZaQkhsV1lIaUVPY1hkT0pu?=
 =?utf-8?B?QlNkYjJxZ003STlLbmw3azZwbVEwVFkxZEtxcS9pTFBOS1BQSnF2UVFXaE1u?=
 =?utf-8?Q?EgFNOzqqQRQGTf64+tdVN8nnsIxGWTLxy3GwB8d?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708b29f7-b8ba-473c-2940-08d8de36854f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 11:21:41.7773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SI+W72vlSp2cXSu+pyY9dUHR1a+PD00E7bExFxis6kRBKYes2E6ZAENj48tYiwbqm7rmKWz4md2ylldZ29mbup8xxKXhzPgebzvPODWamhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3704

T24gVGh1LCBGZWIgMTgsIDIwMjEgYXQgMTA6NDkgQU0gbWlzb25vLnRvbW9oaXJvQGZ1aml0c3Uu
Y29tDQo+IDxtaXNvbm8udG9tb2hpcm9AZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiA+
ID4gPiBBbHNvLCBJdCBpcyBjb21tb24gdXNhZ2UgdGhhdCBlYWNoIHJ1bm5pbmcgdGhyZWFkIGlz
IGJvdW5kIHRvIG9uZSBQRSBpbg0KPiA+ID4gPiA+ID4gbXVsdGktdGhyZWFkZWQgSFBDIGFwcGxp
Y2F0aW9ucy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEkgdGhpbmsgdGhlIGV4cGVjdGF0aW9uIHRo
YXQgYWxsIHRocmVhZHMgYXJlIGJvdW5kIHRvIGEgcGh5c2ljYWwgQ1BVDQo+ID4gPiA+ID4gbWFr
ZXMgc2Vuc2UgZm9yIHVzaW5nIHRoaXMgZmVhdHVyZSwgYnV0IEkgdGhpbmsgaXQgd291bGQgYmUg
bmVjZXNzYXJ5DQo+ID4gPiA+ID4gdG8gZW5mb3JjZSB0aGF0LCBlLmcuIGJ5IGFsbG93aW5nIG9u
bHkgdGhyZWFkcyB0byBlbmFibGUgaXQgYWZ0ZXIgdGhleQ0KPiA+ID4gPiA+IGFyZSBpc29sYXRl
ZCB0byBhIG5vbi1zaGFyZWQgQ1BVLCBhbmQgYXV0b21hdGljYWxseSBkaXNhYmxpbmcgaXQNCj4g
PiA+ID4gPiBpZiB0aGUgQ1BVIGlzb2xhdGlvbiBpcyBjaGFuZ2VkLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gRm9yIHRoZSB1c2VyIHNwYWNlIGludGVyZmFjZSwgc29tZXRoaW5nIGJhc2VkIG9uIHBy
b2Nlc3MgSURzDQo+ID4gPiA+ID4gc2VlbXMgdG8gbWFrZSBtb3JlIHNlbnNlIHRvIG1lIHRoYW4g
c29tZXRoaW5nIGJhc2VkIG9uIENQVQ0KPiA+ID4gPiA+IG51bWJlcnMuIEFsbCBvZiB0aGUgYWJv
dmUgZG9lcyByZXF1aXJlIHNvbWUgbGV2ZWwgb2YgaW50ZWdyYXRpb24NCj4gPiA+ID4gPiB3aXRo
IHRoZSBjb3JlIGtlcm5lbCBvZiBjb3Vyc2UuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJIHRoaW5r
IHRoZSBuZXh0IHN0ZXAgd291bGQgYmUgdG8gdHJ5IHRvIGNvbWUgdXAgd2l0aCBhIGhpZ2gtbGV2
ZWwNCj4gPiA+ID4gPiB1c2VyIGludGVyZmFjZSBkZXNpZ24gdGhhdCBoYXMgYSBjaGFuY2UgdG8g
Z2V0IG1lcmdlZCwgcmF0aGVyIHRoYW4NCj4gPiA+ID4gPiBhZGRyZXNzaW5nIHRoZSByZXZpZXcg
Y29tbWVudHMgZm9yIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLg0KPiA+DQo+ID4gSGVsbG8s
DQo+ID4NCj4gPiBTb3JyeSBmb3IgbGF0ZSByZXNwb25zZSBidXQgd2hpbGUgdGhpbmtpbmcgbmV3
IGFwcHJvYWNoZXMsIEkgY29tZSB1cCB3aXRoDQo+ID4gc29tZSBkaWZmZXJlbnQgaWRlYSBhbmQg
d2FudCB0byBoZWFyIHlvdXIgb3BpbmlvbnMuIEhvdyBhYm91dCBvZmZsb2FkDQo+ID4gYWxsIGNv
bnRyb2wgdG8gdXNlciBzcGFjZSB3aGlsZSB0aGUgZHJpdmVyIGp1c3Qgb2ZmZXJzIHJlYWQvd3Jp
dGUgYWNjZXNzDQo+ID4gdG8gdGhlIG5lZWRlZCByZWdpc3RlcnM/IExldCBtZSBleHBsYWluIGlu
IGRldGFpbC4NCj4gPg0KPiA+IEFsdGhvdWdoIEkgc2VhcmNoZWQgc2ltaWxhciBmdW5jdGlvbnMg
aW4gb3RoZXIgcHJvZHVjdHMsIEkgY291bGQgbm90IGZpbmQNCj4gPiBpdC4gQWxzbywgdGhpcyBo
YXJkd2FyZSBiYXJyaWVyIHBlcmZvcm1zIGludHJhLW51bWEgc3luY2hyb25pemF0aW9uIGFuZA0K
PiA+IGl0IGlzIGhhcmQgdG8gYmUgdXNlZCBmb3IgZ2VuZXJhbCBpbnRlci1wcm9jZXNzIGJhcnJp
ZXIuIFNvIEkgdGhpbmsNCj4gPiBnZW5lcmFsaXppbmcgdGhpcyBmZWF0dXJlIGluIGtlcm5lbCBk
b2VzIG5vdCBnbyB3ZWxsLg0KPiANCj4gT2ssIHRoYW5rIHlvdSBmb3IgdGFraW5nIGEgbG9vay4N
Cj4gDQo+ID4gQXMgSSBzYWlkIHRoaXMgaXMgbWFpbmx5IGZvciBIUEMgYXBwbGljYXRpb24uIElu
IHRoZSB1c3VhbCBzaXR1YXRpb25zLCB0aGUNCj4gPiB1c2VyIGhhcyBmdWxsIGNvbnRyb2wgb2Yg
dGhlIFBDIG5vZGVzIHdoZW4gcnVubmluZyBIUEMgYXBwbGljYXRpb24gYW5kDQo+ID4gdGh1cyB0
aGUgdXNlciBoYXMgZnVsbCByZXNwb25zaWJpbGl0eSBvZiBydW5uaW5nIHByb2Nlc3NlcyBvbiB0
aGUgbWFjaGluZS4NCj4gPiBPZmZsb2FkaW5nIGFsbCBjb250cm9scyB0byB0aGVzZSByZWdpc3Rl
cnMgdG8gdGhlIHVzZXIgaXMgYWNjZXB0YWJsZSBpbiB0aGF0DQo+ID4gY2FzZSAoaS5lLiB0aGUg
ZHJpdmVyIGp1c3Qgb2ZmZXJzIGFjY2VzcyB0byB0aGUgcmVnaXN0ZXJzIGFuZCBkb2VzIG5vdCBj
b250cm9sIGl0KS4NCj4gPiBUaGlzIGlzIHRoZSBzYWZlIGZvciB0aGUga2VybmVsIG9wZXJhdGlv
biBhcyBtYW5pcHVsYXRpbmcgYmFycmllciByZWxhdGVkDQo+ID4gcmVnaXN0ZXJzIGp1c3QgYWZm
ZWN0cyB1c2VyIGFwcGxpY2F0aW9uLg0KPiA+DQo+ID4gSW4gdGhpcyBhcHByb2FjaCB3ZSBjb3Vs
ZCByZW1vdmUgaW9jdGxzIG9yIGNvbnRyb2wgbG9naWMgaW4gdGhlIGRyaXZlciBidXQNCj4gPiB3
ZSBuZWVkIHNvbWUgd2F5IHRvIGFjY2VzcyB0aGUgbmVlZGVkIHJlZ2lzdGVycy4gSSBmaXJzdGx5
IHRoaW5rIGlmIEkgY2FuDQo+ID4gdXNlIHg4NidzIE1TUiBkcml2ZXIgbGlrZSBhcHByb2FjaCBi
dXQgSSBrbm93IHRoZSBpZGVhIGlzIHJlamVjdGVkDQo+ID4gcmVjZW50bHkgZm9yIHNlY3VyaXR5
IGNvbmNlcm5zOg0KPiA+ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVs
LzIwMjAxMTMwMTc0ODMzLjQxMzE1LTEtcm9uZ3dlaS53YW5nQGxpbnV4LmFsaWJhYmEuY29tLw0K
PiA+DQo+ID4gQmFzZWQgb24gdGhlc2Ugb2JzZXJ2YXRpb25zLCBJIGhhdmUgdHdvIGlkZWFzIGN1
cnJlbnRseToNCj4gPiAgMSkgbWFrZSB0aGUgZHJpdmVyIHRvIG9ubHkgZXhwb3NlIHN5c2ZzIGlu
dGVyZmFjZSBmb3IgcmVhZGluZy93cml0aW5nDQo+ID4gICAgQTY0RlgncyBiYXJyaWVyIHJlZ2lz
dGVycw0KPiA+IG9yDQo+ID4gIDIpIGdlbmVyYWxpemluZyAoMSkgaW4gc29tZSB3YXk7IFRvIG1h
a2Ugc29tZSBtZWNoYW5pc20gdG8gZXhwb3NlDQo+ID4gICAgQ1BVIGRlZmluZWQgcmVnaXN0ZXJz
IHdoaWNoIGNhbiBiZSBzYWZlbHkgYWNjZXNzZWQgZnJvbSB1c2VyIHNwYWNlDQo+ID4NCj4gPiBB
cmUgdGhlc2UgaWRlYSBhY2NlcHRhYmxlIHdheXMgdG8gZXhwbG9yZSB0byBnZXQgbWVyZ2VkIGlu
IHVwc3RyZWFtPw0KPiA+IEknZCBhcHByZWNpYXRlIGFueSBjcml0aWNpc20vY29tbWVudHMuDQo+
IA0KPiBJJ20gYWxzbyBydW5uaW5nIG91dCBvZiBpZGVhcyBoZXJlLiBJIGRvbid0IHRoaW5rIGEg
c3lzZnMgaW50ZXJmYWNlIHdvdWxkDQo+IGJlIGFueSBkaWZmZXJlbnQgdG8geW91ciBlYXJsaWVy
IGlvY3RsIGludGVyZmFjZSBvciB0aGUgdGhlIC9kZXYvbXNyIGFwcHJvYWNoLA0KPiB0aGV5IGFs
bCBzaGFyZSB0aGUgc2FtZSBwcm9ibGVtIHRoYXQgdGhleSBleHBvc2UgbG93LWxldmVsIGFjY2Vz
cyB0bw0KPiBwbGF0Zm9ybSBzcGVjaWZpYyByZWdpc3RlcnMgaW4gYSB3YXkgdGhhdCBpcyBuZWl0
aGVyIHBvcnRhYmxlIG5vciBzYWZlIHRvDQo+IHVzZSBmb3IgZ2VuZXJhbC1wdXJwb3NlIGFwcGxp
Y2F0aW9ucyBvdXRzaWRlIHRoZSB2ZXJ5IG5hcnJvdyBzY29wZQ0KPiBvZiBydW5uaW5nIGhpZ2hs
eSBvcHRpbWl6ZWQgSFBDIGFwcGxpY2F0aW9ucy4NCg0KT2ssIGJ1dCBBUk0gYXJjaGl0ZWN0dXJl
IHBlcm1pdHMgaW1wbGVtZW50YXRpb24gZGVmaW5lZCByZWdpc3RlcnMgYXQgdGhlDQpmaXJzdCBw
bGFjZS4gU28gY2FuIHdlIHByb3ZpZGUgc29tZSBtZXRob2QvaW50ZXJmYWNlIHRvIGFjY2VzcyB0
aGVtIGFzDQpDUFUgZmVhdHVyZSBpZiB0aGVzZSByZWdpc3RlcnMgZG8gbm90IGF0IGxlYXN0IGFm
ZmVjdCBrZXJuZWwgb3BlcmF0aW9ucyAobGlrZQ0KdGhpcyBiYXJyaWVyKSBhbmQgb25seSByb290
IGNhbiBhY2Nlc3MgdGhlbT8gTGlicmFyeSBjb3VsZCBvZmZlciBwb3J0YWJsZSB3YXkNCmZvciB1
c2VyIGFwcGxpY2F0aW9ucyAodW5kZXIgcm9vdCBwZXJtaXNzaW9uKSB0byBhY2Nlc3MgdGhlbS4N
Cg0KPiBZb3UgY2FuIG9mIGNvdXJzZSBjb250aW51ZSB1c2luZyB0aGUgbW9kdWxlIHlvdSBoYXZl
IGFzIGFuIGV4dGVybmFsDQo+IG1vZHVsZSB0aGF0IGdldHMgYnVpbHQgb3V0c2lkZSBvZiB0aGUg
a2VybmVsIGl0c2VsZiwgYW5kIHNoaXBwZWQgYWxvbmcNCj4gd2l0aCB0aGUgYXBwbGljYXRpb24g
b3IgbGlicmFyeSB1c2luZyBpdCwgcmF0aGVyIHRoYW4gd2l0aCB0aGUga2VybmVsLg0KPiBPYnZp
b3VzbHkgdGhpcyBpcyBub3Qgc29tZXRoaW5nIEkgd291bGQgZ2VuZXJhbGx5IHJlY29tbWVuZCBl
aXRoZXIsDQo+IGJ1dCB0aGlzIG1heSBiZSB0aGUgbGFzdCByZXNvcnQgdG8gZmFsbCBiYWNrIHRv
IHdoZW4gZXZlcnl0aGluZyBlbHNlDQo+IGZhaWxzLg0KDQpVbmRlcnN0b29kLiBUaGlzIGlzIHRo
ZSBsYXN0IHJlc29ydC4NClRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHlvdSBoZWxwLg0KDQpSZWdhcmRz
LA0KVG9tb2hpcm8NCg==
