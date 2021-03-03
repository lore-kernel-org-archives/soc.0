Return-Path: <SRS0=J3As=IB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30399C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Mar 2021 17:42:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5352864EEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Mar 2021 17:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5352864EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w5Zs48ux86keNDT/HXP9VYgsxMCVvX9Kk+PVCLYHddU=; b=O+r7hH3HRfsIiJd5AABQb2dpR
	QKEoBcY8wy24IPjJzfMpjCYHqWdxThKkl3y1PdE2+jB+sviYRd5cF84sLSppEdWXwz7nR0scCkAYT
	ACDma8cKlWmNTy+TLrBneCcsXmz7m5uYB7e5VDTr8vw1efjtRXpVyc1rPhXtcLGMBr3ncQi3bxmP4
	6qPUY9kg3eCt0QmxhQ4UQOXKbx1akWaLUw84T+u+pLCXxds2t24ZVwFGvCA85lasr5evrUDACAD7b
	2hkuEQfLY6rU+2lWEsQHdjAONndkuJNuBUNeL6jns6KyLgdacbomxLuglsn3hQL4ybHVp7YLBxktf
	ekbMtMZkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVSP-005q8f-KX; Wed, 03 Mar 2021 17:38:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSvl-005Ff9-OF
 for linux-arm-kernel@desiato.infradead.org; Wed, 03 Mar 2021 14:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=9FSJJw1Lpxn2xkVEXOM1a+X98pgs+L+9s+cJyVn8ih4=; b=B6ZxC2Ihqn+sUUj6CoqZCuDnVP
 U7gYkC1tiIs5boAOzwtMYttSwroU53UvBH3pRxGCIYTb6AD+Fv4yYozL9k6WyzTYQkU56/igKZrxh
 f26t8ZVQkEHxyMQTRa5oz9VrVRAa2wKi+WOb3ECGEXV1eukxTrnCam2kQPVoDFUGZJ1fFlPynWAAW
 8bC5dm0IJncUUvGAnP2u5/hhL3yGLPkKNK2nsfvjRGbpSxyk3RdYTSfURMY63dMsWPEFkr/EC9hp7
 y+gvUV50sM3/5f92yI12Wxs/vfWFJrujn4CoBsi6j+EVL9cwR3zBbkMk8owHuv9q1EU6dTOlLVvd+
 zOo8btXw==;
