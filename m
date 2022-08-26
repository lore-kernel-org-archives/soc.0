Return-Path: <SRS0=WNVL=Y6=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032B9ECAAD2
	for <soc@archiver.kernel.org>; Fri, 26 Aug 2022 06:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BABB2C433B5; Fri, 26 Aug 2022 06:22:26 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DFEBC433C1;
	Fri, 26 Aug 2022 06:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DFEBC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661494944; x=1693030944;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NGp2oC0mzsrCjLzmvN/6fLR7ZVL+2yVYbYZdiakJp7k=;
  b=OSSBSzCopO2vSM0rH8XRFO2bQWuJOF71TdnAtsqHOmvVQ3s+R8Agxl5w
   siRT9y/L26G8mE338ykPkkNzgtjYI8W8sKguTkSDJ9f8/Bi4iBSiXkTI/
   IJNiZMeLCJfkW9Q+Rv+p9gzaLp7y37StPaNrWwhIvy74YknIcAuYN80r5
   zkIsh95bYDr4dV2rY1WX4BMh/SXxKvoOkGrmF4v2eHRaFRRXV9BfdrJwu
   K5vswUE1l+aKYpqnmoJ12OSaRYbeJ4vCSPZUUOOemmxqWbvX6Nc4VK2YP
   4IQlqCGhKX2KUD5kspKF1aTOSb8fTCwsWmO5ohKUFfYraIp8MU8HbgC1f
   w==;
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="177962894"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2022 23:22:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 25 Aug 2022 23:22:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 25 Aug 2022 23:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwL8VHhCt8pP5bFjQRnvK1mO5jd+izoZyp+EVSyfK87pkJgXbbt0X6YCTCVhHTVE9Gdz6jX5yewEkjoAmdmcjh6SmBTErVjoYDn9C47H17rABCFEYOhswB7wBQXBMiLOPJk8enixNkHOhrwfvICMpoAh7v6g8Kp5u/Kufsor7IDSscn/akCvTUqMyVWMmF3QMX1HKD+f2vDUuNyIMr5crydbeX/h4fJngr6l82smyGnvaWlScfxvFSR/3WrZUWQtOf5e4dH+VFzqrFfp8K59zm5vNq1sEudjpBdTZj2K46iR5y+qtPrazrEG9S7a3J9AXG3NXGGdwUS96spFIS5AwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGp2oC0mzsrCjLzmvN/6fLR7ZVL+2yVYbYZdiakJp7k=;
 b=V4BzRJ71SVOa2Qf4J1aWkBn2rKJXYTPB8BNzOOCYcdv3Az/eVR+sXYSg5tjsZNKQMuMwd0GG5a8ImjFSzmWuUmUUYdSg/VgHTz8xm6oB8QXADxN3lsfmQ0FuXVcCJTkU2iDO+aRBjqAShCRw/CxilAu7+v9zlNzAQ8c1KTKtViM3MM9/cbvdo2gDglZF8qzZ4fFce+e38LNVG34gK5UqyrvXeCYKjSxW4BK5JxqZ7b6ecjvE9BJ1kKxo3+nbvMwimvUJbQNPp2kAlDWkWiorQiAt58ZQq2GbQCZ1+1123NNxJRstRqJaaRLzJ3e+YvOF1/LY8CAMcaA9lJFqU1w/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGp2oC0mzsrCjLzmvN/6fLR7ZVL+2yVYbYZdiakJp7k=;
 b=CBzUv5xqahvvfjZ+8dqQeclOL49mOohqqG0OIRbdjlbYpEqMRFH8suU99mkbjlcWDNRv8PMZBeMjz5HXnwKrUMFGCxX81YwsBO5GCxT+vfkw7wTSd51tk3uEpWfs8p5UYmMp8XvJlFfZzOkwjPTlLHmKxb1ul777l+5iGMkYTLQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 06:22:07 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 06:22:07 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, <Daire.McNamara@microchip.com>, <broonie@kernel.org>,
	<wsa@kernel.org>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <jassisinghbrar@gmail.com>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <gregkh@linuxfoundation.org>,
	<olof@lixom.net>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
