Return-Path: <SRS0=2/W+=I7=fujitsu.com=tan.shaopeng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1871CC433ED
	for <soc@archiver.kernel.org>; Fri,  2 Apr 2021 08:44:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D514161105; Fri,  2 Apr 2021 08:44:39 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CDB610D2;
	Fri,  2 Apr 2021 08:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5CDB610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=tan.shaopeng@fujitsu.com
IronPort-SDR: RUVwBV4LlaiEZimtxjkqevZKEUV2XKnXsRDe2l45H8HT5YHwSVyfQADkXXTzmL47BsDGoFThvO
 FBzSoF2vSXrT9kQ52I4is4C6o3VMgVm40HMOc07IN+chizyQrypFs/jF2zNJFIQadYFCP9E6l1
 3d0jXGjmmOUQCduw5irK5saffEfs5LBxGnAoIQQmScCRlbJHgmQebMin8MoaCs/+5A43Cp0ZOC
 fwKJMdVYkZK7Bu4sTAkTTjnN+0MNEKSg5DjcJI5G0GghWKcRdQIzkvcRDeJOkS23KP932qYni9
 2TQ=
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="28856079"
X-IronPort-AV: E=Sophos;i="5.81,299,1610377200"; 
   d="scan'208";a="28856079"
Received: from mail-os2jpn01lp2050.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.50])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 17:44:34 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rcke/GfRW04LQYjFQBHAofJpV4+stYrR56NmkvcM9y5BSp8eox1jZGtCXhpFaETo3q9eCzeE+dCL/g/KXCTL6JtrrrJDxc9+zKOMYRmvxvP/4luUup/gfIM8HvS8unxqLKDPJ2tw7erh42VRfzYr2D+TwgqRNnq/2o+ZDUbq57GsaMikLThAX/ssfUOyFLkUdV/LjjbizV7t+DXYCiCk3K7lhgGqEv3iHXXMeXowQco4BhWzz2ZR5oqH+uLSeDMMKdeVNfc5uersDKBK5pimQkSbFW/MANGgUisKpWswPNK5WrUdQRx3wwDJ7C/JhRUedgbGugfDGiiys0V8PqD90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQJd0WJ1McupDnNqvRBI8eW36WODaK3eBC7xeKSWGIc=;
 b=FSVktrhaHWpECedV63kbvLI6UQjnDGmxbL+bcYuzoCrDfS3VfNOb21SNglNG7aO43KYd98BzOAOtcQSDa2RpaG7zztHFmJ0HuAcNAMH2mccJsowJUkzbtI6NX4KF8awzUGB/0RsFKE3h7r4brkGO6QmnycuYwO/gy2JJW+uAYiXHqFfsdDHgAqn6yoB1MZ7GNnr+Ps9A9Lyc5sdh4jV4A9G2UIHldvFsRZN2zH71r6ZQn7lk0Pr5rjHH/1gxUyw5+BNhgVZ6f6edWBTf/eQIkwx9AGOZJSTsBdupURzcwLK8qL+bdCXlcuKSH9u4S+93TskdZI0yER1nC1DT8fDZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQJd0WJ1McupDnNqvRBI8eW36WODaK3eBC7xeKSWGIc=;
 b=bFF0m4bXNF/iBXYzkqs0r+HiapSfBZANFtjWiSgDvam08kaGR6QfWILQ9MACdPjDp9D/x48rzXZ57K/CDZuy5gZWyQiOYjLWAnDN9i/C/T1CUAJvteJQWKSk94i7Vekx/4y3n3eb4hNk+OPmtFZEDro5qTXJ2dfOAbn2+ntqtZg=
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com (2603:1096:603:15::15)
 by OSAPR01MB2866.jpnprd01.prod.outlook.com (2603:1096:603:3d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Fri, 2 Apr
 2021 08:44:32 +0000
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d]) by OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d%6]) with mapi id 15.20.3999.028; Fri, 2 Apr 2021
 08:44:32 +0000
From: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
To: 'James Morse' <james.morse@arm.com>
List-Id: <soc.lore.kernel.org>
CC: 'Arnd Bergmann' <arnd@arndb.de>, Will Deacon <will@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>,
	"misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
Subject: RE: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Topic: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Index:
 AQHXEBESAJcmfc8h0U6q78FjB96JBapyH1gAgAGCoFCAAAVDgIAAAz8AgCpFWZCAAhRpgIABEIog
