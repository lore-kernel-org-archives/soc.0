Return-Path: <SRS0=KGEu=HK=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C898AC433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 12:02:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79E1364E76; Mon,  8 Feb 2021 12:02:06 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F201164E60;
	Mon,  8 Feb 2021 12:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F201164E60
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1612785725; x=1644321725;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ktQ5H8JYp5ZgySkZR4VfvzwHO9Mgrs/mBdNMLYeZkxM=;
  b=k5ultU1Mkelhw5potm3NLXiceSodGr/tVpL6Z5xIidy0icK44QPvXxwz
   LXwgOEtZceelgmJmR32C7JjcOB//Bwx+heTzPpS+MfRel49e6UITEiS4B
   H0TW9YUeBqlNEV90/fygiemIjCrl11X1xO1kuRh9juLO3P7D2qTjf9ofW
   gkxcQZGnwPfpioDqZKmM8+C0zhET+3B8ehiDTmNIOhraxSgXLucjym86z
   M2kI3bijHcAVhkzbW2bRFp8ZdVzwoJLYgyzZSWsXkg+qtXjDhhuN6WixP
   Ahphnb9pLTtu/fHBcYC6kPJP/dKZBwmMcRP8jXPJ5k1Hs+jSHQE/m3BOl
   Q==;
IronPort-SDR: rb5GGXYKJ5kzLbBo/stIFUeaIMnmsV3zR5j4y77pvHVeAUZvBwQkajr3G6WGASlqK5CiWTM4Qw
 aSx/gxlnBcnwD5emNbzpDgy9iDfxgOTelfv+qU8J/p/QJcXKCm7ncyPSpD7JialLK7EwAHzkvu
 IQ4HNNTlwV9fL/nmNvaliYycyGSTZG03dQ6+G7bD1lfay2YFQV9chkW0Az/RDXtl3Hj0l7fEAY
 RRZ6sLAjBl5Rzhf88TOb1E3qFPklbzFGZJePc02r22Pxhna/FjDbm7ZqVdnpoWAg5nA6qjx0Ku
 C18=
X-IronPort-AV: E=Sophos;i="5.81,161,1610434800"; 
   d="scan'208";a="105816294"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Feb 2021 05:02:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 8 Feb 2021 05:02:04 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 8 Feb 2021 05:02:00 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
Subject: [GIT PULL] ARM: at91: defconfig for 5.12 #2
Date: Mon, 8 Feb 2021 12:57:53 +0100
Message-ID: <20210208115753.54730-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the second batch of defconfig changes for 5.12.

Thanks, best regards,
  Nicolas

The following changes since commit 00a1aa475f507454fab82f02c6230c8fb2312a12:

  ARM: configs: multi_{v5,v7}: remove ATMEL_TCLIB (2021-01-02 14:06:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.11-2

for you to fetch changes up to b33f4da7b3efcb7521399d5e18cdd15e60ab34df:

  ARM: configs: sama5_defconfig: add QSPI driver (2021-02-08 09:55:00 +0100)

----------------------------------------------------------------
AT91 defconfig for 5.12, part 2:

- only at91_dt_defconfig and sama5_defconfig modified
- update to match current options, unneeded options removed
- missing drivers added, some are on-SoC peripherals, some are helpers
- modify legacy ATAGS or DT options to match common usage

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: configs: at91: enable drivers for sam9x60

Nicolas Ferre (5):
      ARM: configs: sama5_defconfig: update and remove unneeded options
      ARM: configs: at91: DT/ATAG defconfig modifications
      ARM: configs: at91_dt_defconfig: add useful helper options
      ARM: configs: at91_dt_defconfig: add ov7740 module
      ARM: configs: sama5_defconfig: add QSPI driver

 arch/arm/configs/at91_dt_defconfig | 17 ++++++++++++-----
 arch/arm/configs/sama5_defconfig   | 14 ++------------
 2 files changed, 14 insertions(+), 17 deletions(-)

-- 
Nicolas Ferre