Received: from esa4.fujitsucc.c3s2.iphmx.com ([68.232.151.214])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHPa1-002Lg9-U8
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Mar 2021 11:22:14 +0000
IronPort-SDR: YLgEskd/p6zl9sHYpp0OgkNdoBvtIq56vlyeEBmzxppymaTkhVSzjp5Up9B6jDNcj+WNed8vGM
 or10VoqtRBx453G2wueFjw6EDtlpQrg2Dh+UP5rVUno9dYMFT/NTKwdpCdhRxvIGz3BFNM4vv3
 chU2MZtziZj6/k3i5Ju+96NMzuaYYzY2pj4nDjXuBUY9rQAC04CXftUegVmHJS3pdMFIppWPgz
 N19TuWj2qaAuizDW/nyD10XKYWGzrdz/Gpk6mWDUDnW0dDVCTzEUQbkWRen7kjSOMXWYkZxCLf
 ZEU=
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="35100324"
X-IronPort-AV: E=Sophos;i="5.81,219,1610377200"; d="scan'208";a="35100324"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 20:21:45 +0900
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
 by OSBPR01MB3704.jpnprd01.prod.outlook.com (2603:1096:604:49::18)
 with Microsoft SMTP Server (version=TLS1_2,
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
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8IAATzYAgAE118CAA2BUgIA1QadggBLz3YCAAYCFwA==
Date: Wed, 3 Mar 2021 11:20:23 +0000
Deferred-Delivery: Wed, 3 Mar 2021 11:21:22 +0000
Message-ID: <OSBPR01MB458224BBD6E110002DEA7085E5989@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
 <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
In-Reply-To: <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
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
x-microsoft-antispam-prvs: <OSBPR01MB37049EF0FBA0FCF638418CF2E5989@OSBPR01MB3704.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +/L5c+E1Zivg87NtuLXGZ36o+MmzxMWmHLgWVQMWcgv2v42HvfKV+J5GpamQkoIP5QprpeAfGw8VE5QpJkXuw5Or3IroEPmuUFU27joh4axjFoupasw9xZQXA6xMHkeObhi8yIjHR+BIZs8HkLs5QghgUZ+PWS5p7pmBNYNHzdtcH3gKFxCP8R/N7BIv6vfOTngtPm8pEA70GnMpaZbsfCnATfApl02hwOqq/1WZ3TMsD9IZlmXrvZYE3SnU7xXxXdg3hxpQqYLY1NrBtLNDDbMsACdhymodg0t0ZbC+qLvu4CYkozFJ2TjZv4EWhUD+v7C8Q+R1h6aIVCEBq2rZptQZqvMkI16rgUE34TqHO1Qp9qu5JRjHm+ZTtuxeShk4RVJ9shk/1WwkUzgmTMdx1Cm64pEnTRuY7NYycszbD3nQQrY2UVHYgW/RuEKWUM0PXw9XXPwzX8tyKxtMTRkC8aMqNMpLNZ9BamU5fnOhQ7HhwhLfSC8+uQd+y6R60+Lvxr1k3/SaWgvOkLcs3LsN+BmOLVxCeUYsTLRfGjvGSguaAa2DCKcdbjJFVNsebh09GeODVnBa4GOtmGlmhHFj/f44xHTcr5gfHrfeS3uRJcE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(55016002)(26005)(33656002)(2906002)(186003)(478600001)(66446008)(71200400001)(966005)(52536014)(9686003)(66556008)(64756008)(66476007)(53546011)(6666004)(5660300002)(7696005)(76116006)(66946007)(6506007)(8676002)(83380400001)(316002)(54906003)(85182001)(4326008)(86362001)(6916009)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OHFXc2JQOVJJeUQ5WE1uSWpLcElaaUt5Y2tFbFZqcTRXbnNoSGpnZEc4NEdF?=
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
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708b29f7-b8ba-473c-2940-08d8de36854f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 11:21:41.7773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SI+W72vlSp2cXSu+pyY9dUHR1a+PD00E7bExFxis6kRBKYes2E6ZAENj48tYiwbqm7rmKWz4md2ylldZ29mbup8xxKXhzPgebzvPODWamhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_112214_910553_B67DD52A 
X-CRM114-Status: GOOD (  42.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210303112023.A3HV5l8QmmULsLld7V8kbe1B5da-RPh0O-SZ-3cF_7U@z>

On Thu, Feb 18, 2021 at 10:49 AM misono.tomohiro@fujitsu.com
> <misono.tomohiro@fujitsu.com> wrote:
> >
> > > > > > Also, It is common usage that each running thread is bound to one PE in
> > > > > > multi-threaded HPC applications.
> > > > >
> > > > > I think the expectation that all threads are bound to a physical CPU
> > > > > makes sense for using this feature, but I think it would be necessary
> > > > > to enforce that, e.g. by allowing only threads to enable it after they
> > > > > are isolated to a non-shared CPU, and automatically disabling it
> > > > > if the CPU isolation is changed.
> > > > >
> > > > > For the user space interface, something based on process IDs
> > > > > seems to make more sense to me than something based on CPU
> > > > > numbers. All of the above does require some level of integration
> > > > > with the core kernel of course.
> > > > >
> > > > > I think the next step would be to try to come up with a high-level
> > > > > user interface design that has a chance to get merged, rather than
> > > > > addressing the review comments for the current implementation.
> >
> > Hello,
> >
> > Sorry for late response but while thinking new approaches, I come up with
> > some different idea and want to hear your opinions. How about offload
> > all control to user space while the driver just offers read/write access
> > to the needed registers? Let me explain in detail.
> >
> > Although I searched similar functions in other products, I could not find
> > it. Also, this hardware barrier performs intra-numa synchronization and
> > it is hard to be used for general inter-process barrier. So I think
> > generalizing this feature in kernel does not go well.
> 
> Ok, thank you for taking a look.
> 
> > As I said this is mainly for HPC application. In the usual situations, the
> > user has full control of the PC nodes when running HPC application and
> > thus the user has full responsibility of running processes on the machine.
> > Offloading all controls to these registers to the user is acceptable in that
> > case (i.e. the driver just offers access to the registers and does not control it).
> > This is the safe for the kernel operation as manipulating barrier related
> > registers just affects user application.
> >
> > In this approach we could remove ioctls or control logic in the driver but
> > we need some way to access the needed registers. I firstly think if I can
> > use x86's MSR driver like approach but I know the idea is rejected
> > recently for security concerns:
> >  https://lore.kernel.org/linux-arm-kernel/20201130174833.41315-1-rongwei.wang@linux.alibaba.com/
> >
> > Based on these observations, I have two ideas currently:
> >  1) make the driver to only expose sysfs interface for reading/writing
> >    A64FX's barrier registers
> > or
> >  2) generalizing (1) in some way; To make some mechanism to expose
> >    CPU defined registers which can be safely accessed from user space
> >
> > Are these idea acceptable ways to explore to get merged in upstream?
> > I'd appreciate any criticism/comments.
> 
> I'm also running out of ideas here. I don't think a sysfs interface would
> be any different to your earlier ioctl interface or the the /dev/msr approach,
> they all share the same problem that they expose low-level access to
> platform specific registers in a way that is neither portable nor safe to
> use for general-purpose applications outside the very narrow scope
> of running highly optimized HPC applications.

Ok, but ARM architecture permits implementation defined registers at the
first place. So can we provide some method/interface to access them as
CPU feature if these registers do not at least affect kernel operations (like
this barrier) and only root can access them? Library could offer portable way
for user applications (under root permission) to access them.

> You can of course continue using the module you have as an external
> module that gets built outside of the kernel itself, and shipped along
> with the application or library using it, rather than with the kernel.
> Obviously this is not something I would generally recommend either,
> but this may be the last resort to fall back to when everything else
> fails.

Understood. This is the last resort.
Thanks very much for you help.

Regards,
Tomohiro
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
