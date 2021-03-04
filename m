Return-Path: <SRS0=sbVC=IC=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69D0C433DB
	for <soc@archiver.kernel.org>; Thu,  4 Mar 2021 07:04:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC03764EFE; Thu,  4 Mar 2021 07:04:23 +0000 (UTC)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com [216.71.158.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3C1264EE4;
	Thu,  4 Mar 2021 07:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3C1264EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
IronPort-SDR: CentF7fEFv7tniDi7DnPPa/x2atS8LoSDG0TbnoUKS1jsW05v6s40Je3RUtuKFMVJOgD1glZY6
 PBUix+a7n3vT6HYvykOjtrigTyNyhaRW+kmtqLSWFABwhgW5NC+EEkQlOWSLwJfziuJJC6llXL
 UZP7nucLXyCcyXySh9GoP7w06I0I8Xa8jmh3MWQE+LwhcqWHXpnDA94JkN7CDcYuFL/Z6FUeA7
 AjayR3jt1g73T7Lk3pwj1nuYJXJeMGpIOh/1QvVJduHZ1MEQyLJenWhGrBecQkd+mFZFqrE8H8
 AaY=
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="27007198"
X-IronPort-AV: E=Sophos;i="5.81,222,1610377200"; 
   d="scan'208";a="27007198"
Received: from mail-os2jpn01lp2050.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.50])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 16:04:14 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPEpr2mx0QF5T1gApPJ53hgmE4TI5Ikp5mbRrPcPkrindnRKViIvEyyKtGJNZnZKd5yALYqckSMj4NdPjvYfLzafCFewdQCLm2K3WDTq5Q+R5jBf2jS5wIiilZTmwDxNlbGQvZWiOgiJgsxjsUp3BUxPJbCWzcl5OBV0qwU4eeheIgdqkXNIa97lUjoC/K0wqCG3sswJRgghPlN4I3xHZ2/YWhRc1/rpgJ2qELGRWRCnabb3UqH3UvNUEnSCrFOOrt9r2smYrCulZKkcw5QBaQJHAYXUp9OMJ9eSQvj2RJEZcGyNTIGTnX4ZT7lpjVlPr1ZLf0CkoGOCqqzv7Bc1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4kcOmSwVo9yryFL5lO7SO2on7y3wrHpaEhPERsxBas=;
 b=H6peMj2m9drZ37E6pkK0cVVQsrCCUZ0sVFUPMcbEwzlbBwwyDpw589DHYIKW2/7chh6KhAWVOMY+5mJS3SHnyvKPVCVMeHXGY5wgFewhhO9l0pRnsv9XR7sipW3WjRvo18GH08M0pGEYafo7nM9ShlqpJCf04SeWEHmq3rEuullIltXQVrtdmOwlsw+MwCkYpuTzP2VXNPTeZDuzNiL1PCm1t3W5xtTO+Cd/AhtHnshbawb5ZexgV8EYZgH6yE6sL8hQv9c7kCuXXhSdygkZKZFZ2zVHa1gTfpBDy38xu/mbeA/yb7ZurswwS2bv36OZkQCmr8Ztxs8H+GQUwdlW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4kcOmSwVo9yryFL5lO7SO2on7y3wrHpaEhPERsxBas=;
 b=VlwRxtRYp3WnskyIUnJ5NP4A0Pi1C78oGgyEXx+OlFRaJP+i2sGuDa1u3oPl/y4OGFi5GnLe3CW/VrDjs3TfQkNdo806ROLaf+rjK35iPK02JlegHqa/IX9G2uCSNzq3JQel43onCWhi0EPgXJNgrGdMxqfyQJhWY30a0Fxt6is=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OS3PR01MB6070.jpnprd01.prod.outlook.com (2603:1096:604:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 07:04:11 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056%6]) with mapi id 15.20.3890.028; Thu, 4 Mar 2021
 07:04:11 +0000
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
 AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8IAATzYAgAE118CAA2BUgIA1QadggBLz3YCAAYCFwIAAOqmAgAEhHjA=
