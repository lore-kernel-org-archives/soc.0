Return-Path: <SRS0=1i8z=OY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6055C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Oct 2021 11:46:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9604461360
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Oct 2021 11:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9604461360
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EDfDyk0mTw4pdfmgIHgFIYJElVV6Kp5R2q7DDd+Loqw=; b=m53E+pzrpZmiFM
	+efy+vnc9A+ujmF3BNT/X/Cubff29ay8tpQU3R21Mf+Y3g01z6wrkEW+UTzx+2H2BvARANLdaUVaF
	jrFqGpe6QcqiBLwUFtpuwvNw1lRgM/qgmo/R2enklGwB3C0zSSIML6VVj52Be0OmCMBcJ/tfPm11C
	AsetLtLZ4StLe29bZ1GGVefEzphUNCAY0CZwYY2SgIaF0xrmJ6h/chOyUzjDGrRiV/Zp0F0uzTok4
	xbsjIIJYkLTKTaZfPq9Lyhu7SlexX9Xr2O8/AaJUOxKFzY1R3g8hTELVMbQFwubmP1n+Kp9LeYOGS
	x+YYYVhMPfgf5vE/6Oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXMO7-006G08-CW; Mon, 04 Oct 2021 11:44:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXMO1-006Fz4-VN
 for linux-arm-kernel@lists.infradead.org; Mon, 04 Oct 2021 11:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633347841; x=1664883841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vGeMwNRV/2/W5R1Qp12fVG3McJPmmla7XyPNWUNtpTo=;
 b=odF020FHXs+OSiuNK+5BKw1bU1p8rXVzICJrmpzB+gH1iIrDUGiHRlht
 a9gAFygpqgPZJ1n1uD+VjrG254d5A5aUSdVsThK/Ozvd257uSelpO61c3
 y8s/8UpToCMxm27IXeQeWzRridHcyN9WkMr2PBbJHx8E/gzzLm9fyir68
 RgY+sRPajlmY3kZxtN80RxJzuLewmiq7U3H/EGNL52mzR1csxkib5eUKH
 n6QE9kYwejPIhkrA1e9GSJVgstp/IiI3EripNe8bMQP0qT6eVjT/8TsZL
 DgmhQj5/mkG1LR+50WyUxocunGDDrrXHLJM8nEzoau3lyLqebwA4frVnI Q==;
IronPort-SDR: vXN74bjB7Ak1a64o8pv8oj375gh67+Tl19sq0IXcAoGPp42ScWyzBHsWD+SnySIgxoCSqw0Q9X
 QAc+hjBqqgetfyHbDGSY1sgYD2ALCz3Ahx1A5lwDdgvSNKKWAq9vc2qhMmgBWwHvo0aIfN43Bv
 XKPjS3QusQtxpRjMsfrWP+75BBYhW+MaNy+D1Kmg5ebj+7trvXx2rpmwnlae788bapgcwe+Yxb
 uC+WKrcyXy1XfSHMPZose1uWXYqf8UYi4U3McY6J/GsK+R2bEEARyI5XMYjFMYchB13KXI+Zlr
 uGJ3lFGA6A6VO3HYngY6WMOF
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="71603582"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Oct 2021 04:43:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 4 Oct 2021 04:43:59 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 4 Oct 2021 04:43:57 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: fixes for 5.15 #2
Date: Mon, 4 Oct 2021 13:43:44 +0200
Message-ID: <20211004114344.19304-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_044402_126343_315464D5 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211004114344.fHOO6dGm7bM2-f3HXW4dAKespVAsw8UvsTwqsm9_rBw@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the second batch of fixes for 5.15.
It goes on top of previous PR at:
https://lore.kernel.org/linux-arm-kernel/20210914162314.54347-1-nicolas.ferre@microchip.com/

Thanks, best regards,
  Nicolas

The following changes since commit 4348cc10da6377a86940beb20ad357933b8f91bb:

  ARM: dts: at91: sama5d2_som1_ek: disable ISC node by default (2021-09-14 17:05:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-5.15-2

for you to fetch changes up to dbe68bc9e82b6951ff88285ccffc191d872d9a01:

  ARM: dts: at91: sama7g5ek: to not touch slew-rate for SDMMC pins (2021-10-04 12:16:58 +0200)

----------------------------------------------------------------
AT91 fixes #2 for 5.15:

- More fixes for AT91 platform power management code related to the
  introduction of sama7g5:
  - management of DDR3L regulator rails for sama7g5ek
  - loading of TLB on different cores

- PIO controller slew-rate settings for sama7g5ek: be aligned with
  datasheet requirements.

----------------------------------------------------------------
Claudiu Beznea (5):
      ARM: dts: at91: sama7g5ek: add suspend voltage for ddr3l rail
      ARM: at91: pm: group constants and addresses loading
      ARM: at91: pm: preload base address of controllers in tlb
      ARM: dts: at91: sama7g5ek: use proper slew-rate settings for GMACs
      ARM: dts: at91: sama7g5ek: to not touch slew-rate for SDMMC pins

 arch/arm/boot/dts/at91-sama7g5ek.dts | 36 +++++++++++++++++++++++++-----
 arch/arm/mach-at91/pm_suspend.S      | 42 +++++++++++++++++++++++++++--------
 2 files changed, 63 insertions(+), 15 deletions(-)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