Thread-Topic: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
Thread-Index: AQHYrMIE51FEp2TUrE6UKiLrU4uIQ63AaGqAgABmUgA=
Date: Fri, 26 Aug 2022 06:22:07 +0000
Message-ID: <196dcae3-542a-2cf3-ebee-e7ecc4a8a330@microchip.com>
References: <mhng-9fab66cf-3d6c-417b-9233-8030c256aea9@palmer-mbp2014>
In-Reply-To: <mhng-9fab66cf-3d6c-417b-9233-8030c256aea9@palmer-mbp2014>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27f12380-0508-4851-7681-08da872b4d36
x-ms-traffictypediagnostic: BYAPR11MB3765:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 03V8NfewAgU6iJDfTZ7UEZNJ5y+/qdqmUwMith70ipLRckxENqm7M2HDfw7ClWkmK4vcoJK3IdACgYNePW4wuIG60S+0IDBno2buqrsRilvuT+qjgVZL4XgK5ofRt55UXQjgQYgY9iNXyunb9XyZDOE0R9kvmYBxEbR4KIfkuSTkpVLED2etYv3aO2OtEA8gbRipFTH1asR9ndZSWVTtSDhac65xKDl7wPu7jEQeeP7ClsT0gSebbSWjO5aOmm7IvyK4XYACicieYFJ82WOzezAoO/x0pF5t+Xl7GlAko03gMGN8lFGw1NfBKjh+LlE8kNPtJnsWBy/SkeuY99uyItqoCn8lSA8MwxIMRpeIDAELJFAc4amaW1tg6MSV1poYW7xGDn8YuLMK9lddxfByJusj9p7D9mV74zyBBUJ/jKheu5BtDALBR/t5dmVIM8Y4+nndA/WOktKjZJ84k0PFZdOsr2JKHZhTY72DR41dExxoYYqTjDDNrPLB9MEmUe3Gv5N80l8mkSFFjdzhIy38iNAyi0feb71R+KmSfp8g3io8rB718Cw4FMWRKlLr8zl91TJ1SRF+CPGjRrrhqep8QDamz+X/8zdpFidJx8CiY4Amk5DZIi09ofZdqjcdZyYEy6oDMSxMVci452x5UngUCkoypPMm8Bvo2q2Ix9VVP9v47QzxwIr2dNrj+EpWn86bHK+N5SBsnRFQur9QZs/D2ZX5n+rtPM/mVnKeDXtMmbKPfLroh04ZU/eWuTWd96+D/LMV70b7OyNQAKno65JgeXeGJGOgQkPboyTtt9NRDWBSQoLbFh1RZwg20abiIWbZyGYmxl9adxXBpHvmG8qL9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(136003)(376002)(366004)(38070700005)(2906002)(6512007)(26005)(38100700002)(36756003)(71200400001)(31686004)(110136005)(54906003)(316002)(91956017)(478600001)(53546011)(8936002)(41300700001)(66556008)(2616005)(6506007)(5660300002)(8676002)(4326008)(6486002)(66476007)(76116006)(66946007)(66446008)(4744005)(64756008)(186003)(7416002)(31696002)(86362001)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjBzaG4rQ0xIVjJlVTl5RU80WGsxd1k2cE5LSitUVjkwdXlwQWNmVDlQcUdK?=
 =?utf-8?B?clZvWlpEdnFyK0gwQmJpb3hqb1NOek1nNU41ckFNbFo2MnVPVmhacEhpeko5?=
 =?utf-8?B?dVhMNGNkY2ZUdmowa0tsZTA2Y09zNWdiSFhlQmoxTXVmZkJCYkJnb0NGWENE?=
 =?utf-8?B?UnI0L0Uwa3ZIc3Jzc2xHODNlbENYMUhKUWlIa2tBSnM5MldNSVdVOHVuTWk4?=
 =?utf-8?B?SjQyN3lqMmU2dU9SdXVZczVLcSt1ZzR3UWFGcFRBL1FkWHovQmxKNzRRUEd4?=
 =?utf-8?B?d0xwdkxiODdQY1dyZjhLMFFoZ21zVkVuWk1pN0RUK010OVFueGpiWkNORWRW?=
 =?utf-8?B?K09MNENYRDE5TnN0OVFzZlF2di90NW54VUJyT21ldWsvc3ZobndPVlhaSkVJ?=
 =?utf-8?B?dTdoWTRFNGJDSTVpeXlieGNWd0FKTFNxRUtyR3hXTStXdmZDdDhBMmxFb2JN?=
 =?utf-8?B?RXBHMnFuQ01CWXNGY2RLanpjcWVscmZxcThCRlNFUDB1VElWUkh0UlZkRWhT?=
 =?utf-8?B?MDBjL3MvWmNQQ05xN0l3OUVkREhSUmt1R0tkUjVGUFVxZ0JvdjRXY0ZMVWN5?=
 =?utf-8?B?MkJ0UkZieFo5Q2h1dDY0Sm44dW05c2Y0Q0hyUERoUDdBbXl3Zks0VDY1UzFE?=
 =?utf-8?B?NW5hKzFGSkZZSUVzaEw1Wi9yODY2MTcrSjhLWVo4T0JQZVMvMU9CbkJGRmlR?=
 =?utf-8?B?WWM2VFQ4ak5QbGR4ZmY0RkgwU3E4UTZabFpFUkFBNGN3ZHVXclhXa1JKM3Bm?=
 =?utf-8?B?NzVZMmpZcllVQnQrb3N5REVVS3JqMlJ1d1hHejJlbWZ1aEtiWlZ5QTFhM0Ry?=
 =?utf-8?B?Tit1T1EwQ3hJdUtUUTNqUWM2Z3RDdmVtMXNpK01xL2o2SXZBZW1Ob3RlMFp6?=
 =?utf-8?B?SDdZdkl5U3poV0RvaTNMTFJDK0Z5elUyeGtURm9VQ0dxQytrY2FWV3hpYTR3?=
 =?utf-8?B?YzByVm9TTlRnRXFKL0dpUnlwMXFDeGQvU2hmVVNvck5qRjlFY2tjMTZOOWFQ?=
 =?utf-8?B?V0wwSzg3US9wRlRraThhNTE1ZHlSN3h0OFdwUVpZNkkvVjE4WTI1VnUwM1o4?=
 =?utf-8?B?TWVWLzVVbzdvYzcrcWpWUEdUSE9MS0wzcVRhcUlpZTQrbUxUMFdvZEFhd1VB?=
 =?utf-8?B?eCtWdjJuZC85dzV1L3RVVkRIdXdwRFNReFAxcHBMSFdCME5xRS9lMytmVVhV?=
 =?utf-8?B?cTlnamRMc3RHRGJ3dXlZYyt4bzM0VjY3QWFxNy96Wm80WGlNaEtaemJ3SElQ?=
 =?utf-8?B?NEZmWmZHV2pZekNSRSs5QXYyZm5SVC9XZm5hdGE5ZFc4NlY2YWxvUGh1VkZ6?=
 =?utf-8?B?M05hOEc4NUFYbXg0SGJDNnZldUx0aml4azNNaExDdUtEVmZ6b1IyRHVWQUJP?=
 =?utf-8?B?b3U4d2F0NHIyK2t1NjNvS2JRY0Q4OWRnSlo2UHhCQWhsaE5BSnh2MEozaHh1?=
 =?utf-8?B?ZEhEYlBaRnRCSWcvOTlWS1d3OXJXblh1aE4wbnN2Rm00bll3dWFkWUxRUllW?=
 =?utf-8?B?SVU2ZTNIZEZQQ010eEcxbm9XZGdYbUk2WThEUzVKQUhKSldwYk5maSt0ZkxS?=
 =?utf-8?B?eFViQ1dyT1F5a2Z6V0ljUy9UYmpDM0ZLdm4wQ0ZZeDJLQkxjSzE3NzF3czFI?=
 =?utf-8?B?N04zb1R1b24zNi9YL29xTXlEQXA4NjAxYkhiUTBHazluV0oxKzE1UnpvaTBD?=
 =?utf-8?B?enEyb1dnMEd2ZWdSNG9HZHUyc1FXVUtMdDB4eUgveE9QVHFIRUVuaHYwNWFM?=
 =?utf-8?B?RTBpUGVSS1RxalFGVnhPTmhUOGtOTmJ5bTRETFF2N1F2T3ZEZGR6ZElBUGcv?=
 =?utf-8?B?cWxuTzJLSFNsS3plS3JBdVpwRmNvWTVDbVRPSDM4TDFZMS9HQjF3RUhIc3lr?=
 =?utf-8?B?UXUzSWlqK0htbEZhTVVFV3d1ZWs3RmI2cnc2T1BrNEtleDdxUG1tOGNCUFJD?=
 =?utf-8?B?VDB5VHF4RlppeDE1WmY2Qk43RmVzUy9NZG5JeWFwQXlPejl6NmN6b2poYzFE?=
 =?utf-8?B?cW1GRHdEdHdTditpOTdHTUkwOG1HaDFsZzNGam12QzJlMXRKb1A3Ym55WlE2?=
 =?utf-8?B?Tlg1eWptT0F0dUNFSzMwL0RXNExNb2pyZjdlenZERk5HL211eDZHaVFqRmV4?=
 =?utf-8?Q?Xl00g35+Cc1woW/gOS0BsgX6B?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECFA4090DA71D240BE25023B2B6380FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f12380-0508-4851-7681-08da872b4d36
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 06:22:07.4636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eiUVvb9BqVHCF8QkTDqLprptxclKwyNW3oSVsSupfwHBNJLnHfua7X/JM8NPhYJDe+K3azEn8UY75C8ZGD1OMVo25WM/XOUVnTxQ8Hko1Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765

T24gMjYvMDgvMjAyMiAwMToxNSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gV2VkLCAxMCBBdWcgMjAyMiAwNzowMjo0
MiBQRFQgKC0wNzAwKSwgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBIZXkg
QXJuZCwNCj4+DQo+PiBDb3VsZCB5b3UgcGxlYXNlIHRha2UgdGhlIGZvbGxvd2luZyB0d28gcGF0
Y2hlcyB2aWEgdGhlIHNvYyB0cmVlIHdoZW4NCj4+IHlvdSBnZXQgYSBjaGFuY2U/DQoNCj4gVGhh
bmtzLCB0aGVzZSBhcmUgb24gZml4ZXMuDQoNCkkgdGhpbmsgdGhlc2UgYWxyZWFkeSB3ZXJlIGFw
cGxpZWQgYnkgQXJuZC4gSSBndWVzcyB0aGUgc29jIHBhdGNod29yaw0KYm90IGRvZXMgbm90IEND
IHRoZSBwZW9wbGUgb24gdGhlIG9yaWdpbmFsIG1haWwsIG9ubHkgdGhlIGF1dGhvci4NCg==
