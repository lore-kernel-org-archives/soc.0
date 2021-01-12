Return-Path: <SRS0=gmZ6=GP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AB6C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 10:52:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A742250E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 10:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A742250E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u6mx8oxKoychipXAubASDLRppKpibP1K4H1Dhkm/8zM=; b=qmF1RyyKgVe1arViJXYFpCRUL
	Baqygv9lHBB2GE05ZKtQ5sbY74cRQgz9hSP9p+VMfyVyp/+6H5LvhWQGIo3YwtBRk/pv8eUPTQpto
	QCAiawotyjD/9LD26tCAzdZu++4Aony5ysanscYET/ohqfPZ8fLJH18+73oModGnZyESQ9DKcsO0o
	Op2RhqZBOSIEIdd7NmKxXVuoXHbVIaS9GtqTQP1/RiWjcwKV4KQujovmEEU5w8n/QN63xw6YP6Rxv
	/SV3/OY4srI+Q4TXnXqBfyc0uTXBNsEiptIipwPAmjPx174QpoQWUG7y9osVXjD2IiLGDnJYWPkjg
	BYjkMiYnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzHGJ-0003jZ-9e; Tue, 12 Jan 2021 10:50:55 +0000
Received: from esa6.fujitsucc.c3s2.iphmx.com ([68.232.159.83])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzHGB-0003hK-Uj
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Jan 2021 10:50:49 +0000
IronPort-SDR: Q0CoGtMKJbcaIsxmtFKfXk1sCAiOOaFU9BKZop8x6Dw/XBBo7pwsH6f6yDInaIiL2omAFQGp+4
 5oyG7kUGPWVr+N7Bbjc5ijTaVBAX/amZWUn30VFmPLWs45VPKA34/1tNybHZW16UtpCC4f6Ezs
 Yj208ZuS2s36WRf+2am95RHxu0wXBgdDapaDvs6wvY/yJ4Lls4oGidfTbaLv/5YHVYH6BpsRiH
 TcOTRX5YP64zX7Eaauflgm97xGKycGxd7yu8efBySOQeqdUe8WlhIDBQzWzdega6PcARaHalU0
 y3I=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="24347794"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; d="scan'208";a="24347794"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 19:50:42 +0900
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
Subject: RE: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
Thread-Topic: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
Thread-Index: AQHW5afs5N54s+MgtEWWkkqkCyxp9qodh8MAgAAkMICABii1MA==
Date: Tue, 12 Jan 2021 10:49:30 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:50:30 +0000
Message-ID: <OSBPR01MB4582FBC2071D33B43770B73DE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
 <20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
 <CAK8P3a15PUC5Tu+FBuyZYtyQUC_bc92zVszYeFoCU6tn05jgMA@mail.gmail.com>
