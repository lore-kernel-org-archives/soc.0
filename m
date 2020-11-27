Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A395C3E8C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 21:43:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 870C520B80
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 21:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txcqE14A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 870C520B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QI6LdCfi2gdX1E8+KWx5Tn0DUIjV5Vhy5MGMBGofuPc=; b=txcqE14AehDw5IaW58L2l7GnoF
	YdaHmI5bQS2FB6iirM0q8HUv2GxrZkdeKQOoOmxgWg3u3GhZLbZlIjbdJpP+kO0DDl7uOWgRjrqRo
	wevTm4Ap4Qwe+XjYklRA0zY1TPgI11/rDFiO9Em4OnA/0BdrMXF94b9wnk6TDrlnIm5wqyTMc9+52
	TsLiICSlMO1TEX6yde/gaLXa7CdIwoMtcg5Rg0xj5snUHk49sM/LiFXc9rFPe53oC1WUmhDrPA3so
	EBCZDP9o9oOa7rbFXeKc0PiXFm1XQpZ85lRCSsZL/ZoZAhQRv8au4RMhv1Oq/RZ/DFFjb5YcteHIF
	vIyAGOCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kilUy-0004kB-0t; Fri, 27 Nov 2020 21:41:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kilUu-0004jr-5J
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 21:41:45 +0000
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 762E8FF804;
 Fri, 27 Nov 2020 21:41:40 +0000 (UTC)
Date: Fri, 27 Nov 2020 22:41:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] ARM: at91: Drivers for 5.11 (bis)
Message-ID: <20201127214140.GA1688544@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_164144_380010_34F07628 
X-CRM114-Status: GOOD (  11.65  )
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
Message-ID: <20201127214140.kUHHJEchVt1WiopudeNbZTvuYdeGzT8jyqbG1YS_6vE@z>

Arnd, Olof,

As discussed with Arnd, here are two cleanup patches for at91_cf. My end
goal is to get rid of include/linux/platform_data/atmel.h.
Also a very small patch adding SoC IDs for the sam9x60 SiPs.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-drivers-5.11

for you to fetch changes up to 264788c8f23703d0d3e967fb5aea83eb64d2cb2b:

  pcmcia: at91_cf: remove platform data support (2020-11-27 22:25:15 +0100)

----------------------------------------------------------------
AT91 drivers for 5.11:

 - add sam9x60 SiP IDs
 - at91_cf cleanups

----------------------------------------------------------------
Alexandre Belloni (2):
      pcmcia: at91_cf: move definitions locally
      pcmcia: at91_cf: remove platform data support

Kai Stuhlemmer (1):
      ARM: at91: sam9x60 SiP types added to soc description

 drivers/pcmcia/Kconfig              |  1 +
 drivers/pcmcia/at91_cf.c            | 50 ++++++++++++++-----------------------
 drivers/soc/atmel/soc.c             |  6 +++++
 drivers/soc/atmel/soc.h             |  3 +++
 include/linux/platform_data/atmel.h | 12 ---------
 5 files changed, 29 insertions(+), 43 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
