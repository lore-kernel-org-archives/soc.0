Return-Path: <SRS0=gf/H=LJ=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28235C48BE5
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 15:34:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0E2276162E; Tue, 15 Jun 2021 15:34:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id B8AA2615A0;
	Tue, 15 Jun 2021 15:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8AA2615A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D36DD6E;
	Tue, 15 Jun 2021 08:34:54 -0700 (PDT)
Received: from bogus (unknown [10.57.40.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAD153F70D;
	Tue, 15 Jun 2021 08:34:52 -0700 (PDT)
Date: Tue, 15 Jun 2021 16:34:30 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>, Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210615153430.qslynmqo5urwfugt@bogus>
References: <20210601095838.GA838783@bogus>
 <20210614170856.rs7jrke3gvpmu4km@bogus>
 <20210615152149.GB11724@lx2k>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615152149.GB11724@lx2k>

Hi Olof,

On Tue, Jun 15, 2021 at 08:21:49AM -0700, Olof Johansson wrote:
> Hi,
>
> On Mon, Jun 14, 2021 at 06:08:56PM +0100, Sudeep Holla wrote:
> > Hi Olof,
> >
> > On Tue, Jun 01, 2021 at 10:58:38AM +0100, Sudeep Holla wrote:
> > > Hi ARM SoC Team,
> > >
> > > Please pull !
> > >
> > > This is a new driver pull request. One of the arm64 patch is being
> > > pulled from a stable arm64 branch for-next/ffa as the other patches
> > > are dependent of the same.
> > >
> > > Background
> > > ----------
> > > This has been on the list for almost a year now with changing requirements.
> > > Initially Arm KVM wanted to use this via userspace interface in VMM to
> > > communicate with VMs. But it was later dropped in favour of arch-agnostic
> > > interface[1].
> > >
> > > Also there was some discussion on the dt-bindings which was dropped
> > > completely. Though we need to workaround the lack of full discoveribility
> > > in v1.0 spec, it is now being fixed for the next version of the spec.
> > >
> >
> > I see that you have pulled quite a lot of drivers and other SoC code
> > including my scmi and juno ones that were sent more recently than this
> > one. Just thought of checking if this is still in queue ? Sorry for the
> > nag but this has been on a list almost a year. We missed v5.13 due to
> > DT binding controveries(for good reasons) and we really don't want to
> > miss v5.14
>
> I held off because I wanted to spend a few cycles on looking into it before
> blindly merging it.
>

Sure, just wanted to make sure it was in your list.

> Are there any implemented users of this (on either side) today? We normally
> don't merge a framework in the kernel without having at least one user of it
> also available.
>

Fair enough.

Yes, OPTEE patches are on the list[1]. Just to avoid complexity in merging
Jens(OPTEE maintainer) held it off for next cycle allowing more time. But we
have been testing all the versions of this driver posted on the list with
OPTEE. There are other users too but they need userspace interface which
is still work in progress.

--
Regards,
Sudeep

[1] https://lore.kernel.org/r/20210527081404.1433177-1-jens.wiklander@linaro.org/
