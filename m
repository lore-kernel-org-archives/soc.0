Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D7EC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 10:45:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530CA61354
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 10:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 530CA61354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGZP9b352QYsQCR17BZ3jHa8NRdOaol4aapLwkCZsyI=; b=t/pQ2cYNgYVppW
	v8oQVxkSNe254yK2oo9+O94DXUFsXKQ8ePfY4t6fxCPp0yDFI9E2JCYXWOOtXRAKkTcJPQ/ce4ilc
	eheSWQUgvRRGt8KlWIBXAlS3ntqjE2dZT9thbp+95h02CK4ekWiZf+1mr1DstTjiYfNuBG3mX4J/N
	ygYWp0GK5nijkGUm8bOou42ygDW/iwEqaiOyo93su2jOXH+2wgXPH/d9FUyIvvGNgaUOJiVLf8x5j
	AXsIBjmZU9oc+di2YMmz2l9P3OOuo8PIuU4T8H4CRIL9kRyPRRjoRXMVce8rDmzePGlkJrsFZfXI1
	Rv1A0E/XRHWhPCL6vp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXhvh-00A1js-0y; Tue, 05 Oct 2021 10:44:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXhva-00A1iw-DT
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 10:44:10 +0000
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
 Tony Lindgren <tony@atomide.com>, Alan Stern <stern@rowland.harvard.edu>,
 Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: move omap15xx local bus handling to usb.c
Message-ID: <YVwscgtmTP14DH92@kroah.com>
References: <20210927144118.2464881-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927144118.2464881-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_034409_467383_18316559 
X-CRM114-Status: GOOD (  17.92  )
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
Message-ID: <20211005104402.UrDKCErSoMOHQAoU_rQphg6aLuaHMFS8ex--7yCZUFc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
