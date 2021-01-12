Return-Path: <SRS0=gmZ6=GP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AB8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 10:28:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B52206F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 10:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5B52206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PyUBH+65cBrMwOAB5UA85WYhB0ky4PxFsXDSYeApEnw=; b=EHnb+3nUxh8LfEGak3ASLJsl+
	WPfC+pyaHvQaamt/X20KWbVGmt3wGshOLAX1+LI55/9MXVqHLQuxwVP0I6oppQrTwEnLkOb6cbK60
	2bnFd3ijohDTp9kXEUCYsgix8D66qZ5SlOPbPZ8FXnnIUNS6EdaCSLvZC1+J2R2IisPJEIWZNP0/N
	bn0Sp+FwlOs+RIuPW9WG0ZMUIBMlj17aZlYbg55VUhC0eXpP9CONEbDmNKY6BOYcfjFQ3QGhB5D9d
	Bd+mCQlf2K3jQZv+E9oOKYOmh+yFB0CG0nAgkrOyWuwu1JXFM3UEm1UTZySf02G0UbpMZMiwsapl8
	Bhd1/Hbsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzGsd-0003s1-97; Tue, 12 Jan 2021 10:26:27 +0000
Received: from esa15.fujitsucc.c3s2.iphmx.com ([68.232.156.107])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzGsU-0003op-Nx
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Jan 2021 10:26:22 +0000
IronPort-SDR: t6sV90CGYIrSPTV2/iF7ByLYYQ7uOkD8JIfviTASEyyJPC4UI+MZIOyHPH2F/fAM01HZcPhgqM
 YZ9jMcnky5JCnGk5AhQK28vX7linhG/dlDNMs2gEr2Ak8iP67+QMoRU15dvDhrLVtfHQe2r6bR
 bAmxGeveCSNtrUFZ38VOUxQVzFWOMjRGay8cDioMaNUuxZxmAO/erGeY1/tZHOu8ll01LX810w
 Anb0Xk3SdrHJ1A4w4d2uOA+elsb+OD9FMnwfzQhgM1ee4YgwQoe7gsTG/9oG8kSfxSfCloYcp8
 nts=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="24091845"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; d="scan'208";a="24091845"