In-Reply-To: <CAK8P3a15PUC5Tu+FBuyZYtyQUC_bc92zVszYeFoCU6tn05jgMA@mail.gmail.com>
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
x-microsoft-antispam-prvs: <OSBPR01MB1576C33EA6EA9FE48BDA46EAE5AA0@OSBPR01MB1576.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uW3VSXYZQJaz1JXWWLzSnJs/vL+6dRPFMALTTj9sGMqrDdC3G5K2FJ64AQIDcW8IpE1GBYaqviM0ieJE/HpCL55GOFFqkzONg1tUEWgvGXUvDegEJ9CsXMC+MTWoE5cQddFe3KuBubgBIaDH8LgYMAXoBRzqkVZq3Tlm7HLIfFK+5jnH57fC8/B22rCgE5yxrjMafcE5fWfgGTk3082ewdKn8wljp8upTbukBCFeDwnWqHaB5apgUGSBoSZWOlKLNWMJNtCHYKXGS7qK1VzsI6YF5j77JyJoQo4yi/2pvvhqbBEUqFT4wZX6JTqfOrRrLQC6ci2BmW8XK+DyvQMBgiVUI+soveCC4t2MUpFkyWtHugQ8ngM8KE59uNEvbe4qhkcWndVVFtZLZBb1g+9YmQeXXcMRUk1UmlfTfPuLhMisEyTAHiW5+y0qdOxV+IDF88vjj3dhH5vf82ULUqNmOZQgAfE+Zn5vPUvd70dJHiVLfbvcBhMoBfyb8CJpsEnyL5rCvHyb3Fdz/DEwwbu5Zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(26005)(9686003)(71200400001)(186003)(6916009)(76116006)(66446008)(8676002)(8936002)(2906002)(966005)(316002)(85182001)(54906003)(6506007)(64756008)(4326008)(52536014)(66476007)(53546011)(478600001)(5660300002)(83380400001)(86362001)(66556008)(66946007)(6666004)(33656002)(7696005)(55016002)(777600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MTJaNGF3MUo4akR3ZWhUcW1meEp6dHE5dkVMUG01MjVlS2xVNU5jY256VGpk?=
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
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f22aab-b689-4cdb-b4a1-08d8b6e7e6e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:50:39.9857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tqklq6fBcTiTZrt4kaQ04ssE8pIB0XI/HmkyBwrLlOsiUUByJ9WQN5c/79gUKrUuVJwWn8+obUEwH2Zp6m0FxKyolYHIPaFFeMOf8Z1VZ9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_055048_234496_C84A09CD 
X-CRM114-Status: GOOD (  29.88  )
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
Message-ID: <20210112104930.s9-Cnqu6bXHqtatHgn9RTYCrxHvyMKhk2Y5qq7rG3_0@z>

> On Fri, Jan 8, 2021 at 11:32 AM Misono Tomohiro
> <misono.tomohiro@jp.fujitsu.com> wrote:
> > + *
> > + * This hardware barrier (HWB) driver provides a set of ioctls to realize synchronization
> > + * by PEs in the same Come Memory Group (CMG) by using implementation defined registers.
> > + * On A64FX, CMG is the same as L3 cache domain.
> > + *
> > + * The main purpose of the driver is setting up registers which cannot be accessed
> > + * from EL0. However, after initialization, BST_SYNC/LBSY_SYNC registers which is used
> > + * in synchronization main logic can be accessed from EL0 (therefore it is fast).
> > + *
> > + * Simplified barrier operation flow of user application is as follows:
> > + *  (one PE)
> > + *    1. Call IOC_BB_ALLOC to setup INIT_SYNC register which is shared in a CMG.
> > + *       This specifies which PEs join synchronization
> > + *  (on each PE joining synchronization)
> > + *    2. Call IOC_BW_ASSIGN to setup ASSIGN_SYNC register per PE
> > + *    3. Barrier main logic (all logic runs in EL0)
> > + *      a) Write 1 to BST_SYNC register
> > + *      b) Read LBSY_SYNC register
> > + *      c) If LBSY_SYNC value is 1, sync is finished, otherwise go back to b
> > + *         (If all PEs joining synchronization write 1 to BST_SYNC, LBSY_SYNC becomes 1)
> > + *    4. Call IOC_BW_UNASSIGN to reset ASSIGN_SYNC register
> > + *  (one PE)
> > + *    5. Call IOC_BB_FREE to reset INIT_SYNC register
> > + */
> 
> On a very general note, I would like to see some background about how
> specific this functionality is to the specific design of A64fx. If there are
> other processors with a similar requirement, then it would be best to
> define a more abstract user API that can work for any such product.

As I said in reply to cover letter, I don't know any other product having similar features.
 (reply: https://lore.kernel.org/linux-arm-kernel/20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com/T/#mdb9dd8f8cb8fd0b1ce24983efb8b616a38f4b8e8)

> > +static int __init hwb_init(void)
> > +{
> > +       int ret;
> > +
> > +       ret = setup_hwinfo();
> > +       if (ret < 0) {
> > +               pr_err("Unsupported CPU type\n");
> > +               return ret;
> > +       }
> 
> Loading the module on a different machine should not print a warning:
> In general, we want it to be possible to have all hardware specific
> drivers built into the kernel, but not print any irritating messages
> when they are simply not used on the hardware.
> 
> One way to avoid this would be to use a platform_driver() that
> only gets loaded when a corresponding hardware device of some
> sort is found, or ignored otherwise.

As far as I understand, to use platform_driver() the system needs to provide device tree or
ACPI entry for the driver. Target system uses ACPI but there is no corresponding ACPI HID
for this hardware barrier feature as that is an extension feature to the processor.
So, I thought it is not applicable to use platform_driver().

At least, I will remove this pr_err() If I send updated patch.

Regards,
Tomohiro
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
