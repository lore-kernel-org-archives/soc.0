Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E38DC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 14:26:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA71C22AAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 14:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA71C22AAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fXkudzku+1wWUjyQahnXn29ZR5ObTOkgynMBgbQDKvM=; b=w7PfPUf52z9qOSQcQyTpc9EA3
	ESidenOzsuS6bR8X4iuCl5k2FUQYRh5ADZv5hbv9aZw60SR8wHuX2E1zFIh2xATmL9OF7Z+1K1lCi
	AmZlTE+zLJVcT3cxSgn9UWJ+oF1K7W4PEtaIZf8+uLh5xJKvUGcqNsQDKrKNcgEWog/7BzUrFL4xW
	2bz7+Grk8p31WKOWUqBcCD5kqpKxZ/f+sn48hdoWsyiKGHrLOPxxi4kbLGnK8mY6EA/6n+kL3CWoQ
	jgyH/EZwyI92VkT8E6YZB7C25ThzN0sl4HKhkG5zV8cjJRH7pb+rsH6U1gFJwxUGrfB1F2+cyELZw
	MDMpqsYHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxsgR-0008E7-N1; Fri, 08 Jan 2021 14:24:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxsg2-0008DK-0x
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 14:23:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4D94239FE
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-ot1-f51.google.com with SMTP id x13so9761541oto.8
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Jan 2021 06:23:40 -0800 (PST)
X-Gm-Message-State: AOAM533d22cFs36kBQ9pW+NFFoX4XsxEvlmnPM6tN81andxErALkB98k
 xNzm+y5v4/zyCR+IZ3ODqghRacfLah8hLwgj8M0=
X-Google-Smtp-Source: ABdhPJxELf1W0fhrdAX2uRySAx8WpnGGOnnun2Cn4SR4XD08eLdqJJgXeaYPQhgwmwNZ953w1Vs5KuP66a/KRqoRrzw=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2757827otm.305.1610115820092; 
 Fri, 08 Jan 2021 06:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
In-Reply-To: <20210108125410.GA84941@C02TD0UTHF1T.local>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 15:23:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
Message-ID: <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
To: Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_092342_213515_0EBE29E5 
X-CRM114-Status: GOOD (  32.24  )
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
 Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108142323.eNg5n0o5I1zxORuaijemDs-5XO0ILZYFBxAIgoOl4S0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
