Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409E1C433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 14:23:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1C9A523A1C; Fri,  8 Jan 2021 14:23:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E159823A03;
	Fri,  8 Jan 2021 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610115821;
	bh=ZY+m1Shypt0QhZY785dNYbvfNFF648q2IVm8Cp3y7q8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gPobnuCdo/eOW2xGD70LoX5ze8NpttHaTv0Xjm161bkRs0Rk1pG5c1gae5BAFJFvI
	 av+PfPVEd39l22sGhgn/Gskx0kv6QTuxjq3/Ir+VAxFEudzs7cE5S3XaxEA3+1UEEj
	 oO3i6xUUwoeCvGfTRhYJZxZe8mR0WahFc1yBwB2I+INMoq8TcfYC+iK01933YYvXBs
	 m1hRQsr3LyY0FitvENCtYWrXJp74yYvnGFGunVgD88eYgrn5s8492TJYXDZZAjd8Aj
	 SdsvsZiq8MuezJPV/oCGSZB52DZJVCXhl4zJ+1TpCdGRQk0AzBxuGbtcNqkE7tQdXT
	 nOBWSvS7UhL3Q==
Received: by mail-ot1-f41.google.com with SMTP id o11so9804772ote.4;
        Fri, 08 Jan 2021 06:23:40 -0800 (PST)
X-Gm-Message-State: AOAM533M+vEO9Bt2/knPgolg9KC80IKKP+uksV1Y3Qk7r4DL1edwyi+p
	487ltJey6OKu58TRdC1lHd3Z/2TyxqlOP/1osg0=
X-Google-Smtp-Source: ABdhPJxELf1W0fhrdAX2uRySAx8WpnGGOnnun2Cn4SR4XD08eLdqJJgXeaYPQhgwmwNZ953w1Vs5KuP66a/KRqoRrzw=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2757827otm.305.1610115820092;
 Fri, 08 Jan 2021 06:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com> <20210108125410.GA84941@C02TD0UTHF1T.local>
In-Reply-To: <20210108125410.GA84941@C02TD0UTHF1T.local>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 15:23:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
Message-ID: <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
To: Mark Rutland <mark.rutland@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 1:54 PM Mark Rutland <mark.rutland@arm.com> wrote:
> On Fri, Jan 08, 2021 at 07:52:31PM +0900, Misono Tomohiro wrote:
> > (Resend as cover letter title was missing in the first time. Sorry for noise)
> >
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
> >  The driver mainly offers a set of ioctls to manipulate related registers.
> >  Patch 1-9 implements driver code and patch 10 finally adds kconfig,
> >  Makefile and MAINTAINER entry for the driver.
>
> I have a number of concerns here, and at a high level, I do not think
> that this is something Linux can reasonably support in its current form.
> Sorry if this comes across as harsh; I appreciate the work that has gone
> into this, and the effort to try to upstream support is great -- my
> concerns are with the overal picture.
>
> As a general rule, we avoid the use of IMPLEMENTATION DEFINED features
> in Linux, as they pose a number of correctness/safety challenges and
> come with a potentially significan long term maintenance burden that is
> generally not justified by the features themselves. For example, such
> features are not usable under virtualization (where a hypervisor may set
> HCR_EL2.TIDCP, or fail to context-switch state that it is unaware of).

I am somewhat less concerned about the feature being implementation
defined than I am about adding a custom user interface for one
platform.

In the end, anything outside of the CPU core that ends up in a SoC
is implementation defined, and this is usually not a problem as long
as we have an abstraction in the kernel that hides the details from
the user, and the system is still functional if the implementation is
turned off for whatever reason.

> Secondly, the intended usage model appears to expose this to EL0 for
> direct access, and the code seems to depend on threads being pinned, but
> AFAICT this is not enforced and there is no provision for
> context-switch, thread migration, or interaction with ptrace. I fear
> this is going to be very fragile in practice, and that extending that
> support in future will require much more complexity than is currently
> apparent, with potentially invasive changes to arch code.

Right, this is the main problem I see, too. I had not even realized
that this will have to tie in with user space threads in some form, but
you are right that once this has to interact with the CPU scheduler,
it all breaks down.

One way I can imagine this working out is to tie into the cpuset
mechanism that is used for isolating threads to CPU cores, and
then provide a cpuset interface that has the desired behavior
but that can fall back to a generic implementation with the same
or stronger (but normally slower) semantics.

> Thirdly, this requires userspace software to be intimately familiar with
> the HW platform that it is running on (both in terms of using IMP-DEF
> instructions and needing to know the physical layout), rather than being
> generic and portable, which I don't believe is something that we wish to
> encourage.  I also think this is unlikely to be supported by generic
> software because of the lack of portability, and consequently I struggle
> to beleive that this will see significant usage.

Agreed as well.

        Arnd