Date: Thu, 4 Mar 2021 07:03:06 +0000
Deferred-Delivery: Thu, 4 Mar 2021 07:04:05 +0000
Message-ID:
 <OSBPR01MB4582AE99E2BFFB23749C2394E5979@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
 <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
 <OSBPR01MB458224BBD6E110002DEA7085E5989@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a3CwCSXyXuj9NGcyowTUYdUgAJdH8ue=R_aXYX+SO6Uew@mail.gmail.com>
In-Reply-To:
 <CAK8P3a3CwCSXyXuj9NGcyowTUYdUgAJdH8ue=R_aXYX+SO6Uew@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: 4449e6c838c044b99b5badd89cd366e5
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.176]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3e3d8e6-5dc9-4426-a21f-08d8dedbb6a4
x-ms-traffictypediagnostic: OS3PR01MB6070:
x-microsoft-antispam-prvs:
 <OS3PR01MB607091D90F924B4A5790B7AFE5979@OS3PR01MB6070.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iS68dKusvLv+WJTyiGlp2qjoNGhW/YZzEtlIdVos1gbaj9Ii9T/rdAmHGiymK1noxsLXzt/9miAvXwdUYvF+rMja5XImiposteZxslLELGP/xIdCKsgrq2/o0jZzp7B1O8Px4JF6RVFL4mbEkPEkhOO5bHdMdWgz8W9AjeTeGaxT6mgZTxud3Mf3z2zE57p3N2qSPQ1C8dPBsZsOWcoQojjKv+DEluu1VVT3YrsX5Z0Tv8XQLkqIO2AnimmpV6CGYG8tWF3xTdDcgSHt1SDEE3f0gkRE6R0LzDkyWvGiTI3F7D2Wkycc9klNjx4UeQC2al+rxTgKtAMDHhJrEKSHnIT2Qku7YS4pO6X4yjiDtvLKTLiNxy5b5QdBlC5RlVA7DDY5cLv92gVN0uPRVlyj6KNoa1xt8JPhIzHiT59nks2N3L5KvY5SD46JhL9IFcaMRlnIoKpQku9ieOJHS+IZpR1X1GJONZfUNyYmirLcPWKkhtVCbjABDpCpjw/jDSImicbrx0q03r1DCaPodQiUzg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(6666004)(26005)(7696005)(316002)(55016002)(33656002)(6916009)(71200400001)(8936002)(6506007)(2906002)(186003)(9686003)(86362001)(8676002)(85182001)(4326008)(83380400001)(54906003)(478600001)(66556008)(5660300002)(64756008)(52536014)(66476007)(66946007)(66446008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?TzdSZ2ZtM0lQLzBaSEpqS0VZTEEvYkIrQlA0YVN6UEZKRXdpKzdBWGcvNW12?=
 =?utf-8?B?eHdWVTVwR2doRmxNMkZORm55dkJxa0dKaXpXM1RiczBNeXJvb1Zld3lsVytr?=
 =?utf-8?B?VE1rNGFlODVWMnNEa3NlaE40U21jQ3FiT2ZaSlhFdXcwelB5L0x0M1Y5ZUw5?=
 =?utf-8?B?a2NBRlpscnp5cWViL296amRoQjN0U2Y4azZyTnUzN2FqM1R5S2VvVTYvRzQy?=
 =?utf-8?B?NEJXYWQxU2xnSm5IKzlJVjJ4MitvN2xQQytQZHR3NVRKdFVGRXg5OVBXc3Vl?=
 =?utf-8?B?aVBFMHl3eFFUd3pwU01BUzlMK2k5ZU85UlZWRmlCKzlnZkUrQW1mVmNZTUZa?=
 =?utf-8?B?SWdBMHlZRUNndFZsbUZrNU1pVGpMcHVYUXk1V2RqemF0cUw4cXArVVQ3OVJr?=
 =?utf-8?B?ODhwdURYMVhZM1d1YmQ1SlF1amh1eGhQSTJqd2NhQThFZTFvRmkvUzRFT1lr?=
 =?utf-8?B?TUI3YjRWaXZEZG05ZDdZbHBZbFFPQ3V4c09NbkNGNVRGWDBBRXdKdEZEY0Vz?=
 =?utf-8?B?ZWt0aVByVXN5Rlp0TU9wWU1vWTZUTk95dkFBVDN6MHYrMWtHc0o1NERXazhG?=
 =?utf-8?B?NmhFaStzY3VMRVlsVk85VWRpNzI3T0dVRW1WMU15MlNpLzg4aGYwSjMwSFRl?=
 =?utf-8?B?a0txVXpiVGR6OEpwb0ZaaEttT2w0aGU4R2NFeHFyem1QcUUrSmZ1VzVyLzZX?=
 =?utf-8?B?RVJ4ckRKZ3ZhMlJTNW1BSnVzZ3pmMWk0eWtMbDg4Um1hbStOd3cwRXBkTHRO?=
 =?utf-8?B?dWRGV3QwVytyVXpQekZjRWVWWHVuaEpwaktuQUpPVU5MRnp2bks2bzFMd0lT?=
 =?utf-8?B?ay8xNVpRYjM0L09TNHJQVXN6V2V6TmF2MzEwNEtOcVM4VzloMHJQcVhLcmsv?=
 =?utf-8?B?UXVjbXM0S0Z2R005YXFURnpEc1prTzFYc0dKVnJKTHFkUjdTblVwR29hNzRN?=
 =?utf-8?B?c2h1RTBHZ1RQT3ZOVXg3WTVGMXhnQW5oV0psdU5QT3U1SzM4UDBjVEhzUmxS?=
 =?utf-8?B?VmhieWFrY1Zha0ljTk9HbDZhREdlZXNaR3FTZ0FiZUdkWGtzTkNsV0tTb0x2?=
 =?utf-8?B?VEVFajN4OVlneUI3Snh0UnJpc0tWNkl3TGl1RXB3ZjMxeGRucGJ1cmVodTVW?=
 =?utf-8?B?OWFwUkN3d1ZWaCtHRUkzMkQ4SENkWDNySWtGVDRPZWtUVzVWVmlkQTRDMmhy?=
 =?utf-8?B?b3JRY08yUzFTdHIxRlc1UkNZQ2hHUUlLVGJCZTZIZlBCeDlYM1lKdktlUnZo?=
 =?utf-8?B?TWs3UHA4NTNUei9DOWRoL3h1UkZEckkzTm5iVHJuUThxek0rNlFTcDBUaVpp?=
 =?utf-8?B?Qm5HWjhDWWhHZy9tUzFSNGw2dmoxbE5LaTZYMk00SHA4UHZyUmloNGlncXQz?=
 =?utf-8?B?cE9Wc3MyYnJjOWZFUHMrOXJLMHBPOWZ1bkVjWW1oZVlnWjRkcklOTjd4Y1Fy?=
 =?utf-8?B?ZXl0RUlqOHFIU20xT1IyNExKYkVzWEc1LzAvVXljRnEyTkdWbTRZQ3VOeVN1?=
 =?utf-8?B?WWxqd21wK0tyendVSFdzRnordWVDYWt1V2lvcWdaY1dPVGxVQ0FSL1dzVjRi?=
 =?utf-8?B?QWl4Y3h1cVRINmpQWi9xNlkwNTJtSE54dE95M3dCMmZMQ0cwNlI2NVZEMU94?=
 =?utf-8?B?N0o0djJkcGRnSERmQ0dpeFVkdWptcGVWWEVrQ3pYNzNzK20vc2NQUVU0VENa?=
 =?utf-8?B?Y3dHN3ViemtRc2NIZTk1azgrS2ZmeGhVZUxPRkVuNmwvRVdMYzNLNUtiL0lW?=
 =?utf-8?Q?nAbG6Z/1XW/47xwHhZJIlAXUteMOloQlI6OYF1y?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e3d8e6-5dc9-4426-a21f-08d8dedbb6a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 07:04:11.5612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pa8qrAFXcDjVzPHVQFnhbW1GcOpB4fmi67bdqmlDNuWolDf6ZM6lBh2GvMjqgmAei3bUKvXApVdr2OGSPvH9f8zhACuo+UPHbr4/mEVa8AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6070

PiA+ID4gSSdtIGFsc28gcnVubmluZyBvdXQgb2YgaWRlYXMgaGVyZS4gSSBkb24ndCB0aGluayBh
IHN5c2ZzIGludGVyZmFjZSB3b3VsZA0KPiA+ID4gYmUgYW55IGRpZmZlcmVudCB0byB5b3VyIGVh
cmxpZXIgaW9jdGwgaW50ZXJmYWNlIG9yIHRoZSB0aGUgL2Rldi9tc3IgYXBwcm9hY2gsDQo+ID4g
PiB0aGV5IGFsbCBzaGFyZSB0aGUgc2FtZSBwcm9ibGVtIHRoYXQgdGhleSBleHBvc2UgbG93LWxl
dmVsIGFjY2VzcyB0bw0KPiA+ID4gcGxhdGZvcm0gc3BlY2lmaWMgcmVnaXN0ZXJzIGluIGEgd2F5
IHRoYXQgaXMgbmVpdGhlciBwb3J0YWJsZSBub3Igc2FmZSB0bw0KPiA+ID4gdXNlIGZvciBnZW5l
cmFsLXB1cnBvc2UgYXBwbGljYXRpb25zIG91dHNpZGUgdGhlIHZlcnkgbmFycm93IHNjb3BlDQo+
ID4gPiBvZiBydW5uaW5nIGhpZ2hseSBvcHRpbWl6ZWQgSFBDIGFwcGxpY2F0aW9ucy4NCj4gPg0K
PiA+IE9rLCBidXQgQVJNIGFyY2hpdGVjdHVyZSBwZXJtaXRzIGltcGxlbWVudGF0aW9uIGRlZmlu
ZWQgcmVnaXN0ZXJzIGF0IHRoZQ0KPiA+IGZpcnN0IHBsYWNlLiBTbyBjYW4gd2UgcHJvdmlkZSBz
b21lIG1ldGhvZC9pbnRlcmZhY2UgdG8gYWNjZXNzIHRoZW0gYXMNCj4gPiBDUFUgZmVhdHVyZSBp
ZiB0aGVzZSByZWdpc3RlcnMgZG8gbm90IGF0IGxlYXN0IGFmZmVjdCBrZXJuZWwgb3BlcmF0aW9u
cyAobGlrZQ0KPiA+IHRoaXMgYmFycmllcikgYW5kIG9ubHkgcm9vdCBjYW4gYWNjZXNzIHRoZW0/
IExpYnJhcnkgY291bGQgb2ZmZXIgcG9ydGFibGUgd2F5DQo+ID4gZm9yIHVzZXIgYXBwbGljYXRp
b25zICh1bmRlciByb290IHBlcm1pc3Npb24pIHRvIGFjY2VzcyB0aGVtLg0KPiANCj4gVGhlIGtl
cm5lbCBpcyBtZWFudCB0byBwcm92aWRlIGFuIGFic3RyYWN0aW9uIGZvciBhbnkgZGlmZmVyZW5j
ZXMgYmV0d2VlbiB0aGUNCj4gQ1BVcywgaW5jbHVkaW5nIGltcGxlbWVudGF0aW9uIGRlZmluZWQg
cmVnaXN0ZXJzLiBXaGlsZSBhbnkgc3VjaCBhYnN0cmFjdGlvbg0KPiB3aWxsIGJlIGxlYWt5LCBq
dXN0IHBhc3NpbmcgdGhyb3VnaCB0aGUgcmF3IHJlZ2lzdGVycyBpcyBnZW5lcmFsbHkgbm90IGEg
aGVscGZ1bA0KPiBhYnN0cmFjdGlvbiBhdCBhbGwsIGFzIHNlZW4gZnJvbSB0aGUgeDg2IE1TUiBk
aXNjdXNzaW9uIHlvdSBwb2ludGVkIHRvLg0KPiANCj4gT25lIHByb2JsZW0gd2l0aCBoYXZpbmcg
YSByb290LW9ubHkgcmVnaXN0ZXIgbGV2ZWwgaW50ZXJmYWNlIGlzIHRoYXQgdGhpcw0KPiBjYW4g
YnJlYWsgdGhlIGJvdW5kYXJ5IGJldHdlZW4ga2VybmVsIG1vZGUgYW5kIHJvb3QgdXNlciBzcGFj
ZSwgYW5kDQo+IHRoaXMgaXMgc29tZXRoaW5nIHRoYXQgYSBsb3Qgb2YgcGVvcGxlIHdvdWxkIGxp
a2UgdG8gc3RyZW5ndGhlbiBmb3Igc2VjdXJpdHkNCj4gcmVhc29ucyAoZS5nLiBhIHJvb3QgdXNl
ciBzaG91bGQgbm90IGJlIGFibGUgdG8gYnJlYWsgc2VjdXJlIGJvb3QpLg0KPiANCj4gQW5vdGhl
ciBwcm9ibGVtIGlzIHRoYXQgZXhwb3NpbmcgdGhlIHJhdyByZWdpc3RlcnMgZnJvbSBrZXJuZWwg
c3BhY2UNCj4gY3JlYXRlcyBhbiBBQkksIGFuZCBpZiBpdCB0dXJucyBvdXQgdG8gYmUgYSBiYWQg
aWRlYSBsYXRlciBvbiwgdGhpcyBpcyBoYXJkIHRvDQo+IHRha2UgYmFjayB3aXRob3V0IGJyZWFr
aW5nIGV4aXN0aW5nIGFwcGxpY2F0aW9ucy4gTm90IGJyZWFraW5nIHRoaW5ncyB0aGF0DQo+IHVz
ZWQgdG8gd29yayBpcyB0aGUgcHJpbWFyeSBydWxlIGZvciB0aGUgTGludXgga2VybmVsLg0KDQpP
aywgdGhhbmtzIGZvciB0aGUgdGhvcm91Z2ggZXhwbGFuYXRpb25zLiBJdCBoZWxwcyBteSB1bmRl
cnN0YW5kaW5ncy4NCg0KPiBJbiBvcmRlciB0byBtZXJnZSBhbnl0aGluZyBpbnRvIHRoZSBtYWlu
bGluZSBrZXJuZWwsIEkgdGhpbmsgdGhlIHJlcXVpcmVtZW50DQo+IHdvdWxkIGJlIHRoYXQgaXQg
ZG9lcyBwcm92aWRlIGEgc2Vuc2libGUgYWJzdHJhY3Rpb24gaW5zaWRlIG9mIHRoZSBrZXJuZWwN
Cj4gdGhhdCBjYW4gZGlyZWN0bHkgYmUgdXNlZCBmcm9tIGFwcGxpY2F0aW9ucyB3aXRob3V0IGhh
dmluZyB0byBnbyB0aHJvdWdoDQo+IGFub3RoZXIgbGlicmFyeSB0aGF0IGFic3RyYWN0cyBpdCwg
YW5kIHRoYXQgaGFzIGEgZ29vZCBjaGFuY2Ugb2YgYmVpbmcNCj4gc3VwcG9ydGFibGUgZm9yZXZl
ci4NCg0KQXMgeW91IG1lbnRpb25lZCBhbiBpZGVhIG9mIHByb2Nlc3MtYmFzZWQgYXBwcm9hY2gg
ZWFybGllciwgSSB3aWxsDQpyZWNvbnNpZGVyIHRoZSBwb3NzaWJpbGl0eSBvZiBnZW5lcmFsIGFi
c3RyYWN0aW9uIGludGVyZmFjZSBpbiB0aGF0IHdheS4NCg0KUmVnYXJkcywNClRvbW9oaXJvDQo=
