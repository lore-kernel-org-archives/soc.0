Return-Path: <SRS0=bXzz=GP=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A48C433DB
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 10:35:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6F3002310A; Tue, 12 Jan 2021 10:35:21 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.34 at mail.kernel.org; Tue, 12 Jan 2021 10:35:20 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA5E8222B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA5E8222B3;
	Tue, 12 Jan 2021 10:35:20 +0000 (UTC)
IronPort-SDR: +YRYXXwKENS8awxyTWzVdhI868equFsFPsk4qZFSmyXSih7XsH+dEJlKRkG4jgRtg2QJrp3CmE
 fLdgOrY+EFOxQJnqJLqlji7feTlYzQ37UJS0Y/JfnEstfO97wx9oTxa59QU/LAwK4ptzf2C5BO
 iKzK+VCEJdn2K2go1veit9gC4/kcNRNJ2l8dgYQ6Ub0ug6vumhE9E1hdu3YZz1ak5Re1zlSz73
 hGc5/aPpx4vG1RhsBtOggAXap6OkZ0F/EPWwY/KnB1vbk64HnDc+8EeZttw5glPJl3J2xQuyyi
 nms=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="24254645"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; 
   d="scan'208";a="24254645"
Received: from mail-ty1jpn01lp2055.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.55])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 19:34:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gL/QJEjKFo3kjZ4J28VzG9XtFBElgNT/q+m25VGzckwnUE45aCv28L0KNGbDfc+W6+BJTMvwU1p9JE/9ckcIhIQ60Cbknd/0CCpzpC9d6gjBhXlaxClsNZzvfbt+mnYKSkWyhvtthc2YvFfPVYeBaY4lrncZqixEt+p5bxLlZZ3L56SzhzDa4Sbprht3P+TgXflXm7i51FDgbUnDMU1q42khXVdAh1om8oUj3x8JTstylrUbe/gq/SUMwQqkXG8jj0JM6vMWV0/8+vcPBh7m27VOgS3wjWgc/4S0RLktQXdL8eQXTzjYZNknJJk6bU6wZDZM1uGM+IMO+aRdmjMrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLVAIre6gEkUiLFXccBOpTDKKNK52tjzCZKKRfDcHo8=;
 b=gas5xPhqETzNCaf47eJqXVQfc91LWNTkBQse6enIIOkvrLoPXQ0N6UCWCQbSZJcIunFGIMQwy4hHuy1SyfzcKCxjf8YJdUNWoxa8VYUKM9ejDh1kAEYX4GXQBzfFxRgrWH6gvJagjbuU+kJVii/9UIcZNYJZp2io5VScwdnTKCSeGmhvLN14VYOhmRkfqQS8FcmTI0Djk6CwAECslEGZ7ZAU686QD6YFhdXTy9u96pN53TbsaVRmWWah65GmlUSDKAPzf0UxR0XUrJ/yg+RuR6W5ZWa4BK+TbM0K4a+vO/Qrk0PNdTeWvDnqZ93KJETgSXMvhh4ZbWDt0G0cGSpT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLVAIre6gEkUiLFXccBOpTDKKNK52tjzCZKKRfDcHo8=;
 b=JEToI5BGUjaFdMj8cnak1y82cVNRpaD7+QpyVRqnd0tdMLM4YEliuSWOgbBKiWNnUwFkSC3QSrQvzPL9hB83mrBMwfLdGBnjOX6YdEAr78au7LPWFr5I44xqY5U/Xz+BH6t3ILGsUjHzNDg+Fuut8rEhFa5bA2kXUenW3yBucUQ=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSAPR01MB4692.jpnprd01.prod.outlook.com (2603:1096:604:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Tue, 12 Jan
 2021 10:34:10 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:34:10 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Mark Rutland' <mark.rutland@arm.com>
List-Id: <soc.lore.kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "soc@kernel.org" <soc@kernel.org>,
	"olof@lixom.net" <olof@lixom.net>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAYVV2A=
Date: Tue, 12 Jan 2021 10:32:53 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:33:53 +0000
Message-ID:
 <OSBPR01MB4582D35F320C026611AA807CE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
In-Reply-To: <20210108125410.GA84941@C02TD0UTHF1T.local>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: 9333fa91eaa64170bd7e6644cc66241e
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f9fe578-40a3-4eba-2b21-08d8b6e598dd
x-ms-traffictypediagnostic: OSAPR01MB4692:
x-microsoft-antispam-prvs:
 <OSAPR01MB4692AAA6E34D18C641D51FEBE5AA0@OSAPR01MB4692.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t1Cuoztd4iljtAur3QXOAeh0s3ITPMJ12C29b2tf1g8339lxBHVVpoI48M+vi3p2ZBoG8ML9BnNvITkT1X2xpBJMTWB+CvBrYzlD0OtnzrvTuyoTN3TH9/wdmmm+Oz9kOW7G+3UMs+zkuOjr1G34Nbj0wrDSv2B22BwLiuhvu2Ywna7HiYtgr/G2GxjfcPTGtNgBp4WsRoD+PxMkzIPTK1ldccJkg8lgNp2BK8nXJn2Kr3JSb4aKVddqZDBDeCO/VF4+0APxuzyoJWGyGou0TEHZJNhoMp3wDtB8GTJCnGFyJCalvAtMhs26VzKo1k54RMEUcfoIjv0jw7/UJYzooTxBO7n27zeXfnED7NX83M6LWXh7hqwn0+amsvANPMQ83DO7G5DZyqt2IX1Qrs0RI35EDoF1KEBptCfpWl98jo6VrKw8bJrBIPpwxV2ZQiRROFBE4YTC+Gk3f+5CvbIIgmtw+eV8BzL0WBhs817c+AOk3Ja7KvXVuvOjQHnC5S/WJqeDvGeukxlS/hLrfjm95g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(26005)(54906003)(5660300002)(66476007)(478600001)(2906002)(6506007)(316002)(6916009)(4326008)(86362001)(83380400001)(8676002)(9686003)(55016002)(66556008)(186003)(85182001)(52536014)(76116006)(33656002)(966005)(64756008)(66946007)(66446008)(7696005)(71200400001)(6666004)(8936002)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?iso-2022-jp?B?MFV4U1dJa21GSU41dmZaWWZnN20xQkMwRzA4WEIxcjMxaERTRytoOTVH?=
 =?iso-2022-jp?B?YkVtWHBsMW5Rc2pVWWxTdzFuQTA3cHBFanZpQll3U3pvWW45SVM2ZUhI?=
 =?iso-2022-jp?B?UFpZSmM3M2JweFdsUEZPSnJoUmhlaEcxQlFTUnRqcGtvVW8rRC9wSVJq?=
 =?iso-2022-jp?B?OGJ6QkJKRXRqWjJvOWFaUmFDN3RHSUtMU3haWGZNSVNXbGZNbnkxbWZJ?=
 =?iso-2022-jp?B?eWhTS1BDV1V4UnRnU2FOQWM4TUZPell0YXMrNlk5ck9UMHNSb1p4SEFK?=
 =?iso-2022-jp?B?czVoVlNmYWdqa1dCbVZCVzNmVDVkOXNVODdUYk1PY2N6citaa1RkSWlT?=
 =?iso-2022-jp?B?R3BIS0pLTUhob1M5Z3lBVkpWVTFuMUlMRitReXVEM2RVM3hiZHZPSDJ3?=
 =?iso-2022-jp?B?ZXZXdHJQYmJGY0FUbS90WHRaRXNrNW1Ock9XdWpZODBKWXBYQlo4YnRN?=
 =?iso-2022-jp?B?MkJ0QjFyODhCayszbjRxaC9wL0dFLzhGTEhiRFJmZ0NyMjhBdGRBdVhB?=
 =?iso-2022-jp?B?dDFSYStqeUVMSmZ1dHpoZWhZcDdvQ0pBOEplNURxNTBWRm5pTm9VT0dE?=
 =?iso-2022-jp?B?RHY3UGlpMUtFaVVlNFlLQ09PQlJWbHo1L0dFUkx5OUZqN01MVDZYYTZi?=
 =?iso-2022-jp?B?L3B5OVdkNFRrWXZuM3ZqT01zTmlSTS9hdm9NK05RWGk3UVUvV1ppdEJI?=
 =?iso-2022-jp?B?MFdiUjlYalhWTWZSNDB5aDQvbVBSdjBBRkxjVVA4akxBL2hrRllKeXN1?=
 =?iso-2022-jp?B?WmhEbERsN0dnRjJDcmtpdXNBUm1EQ3cvTzhRaTM0SW4xck44TE1PeXJ0?=
 =?iso-2022-jp?B?K1BBTmFUTVRQZkJkdEQ5bFhJMmxydTFCWWZMQTBCZ0JuVWQvVUl4UUl0?=
 =?iso-2022-jp?B?bUJ4S3NIdDRwaUlycC9oem51QzZtdFJoUDBlc1dDSWVmQzcvOWdid2hT?=
 =?iso-2022-jp?B?UkFocXJWdW5hUndFSWJNS1ByMUdyR1JMaHAwZ3ZlQ2RHZ3lJV0VLQVVY?=
 =?iso-2022-jp?B?OUtOU3ptd0pvR0N5MHRZQnQ5dzJQclExMFpRcHRCZzBmOTlaZ0Nid2pF?=
 =?iso-2022-jp?B?emY2ZEJCSkRSMXZqUm8xUkhuQjBJUUNHOVZqdy92YXNKSnE2dGREbGNj?=
 =?iso-2022-jp?B?a1RTVytQQ1pMMCtqdmJMT2RpNFk3VTlPMHFtU011NHFDWC9DeUpmSS82?=
 =?iso-2022-jp?B?QURYWGhJd0NOOW5MYW80dFM5OExWQy9oV3lrd3pxR0VEQ2pNTDA1c0Jm?=
 =?iso-2022-jp?B?SzRLRy80QXBGbzNZak05QWE0S2FHSnJqekhyMkRyQy9GUE8yNy9yVmll?=
 =?iso-2022-jp?B?R2ZhNCtmVEpuYStxRm1VZXRQWE1rZFZVeHR6ZnBIN2psSkZycFY5V1BJ?=
 =?iso-2022-jp?B?aVdrYWt1dE84MG9SQ29xNW1VclpqU1Z1MFN6dHc1RVlUSmluQT0=?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9fe578-40a3-4eba-2b21-08d8b6e598dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:34:10.0083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JriwseaBnMCSD3vBxRQH2JoKn8k6QrbfvOR/fUT0NILyzGSDoT1lLdWFp07U3GmkyphuS4qSiqrRm+5ZRYcy/PXgdvDSGzckLngJ4jNUydU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4692

> On Fri, Jan 08, 2021 at 07:52:31PM +0900, Misono Tomohiro wrote:
> > (Resend as cover letter title was missing in the first time. Sorry for =
noise)
> >
> > Hello,
>=20
> Hi,
>=20
> > This series adds Fujitsu A64FX SoC entry in drivers/soc and hardware
> > barrier driver for it.
> >
> > [Driver Description]
> >  A64FX CPU has several functions for HPC workload and hardware barrier
> >  is one of them. It is a mechanism to realize fast synchronization by
> >  PEs belonging to the same L3 cache domain by using implementation
> >  defined hardware registers.
> >  For more details, see A64FX HPC extension specification in
> >  https://github.com/fujitsu/A64FX
> >
> >  The driver mainly offers a set of ioctls to manipulate related registe=
rs.
> >  Patch 1-9 implements driver code and patch 10 finally adds kconfig,
> >  Makefile and MAINTAINER entry for the driver.
>=20
> I have a number of concerns here, and at a high level, I do not think
> that this is something Linux can reasonably support in its current form.
> Sorry if this comes across as harsh; I appreciate the work that has gone
> into this, and the effort to try to upstream support is great -- my
> concerns are with the overal picture.
>=20
> As a general rule, we avoid the use of IMPLEMENTATION DEFINED features
> in Linux, as they pose a number of correctness/safety challenges and
> come with a potentially significan long term maintenance burden that is
> generally not justified by the features themselves. For example, such
> features are not usable under virtualization (where a hypervisor may set
> HCR_EL2.TIDCP, or fail to context-switch state that it is unaware of).
>=20
> Secondly, the intended usage model appears to expose this to EL0 for
> direct access, and the code seems to depend on threads being pinned, but
> AFAICT this is not enforced and there is no provision for
> context-switch, thread migration, or interaction with ptrace. I fear
> this is going to be very fragile in practice, and that extending that
> support in future will require much more complexity than is currently
> apparent, with potentially invasive changes to arch code.
>=20
> Thirdly, this requires userspace software to be intimately familiar with
> the HW platform that it is running on (both in terms of using IMP-DEF
> instructions and needing to know the physical layout), rather than being
> generic and portable, which I don't believe is something that we wish to
> encourage.  I also think this is unlikely to be supported by generic
> software because of the lack of portability, and consequently I struggle
> to beleive that this will see significant usage.
>=20
> Further, as an IMP-DEF feature, it's not clear how much of this will
> carry forward into future designs, and where things may change. It's
> extremely difficult to determine whether any of the ABI decisions (e.g.
> the sysfs layout) are sufficient, or what level of changes would be
> necessary in userspace code if there are physical topology changes or
> changes to the strucutre of the system register interfaces.
>=20
> Overall, I think this needs much more justification in terms of
> practical usage, safety/correctness, and long term maintenance, and with
> that I think the longer term goal would be to use this to justify an
> architectural feature along similar lines rather than to support any
> IMPLEMENTATION DEFINED variants upstream in Linux.
>=20
> >  Also, C library and test program for this driver is available on:
> >  https://github.com/fujitsu/hardware_barrier
>=20
> Hmm... I see some code in that repo which looks suspiciously like code
> from the Linux kernel tree, but licensed differently, which is
> concerning.
>=20
> Specifically, the asm block in internal.h (which the SPDX headers says
> is licensed as LGPL-3.0-only) looks like a copy of code from
> arch/arm64/include/asm/sysreg.h (which is licensed as GPL-2.0-only per
> its SPDX header).
>=20
> If that code was copied, I don't believe that relicensing is permitted.
> I would advise that someone with legal training considers the provenance
> of that code and what is permitted.

Sorry, I must have lacked the attention where the code comes from when I wr=
ote the code.
I have removed that part to write assemby directly:
 https://github.com/fujitsu/hardware_barrier/blob/develop/src/internal.h
 https://github.com/fujitsu/hardware_barrier/blob/develop/src/hwblib.c#L215

Regards,
Tomohiro