Received: from mail-ty1jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 19:26:14 +0900
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
 by OSBPR01MB2678.jpnprd01.prod.outlook.com (2603:1096:604:1d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Tue, 12 Jan
 2021 10:26:10 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:26:10 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8A==
Date: Tue, 12 Jan 2021 10:24:48 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:25:47 +0000
Message-ID: <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
In-Reply-To: <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
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
x-microsoft-antispam-prvs: <OSBPR01MB267809722DDC270E27EF7967E5AA0@OSBPR01MB2678.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4AGhZ2eYqxgPjXFG7HpJpAtWMvYPOEYy0AXLPXyAp2lYDInVPtR6IR64yUzHnZG7Rc/Mkglt8BTBSG121gLnpyOc4vQC2dizTTEg0Y3GzPAkhSxoTsNVXVg80VdBUWX4P5eNnU60GRti+LgTNVuccYX5XOOpT6AKcngz56rTDUea8LRVBg+G7/BaFiLgLWZAIL9hCbI/x4VD9zzs5oYFE6bkbFH6Cvpt2gFS4TxlUEpLeUXXUvbeLQ6RWQoUBKg9slU5j6beZAQaoYPd3yxheMyM+PvnitV2jwuT5YvgK3zQBpVVmG0JGvZK7OfnBNpst5+vEmO0VIzYqs5zB8OsUxLhrBB8/b7s0eXyOwqzPCzEYAqMwrgGTDLa2c8ID4AJMDHwSHoTxwJKVjGpsdAUl7xaE0Lse3S+y4DllLo4QV/+QRWRODuonMdsMbkfT8B4EBuTy3uR3tIgKfzL6+ECx52Bgk7mYALjKPAOpV7/mJJ7ymuiq4E44DIZh1m4vMnXRhgSdODqrwse9NLVr6ArRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(478600001)(83380400001)(66476007)(26005)(55016002)(6666004)(8676002)(71200400001)(76116006)(66556008)(5660300002)(186003)(54906003)(6506007)(52536014)(85182001)(66446008)(316002)(66946007)(86362001)(7696005)(110136005)(64756008)(53546011)(9686003)(2906002)(966005)(8936002)(4326008)(33656002)(777600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?b1JUMlVqOUdXenZPdGRWSEFIclp5eU4ySllPWVowdzVHb3VqOU9Ia3R0ZEZG?=
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
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93188e02-02e4-41f9-b0ec-08d8b6e47ac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:26:10.0048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tHKUNcOg4h2vgCkbE2YevY8wX3ft07J55b/jHecr4NEhWqQ4tkD/VHlxSSZmHf8EI80NUYhKUCxVvjEW9Ij5BMKmb1C2vJeIp9d7KT6cds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_052619_935854_BEFA380F 
X-CRM114-Status: GOOD (  41.96  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210112102448.g938VjN_ZGtTEgXqkUQO72VwGGu_c6yzvskEl3xGnH8@z>

Hi, 

First of all, thanks a lot for all the comments to both of you (cont. below).

> On Fri, Jan 8, 2021 at 1:54 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > On Fri, Jan 08, 2021 at 07:52:31PM +0900, Misono Tomohiro wrote:
> > > (Resend as cover letter title was missing in the first time. Sorry for noise)
> > >
> > > This series adds Fujitsu A64FX SoC entry in drivers/soc and hardware
> > > barrier driver for it.
> > >
> > > [Driver Description]
> > >  A64FX CPU has several functions for HPC workload and hardware barrier
> > >  is one of them. It is a mechanism to realize fast synchronization by
> > >  PEs belonging to the same L3 cache domain by using implementation
> > >  defined hardware registers.
> > >  For more details, see A64FX HPC extension specification in
> > >  https://github.com/fujitsu/A64FX
> > >
> > >  The driver mainly offers a set of ioctls to manipulate related registers.
> > >  Patch 1-9 implements driver code and patch 10 finally adds kconfig,
> > >  Makefile and MAINTAINER entry for the driver.
> >
> > I have a number of concerns here, and at a high level, I do not think
> > that this is something Linux can reasonably support in its current form.
> > Sorry if this comes across as harsh; I appreciate the work that has gone
> > into this, and the effort to try to upstream support is great -- my
> > concerns are with the overal picture.
> >
> > As a general rule, we avoid the use of IMPLEMENTATION DEFINED features
> > in Linux, as they pose a number of correctness/safety challenges and
> > come with a potentially significan long term maintenance burden that is
> > generally not justified by the features themselves. For example, such
> > features are not usable under virtualization (where a hypervisor may set
> > HCR_EL2.TIDCP, or fail to context-switch state that it is unaware of).
> 
> I am somewhat less concerned about the feature being implementation
> defined than I am about adding a custom user interface for one
> platform.
> 
> In the end, anything outside of the CPU core that ends up in a SoC
> is implementation defined, and this is usually not a problem as long
> as we have an abstraction in the kernel that hides the details from
> the user, and the system is still functional if the implementation is
> turned off for whatever reason.

Understood. However, I don't know any other processors having similar
features at this point and it is hard to provide common abstraction interface.
I would appreciate should anyone have any information.

> > Secondly, the intended usage model appears to expose this to EL0 for
> > direct access, and the code seems to depend on threads being pinned, but
> > AFAICT this is not enforced and there is no provision for
> > context-switch, thread migration, or interaction with ptrace. I fear
> > this is going to be very fragile in practice, and that extending that
> > support in future will require much more complexity than is currently
> > apparent, with potentially invasive changes to arch code.
> 
> Right, this is the main problem I see, too. I had not even realized
> that this will have to tie in with user space threads in some form, but
> you are right that once this has to interact with the CPU scheduler,
> it all breaks down.

This observation is right. I thought adding context switch etc. support for 
implementation defined registers requires core arch code changes and 
it is far less acceptable. So, I tried to confine code change in a module with 
these restrictions. 

Regarding direct access from EL0, it is necessary for realizing fast synchronization 
as this enables synchronization logic in user application check if all threads have
reached at synchronization point without switching to kernel.
Also, It is common usage that each running thread is bound to one PE in multi-threaded 
HPC applications.

> One way I can imagine this working out is to tie into the cpuset
> mechanism that is used for isolating threads to CPU cores, and
> then provide a cpuset interface that has the desired behavior
> but that can fall back to a generic implementation with the same
> or stronger (but normally slower) semantics.

I'm not sure if this approach is feasible, but I will try to look into it.

> > Thirdly, this requires userspace software to be intimately familiar with
> > the HW platform that it is running on (both in terms of using IMP-DEF
> > instructions and needing to know the physical layout), rather than being
> > generic and portable, which I don't believe is something that we wish to
> > encourage.  I also think this is unlikely to be supported by generic
> > software because of the lack of portability, and consequently I struggle
> > to beleive that this will see significant usage.
> 
> Agreed as well.

It may be possible to trap access to these implementation defined registers 
and fallback some logic in the driver. The problem is that other processors 
might use the same IMP-DEF registers for different purpose.

Regards,
Tomohiro
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