Date: Fri, 2 Apr 2021 08:44:32 +0000
Message-ID:
 <OSAPR01MB2146C20E39297D5DB347ACB48B7A9@OSAPR01MB2146.jpnprd01.prod.outlook.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <20210304104650.GA20843@willie-the-truck>
 <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
 <OSAPR01MB21463C735D4A07344F35E7CC8B7C9@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <edaea436-d94e-d862-1136-66e9f881e0cc@arm.com>
In-Reply-To: <edaea436-d94e-d862-1136-66e9f881e0cc@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8448ffc7-bc03-4f79-43ee-08d8f5b38936
x-ms-traffictypediagnostic: OSAPR01MB2866:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <OSAPR01MB2866EA96228F3298B0CB79A58B7A9@OSAPR01MB2866.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CVfbLlr3dtW4rBXQ65C5Kdz26Y8CONLLRXCHwuEHnqIt/xq/Lv+KhLkRUSm4lgcA216/7QMROYMbsxMlnTnzBkQ7YmU17snVALnuB5EK5EJ1ah9pInlhUMKEARC2ep8/nz/X+7luyjZ4QHSaCh+a6L4qXLDbv6wEDTAMUa/a0qWCnL8CRNMh87dEfc39L4gUIHHQ6RZC84VMhQzIWAD2dNKK88RTiX9UaigYF3E8nFD0yvafp9z/hzd+eddmsuWzAJm4eUsEL+IeqbDiimtE5N08iwPa7mUSUxtwG/T4hyjw2hqTljGl19WNVrDyNF/cAz92pFRPSHzqydOXatMrkFfV1VKk9NjSxUsbO/5ktJL5Jz4kglbda2cYOxxmqGtJHr1iCV5I6Ns+hEV0xP+NxhTT/zh2AYMFBX27Xl8JT2uh005zFaQaIGevGTKMN949764UtIu43SXJopttegD1tEKpFtQxMOtAuJ/tfLLYSprI7c7Xt6cagTummFOMjEPHpXGpesejXlFcYu2ThPSDoC3LBNV7Er+cQp6vTvnNaLpU3FQFVjV3optaMYzC5J/zaWR5248EtKFGqtD+xohggIzv8wFa+UZXFTU1PG4V7hFARaju7RtmrwWDSv1eRsxdmIfkjcb5TMaDeKzk6I5JBJxAMvBbe3xYUS97rRKeB1abHYw6L2tHrgHEmEf2xG8EIYtew4VeBYJF7lKQRWN6lxAQFz2NHXtnvJDYbSNCqeObnZytECnY2NQkGJJdV5WT
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2146.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(55016002)(33656002)(86362001)(53546011)(6916009)(64756008)(107886003)(966005)(7696005)(52536014)(5660300002)(2906002)(6506007)(9686003)(85182001)(4326008)(186003)(66946007)(76116006)(316002)(66556008)(66476007)(38100700001)(66446008)(26005)(478600001)(8676002)(8936002)(54906003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?UVhFL2llR0FncGUxaU5oZkhTUlhyclM1ZGl4Uk05ZmFpN2JpN1d0SUJuQUVq?=
 =?utf-8?B?bk1XS1IvN2pqUmJsK0pTdlZhdFQ5c1hiODU0M0VueE9Fb1ErTnNDN1BMUGhO?=
 =?utf-8?B?bXprN05HWGRVQjE2ZmEycGZJbDRhOXU5WTA2dDAyUTNremxucjdIRTJQU0lQ?=
 =?utf-8?B?a0tiSWc1OTNCd2hsSThBMDVONjZmLzRXZVlPWWdzL2J5c0RYNmY5TllrbWND?=
 =?utf-8?B?RjlKamtnMEdyM3lVY1pOamlyWFozMkZZWnRBQkNaTjdIcHlmYmZYcmlJa3dt?=
 =?utf-8?B?MWwyd1FEdTNTdStoeUc3U1MxZnFDQkV3VERhRzdUSnB1eHN4S0FidFZpTEVY?=
 =?utf-8?B?cGpUWkcxQmJXcm5mL1RFKzhOUk5la3BXQjBLZnRoL0JaL3FkT01xU2JrcGpL?=
 =?utf-8?B?UzlaL0UrYUkrNVdsM2svc1B4N0QzOFdTQnB0WnhYbU1NbEFpM2dGTzR2dm04?=
 =?utf-8?B?OHBYTVB5L0tBUjF5T2FEU0tYMTlUWXA1ODdKRTBDRU9NU2VwQkRwdUtFYU5D?=
 =?utf-8?B?eFZqSW9xV0hLUGFtN0I5QW4yYUVhRDZ3OTZrYVdjekhTcFJKWjhwNjRBNGhQ?=
 =?utf-8?B?L3ZCNDFFcDBocmUyTDhRa2FabUJXUHl4d09PQkd5TEJrbUZvL0JPVmh5bXFw?=
 =?utf-8?B?bDJFYzBzMjFSY0xtSmdVK1JvcUJadjVWR2xQWDM3YUcvc2FXaW1xTyt4OWpt?=
 =?utf-8?B?Mm9mQjN0U2p5MGlCczBiQjF2Q29DOExuY1RxOFAxOUtwZk1ZZlBEaFBpTCts?=
 =?utf-8?B?U1hobU8yVVAyc0dpYjYyaG9NVURsL2VZTTJZNG9QQlA4M0tpVlBuMmpvOUtL?=
 =?utf-8?B?Y0pselFoa1JvRzZZK3h2UlJ1YXQ5MTNNYjVIa0pGVzJhbndZUXE3S09KcjNa?=
 =?utf-8?B?K2srcmFjRDl1Tm8xc3N1QVhKTWdoUjBVK1dHZXNncVFYQWRLMVVsdGhEbjRv?=
 =?utf-8?B?OVBubXp4N1NzUGExV2c4WUpldHpYWDE0MG15QklhWnlQdjVNWm5INWZDWDVt?=
 =?utf-8?B?NEVjMTJtM3kxM0x6RTFaVFY3WFRrRWlLODJlVGV4UHdFZ3JXdWl5ekx6RjJr?=
 =?utf-8?B?VWhEb01WNjZzdlpNWmxxL3BXdVg5UTMxYWdmYlA5R0VKSEt6VitPUG9RT1JN?=
 =?utf-8?B?ZUlNZjNtT25pSFVPM0NZVkE2ekpMb2xsaW05bld6ZGtQNmc1aUJFWXlJeTlO?=
 =?utf-8?B?MFFRYlRFK1ZPdk0vQzVFdXpmNG0ybUlCa1ptcUxqZXNDZ3VpWkFvRktONUFE?=
 =?utf-8?B?c3AxMm52M1ZURFVVbGlOd3ExSVpLOEc1b29IUDN3RWppSUFJYWYzZDBKUi9a?=
 =?utf-8?B?d1Irb0tyTk92cVFiNnN2cG5QQlNPUTBiMW9zamxZTEN6MU90OU03OUNPS1VS?=
 =?utf-8?B?UGg0S1FXMHNuL2c4SkNVWG01MG1CK0IwRzE2eHkxZVRGNk1IVzg5aERZYWg2?=
 =?utf-8?B?cU92R3h0NUpHbmF0bVVRcHJQYnQ0UGFhUkx4clZpK0lvV1BCcVo3d3kxWkgv?=
 =?utf-8?B?alZTUzFDRWNkNUZTQzNXaExKSHVudTlVbGlTd3ZEN0p4cWFvbGhvOUI1dXRz?=
 =?utf-8?B?Zndqend1alE3eUxuTzl4SEdweHVRejl3Kzl5TWJLK2IxbkEvRi9TdFBjNUg3?=
 =?utf-8?B?MjhaVVNyTkR5bHpFZ3VWdTRvZ2VuL2tYK2E0Wm5GdTdMaWNFZUI3TlptaUlq?=
 =?utf-8?B?NzFRUXhvb1oyK0dPTW9qUVg5bUhGN2tsc3RGcUpDRjlFbzZneSt0aGN4NzRG?=
 =?utf-8?Q?yT3wv4uw4zAiaKiOWGSl+3mMxulKXEsBYV871kM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2146.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8448ffc7-bc03-4f79-43ee-08d8f5b38936
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2021 08:44:32.1991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8Wk8SvdQ60ovko0mSksFHse8UheEieJrMkZjNb51cC64r5QveQtZxpqgcjZNKa50WrLadvbntNnnwro98n7gqqpib1OQfSTdCFd9Ns2wXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2866

SGkgSmFtZXMgTW9yc2UNCg0KPiBPbiAzMS8wMy8yMDIxIDA5OjUyLCB0YW4uc2hhb3BlbmdAZnVq
aXRzdS5jb20gd3JvdGU6DQo+ID4+PiBHaXZlbiB0aGF0IGFsbCBvZiB0aGlzIGlzIG91dHNpZGUg
b2YgdGhlIHNjb3BlIG9mIHRoZSBhcmNoaXRlY3R1cmUsDQo+ID4+PiBJIGRvbid0IHRoaW5rIHRo
YXQgYXJjaC9hcm02NC8gaXMgdGhlIHJpZ2h0IHBsYWNlIGZvciBpdC4gUGVyaGFwcw0KPiA+Pj4g
dGhpcyB3b3VsZCBmaXQgaW50byB0aGUgcmVzY3RybCByZXdvcmsgdGhhdCBKYW1lcyBoYXMgYmVl
biBkb2luZyBmb3INCj4gTVBBTT8NCj4gPj4NCj4gPj4gSW5kZWVkLCB0aGF0IHNvdW5kcyBsaWtl
IGEgZ29vZCBzdGFydGluZyBwb2ludC4gSSBkb24ndCB1bmRlcnN0YW5kDQo+ID4+IGVub3VnaCBh
Ym91dCBlaXRoZXIgb2YgdGhlIHR3byB0byBiZSBzdXJlLCBidXQgaXQgc291bmRzIGxpa2UgdGhl
cmUNCj4gPj4gaXMgc29tZSBvdmVybGFwIGluIGZ1bmN0aW9uYWxpdHksIGFuZCBpZGVhbGx5IHdl
IHdvdWxkIGhhdmUgb25lIHVzZXINCj4gPj4gaW50ZXJmYWNlIHRoYXQgY2FuIGRlYWwgd2l0aCBh
bGwgdGhlIGhhcmR3YXJlIGltcGxlbWVudGF0aW9ucyAoaW50ZWwsIGFybSwNCj4gZnVqaXRzdSBh
bmQgYW55IGZ1dHVyZSBvbmVzKS4NCj4gDQo+ID4gQWNjb3JkaW5nIHRvIG15IHN0dWR5LCBpdCBz
ZWVtcyBwb3NzaWJsZSB0byBhZGQgQTY0RlgncyBzZWN0b3IgY2FjaGUNCj4gPiBmdW5jdGlvbiB0
byByZXNjdHJsLg0KPiANCj4gSSB0aGluayB0aGlzIGRlcGVuZHMgb24gd2hldGhlciBpdCBtYXBz
IHRvIG9uZSBvZiBJbnRlbCBSRFQncyBleGlzdGluZyBzY2hlbWEuDQo+IFdoaWxlIGFkZGluZyBu
ZXcgb25lcyBsb29rcyBlYXN5LCBpdCBpcyBiYWQgZm9yIHVzZXItc3BhY2UgYXMgdGhleSBhcmUg
bm90DQo+IHBvcnRhYmxlIGJldHdlZW4gbWFjaGluZXMgdGhhdCBzdXBwb3J0IHJlc2N0cmwuDQoN
ClRoYW5rcyBmb3IgeW91ciBhZHZpY2UsIEkgd2lsbCB0cnkgZmluZGluZyBhIHdheSB0byBhZGQN
CnRoZSBzZWN0b3IgY2FjaGUgZnVuY3Rpb24gaW4gcmVzY3RybCBieSB1c2luZyBleGlzdGluZyBz
Y2hlbWEuDQoNCj4gPiBJIGhlYXJkIHlvdSBhcmUgd29ya2luZyBvbiByZXNjdHJsIHJld29yayBm
b3IgTVBBTSAsIGJ1dCBJIGNhbm5vdCBmaW5kDQo+ID4gcmVsYXRlZCBwYXRjaGVzIG9uIE1MIGFy
Y2hpdmUuIFRoZXJlZm9yZSwgSSB3b3VsZCBsaWtlIHRvIGtub3cgdGhlDQo+ID4gc3RhdHVzIGFi
b3V0IE1QQU0gc3VwcG9ydC4NCj4gDQo+IEl0cyBhYm91dCBmaXZlIG9yIHNpeCBzZXJpZXMgdGhh
dCByZWZhY3RvciByZXNjdHJsIGluc2lkZSBhcmNoL3g4NiB0byBoYXZlIGEgY2xlYXINCj4gYm91
bmRhcnkgYmV0d2VlbiBhcmNoLXNwZWNpZmljIGNvZGUgYW5kIHRoZSByZXNjdHJsIGNvZGUgdGhh
dCBpbXBsZW1lbnRzIHRoZQ0KPiBmaWxlc3lzdGVtLCB0aGVuIHB1bGwgaXQgb3V0IHRvIC9mcy8g
YW5kIGJ1aWxkIHRoZSBNUEFNIGRyaXZlciB0byBtYWtlIGl0IHdvcmsgZm9yDQo+IGFybTY0Lg0K
PiANCj4gVW5mb3J0dW5hdGVseSwgaXRzIHJhdGhlciBsYXJnZSAoPjEwMCBwYXRjaGVzKSwgc28g
d2lsbCB0YWtlIHNvbWUgdGltZSB0byBiZQ0KPiByZXZpZXdlZC4NCj4gDQo+IA0KPiA+ICgxKSBJ
IHRoaW5rIHRoZSBmaXJzdCBzdGVwIGlzIHRvIHN1cHBvcnQgcmVzY3RybCBmb3IgQVJNIGFyY2gu
DQo+ID4gICAgSGF2ZSB5b3UgZmluaXNoZWQgdGhlIHdvcmsgb2YgYXJtIHN1cHBvcnQgYW5kIHdo
ZW4gd2lsbCB5b3UgcmVsZWFzZSBpdD8NCj4gDQo+IE5vLW9uZSB3YW50cyBhIHNlY29uZCBjb3B5
IG9mIHRoZSBjb2RlIHRvIGltcGxlbWVudCByZXNjdHJsLCBhcyB0aGlzIHdpbGwNCj4gaW50cm9k
dWNlIHN1YnRsZSBidWdzIHRoYXQgdXNlci1zcGFjZSB3b3VsZCBoYXZlIHRvIHdvcmsgYXJvdW5k
LCBhbmQgbWFrZSBpdA0KPiBoYXJkZXIgdG8gbWVyZ2UgbGF0ZXIuDQo+IA0KPiBUaGUgZmlyc3Qg
c3RlcCBpcyB0byByZWZhY3RvciB0aGUgYXJjaC94ODYgaW1wbGVtZW50YXRpb24gb2YgcmVzY3Ry
bCBzbyB0aGF0IHRoZQ0KPiBwYXJ0cyB0aGF0IGFyZSB2aXNpYmxlIHRvIHVzZXItc3BhY2UgY2Fu
IGJlIG1vdmVkIHNvbWV3aGVyZSB0aGF0IGlzIGNvbW1vbg0KPiB0byBtdWx0aXBsZSBhcmNoaXRl
Y3R1cmVzLg0KPiANCj4gSSd2ZSBwb3N0ZWQgdGhlIG5leHQgY2h1bmsgb2YgdGhhdCB3b3JrIGhl
cmU6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTAzMTIxNzU4NDkuODMyNy0x
LWphbWVzLm1vcnNlQGFybS5jb20vDQo+IA0KPiA+ICgyKSBXaGVuIHdpbGwgeW91IHJlbGVhc2Ug
TVBBTSBwYXRjaD8NCj4gDQo+IFRoZSBsYXRlc3QgY29tcGxldGUgdmVyc2lvbiBvZiB0aGUgdHJl
ZSBpcyBoZXJlOg0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9tb3JzZS9saW51eC5naXQvbG9nLz9oPW1wYQ0KPiBtL3NuYXBzaG90L2ZlYg0KPiANCj4g
SXQgaXMgb3ZlciBhIHllYXIgb2xkLCBhbmQgaGFzIHBsZW50eSBvZiBidWdzLg0KPiANCj4gSSBo
b3BlIHRvIHB1c2ggYSBuZXdlciB2ZXJzaW9uIG9mIHRoZSBicmFuY2ggb25jZSBJIGhhdmUgYSBj
b21wbGV0ZSBjb3B5IG9mIHRoZQ0KPiB0cmVlIHRoYXQgaGFzIGJlZW4gdGVzdGVkLCBhbmQgaXMg
YmFzZWQgb24gdGhlIGN1cnJlbnQgdmVyc2lvbiBvZiB0aGUgQUNQSSB0YWJsZS4NCg0KVGhhbmtz
IGZvciB5b3VyIGluZm9ybWF0aW9uLiBMZXQgbWUgc2VlIHRoZSBwYXRjaC4NCg0KVGhhbmtzLCAN
ClRhbiBTaGFvcGVuZw0K
