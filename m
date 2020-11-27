Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DB9C3E8C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 21:25:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1782C20B80
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 21:25:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PI+BmdTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1782C20B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k5hZCQEgZRx4nWFjljGv6CJu8y7Pfpu1Jqk8IDcEOvs=; b=PI+BmdTS+0sf3jog/sweMZngg
	cDwQ3gQthEkRMhLnJW7isp4NPlYYU0RL6aANTDCgoNhvzZzbqj9ZErmqjBu3SXyum1VRkYsSZuXcV
	Dh+E22OBZ3PJHkSyM2sc83sIjZ7Uoz+TzDuvFzq19pIBUVVj6J/xme/hmMvP0BWNnlEky717iZM7z
	tbjg5XWpPFp6AeDVihhABflpFZ8+L74KxsfzknJ58mrKo8lG2N2XJThcCa73NkKSGkdi4VKH8ZGua
	pEaYR5JpGixAOcsAZdlz6a914t1giNPb1WTEPYSI+3hclngeGcPncbPnrmYw/nTi4iF2i/eWGHrWG
	oKUE3VAPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kilDN-00040H-UC; Fri, 27 Nov 2020 21:23:37 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kilDJ-0003zo-RR
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 21:23:35 +0000
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1BA0A1BF203;
 Fri, 27 Nov 2020 21:23:24 +0000 (UTC)
Date: Fri, 27 Nov 2020 22:23:24 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org
Subject: Re: [GIT PULL] ARM: at91: Drivers for 5.11
Message-ID: <20201127212324.GG1296649@piout.net>
References: <20201127210844.GA1683573@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127210844.GA1683573@piout.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_162334_063275_FC1060A4 
X-CRM114-Status: GOOD (  17.52  )
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127212324.gpf9mmdjOSL6XxuxhNMdxVnnFoF8bJkuLA73LEAOAC8@z>

Please ignore that one, I'm going to merge my current at91-drivers and
at91-soc branches and send you only one PR as this is what makes more
sense.

On 27/11/2020 22:08:46+0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> As discussed with Arnd, here are two cleanup patches for at91_cf. My end
> goal is to get rid of include/linux/platform_data/atmel.h.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-drivers-5.11
> 
> for you to fetch changes up to 91be3e89f450aa738204f6629f06d8b0e3d8d77b:
> 
>   pcmcia: at91_cf: remove platform data support (2020-11-24 12:05:24 +0100)
> 
> ----------------------------------------------------------------
> AT91 drivers for 5.11:
> 
>  - at91_cf cleanups
> 
> ----------------------------------------------------------------
> Alexandre Belloni (2):
>       pcmcia: at91_cf: move definitions locally
>       pcmcia: at91_cf: remove platform data support
> 
>  drivers/pcmcia/Kconfig              |  1 +
>  drivers/pcmcia/at91_cf.c            | 49 ++++++++++++++-----------------------
>  include/linux/platform_data/atmel.h | 12 ---------
>  3 files changed, 20 insertions(+), 42 deletions(-)
> 
> -- 
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
