Return-Path: <SRS0=gmZ6=GP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6690C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 11:05:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848EC2310C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 11:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 848EC2310C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QIDgRFzBRpWvcKvZSN0w4wT37OG4+Dfwcy5Cn6HVJes=; b=DWZzIQ1shkA/9ZTXVeiDdye6z
	tmjOh/hDHZtEocrfauKEuW3hEFzQYSGIYkvrO0CTjew9GHVT7jQLFVXoXnCJPYObG8G4oO6P9riut
	I0IvsyvryqldSjewsfnRejfcslkq8VCKgiD+afGj9jmM8GWfp75Uva3Tiesh7I6JJQ8sxYKN/astq
	oy+gR3N7YbENFavodHKwdizzfW9PHJ1HdFt58LIbekc3E2nB7smJ/d1zSoFkOzVKXzS2DyYXjuMSx
	qY+46KU8W11Z9y8KhtNhZCvtccae4BCIyODlCjoqi1w18/PARbOCveWaNkErHoXAN7+rPYLCX4VnH
	urbOJG+RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzHSo-0007eL-0P; Tue, 12 Jan 2021 11:03:50 +0000
Received: from esa19.fujitsucc.c3s2.iphmx.com ([216.71.158.62])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzHSk-0007co-EX
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Jan 2021 11:03:47 +0000
IronPort-SDR: 8PqRk1ULkbO4Fny/OIFiZ1erJfGf2EwNMZTF5vw+8VsNi3zA9HTBYPr1wRCdgd4YsCUV/X38uj
 Z2rhYeVvLG0bfko9ePFQpx8MqSaRB3I3V4q5/om68koyWmYDJRxeiUZMGMkUkNYkWE1heC8VES
 vvpgK8wphPd/QPTNlQjot2fMcm/XtzKTX/QmQXPhBnmFxtMK3N3gVEkP66924ODzABgHp0SlPq
 lwvaDgiWQwEResLoUZw/XP3/rgbp5sSSXKF3jJG1EAizlc8KMxDutQbBtjaTAW3gEX99UbBwGD
 gQo=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="23991717"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; d="scan'208";a="23991717"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 20:03:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsSAETP8vYvrAXYlea7ELElGawMMpW0FxsVAAtrXc4mVLyrWcH4kqHlYiRx6VvhW/A57HNJyqKdUyGSeXJISkqoyZNKJGZz86Hdhw2fmbUH0Udy3cHQvbFWafamEtdVI0Asan+cZMb3vNwL/w1ZY8Zuy+YGY3DPa8nkOWlOEbeT2HXU20koomr7v73nGfwhxcQYEFqqMe4rPDAssqU3V2W/eUx/OnZYr9vOWpu6VuBh+Jpcn+vc0wmWnymM/LiFiSnQaz0m9w84qw/4+xc0/nIW7uLBMoTLHUeMgGTXezv8Xbp2W7mlKiNb/NLpzmSFn24NEnlJAqG9YoJ4SUzDRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkyQAJuGtThckZ6yqCUxeuzWYa9j5w7dihk5PKwyHxM=;
 b=WZBxLr6SvJsb0I7OtHhJmXWfJ+LIe2cFff9C81mgjKugwqb7rbsSLdmaAn4XETJk5jvuM/ViWlE1MadWplnprnFj7h2J9TBJBqZ/Q6SYu3iMcFixRH5FnuKedTBbkpHuZdJCIk0RgLVSAtNZEBi+MLDL4VA4VVhzHb0cJxBwklsZgwTFbRwula5X4gljtvgIUNq5BuvneEok7uQSw3MkhwcpKybto3D455GWiPBoTrteWMHXtbmAQGJAkaqm8ChoP9T1Ml0BTex1136PMbpDWCNMjGAuol1yerAthQJk7rGBDuvhTTlDIOv5jjQ06yyXTadiIaF0p6pDRXWzLUeLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkyQAJuGtThckZ6yqCUxeuzWYa9j5w7dihk5PKwyHxM=;
 b=nCiFpLOkjXyARp4FQVgD0Rebqnyh3vw3JsdwdVySrkbh/ggbc18ayBFYeEjQUKqvc2oGBW7vU3WpJjBo79VT1BZybY5Il7kBS3FLwSlJ9Vrqpkl6tQ7lJr0lt6rbF0u4IeHQpUgcLNyt6bkx5gZRDfsdpzaYeuhhuBGd2dRek3g=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSAPR01MB4131.jpnprd01.prod.outlook.com (2603:1096:604:56::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:03:40 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:03:40 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
Subject: RE: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
Thread-Topic: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
Thread-Index: AQHW5aq3Sb+v2p0duE2hWbZ0o6Q4FKodt0cAgAYfDpA=
Date: Tue, 12 Jan 2021 11:02:27 +0000
Deferred-Delivery: Tue, 12 Jan 2021 11:03:26 +0000
Message-ID: <OSBPR01MB458227B345C445CBF342648DE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com>
 <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
In-Reply-To: <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-shieldmailcheckermailid: fa8d50798aa64b29ac94050062c51441
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1a6c68d-24d2-423f-c8de-08d8b6e9b7ca
x-ms-traffictypediagnostic: OSAPR01MB4131:
x-microsoft-antispam-prvs: <OSAPR01MB4131B6F6215F01E8647B4D23E5AA0@OSAPR01MB4131.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bi6RmjJIGjFdunnfT+TyafzMFWQG2LF3wSH7vpdolKUN6P80ORu9CE3d9GBwK6qZ5NW4V0qnyq2fPaZDuAhfSxdxuwuYVN7yLt0DVROMgR/1JaUnPLAyp3bpi+X7ugsoZL0DGErro14EaXBGaM1YjvbFctv43ookBb3QkC9Pkv7I646er6z2g1+au1bxUs8R/6TFpsL7Te45H4JFVZ0JLDGdZIJChn5mZdDo9Rm3WDtPryE3NsCOP6x5ZmawL6Wit2SuUkYVLATZprrmCxcZo46kdLBQskbROGqgzDQCtrIrEGpnGzIZ9gTYoWrQezTfK4YtsQRfvmJkT3oFvgfeW3QqghWns85770QOReyp3ACKB8kAZT9OmJNbNXUuGmPwXxGlDpj0oCH1JerdBp5mUMD4Z4SEwdp2MD6HsdpS/wqHeuCzkW5+1ClDF+obiTl7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(7696005)(478600001)(316002)(71200400001)(53546011)(5660300002)(66556008)(6916009)(85182001)(55016002)(8676002)(6506007)(26005)(52536014)(86362001)(6666004)(66476007)(66446008)(64756008)(186003)(8936002)(9686003)(83380400001)(2906002)(33656002)(4326008)(76116006)(66946007)(54906003)(777600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RlZ6ZjdRYkRYY290Q2xLcll1U044UllhNDkreXFyUzhIQThYbkk2OU0xR0Qz?=
 =?utf-8?B?NURrVkF1M0doVjRUa281WWcwbVpVNlh1WGtHaVhKaVg0SXB0QlhQZUFTYkZB?=
 =?utf-8?B?Y1JYSkt2ZUlJT0w3c29kN1dBVjFEakpYTEtja0NNMWRrVDh1NzJGd1hwWGpK?=
 =?utf-8?B?TkI0enppTEloU041L2NNdzJnOHRLL1l5ZjY4aXZUVXQ0WVBPMGx1bVN0NDRo?=
 =?utf-8?B?bnVuWHFkRmRNbW1CVFF2RUtrb1VtUFJ6UmtudTFCempleWhCeVRFV1VXRzRo?=
 =?utf-8?B?ZFdYdFROUTh4SWFvdFVKTVNRZXYrcytGSWIremRocGo0eW53Y3B1Q04ySE95?=
 =?utf-8?B?RlBFaUZGdXpDN2tXUUlreUpNOVE3VWptYlRkV1VSWVJFNzdQZm5zaHM4U0Uy?=
 =?utf-8?B?OWJBTENiUElwT1ZQWTA0bkFEYjU4YmRNY1RrVEMxWkhFVnY0dEhuNzFwc3F4?=
 =?utf-8?B?ZDVjb0FnekliSUMrYXFoMTZSNnA5VXBVYkxVQ0lKSTEyMlcvVWxya1BBcVhW?=
 =?utf-8?B?M1J0eFV2MmN4UGoyRlpxd2IvMk9nSGFPeStXTnYycnNnQ0s1K1BKNzRDWTF0?=
 =?utf-8?B?RGhIU1pIMTNDdGhqK1dMdk10VWMwWFgvQWFGdVQ3OHU5TGFLemdwcWZRWlp2?=
 =?utf-8?B?cjJzLzZ5cFlFUU1ya2EwckFCelQ1a3VsTmx0L2RxN1Fsemg5U0tsR050TWdj?=
 =?utf-8?B?SmRtd1JmRkhTeGpnSUV4ZkNqWEt1TC9pWTZ1anArOXdoUytQUVJkZmJOSlg3?=
 =?utf-8?B?UVFPSGk1UXpwWkJPUzFxQnRTRUZ0QUpvbEl0YjBacXFHWFRiZlp0NVlpTGt3?=
 =?utf-8?B?Vno5U3BiVVhTMmVnSWVvWkt2SXVWS2RsOVY5ZSszMVdrN1E5N3lab0xvcHlx?=
 =?utf-8?B?Q3dqbWdnVXhkU2YrVW1jclRteWlyQVNDbXlITnE5cStQVjBPQm9kcngyaitQ?=
 =?utf-8?B?SFRkU2hBbm9ZVHBDZlI1RDk5WXFOalRXZFhqYzZzdjRmREVpYWl5cVBZb0Nv?=
 =?utf-8?B?dTBuRnY1cVZXQkVrN3Z0OVZYMEJheXBEbE5LZnh6L1pJTS93Z3hXcW1zRVcz?=
 =?utf-8?B?anVNYWNESFpNb3NVRFVOdVBES1ZVTDF4dUlLMGd6ZW1EeWxBS3RKa2Y3NUJ3?=
 =?utf-8?B?VHA4SFllMTFsVThLTUJSVzJtSFY1WXNBWUVkZ0gvMkF3VWtTaEpaVWlDMmZu?=
 =?utf-8?B?RFpDNi9DMWVlbWpxSGo0S0U5Q0VyQUVwdzVka1BqVXpJVTdTM2hzU1QvQzR3?=
 =?utf-8?B?MnFuQzExaUd5cUd6NnF0NWRjWmpJSmZybTc5eXBNWW9xNUhJVFNRSWxkRWlM?=
 =?utf-8?Q?cgftCbRJDQzMA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a6c68d-24d2-423f-c8de-08d8b6e9b7ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 11:03:39.9800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRY0uU5PB35s2DNrSEExLOdaxwb8nRAA43Yqne4Cn9rOW7ELKnt0BOfaIg8fIswMn3b2islhqi/D1bjACbJFYAQ/cMtI0nH3fQzFckkD8eY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_060346_726840_52B21D8E 
X-CRM114-Status: GOOD (  27.47  )
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
Message-ID: <20210112110227.azt2Sor7ElllwvCzzG-Y2-y4paTLany1UfYGy0yp0DU@z>

> On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
> <misono.tomohiro@jp.fujitsu.com> wrote:
> 
> > +static void write_init_sync_reg(void *args)
> > +{
> > +       struct init_sync_args *sync_args = (struct init_sync_args *)args;
> > +
> > +       switch (sync_args->bb) {
> > +       case 0:
> > +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB0_EL1);
> > +               break;
> > +       case 1:
> > +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB1_EL1);
> > +               break;
> > +       case 2:
> > +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB2_EL1);
> > +               break;
> > +       case 3:
> > +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB3_EL1);
> > +               break;
> > +       case 4:
> > +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB4_EL1);
> > +               break;
> > +       case 5:
> > +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB5_EL1);
> > +               break;
> > +       }
> > +}
> 
> (minor style comment
> 
> I think this could be simplified into a single write_sysreg_s() with the
> register number calculated based on sync_args->bb, rather than duplicating
> the same three lines six times.

I think msr/mrs instructions needs register names at compile time so
it cannot be calculate dynamically. Or am I misunderstood?

> > +static int ioc_bb_alloc(struct file *filp, void __user *argp)
> > +{
> > +       struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;
> 
> A slightly better way to write the ioctl command specific functions
> is to just give the argument the correct type (struct
> fujitsu_hwb_ioc_bb_ctl __user*)
> instead of 'void __user *', to avoid the cast.
> 
> Similarly, as you don't use 'filp' itself, just pass the struct hwb_private_data
> pointer as the first argument.

thanks, I will follow this advise.
 
> > @@ -164,6 +386,7 @@ static int fujitsu_hwb_dev_open(struct inode *inode, struct file *filp)
> >  static const struct file_operations fujitsu_hwb_dev_fops = {
> >         .owner          = THIS_MODULE,
> >         .open           = fujitsu_hwb_dev_open,
> > +       .unlocked_ioctl = fujitsu_hwb_dev_ioctl,
> >  };
> 
> All drivers with an ioctl interface should work in compat mode as well,
> so please add a
> 
>        .compat_ioctl = compat_ptr_ioctl;


A64FX does not support 32-bit mode (aarch32 state).
So I think unlockd_ioctl is enough or is it better to use compat_ioctl anyway?

> 
> > +#define __FUJITSU_IOCTL_MAGIC 'F'
> 
> It's hard to find a non-conflicting range of ioctl numbers, but
> it would be good to note the conflict in
> 
> Documentation/userspace-api/ioctl/ioctl-number.rst
> 
> The 'F' range is also used in framebuffer drivers.

I didn't notice this, thanks for pointing out.

Again, thanks for all the reviews/comments.
Tomohiro

> > +/* ioctl definitions for hardware barrier driver */
> > +struct fujitsu_hwb_ioc_bb_ctl {
> > +       __u8 cmg;
> > +       __u8 bb;
> > +       __u8 unused[2];
> > +       __u32 size;
> > +       unsigned long __user *pemask;
> > +};
> 
> However, this structure layout is incompatible with 32-bit user
> space because of the indirect pointer. See
> Documentation/driver-api/ioctl.rst for how to encode a
> pointer in a __u64 member.
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
