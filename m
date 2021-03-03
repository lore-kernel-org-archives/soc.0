Return-Path: <SRS0=J3As=IB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2775C43381
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Mar 2021 18:41:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE79A64ECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Mar 2021 18:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE79A64ECF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hwKtwtVxMppC9yKUtR+cxT6UM74l66GNP9Z8JLdxzck=; b=OHvcWtIQS788B1U4Wgobt5RWm
	18nF9Ppg5i0IJ5NoPsfEXxD2QgrT6Hp0i0aM30ebq3YPR+n9lMbcqKyULKIxHHBwIs8tDzZ4f2HvS
	MBoNkRVR+WpZo9VU5JHzOnEIqOJawGBr4oZDr8emG2t6pSAjENHEXjMMCR3vYlKnANje8iXHUSDJN
	lf5GwyEiUlj7pKSbuio8pWHs0yCQL/4nCE3cyy864PlV7AMBgYjtaybfoJXr9GYDi1tw8TYkxgbv8
	e9hvnP5o+7zDtAYUyooclMz6e6W0OQroI0/uMxz2eu2nM+4M2klXRCqdWC+jXtWWJeMl41gQ9d0U9
	qFeHuMJVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWP4-0063OM-FT; Wed, 03 Mar 2021 18:39:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT18-005HF6-EL
 for linux-arm-kernel@desiato.infradead.org; Wed, 03 Mar 2021 15:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=by3K048DQ1t9InFYfR9YClx1/v8wISgr9N0yhXdY8Fc=; b=gaHErDL2fSxLBjWIBxnwL8QXSU
 jQuChIvYbuDNVk5sXsJYuJ8nr3v3pg62Am83lviwNKHrOLxdoTVHdi5Wzbv3mvfhzW5qCGdGIWdu0
 kDKzSWZVsFbT0LWF78xiXICvgzLF5XM60/SCsPEnU1tNpVIXfekcocbH9dVlLw66v8lUZUjf/tK1T
 DpqGKSGUly6SAGw+MycL2/f9BvBYLUYDoLw8v7WhkvGgdCoU0PzmJGXVIBSdL0tp/wKzAATSlKEnL
 lmzoc0oJL1+wkSE6+iCPTrZacP6PvlDIh/k6oGraKruCVe1dl3boXryHzS6hs4qjEdQxYCOuameYd
 CEWJfAWA==;
Received: from mout.kundenserver.de ([217.72.192.73])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHPcP-002Lnv-0Y
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Mar 2021 11:24:44 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MDQmW-1l6w1E2fN0-00AWwb for <linux-arm-kernel@lists.infradead.org>; Wed,
 03 Mar 2021 12:24:34 +0100
Received: by mail-wr1-f54.google.com with SMTP id b18so16771258wrn.6
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Mar 2021 03:24:31 -0800 (PST)
X-Gm-Message-State: AOAM531MgHV+9syj7eNEoc1bWK2Pqp6TF0piq++xybtFmgJn3cz5vhHk
 rZUwNdwHJMlCCqc8Ty3vSkHR6GQdhHJwbdQxKFk=
X-Google-Smtp-Source: ABdhPJxpwiQEBoXRFpev1BecFuEWDtaCog1buNDzGK8+Jk7b6oIRnv3iwO0+Defv6yy4HboaxEeWf/uRuMjHZmPwZAs=
X-Received: by 2002:adf:de11:: with SMTP id b17mr27292715wrm.196.1614770671214; 
 Wed, 03 Mar 2021 03:24:31 -0800 (PST)
MIME-Version: 1.0
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
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
 Olof Johansson <olof@lixom.net>,
 Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
X-Provags-ID: V03:K1:fyfNOU4OyYPPcA19ArSA2aYm7+ifWGrcLLm39wWkYKR338id0is
 X7/sU70At+byGstaZwyv+d5eAFltV7dXRyhx9M66kdTqqNGQ3IHrczTGQ6Tu9nmuzkUIdL0
 KPHm8Ja7JzotbafiM/SeIRTjEI/9RG2lWX2UIHqSzalpDysuP8qDKWzyBoOR2zWJgvu9cJ6
 HYC05bpKAmwBH4LkpV5NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CftOm2SznQM=:sStmQVwic7sR/2l8e5nHTH
 SuXSJWq34oWgegAH9wo8zG5E/kRVneQlISTDcYfdEoFHT/+z/ZDX0fng42Wu3WFsQWccZ98h/
 0ny0lhqvkkF296X0rtVQ5SWQqERO80GHIrtYQ5Zw/izlTEYtjDAKR/uXnztjJ/GXe0Sl3ddwU
 7qkF5BBG/03v4cA3A+qjiXLDapHuDbM6Kr1ycyHo72Yh/WW1TPC+2zGJIFQHiIk7nsbbtax05
 na35+X8e6U/ZWc6krOh7GQJ5d5A0DmDrI7oAe0tr15cNHtw4i7oLBgKWtFtwobv12LWE77v5a
 IThk69iWXVZ39MjwsXTkSRHHSnPbj/oqiUg9ugb26EKxzA2/IlIxJuaHnSnmTuDP2BcyCHth2
 BIrY0efsIQ8auYgLFUn5HRMQ9jpkY25iNL4WRUQyufY5iQlz6cQUDBcHS53SV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_112444_011235_1996CED1 
X-CRM114-Status: GOOD (  26.31  )
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
Message-ID: <20210303112414.Uh932k3F28WKr7whuAufl0pXhmy1xZl3hMjeVQCxxjk@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
