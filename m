Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680B6C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Apr 2022 14:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A1E4C385A6; Fri,  8 Apr 2022 14:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98262C385A3;
	Fri,  8 Apr 2022 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649429999;
	bh=71U0oqS5DrYUjZ1LnIjF+pi27wgwlYEGUni79PoPFtA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=w705BcmmICRkgt8T9jA8+rkSN4j69SMumLIkDqMVo7qcGR+S3Zasw9j+sjzr8bPDL
	 sWWEfQZYxQPpb93JQpb177dWRLjDH19LdJd0CLdOpagjasvF+VCX+9ewGyL1SOihhy
	 zqI/wad3JndwG8QpzUsZOdv5pnRpc1uSACZsfRiM=
Date: Fri, 8 Apr 2022 16:59:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>,
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>, Olof Johansson <olof@lixom.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Doug Anderson <dianders@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kgdb-bugreport@lists.sourceforge.net,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Travis <mike.travis@hpe.com>
Subject: Re: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Message-ID: <YlBN7NaWbU50nfGi@kroah.com>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>

On Fri, Apr 08, 2022 at 04:49:31PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 8, 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergmann wrote:
> > > On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> > > >
> > > > There is some prior art for this sort of feature. AFAICT SGI UV has a
> > > > similar mechanism that can send an NMI-with-no-side-channel to the
> > > > kernel. The corresponding driver offers a range of actions using a
> > > > module parameter:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
> > > >
> > > > I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> > > > it is just obfuscation. However it is certainly seems attractive to be
> > > > able to reuse handle_sysrq() to provide a more powerful set of actions.
> > >
> > > How about a module parameter that allows picking a sysrq character then?
> >
> > Module parameters are so 1990, as this is a platform device, why not get
> > it from DT?
> 
> This machine doesn't use DT. I suppose the same could be done with an EFI
> variable, but with a module parameter you get the added benefit of having both
> a boot time kernel command line argument, and the option to override it at
> run time.

I thought it was a platform device?  Worst case, make it a sysfs file :)
