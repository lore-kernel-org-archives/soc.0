Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797F1C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 15:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E734604D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 15:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E734604D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMCPlmOjrpgV5zUad3GQmgkYsj7zbO/GeipUP07uPNk=; b=H/7LaD1ELnwpEa
	1/wnOB/Z+jORLnXvUySr40hISrvCiQtKcRIaOsbQfas9aQ3sybmjNkch3NulQhgJS2O/MAilIB4Wh
	jGMlSwLx+yqIE7pNDDpbDzVucVrav+Iqi49nZrXQ1Phe+/1lPjixEa0koqlKlCcSSrq57TsfDqz60
	mcH9hUy0HFZyyy7F2I2i8WVdYktwpwD9RO7psujq2D4jd2TD7QEl7C3lq4kKcbY+1yYIgDzfDXD29
	jQfgt4X3MWgRQ6yXtNXtmns/qMhxG1+tWJe+nInsnty9cG9HdEa7xLyATSNtrdIkQpGFENa0JX/l3
	1cxVNsIJaQyyJ3wyk+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUsDm-0032LB-Lg; Mon, 27 Sep 2021 15:07:11 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUsDg-0032IT-JO
 for linux-arm-kernel@lists.infradead.org; Mon, 27 Sep 2021 15:07:06 +0000
Received: (qmail 362132 invoked by uid 1000); 27 Sep 2021 11:06:59 -0400
Date: Mon, 27 Sep 2021 11:06:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: move omap15xx local bus handling to usb.c
Message-ID: <20210927150659.GB361082@rowland.harvard.edu>
References: <20210927144118.2464881-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927144118.2464881-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_080704_823540_F38DED7D 
X-CRM114-Status: GOOD (  13.51  )
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
Message-ID: <20210927150659.H3IqlrLkoTmTjGUu0WrNBDeIfZIfdDgbDiVlnhSonNA@z>

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

For the ohci-omap.c portion:

Acked-by: Alan Stern <stern@rowland.harvard.edu>


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
