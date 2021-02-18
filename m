Return-Path: <SRS0=DAyh=HU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDC5C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Feb 2021 09:51:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6160A64D9C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Feb 2021 09:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6160A64D9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jwG2XAev+i7KL5Iu248VrI3D7O77Srkrf2qTBictv4I=; b=KLIAMLoNOHWO6TX5EwrLXBJnc
	QPIbPz8bxiEE0llNBT/5w7W9EfdXnicVvcdzmAiGS3ldjocu6yfkjq6jvZ+oYfHU3TnzrBwg6HFrr
	sqjLAhXCQqfSGLHcMr//DYJ0JR5/eQFGfH21GsMYURJf55//g8cYYHaBXsROr0ws0FVWqqu6zqeQy
	FeKidzYUroKjF5rjKpmTQWtkGa+7BGJrrFkoZk+uArpdW0XXF/mc/DCl7P9L5NM4df5/VfJwv+R4z
	EjiCI3+/9WUDjwVDP3E+aRsElfHwzZ02XxIexn2Hw7dF1O8AH22kk5D+Bb70F6RxCcCd/lEeVUnLT
	oVkZjtZhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCfwx-0007gs-M9; Thu, 18 Feb 2021 09:50:19 +0000
Received: from esa9.fujitsucc.c3s2.iphmx.com ([68.232.159.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCfwv-0007ff-4X
 for linux-arm-kernel@lists.infradead.org; Thu, 18 Feb 2021 09:50:18 +0000
IronPort-SDR: JpQFp+4EcYd5fHSTYVskxqcUhRF7Xr98llXL0dZ1srVa7AUACu0et5RZ8EFVn+QmfSkxibUirp
 rWefDkj/tV3XLtaPERJ1uGilz4dFnCW8GWhqB5kEXXkE0XTW3G63F2sPmy4K9zbnnHZwQzKZ3u
 Wys6AAnjGupftcsvDL5nsXq5zsCFOUcggD/WRv2/I0Ra3FggnD+1p2DZ8QDNmxCmLMA42drgRc
 u3eVESG4uD9eNERAwJOY9HUz8QUZjxkpRPR/s2tceY2BK93ziyjNs13p+/1D9V3bc2w623Y4Qu
 v24=
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="26436423"
X-IronPort-AV: E=Sophos;i="5.81,186,1610377200"; d="scan'208";a="26436423"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 18:50:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhB4ME2QGlpUsYMdITuf0uS3H4bQXh9+QImvJI9DzhDIB1cr6J3CDrOKEY45oDCW/S0rzCJ07Kv3lsjX/7PBHG4HV1MIkK8pJNS5BdVG4HhOxKP6dRFYt+4OK226umNEN35pmbHdZg/0SaCseQ0YowoiHrfrp9jTFoPyzSXRJbaT0pVsAN9P5nkaoockNYXapa2JGzAuD0ZvHmjYsY0a+8ghlfpI8FCr7D/HUP9ye4KhWt5VdNAVlnMQ2Es2XgqaTN3q8ZP3THYtZgS0sFBEDa709RIMtvscWnqGIOqOPdyV5rZERG0eHUP8wyqJHS3GsOawus/+ERXvDiP1RRTb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95Rcp4anV1p6udtsJYlvho649bYOB4kDG5x8+3WE8zc=;
 b=meYNhbwIAlfGwpk3aosrxE9WmmQAMXMNpedZ8V8zQIw+1s0Zo3CRKWxYqHSagtc9ZWzofl7z8x0uSeNLw3PYILWiT/ve9wM6o12xqzbghWYu61hR0Ou52iZ8y9yewJXsV1iAOW9TdhiT36f+ihck7NRVE27fJZ/Ar5K53QzYvYbJUA5JKzx1MqPH7EvvyRXPKanU7IJi5TqD4bGT3SHwEZfhc9eSsRjcZoPy9SlQeMlSzFnpGVdnLbPZ7ZSKrstSpKEzZwZl2pE+nOhfoeJVgMavhL/6NMXUI5HwiTMuGT1IZfNMgLekBZrw/4FtgdFehRWBVhBa4xmqrJ38T1Bi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95Rcp4anV1p6udtsJYlvho649bYOB4kDG5x8+3WE8zc=;
 b=YljXxiDNfQsFpiodd2UY8jjz8lqRIoO9LdHIvlteVhKalStgpp0lBAnRIrKNEuezyOaB4BGd1cCcOLRydlEpaxrN/1QTXknPrT1aZ3m6sXVOckSrrHr0BOZ4RRIkevcX5n1jDplkmlt1qcXKuorWgVLFrDWK6M1Yvex1X5qRJ/s=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSBPR01MB5111.jpnprd01.prod.outlook.com (2603:1096:604:39::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36; Thu, 18 Feb
 2021 09:50:08 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056%6]) with mapi id 15.20.3846.039; Thu, 18 Feb 2021
 09:50:08 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8IAATzYAgAE118CAA2BUgIA1Qadg
Date: Thu, 18 Feb 2021 09:49:07 +0000
Deferred-Delivery: Thu, 18 Feb 2021 09:50:06 +0000
Message-ID: <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
In-Reply-To: <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-shieldmailcheckermailid: 1769a2693f974084823e4554ede38312
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf0297f6-bbc5-4950-1f7d-08d8d3f293bf
x-ms-traffictypediagnostic: OSBPR01MB5111:
x-microsoft-antispam-prvs: <OSBPR01MB511161DA9FE5FE4072E4FFB5E5859@OSBPR01MB5111.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SmqITVuHMNBFRQbQDtX+BYfoEk/R6pIFZ1+IeFDcn/bYMk+xISQIjzEBagRCj12s31XAWiCIReldnSw0mj62/v0KioiaGIMZ8N2y8ktKhHk/yubA7FAJMP+fw2yhCVOgxQ152J88rHQ+8mB6y8pwXav9RxRmDEFRmkxqJz+jcshNRwRBxUFbESmqqXxpEJ9ln4O31XurovHS2bQTXrIxzLROId7sU+LdR0xXDxwrHh2zAvskdso4dyruKJcBVHq2lpUdLQSUtt7SfHfDecVpUH9iF4UZj6ycfv+fSxNhBuvXF3dbtgxSX8a7szAsXYsen23C/HEQF5yjpPPJrwv/ZokUCNLBB6rBrr0w+Hk6vkPoQM738nR+qwdFVMDeeOtBfD+rKFDZ7Z/16S9E9nGFTQVpel7ZWQepRopUGLd6cuQn6kjI3zZ146PlC66MVybzW9xCnmbCr2Nmk0iXZRQPaV+u11rnFc+i9gW7xo4ZQb6ZjpQIUelakPJUjjaRTCCP0BmKzkjF2SoE07oK/9NmZsF4sWkvVn8nQtULycEf61BEV+k0sGATclqDDo+IsD/PdPTtlEXmp1UMOBWydCba2kzYYbmz+Q0FvWUnxp8pnGM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(66476007)(478600001)(86362001)(64756008)(186003)(316002)(66446008)(4326008)(2906002)(54906003)(6506007)(966005)(6916009)(26005)(5660300002)(55016002)(8936002)(8676002)(76116006)(71200400001)(9686003)(7696005)(52536014)(83380400001)(66946007)(33656002)(85182001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cHVrTzZFOFFObmtVWXgwOGJwckVqZ24xdVZ3bEtSc2lzdVlnOUlPN3lKSTdV?=
 =?utf-8?B?QW5JUkxvY3ptVi9CSTBBNXBXTEx1Zk5hSHQ1WGpVeGVCM2h1RGZJYTlERjlj?=
 =?utf-8?B?Q0JLaGNNaklCcXpCK1lnYm16L2hmUUZTSGhpQlFFK3RjajUxdXhFQzdsaFZp?=
 =?utf-8?B?U2YvWk9LeFlTRXVkRDk3SkNmeVB4azcrR00zZFd3ZlRsckoxTzNNTkVFdU5H?=
 =?utf-8?B?bmZJNGppUmEvODJCRHgyMUNCVUN3NVBxbi96M1VacVJTb0txMGsycDNSc0lm?=
 =?utf-8?B?Y2ZrRlJ3QXlzeXlVd0RkTW1INWVVc0kwNC9LSWNRTGh1MmlxUmUrdmtDVnMz?=
 =?utf-8?B?VzdEVmFLR0crd1BHVGNYU2wrVExRSjlPMGE3UEtIRkdaa2xuMGZLN3ZyZTNF?=
 =?utf-8?B?Nmk4bHY4TnBxampoRkhGU2t3TTA1bXhDa08vZGl3Z0ZicURBQmtwWXN3bCtY?=
 =?utf-8?B?N1pKQ3NYZjJOM0RFTitMV29DRTArbzFpb0tmVFA4YlhiQXhMZ21LNDM2SDcx?=
 =?utf-8?B?L0E2azNESSthZC8yYjA2QXdEcWIzL0VkK3V3RGpBb2pqOHNMbm1DQXFqc3lS?=
 =?utf-8?B?Y0gzQVh0ZU1lQm9FZVczQ1hzR3BWazRMMU15UkY3bDBMZXdzZy96UXh1UUg4?=
 =?utf-8?B?SWlLTjNSWnF5SXVBWUhRQ1dNZUFnQS82ZGo1SGsra2RCZjgzckMyUml1Umkv?=
 =?utf-8?B?Rk9meGhkVEw2NEM1SXRFYm9EQXZSZVlySDhkd1Ezd2hmdXAydnJaQ1VMaVRR?=
 =?utf-8?B?K0VUei85blJNdCtlNEZHWDhackxIdllnTFpDUXpQdVdLT3NTc24waXJvSE1o?=
 =?utf-8?B?Z1NsMllZeXhuRnVWbXZCZ0RqUy9wL2tYOGE1VFF5Q0VzUGcxRlN2Y01iV1ZU?=
 =?utf-8?B?d0NGTHYwTm94SlFWYnF4dTAvOEI2ZkZQdERnWkZSUUlYZE5XUlEvQVJqRHkw?=
 =?utf-8?B?K2dUTU5NTFYyWjE4UWFXdENmMUZxdXZaRFQ4R1RJaWZZTjRNNGpmakZtNXJz?=
 =?utf-8?B?MXhhbDlCTnEwUWhnSzNrR1cybkYzRGM4YXFHQXE5clZqbFE5NmJtM1RKNXN3?=
 =?utf-8?B?TGJreTczSXhTUmlQL0sxeTVPZjZ5ZForZGtHM0VtaTJ3UkkyUDB1SDhMdWFC?=
 =?utf-8?B?RmJTM3ZJK0RLcTZtOXZONjQrdytXSERRNTl1RnpoTEZ4MXlSSzBZS2ZIQXVi?=
 =?utf-8?B?c0pZSlN4WUZtTUtXUGtObGt4eXd3RUFEK2t1bDlKTmoyaWNPVjJsSU5xUGlz?=
 =?utf-8?B?MXhaWVV4YlJMdWZna3pjV29qZmxra083S0dCTzJLZEpGSUdjZjhQWTRhaEpR?=
 =?utf-8?B?MDJubWErNi9QQ09POFp2d1VkNlJuNzV5ekFiK2phM2luemFJenRJVlNFanJY?=
 =?utf-8?B?QnJHalNpRGt6Wk5qdVFoNmM4R09vY011ZXNpRmhON3ZwanhRUEJpSXlkb3Fk?=
 =?utf-8?B?Uk1QbDY1cTRtcjNhb0FObVhkRmZlQllybjllMVMvREY0OFhIM2dSMlYzSUtk?=
 =?utf-8?B?NWVnTTR1WUtoVWViTnpZVzJsMUVxSFF3dngvamhRWDBzTUFmd0M3R3g5eVVS?=
 =?utf-8?B?bklVeWRhRlJmT0ZSa3psZmM4VnJEWUZ4Slo0UUhXK0JLT3QyZDVXdUJJbzdB?=
 =?utf-8?B?cWlkT1pRZ1d1a2ltK3c5Y21PdFA5RTRHNlJBWTBIdlBwOXVyWEJaNlp4ZnJ3?=
 =?utf-8?B?Z212N3NTbDg1YlBzTVNlaXhLdWxWVzZOUDFkbVhoNloyS0R3KzFLTnZJWi9Y?=
 =?utf-8?Q?jQ29YIlLhF9eqwMtQboJVf6N/iLtPxiewbAaTyA?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0297f6-bbc5-4950-1f7d-08d8d3f293bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 09:50:08.6168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSd1GLAaFeXIzzGg20AT1xPCh1LySZUAAC03NUbFF2KhT/O2gzTyqKAQiBZzwgGPx1OWjsT3MBcsQA/8jzH3YUTuRGnSdycYaSSnQKFg5sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_045017_502304_1B2C5904 
X-CRM114-Status: GOOD (  28.08  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210218094907.--G21EdCTNFds7nFtes1-kAjgoFrxWdGw-CjJ90zZHg@z>

> > > > Also, It is common usage that each running thread is bound to one PE in
> > > > multi-threaded HPC applications.
> > >
> > > I think the expectation that all threads are bound to a physical CPU
> > > makes sense for using this feature, but I think it would be necessary
> > > to enforce that, e.g. by allowing only threads to enable it after they
> > > are isolated to a non-shared CPU, and automatically disabling it
> > > if the CPU isolation is changed.
> > >
> > > For the user space interface, something based on process IDs
> > > seems to make more sense to me than something based on CPU
> > > numbers. All of the above does require some level of integration
> > > with the core kernel of course.
> > >
> > > I think the next step would be to try to come up with a high-level
> > > user interface design that has a chance to get merged, rather than
> > > addressing the review comments for the current implementation.

Hello,

Sorry for late response but while thinking new approaches, I come up with
some different idea and want to hear your opinions. How about offload
all control to user space while the driver just offers read/write access
to the needed registers? Let me explain in detail. 

Although I searched similar functions in other products, I could not find
it. Also, this hardware barrier performs intra-numa synchronization and
it is hard to be used for general inter-process barrier. So I think
generalizing this feature in kernel does not go well.

As I said this is mainly for HPC application. In the usual situations, the
user has full control of the PC nodes when running HPC application and
thus the user has full responsibility of running processes on the machine.
Offloading all controls to these registers to the user is acceptable in that
case (i.e. the driver just offers access to the registers and does not control it). 
This is the safe for the kernel operation as manipulating barrier related
registers just affects user application.

In this approach we could remove ioctls or control logic in the driver but
we need some way to access the needed registers. I firstly think if I can
use x86's MSR driver like approach but I know the idea is rejected
recently for security concerns:
 https://lore.kernel.org/linux-arm-kernel/20201130174833.41315-1-rongwei.wang@linux.alibaba.com/ 

Based on these observations, I have two ideas currently: 
 1) make the driver to only expose sysfs interface for reading/writing
   A64FX's barrier registers  
or 
 2) generalizing (1) in some way; To make some mechanism to expose 
   CPU defined registers which can be safely accessed from user space 

Are these idea acceptable ways to explore to get merged in upstream? 
I'd appreciate any criticism/comments. 

Regards, 
Tomohiro
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
