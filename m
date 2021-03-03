Return-Path: <SRS0=Aisg=IB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBB2C433DB
	for <soc@archiver.kernel.org>; Wed,  3 Mar 2021 11:29:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4DDC364F0F; Wed,  3 Mar 2021 11:29:39 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.34 at mail.kernel.org; Wed, 03 Mar 2021 11:29:38 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 316DF64EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316DF64EDF
	for <soc@kernel.org>; Wed,  3 Mar 2021 11:29:38 +0000 (UTC)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4KFF-1lH8V42pPt-000Kwi; Wed, 03 Mar 2021 12:24:31 +0100
Received: by mail-wr1-f49.google.com with SMTP id v15so23263376wrx.4;
        Wed, 03 Mar 2021 03:24:31 -0800 (PST)
X-Gm-Message-State: AOAM533IRAWeoxQEbNFF8UVYmTVbYWSvVsgiqavssnUywmqAhn+hSDPm
	HOCZaUaIMXPToHnjhhafUwAQF5SmNvich5vVWkk=
X-Google-Smtp-Source: ABdhPJxpwiQEBoXRFpev1BecFuEWDtaCog1buNDzGK8+Jk7b6oIRnv3iwO0+Defv6yy4HboaxEeWf/uRuMjHZmPwZAs=
X-Received: by 2002:adf:de11:: with SMTP id b17mr27292715wrm.196.1614770671214;
 Wed, 03 Mar 2021 03:24:31 -0800 (PST)
MIME-Version: 1.0
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com> <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
In-Reply-To: <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 3 Mar 2021 12:24:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
Message-ID: <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: fujitsu: Add cache driver code
To: "tan.shaopeng" <tan.shaopeng@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Olof Johansson <olof@lixom.net>, Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:prLxWxirgnwYIBWAGABu65Fbv6g7s436uvssyOJK9oI8+xA1Zvi
 QRZAFZheHCu/CWdjGln/3CQRCUzshidKiJRzZcTUhpnD3o8vaHdnX7XYvAqqgbp69KQBnZM
 SOU/qCz7ncIRI7i9gJ5u5t/OrR64rY4Hofb98VhGWlJ6uj3du202hAv398S/XrEfEPgHiFl
 pwfO1ySwJTMruHtrSAMaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5pcznSqCMBM=:rHPDLSC3J6IzAyGwybLBEP
 8Zj5KqiOJOZqXbn1ProDacNDXtO088vVUHvECfi2nAE1WPrxWm4+FJlGUG0dGeBmQXeVtZRf8
 lCXgMGnq1j4fL6FjkXOFddIEzjPzBSVS/4hD9dkxsN7WOcAHWz+WE8ZSF4AhlfMYbbnRsCUed
 jeQI9gzaKv9ukyqvFmNekO5HmcjjcaC6pg2vGtXsqkDw+v8YZnjzpxATU1zq9y+RB6Q6Lo/Wn
 OR59hByQGbb56BaN2ywmYTcBWFgFWsXxzkOF3F0zdZzxFbI70db78eO8pYjh3Msq3JuKaubME
 YwzoLOZkIdTGZouZpo3DHfxfVlKpl5pR1o22USRDxMziNBVjiZ2Q2ZK6l4TqLFpnHtl3FZsh7
 t3+PB/j4L73CwBiXar6D8JndlPLQcRtzU1Z8W8uWYSoVgsomPO0YILELYejCH

On Wed, Mar 3, 2021 at 10:38 AM tan.shaopeng
<tan.shaopeng@jp.fujitsu.com> wrote:
> +
> +config FUJITSU_CACHE
> +        tristate "FUJITSU Cache Driver"
> +        depends on ARM64_VHE || COMPILE_TEST
> +        help
> +          FUJITSU Cache Driver
> +
> +          This driver offers cache functions for A64FX system.
> +         Loading this cache driver, control registers will be set to enable
> +         these functions, and advanced settings registers will be set by default
> +         values. After loading this driver, you can use the default values of the
> +         advanced settings registers or set the advanced settings registers
> +         from EL0. Unloading this driver, control registers will be clear to
> +         disable these functions.
> +          When built as a module, this will be called as "fujitsu_cache".

My feeling is that this code should be in arch/arm64/, as the cache
is generally considered part of the CPU, rather than part of the wider
SoC design, or something that can be controlled separately from the
core kernel and memory management code.

> +module_param(tagaddr_ctrl_reg, ulong, 0444);
> +MODULE_PARM_DESC(tagaddr_ctrl_reg, "HPC tag address override control register");
> +module_param(hwpf_ctrl_reg, ulong, 0444);
> +MODULE_PARM_DESC(hwpf_ctrl_reg, "hardware prefetch assist control register");
> +module_param(sec_ctrl_reg, ulong, 0444);
> +MODULE_PARM_DESC(sec_ctrl_reg, "sector cache control register");
> +module_param(sec_assign_reg, ulong, 0444);
> +MODULE_PARM_DESC(sec_assign_reg, "sector cache assign register");
> +module_param(sec_set0_l2_reg, ulong, 0444);
> +MODULE_PARM_DESC(sec_set0_l2_reg, "sector cache L2 way register(sector=0,1)");
> +module_param(sec_set1_l2_reg, ulong, 0444);
> +MODULE_PARM_DESC(sec_set1_l2_reg, "sector cache L2 way register(sector=2,3)");

My feeling is that the actual settings need to be on a higher level, not tied
to the specific register-level implementation of this chip. Normally,  the L2
cache is set up by the firmware according to local policy, and the settings
can either be read by the kernel from registers or passed down through the
device tree. It sounds like you want to control the policy at runtime in the
operating system rather than at boot time, so for each setting you wish to
override, there should be description of what the setting does and what
the purpose of overriding the firmware setting is.

Looking at the first one in the list, I see the specification mentions
multiple distinct features that can be enabled or disabled, so these
should probably get controlled individually. I also see that it is possible
to control this for TTBR1 and TTBR0 separately, and we probably
cannot allow user space (through module parameters or any other
interface) to control TTBR1, which is where the kernel resides.

The TTBR0 settings in turn would seem to interact with
CONFIG_ARM64_MTE, and should not be controlled independently
but through the same interfaces as that if we find that it does need
to be controlled at all.

I have not looked at any further details, but that should help get an
idea of what I think would happen with the other registers.

> +static int __init fujitsu_drv_init(void)
> +{
> +       int ret;
> +
> +       if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU)
> +               return -ENODEV;
> +       if (read_cpuid_part_number() != FUJITSU_CPU_PART_A64FX)
> +               return -ENODEV;

The module_init function should not return an error when it is running on
incompatible hardware, please just change this to silently return success
to avoid warning about the failed initcall if the driver is built into a generic
kernel.

       Arnd
