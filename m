Return-Path: <SRS0=EmFY=GL=arm.com=mark.rutland@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8A9C433E0
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 15:51:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ED75323888; Fri,  8 Jan 2021 15:51:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 9323423884;
	Fri,  8 Jan 2021 15:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9323423884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=mark.rutland@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E07ED1;
	Fri,  8 Jan 2021 07:51:14 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.36.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1040C3F70D;
	Fri,  8 Jan 2021 07:51:12 -0800 (PST)
Date: Fri, 8 Jan 2021 15:51:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Message-ID: <20210108155110.GC84941@C02TD0UTHF1T.local>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>

On Fri, Jan 08, 2021 at 03:23:23PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 8, 2021 at 1:54 PM Mark Rutland <mark.rutland@arm.com> wrote:
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

I completely agree that adding a custom interface that's platform
specific is undesireable.

> In the end, anything outside of the CPU core that ends up in a SoC
> is implementation defined, and this is usually not a problem as long
> as we have an abstraction in the kernel that hides the details from
> the user, and the system is still functional if the implementation is
> turned off for whatever reason.

I think that peripherals and other bits out in the SoC are quite
different to things built into the CPU, where there's inevitably most
significant and subtle interactions with the architecture, and can be so
closely coupled as to not have a good point to apply abstraction. We
have common ways of abstracting storage devices, but the same is not as
true for userspace instructions.

Thanks,
Mark.
