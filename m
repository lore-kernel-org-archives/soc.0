Return-Path: <SRS0=6aPj=M3=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DBBC4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 08:17:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6BC8F60EFD; Wed,  4 Aug 2021 08:17:59 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00EA66056C;
	Wed,  4 Aug 2021 08:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00EA66056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628065079; x=1659601079;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cISOfZdpIzxP9sgFljLgRKSvTcjwqZfCPbc2qQw1C1Y=;
  b=ZD1stkbCEaA2EbXY250MovwRT+yGGfjqDkGJxCHiTpeXjzDS6mqqjTZx
   LvsZCH44anrwSuPE9W8/QHaDWZx8IpHI/ewJygx8R+nTL3cs7OqCc0Ig1
   zYA3gplb+35wDLvPd4a9CKIK4mlgAaQLCJNTFlDNaIhDdRBNYBQIS8H2P
   J5ccmJ/Gp3NSNPy1bjKCF0xrYb46ncwYbXNpIR7yFBQrK5n35AVM1YaZW
   0Lbaz3mF1T0ba27ZyrowXytRk0G8I3ARrRHAtjLv8pQrcausKOZh5mOma
   8ZHZRGrXYocaY2cjZVVYQuTthB09wcrMx4OAmJj5HmM79TU1ph28hA6fm
   g==;
IronPort-SDR: MevOYCoExy2zLGIHnJL995+7Fzf6mDlBmOESYfE0lYAeef6gNOexkMxbX+7ayumH5zNvtb3xvu
 OM0EVeDqLOTq5WcLdSiSkSgNNNI9Be3Dxnb7ICXcVT0rhqDbnZW0dVlY7Ga/1k+3uo+bDX5xF9
 Txk+j1GMSMVnGqptdDl5FEP8OI4oES9BJMMmHsd4fCKlL2usL2E+XENToOGexZtjCGH/Ytko5v
 dv1qupeHcHOB+2Z0ZRkprVNchkPhcF0XD6ZMkj2NekTuRcIW/cb8cfIohFMGpVMj8XWin+AbG9
 61+VwA4ECPMBSIAE91SBBjIw
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="127044258"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2021 01:17:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 01:17:57 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 4 Aug 2021 01:17:55 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL] ARM: at91: soc for 5.15
Date: Wed, 4 Aug 2021 10:17:21 +0200
Message-ID: <20210804081721.11093-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the soc changes for 5.15 which contains the introduction of our new
SoC family: the SAMA7G5.
Note that one header file is shared with the clock sub-system. We synchronized
with Stephen to make it appear in this Pull-Request.

Thanks, best regards,
  Nicolas

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-soc-5.15

for you to fetch changes up to ad9bc2e35cf575644064284943aefdde426644cc:

  ARM: at91: pm: add sama7g5 shdwc (2021-07-19 14:32:13 +0200)

----------------------------------------------------------------
AT91 soc for 5.13:

- Add new SoC based on a Cortex-A7 core: the SAMA7G5 family
  - mach-at91 entry, Kconfig and header files
  - Power Management Controller (PMC) code and associated power
    management changes. Support for suspend/resume, Ultra Low Power modes
    and Backup with Memory in Self-Refresh mode.
  - Power management association with DDR controller and shutdown
    controller for addressing this variety of modes.

----------------------------------------------------------------
Claudiu Beznea (23):
      clk: at91: add register definition for sama7g5's master clock
      ARM: at91: pm: move pm_bu to soc_pm data structure
      ARM: at91: pm: move the setup of soc_pm.bu->suspended
      ARM: at91: pm: document at91_soc_pm structure
      ARM: at91: pm: check for different controllers in at91_pm_modes_init()
      ARM: at91: pm: do not initialize pdev
      ARM: at91: pm: use r7 instead of tmp1
      ARM: at91: pm: avoid push and pop on stack while memory is in self-refersh
      ARM: at91: pm: s/CONFIG_SOC_SAM9X60/CONFIG_HAVE_AT91_SAM9X60_PLL/g
      ARM: at91: pm: add support for waiting MCK1..4
      ARM: at91: sfrbu: add sfrbu registers definitions for sama7g5
      ARM: at91: ddr: add registers definitions for sama7g5's ddr
      ARM: at91: pm: add self-refresh support for sama7g5
      ARM: at91: pm: add support for MCK1..4 save/restore for ulp modes
      ARM: at91: pm: add support for 2.5V LDO regulator control
      ARM: at91: pm: wait for ddr power mode off
      ARM: at91: pm: add sama7g5 ddr controller
      ARM: at91: pm: add sama7g5 ddr phy controller
      ARM: at91: pm: save ddr phy calibration data to securam
      ARM: at91: pm: add backup mode support for SAMA7G5
      ARM: at91: pm: add sama7g5's pmc
      ARM: at91: pm: add pm support for SAMA7G5
      ARM: at91: pm: add sama7g5 shdwc

Eugen Hristev (3):
      ARM: at91: add new SoC sama7g5
      ARM: at91: debug: add sama7g5 low level debug uart
      ARM: at91: sama7: introduce sama7 SoC family

 arch/arm/Kconfig.debug               |  10 +
 arch/arm/mach-at91/Kconfig           |  18 +
 arch/arm/mach-at91/Makefile          |   1 +
 arch/arm/mach-at91/generic.h         |   2 +
 arch/arm/mach-at91/pm.c              | 343 +++++++++++----
 arch/arm/mach-at91/pm.h              |   3 +
 arch/arm/mach-at91/pm_data-offsets.c |   2 +
 arch/arm/mach-at91/pm_suspend.S      | 827 ++++++++++++++++++++++++++---------
 arch/arm/mach-at91/sama7.c           |  33 ++
 include/linux/clk/at91_pmc.h         |  26 ++
 include/soc/at91/sama7-ddr.h         |  80 ++++
 include/soc/at91/sama7-sfrbu.h       |  34 ++
 12 files changed, 1090 insertions(+), 289 deletions(-)
 create mode 100644 arch/arm/mach-at91/sama7.c
 create mode 100644 include/soc/at91/sama7-ddr.h
 create mode 100644 include/soc/at91/sama7-sfrbu.h

-- 
Nicolas Ferre
