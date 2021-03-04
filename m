Return-Path: <SRS0=peI6=IC=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E6AC433DB
	for <soc@archiver.kernel.org>; Thu,  4 Mar 2021 10:55:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 74B4964F32; Thu,  4 Mar 2021 10:55:00 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D9964E12;
	Thu,  4 Mar 2021 10:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95D9964E12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-oi1-f176.google.com ([209.85.167.176]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MzhWp-1ldxJo2hHN-00vhuj; Thu, 04 Mar 2021 11:54:57 +0100
Received: by mail-oi1-f176.google.com with SMTP id x20so29574794oie.11;
        Thu, 04 Mar 2021 02:54:57 -0800 (PST)
X-Gm-Message-State: AOAM531uHRyKKWZhM2mEedj0nI6+dDZai1LJvX73r2yAZYCfUiAHbdQH
	ntmiQWErARaDZitDOfjmB7Gcr8JuRQ70ck79iMY=
X-Google-Smtp-Source: ABdhPJytX8nn9WHwGZ7rb0wgm/6H84zd3AC843FxpQZ5cioWDF+zMks/HkXPuRTfr7wcNPv4syg2U/RoyxzEgDNs6dQ=
X-Received: by 2002:aca:5e85:: with SMTP id s127mr2376937oib.67.1614855296283;
 Thu, 04 Mar 2021 02:54:56 -0800 (PST)
MIME-Version: 1.0
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com> <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Mar 2021 11:54:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17oRP=mU09ypPSxY3ms=fCROxk8SXo0S+CQpdtvsoHXA@mail.gmail.com>
Message-ID: <CAK8P3a17oRP=mU09ypPSxY3ms=fCROxk8SXo0S+CQpdtvsoHXA@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: fujitsu: Add cache driver code
To: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Olof Johansson <olof@lixom.net>, 
	"misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fCKjy6UJPuYu08747POVyvz0CPzPyZ82ng+nCE5MDfDlx9H/dIC
 JPAWoe/SCS3cKLS/j3lhvbaqTWgVBUF2ab+IpgM1h9sdXOBFtftHtf7eEKIF1KmgEc/mC/i
 Kf1v+jJvyGtTFbwisPuwwampfQerBMqeZktHJQ/mjpnF7VLK148wgVpkFQBwCox+vbDLgdn
 4eZ/5GtGwTJ8dmfqFW3wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7rmfmGNKsus=:lx9GT9knZmJaFFEZc5BkPz
 SSaukHOJLWpQ7+CddYhdQn3/UpsVvuaKYMEhi0Kht7mF/5iIkLOBJmTJdNwvLTL974cxOKsjV
 IsSZayKhqX9TblVq7UbW8b5+rrWuGG1htNtiNQtM/0MGtcruu08rTqEpavkodnCHwKb252E3H
 E2bPAJPQs3ZKyFbyPLiU5cFytAeWA2rvIdriZJpSdS+bUOKP3LVmAOsc5reyNrOPN6sbCmDwk
 7P84MhERNW2t4ehTd0TSp0OvBkywYHSN0LDgkXgNjuFysZ8xUSgxuZXAJjpspv1gHy+rs1yn7
 j1ZyZSIAHd7HXC1fFa3pL723++rQ7ZW+bk5qXkmWLGHuL3i7GxOoKct6gloDMh2wxr+dQNaMF
 89UxCz9oJEul8jJ6rhD62TOnNTgI6ylg4MqCsZlDYSJC8XFO/HgcGKDbqgzoV

On Thu, Mar 4, 2021 at 11:34 AM tan.shaopeng@fujitsu.com
<tan.shaopeng@fujitsu.com> wrote:
> > On Wed, Mar 3, 2021 at 10:38 AM tan.shaopeng
> > <tan.shaopeng@jp.fujitsu.com> wrote:

> > > +module_param(tagaddr_ctrl_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(tagaddr_ctrl_reg, "HPC tag address override
> > control register");
> > > +module_param(hwpf_ctrl_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(hwpf_ctrl_reg, "hardware prefetch assist control
> > register");
> > > +module_param(sec_ctrl_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(sec_ctrl_reg, "sector cache control register");
> > > +module_param(sec_assign_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(sec_assign_reg, "sector cache assign register");
> > > +module_param(sec_set0_l2_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(sec_set0_l2_reg, "sector cache L2 way
> > register(sector=0,1)");
> > > +module_param(sec_set1_l2_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(sec_set1_l2_reg, "sector cache L2 way
> > register(sector=2,3)");
> >
> > My feeling is that the actual settings need to be on a higher level, not tied
> > to the specific register-level implementation of this chip. Normally,  the L2
> > cache is set up by the firmware according to local policy, and the settings
> > can either be read by the kernel from registers or passed down through the
> > device tree. It sounds like you want to control the policy at runtime in the
> > operating system rather than at boot time, so for each setting you wish to
> > override, there should be description of what the setting does and what
> > the purpose of overriding the firmware setting is.
>
> OK, I will change module parameter from specific register-level to
> a higher level. And, I will modify the description of module parameters.
> To be clear, we don't suppose these parameters (EL1 registers) are
> often changed at runtime.
>
> > Looking at the first one in the list, I see the specification mentions
> > multiple distinct features that can be enabled or disabled, so these
> > should probably get controlled individually.
>
> It is not necessary to enable/disable every feature individually.
> There are no plans to use these features individually.

Ok, in that case you probably want a smaller number of global
settings can describe all the combinations one may need in
practice.

> > I also see that it is possible
> > to control this for TTBR1 and TTBR0 separately, and we probably
> > cannot allow user space (through module parameters or any other
> > interface) to control TTBR1, which is where the kernel resides.
>
> This driver does not change the values of TTBR0 and TTBR1,
> and the values of TCR_EL1.TBI0 and TCR_EL1.TBI1.
> The cache functions can be used when TBI is already enabled.
>
> > The TTBR0 settings in turn would seem to interact with
> > CONFIG_ARM64_MTE, and should not be controlled independently
> > but through the same interfaces as that if we find that it does need
> > to be controlled at all.
>
> MTE is not supported on A64FX.
> So, this function does not conflict with MTE.

But could you guarantee that no future generation might support
both features? In either case, it sounds like the kernel would need
to know when this is enabled in the same way: as far as I understand,
both of these put extra information into the upper eight bits of a
pointer, and any code that interacts with user addresses would need
to know about this.

       Arnd
