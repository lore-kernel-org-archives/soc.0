Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EE0C433EF
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 10:44:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6230161502; Tue,  5 Oct 2021 10:44:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF37061381;
	Tue,  5 Oct 2021 10:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633430644;
	bh=M2hZaujgFevVqNaO32AihHFD4liY2HQLb1NvmtGHhBY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=iRMwbvPBZyCJXzY4tn1tPwSaJ+mRddV2KdsuNFEDAkVocTHkMsnqnRjPtkf5JW8Li
	 Ub9UNWSBR8kQTT922wpA7lafQu34gG7JAY0nyxSxPCTiBSlkeoK7tkNU9drT374yr4
	 os/AEE7dZf1q11KqASrjNKfRLprlsoDGtv3neQLM=
Date: Tue, 5 Oct 2021 12:44:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: move omap15xx local bus handling to usb.c
Message-ID: <YVwscgtmTP14DH92@kroah.com>
References: <20210927144118.2464881-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927144118.2464881-1-arnd@kernel.org>

On Mon, Sep 27, 2021 at 04:40:50PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Commit 38225f2ef2f4 ("ARM/omap1: switch to use dma_direct_set_offset for
> lbus DMA offsets") removed a lot of mach/memory.h, but left the USB
> offset handling split into arch/arm/mach-omap1/usb.c and
> drivers/usb/host/ohci-omap.c.
> 
> This can cause a randconfig build warning that now fails the build
> with -Werror:
> 
> arch/arm/mach-omap1/usb.c:561:30: error: 'omap_1510_usb_ohci_nb' defined but not used [-Werror=unused-variable]
>   561 | static struct notifier_block omap_1510_usb_ohci_nb = {
>       |                              ^~~~~~~~~~~~~~~~~~~~~
> 
> Move it all into the platform file to get rid of the final
> location that relies on mach/memory.h.
> 
> Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> If there are no objections, I'd apply this to the soc tree for
> 5.16, or let Tony pick it up into his tree. This was originally
> part of a longer series to bring omap1 closer to an allmodconfig
> build. If I manage to find some time, I'll also try to resurrect
> the rest of that series.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
