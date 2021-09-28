Return-Path: <SRS0=7ONh=OS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22EFC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Sep 2021 06:33:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A832F61130
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Sep 2021 06:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A832F61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCTJ/3TtlNEZhoijc+I5RFATwu/kSVf4BG+vna3mw1A=; b=oPWXuiMW398wqJ
	ovQmaFuO5ZkIW1zWXLuE3xnsEskbu3n/hN4ggJpCCYaj2F4MHkmWRT9AqeVEUhOORSEeQI3nnqCzN
	jSboYgj5rzS3e4W1Wn9HQQiCa5tVJr8a0Jf5haA562Qv458hMPnj2wvDQGEqi1AZ5rCw/uCcswoyi
	Ro3lQzoqGvDZdRBm53H02Lr+zDL4J5s3iz366wiWjYYA93HclBXBCwItO5P+CMs0JhsKCcWoi2BhD
	nu5DYhVTVcEX+MrKFV1e5Wb/aMy/QAZdDLCFioXyLHZXAQ7ZAvj1VQShfEA9ZLcWsKtkFixXHvJU0
	NW6eTc8BSBcUb5fNSOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV6eL-005r8U-JH; Tue, 28 Sep 2021 06:31:33 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV6eH-005r7Z-M7
 for linux-arm-kernel@lists.infradead.org; Tue, 28 Sep 2021 06:31:30 +0000
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
 Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: move omap15xx local bus handling to usb.c
Message-ID: <YVK2vnOQHCH2zwHh@atomide.com>
References: <20210927144118.2464881-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927144118.2464881-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_233129_802914_585C2141 
X-CRM114-Status: GOOD (  12.38  )
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
Message-ID: <20210928063126.2mgwNn4LRBXwSOo7COcBKAbis6SaZzPOpf4zmbUwJ3Q@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
