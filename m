Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496B3C3E8C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 21:56:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8390221534
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 21:56:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ADbOz/CQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8390221534
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PIachfI8fjIm6jeY0wSDnTZK9DRhtIJ8K9DwuTzkqZ8=; b=ADbOz/CQlYa8Cuwi2gerk+mRjf
	tkpxntarsQF7mojkU8H/4PA3EidWnlXLYpQ3p962eOcBUPNpH/P3NHW0RMCAHrRWhKZL92i/ABilS
	ULph079EjUQGTvG+MiMtLWToeS0fMga4XY60FOOlWXNMqAV7MxzQQ3y6YVGJsdPYeNCh9fQK57N0Q
	DPSKQGJ6vOdWCTZTNDI6eEMB8RRuH5clHu/fzjYQAYhs5vwUmCZ0r1bFSpKso5Ovdbsvt2ghNCmrw
	8Cure8CUqzNpziURIF8CKQQ1krwTDxuuc3wuQwvBka0laDQVIhlFX58tSFm0GCQgFsBmA0jn6tWe/
	l2HQfmtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kili9-0005eN-GE; Fri, 27 Nov 2020 21:55:25 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kili6-0005e1-9q
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 21:55:23 +0000
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3AD8D240002;
 Fri, 27 Nov 2020 21:55:18 +0000 (UTC)
Date: Fri, 27 Nov 2020 22:55:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] ARM: at91: defconfig for 5.11
Message-ID: <20201127215517.GA1733715@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_165522_529570_28E1BD60 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20201127215517.l-8onPJtzmwNwOFh0colbnPTV0rI1FskvkJr1mr7F-U@z>

Arnd, Olof,

Two patches limiting the number of compiled media drivers.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-defconfig-5.11

for you to fetch changes up to 036f224ef8f447928bfd3085220c28e158a4e4d6:

  ARM: configs: at91_dt: resync with media changes (2020-10-29 14:32:07 +0100)

----------------------------------------------------------------
AT91 defconfig for 5.11:

 - filter compiled media drivers

----------------------------------------------------------------
Eugen Hristev (2):
      ARM: configs: at91: sama5: resync with media changes
      ARM: configs: at91_dt: resync with media changes

 arch/arm/configs/at91_dt_defconfig | 5 +++++
 arch/arm/configs/sama5_defconfig   | 9 +++++++++
 2 files changed, 14 insertions(+)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
