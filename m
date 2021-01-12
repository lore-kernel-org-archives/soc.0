Return-Path: <SRS0=bXzz=GP=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDC5C433E0
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 10:50:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC86C23109; Tue, 12 Jan 2021 10:50:47 +0000 (UTC)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D2CF2250E;
	Tue, 12 Jan 2021 10:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D2CF2250E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: Q0CoGtMKJbcaIsxmtFKfXk1sCAiOOaFU9BKZop8x6Dw/XBBo7pwsH6f6yDInaIiL2omAFQGp+4
 5oyG7kUGPWVr+N7Bbjc5ijTaVBAX/amZWUn30VFmPLWs45VPKA34/1tNybHZW16UtpCC4f6Ezs
 Yj208ZuS2s36WRf+2am95RHxu0wXBgdDapaDvs6wvY/yJ4Lls4oGidfTbaLv/5YHVYH6BpsRiH
 TcOTRX5YP64zX7Eaauflgm97xGKycGxd7yu8efBySOQeqdUe8WlhIDBQzWzdega6PcARaHalU0
 y3I=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="24347794"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; 
   d="scan'208";a="24347794"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 19:50:42 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj97qgqjPz3jFqvLre1lPGSzI9yV2vOGCYyihHY7iflZOk3z9Sk+XOVBYa1EQVSlJB50MXuQKogsG0oBOgezFI3kTHAr13YrIZSM/Idb90aMOdVtaasggOROHyRyvgLXH13rOFsU4O4z95lBjjBLYmijDyWVEzToPVlfH/2xs89mMwW5UWFMqRtAzFWC7dseuI8ak+8wvGv1zsmHM/Wk73GWIFlHRRXzgUHBY9mGgAKLbwTm85g2JJyd6UULDKEphHId0n4h/Bu/h7/Kgth0Brf2D3qqv5Hpi73q5UGpTMXj8PdUzAu9Pzwut6FAuAJczsMNHz2dkFh/pGx0VXDgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMnVF6vWKYxutY/SIcRC97TlinYc+Leyjhp0zuH+ya8=;
 b=mXUtVehbCOKkzwEKPbJoE1xdZVinFz8MEB9BWiTuiEuxfn7R/CWGlDFE2l+XHz4NdJHOSGL5/mqqW7zfwEqItoiFL0MVKWVMn2PxBDplS+agnu/SINeK8VV2S+ficzyWpEuiWt0XUPcgN3KnEuuD3IvouAmrDQJBKDd2o8BZK1JOGaz4PiUUO6/1lNXIG882KFBGyhyYBUQjZQTcR4gsCIMtvmNoDwXm+CyqLFQVzAWcqvt/Tc4M2UTVlLsFPIbSzOiFhk76OgXCWjAzD7eXv4wI8RzW4/xUnLy2jYrFZIYedLWV39H5aI1yp4KsngBd502Glz2kUu3jUmWuQ16H/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMnVF6vWKYxutY/SIcRC97TlinYc+Leyjhp0zuH+ya8=;
 b=KfeMKgVkYnol8/OB8nB+RVKeFhKH0aBl5TK12lRO5FBnfc9zc2yRoLc9i25peA48GPsL747976zmEAqAFDf8G6U4IJivNjQpuCaZ6sdHgr6FQdRdRBh3dI38ZIEzEuKsmDmUVagHWi74P5bsHXmKpnPDyXWUXos6CCfsI3L0YU8=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSBPR01MB1576.jpnprd01.prod.outlook.com (2603:1096:603:6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.10; Tue, 12 Jan
 2021 10:50:40 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:50:40 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team
	<soc@kernel.org>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
	<olof@lixom.net>
Subject: RE: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
Thread-Topic: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
Thread-Index: AQHW5afs5N54s+MgtEWWkkqkCyxp9qodh8MAgAAkMICABii1MA==
Date: Tue, 12 Jan 2021 10:49:30 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:50:30 +0000
Message-ID:
 <OSBPR01MB4582FBC2071D33B43770B73DE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
 <20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
 <CAK8P3a15PUC5Tu+FBuyZYtyQUC_bc92zVszYeFoCU6tn05jgMA@mail.gmail.com>
In-Reply-To:
 <CAK8P3a15PUC5Tu+FBuyZYtyQUC_bc92zVszYeFoCU6tn05jgMA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: 566a2881088d41a9a3f71bc179e8c431
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56f22aab-b689-4cdb-b4a1-08d8b6e7e6e1
x-ms-traffictypediagnostic: OSBPR01MB1576:
x-microsoft-antispam-prvs:
 <OSBPR01MB1576C33EA6EA9FE48BDA46EAE5AA0@OSBPR01MB1576.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uW3VSXYZQJaz1JXWWLzSnJs/vL+6dRPFMALTTj9sGMqrDdC3G5K2FJ64AQIDcW8IpE1GBYaqviM0ieJE/HpCL55GOFFqkzONg1tUEWgvGXUvDegEJ9CsXMC+MTWoE5cQddFe3KuBubgBIaDH8LgYMAXoBRzqkVZq3Tlm7HLIfFK+5jnH57fC8/B22rCgE5yxrjMafcE5fWfgGTk3082ewdKn8wljp8upTbukBCFeDwnWqHaB5apgUGSBoSZWOlKLNWMJNtCHYKXGS7qK1VzsI6YF5j77JyJoQo4yi/2pvvhqbBEUqFT4wZX6JTqfOrRrLQC6ci2BmW8XK+DyvQMBgiVUI+soveCC4t2MUpFkyWtHugQ8ngM8KE59uNEvbe4qhkcWndVVFtZLZBb1g+9YmQeXXcMRUk1UmlfTfPuLhMisEyTAHiW5+y0qdOxV+IDF88vjj3dhH5vf82ULUqNmOZQgAfE+Zn5vPUvd70dJHiVLfbvcBhMoBfyb8CJpsEnyL5rCvHyb3Fdz/DEwwbu5Zw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(26005)(9686003)(71200400001)(186003)(6916009)(76116006)(66446008)(8676002)(8936002)(2906002)(966005)(316002)(85182001)(54906003)(6506007)(64756008)(4326008)(52536014)(66476007)(53546011)(478600001)(5660300002)(83380400001)(86362001)(66556008)(66946007)(6666004)(33656002)(7696005)(55016002)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?MTJaNGF3MUo4akR3ZWhUcW1meEp6dHE5dkVMUG01MjVlS2xVNU5jY256VGpk?=
 =?utf-8?B?Q2lrSGQybmRXZTZxN1FZWFJZZm51MGcyNTQzMjg0NGptc20vdUZOc1FxaExZ?=
 =?utf-8?B?aXVvMFZsSGpXMVBGNGlDN0h4RG03Nzl6U1BKQktZWmFuWG1WMXpEaE1QaFJK?=
 =?utf-8?B?dnQyeDB4MmtYYy9jVEtDNzFEWkNYL3VDdFpHV0Z1QlZOVk04Y0hNNlcxZEZ0?=
 =?utf-8?B?SlhrTG5qM0FudDNtVHplZHNWN2tyYmtUY1dDeElnUFNZRTZLS0puS3BJMW8w?=
 =?utf-8?B?eGdyQUwzZUZBbnNmR0oxejNmaXlwZDBpbVF5cUlrOVBQVHdMckZmUHczY24y?=
 =?utf-8?B?MFlJYUpFMGx0aTAyZm1VazNoWis1SVFiNXR2VW5ZRlQwMm9SZldKOC9yYTNy?=
 =?utf-8?B?emRRTG0xcVR1SmhDZnVHaEpFTXI2eU1NL2hKWHhEMVlzQyt1aWxOaFI5WlRN?=
 =?utf-8?B?NExySUxsUnZLWjZLMENpM0xOVnIwRzFXc0pWWm1KOG5yUGE3dlE4WnBZYjB1?=
 =?utf-8?B?WjNEOFJsSUFXeWo3SlcyZC9Sc2M4a2t3KzFCTy9CbjkrNUVYQzRNaksreWR6?=
 =?utf-8?B?Z2tnZ0NyOTJIdGp1Wk9sMTh6VkE0OENPMWozTUJtZkcwaGtQcDd3akxJUzdq?=
 =?utf-8?B?MGk4a0QxWllTc1V6bHhOOS9QZWdRaXN2cUpST1hNSDE2THN6N2JjTHQwYmt5?=
 =?utf-8?B?UWxlYjF1Z1BOQlNPSmt4MFZWTzhiSWV5SHlzSUx2ZHN1bW9xVUkyZzRXM29a?=
 =?utf-8?B?c2k0RU02QWhMZXhzTmNUcjE0ZkJEbGlPbS9SSE9XNjZsM0NBYSsvMmxIWTJs?=
 =?utf-8?B?VTg1SUFKZzZ2cG1hdUF3MkVsd0xRYkJMM0RMSW5IMHMxRjl2c0w2RUtVdEdq?=
 =?utf-8?B?a2dQbS9XSFJ4VUNvbHlXMytsbndwUmZJOGdraUI2WENHc3ovcGpYMGN6TzNY?=
 =?utf-8?B?UCt6aHg3T1Z6QUdkcHpFMEQzZXFDTUVqVjZ3WW1kZktlR3piU2x4aEY5QTds?=
 =?utf-8?B?b0oxckVEOHNxY1IxOFVFa1oveVlmNzUyamQ5S0ExU2JwZEEwaEsvcW9iQXJO?=
 =?utf-8?B?WDE4N2Fyek9rMUdXMkZmQnJJRHpQcXpZVWR5dkZDRFZqZUFOajBKOXhYYTYr?=
 =?utf-8?B?T0ptKzVVSmRzVkdmbytzcmpQelVpV2ZWYXE3TkliRnNGRkJJNFRZT2J0dHpy?=
 =?utf-8?B?SnRMWFMvYmlvR2U4Z3B2YjJUb2p2SWZ0S0dGSTFPSGIrTGwyWkc4alp6L2VQ?=
 =?utf-8?B?enRuc2ZCa3dNMFNxaTVDa1B5cm1KVWJrQkVNdHFncG1PeWdKTktTVHl1ci91?=
 =?utf-8?Q?VPMT+29yvw/X4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f22aab-b689-4cdb-b4a1-08d8b6e7e6e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:50:39.9857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tqklq6fBcTiTZrt4kaQ04ssE8pIB0XI/HmkyBwrLlOsiUUByJ9WQN5c/79gUKrUuVJwWn8+obUEwH2Zp6m0FxKyolYHIPaFFeMOf8Z1VZ9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1576

PiBPbiBGcmksIEphbiA4LCAyMDIxIGF0IDExOjMyIEFNIE1pc29ubyBUb21vaGlybw0KPiA8bWlz
b25vLnRvbW9oaXJvQGpwLmZ1aml0c3UuY29tPiB3cm90ZToNCj4gPiArICoNCj4gPiArICogVGhp
cyBoYXJkd2FyZSBiYXJyaWVyIChIV0IpIGRyaXZlciBwcm92aWRlcyBhIHNldCBvZiBpb2N0bHMg
dG8gcmVhbGl6ZSBzeW5jaHJvbml6YXRpb24NCj4gPiArICogYnkgUEVzIGluIHRoZSBzYW1lIENv
bWUgTWVtb3J5IEdyb3VwIChDTUcpIGJ5IHVzaW5nIGltcGxlbWVudGF0aW9uIGRlZmluZWQgcmVn
aXN0ZXJzLg0KPiA+ICsgKiBPbiBBNjRGWCwgQ01HIGlzIHRoZSBzYW1lIGFzIEwzIGNhY2hlIGRv
bWFpbi4NCj4gPiArICoNCj4gPiArICogVGhlIG1haW4gcHVycG9zZSBvZiB0aGUgZHJpdmVyIGlz
IHNldHRpbmcgdXAgcmVnaXN0ZXJzIHdoaWNoIGNhbm5vdCBiZSBhY2Nlc3NlZA0KPiA+ICsgKiBm
cm9tIEVMMC4gSG93ZXZlciwgYWZ0ZXIgaW5pdGlhbGl6YXRpb24sIEJTVF9TWU5DL0xCU1lfU1lO
QyByZWdpc3RlcnMgd2hpY2ggaXMgdXNlZA0KPiA+ICsgKiBpbiBzeW5jaHJvbml6YXRpb24gbWFp
biBsb2dpYyBjYW4gYmUgYWNjZXNzZWQgZnJvbSBFTDAgKHRoZXJlZm9yZSBpdCBpcyBmYXN0KS4N
Cj4gPiArICoNCj4gPiArICogU2ltcGxpZmllZCBiYXJyaWVyIG9wZXJhdGlvbiBmbG93IG9mIHVz
ZXIgYXBwbGljYXRpb24gaXMgYXMgZm9sbG93czoNCj4gPiArICogIChvbmUgUEUpDQo+ID4gKyAq
ICAgIDEuIENhbGwgSU9DX0JCX0FMTE9DIHRvIHNldHVwIElOSVRfU1lOQyByZWdpc3RlciB3aGlj
aCBpcyBzaGFyZWQgaW4gYSBDTUcuDQo+ID4gKyAqICAgICAgIFRoaXMgc3BlY2lmaWVzIHdoaWNo
IFBFcyBqb2luIHN5bmNocm9uaXphdGlvbg0KPiA+ICsgKiAgKG9uIGVhY2ggUEUgam9pbmluZyBz
eW5jaHJvbml6YXRpb24pDQo+ID4gKyAqICAgIDIuIENhbGwgSU9DX0JXX0FTU0lHTiB0byBzZXR1
cCBBU1NJR05fU1lOQyByZWdpc3RlciBwZXIgUEUNCj4gPiArICogICAgMy4gQmFycmllciBtYWlu
IGxvZ2ljIChhbGwgbG9naWMgcnVucyBpbiBFTDApDQo+ID4gKyAqICAgICAgYSkgV3JpdGUgMSB0
byBCU1RfU1lOQyByZWdpc3Rlcg0KPiA+ICsgKiAgICAgIGIpIFJlYWQgTEJTWV9TWU5DIHJlZ2lz
dGVyDQo+ID4gKyAqICAgICAgYykgSWYgTEJTWV9TWU5DIHZhbHVlIGlzIDEsIHN5bmMgaXMgZmlu
aXNoZWQsIG90aGVyd2lzZSBnbyBiYWNrIHRvIGINCj4gPiArICogICAgICAgICAoSWYgYWxsIFBF
cyBqb2luaW5nIHN5bmNocm9uaXphdGlvbiB3cml0ZSAxIHRvIEJTVF9TWU5DLCBMQlNZX1NZTkMg
YmVjb21lcyAxKQ0KPiA+ICsgKiAgICA0LiBDYWxsIElPQ19CV19VTkFTU0lHTiB0byByZXNldCBB
U1NJR05fU1lOQyByZWdpc3Rlcg0KPiA+ICsgKiAgKG9uZSBQRSkNCj4gPiArICogICAgNS4gQ2Fs
bCBJT0NfQkJfRlJFRSB0byByZXNldCBJTklUX1NZTkMgcmVnaXN0ZXINCj4gPiArICovDQo+IA0K
PiBPbiBhIHZlcnkgZ2VuZXJhbCBub3RlLCBJIHdvdWxkIGxpa2UgdG8gc2VlIHNvbWUgYmFja2dy
b3VuZCBhYm91dCBob3cNCj4gc3BlY2lmaWMgdGhpcyBmdW5jdGlvbmFsaXR5IGlzIHRvIHRoZSBz
cGVjaWZpYyBkZXNpZ24gb2YgQTY0ZnguIElmIHRoZXJlIGFyZQ0KPiBvdGhlciBwcm9jZXNzb3Jz
IHdpdGggYSBzaW1pbGFyIHJlcXVpcmVtZW50LCB0aGVuIGl0IHdvdWxkIGJlIGJlc3QgdG8NCj4g
ZGVmaW5lIGEgbW9yZSBhYnN0cmFjdCB1c2VyIEFQSSB0aGF0IGNhbiB3b3JrIGZvciBhbnkgc3Vj
aCBwcm9kdWN0Lg0KDQpBcyBJIHNhaWQgaW4gcmVwbHkgdG8gY292ZXIgbGV0dGVyLCBJIGRvbid0
IGtub3cgYW55IG90aGVyIHByb2R1Y3QgaGF2aW5nIHNpbWlsYXIgZmVhdHVyZXMuDQogKHJlcGx5
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjEwMTA4MTA1MjQx
LjE3NTc3OTktMS1taXNvbm8udG9tb2hpcm9AanAuZnVqaXRzdS5jb20vVC8jbWRiOWRkOGY4Y2I4
ZmQwYjFjZTI0OTgzZWZiOGI2MTZhMzhmNGI4ZTgpDQoNCj4gPiArc3RhdGljIGludCBfX2luaXQg
aHdiX2luaXQodm9pZCkNCj4gPiArew0KPiA+ICsgICAgICAgaW50IHJldDsNCj4gPiArDQo+ID4g
KyAgICAgICByZXQgPSBzZXR1cF9od2luZm8oKTsNCj4gPiArICAgICAgIGlmIChyZXQgPCAwKSB7
DQo+ID4gKyAgICAgICAgICAgICAgIHByX2VycigiVW5zdXBwb3J0ZWQgQ1BVIHR5cGVcbiIpOw0K
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgICAgfQ0KPiANCj4gTG9h
ZGluZyB0aGUgbW9kdWxlIG9uIGEgZGlmZmVyZW50IG1hY2hpbmUgc2hvdWxkIG5vdCBwcmludCBh
IHdhcm5pbmc6DQo+IEluIGdlbmVyYWwsIHdlIHdhbnQgaXQgdG8gYmUgcG9zc2libGUgdG8gaGF2
ZSBhbGwgaGFyZHdhcmUgc3BlY2lmaWMNCj4gZHJpdmVycyBidWlsdCBpbnRvIHRoZSBrZXJuZWws
IGJ1dCBub3QgcHJpbnQgYW55IGlycml0YXRpbmcgbWVzc2FnZXMNCj4gd2hlbiB0aGV5IGFyZSBz
aW1wbHkgbm90IHVzZWQgb24gdGhlIGhhcmR3YXJlLg0KPiANCj4gT25lIHdheSB0byBhdm9pZCB0
aGlzIHdvdWxkIGJlIHRvIHVzZSBhIHBsYXRmb3JtX2RyaXZlcigpIHRoYXQNCj4gb25seSBnZXRz
IGxvYWRlZCB3aGVuIGEgY29ycmVzcG9uZGluZyBoYXJkd2FyZSBkZXZpY2Ugb2Ygc29tZQ0KPiBz
b3J0IGlzIGZvdW5kLCBvciBpZ25vcmVkIG90aGVyd2lzZS4NCg0KQXMgZmFyIGFzIEkgdW5kZXJz
dGFuZCwgdG8gdXNlIHBsYXRmb3JtX2RyaXZlcigpIHRoZSBzeXN0ZW0gbmVlZHMgdG8gcHJvdmlk
ZSBkZXZpY2UgdHJlZSBvcg0KQUNQSSBlbnRyeSBmb3IgdGhlIGRyaXZlci4gVGFyZ2V0IHN5c3Rl
bSB1c2VzIEFDUEkgYnV0IHRoZXJlIGlzIG5vIGNvcnJlc3BvbmRpbmcgQUNQSSBISUQNCmZvciB0
aGlzIGhhcmR3YXJlIGJhcnJpZXIgZmVhdHVyZSBhcyB0aGF0IGlzIGFuIGV4dGVuc2lvbiBmZWF0
dXJlIHRvIHRoZSBwcm9jZXNzb3IuDQpTbywgSSB0aG91Z2h0IGl0IGlzIG5vdCBhcHBsaWNhYmxl
IHRvIHVzZSBwbGF0Zm9ybV9kcml2ZXIoKS4NCg0KQXQgbGVhc3QsIEkgd2lsbCByZW1vdmUgdGhp
cyBwcl9lcnIoKSBJZiBJIHNlbmQgdXBkYXRlZCBwYXRjaC4NCg0KUmVnYXJkcywNClRvbW9oaXJv
DQo=
