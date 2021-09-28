Return-Path: <SRS0=ypFQ=OS=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6E5C433EF
	for <soc@archiver.kernel.org>; Tue, 28 Sep 2021 06:31:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C6AE7611BD; Tue, 28 Sep 2021 06:31:28 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 478D761153;
	Tue, 28 Sep 2021 06:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 478D761153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 96F7C809F;
	Tue, 28 Sep 2021 06:31:56 +0000 (UTC)
Date: Tue, 28 Sep 2021 09:31:26 +0300
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: move omap15xx local bus handling to usb.c
Message-ID: <YVK2vnOQHCH2zwHh@atomide.com>
References: <20210927144118.2464881-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927144118.2464881-1-arnd@kernel.org>

* Arnd Bergmann <arnd@kernel.org> [210927 14:41]:
> From: Arnd Bergmann <arnd@arndb.de>
> If there are no objections, I'd apply this to the soc tree for
> 5.16, or let Tony pick it up into his tree. This was originally
> part of a longer series to bring omap1 closer to an allmodconfig
> build. If I manage to find some time, I'll also try to resurrect
> the rest of that series.

Looks good to me, it should not conflict with anything else so please
feel free to apply:

Acked-by: Tony Lindgren <tony@atomide.com>
