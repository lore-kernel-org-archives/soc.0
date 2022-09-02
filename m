Return-Path: <SRS0=b33T=ZF=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB94ECAAD5
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 08:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF3B1C433C1; Fri,  2 Sep 2022 08:55:27 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9BB0C43470;
	Fri,  2 Sep 2022 08:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9BB0C43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662108927; x=1693644927;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p/dOcwFjX+f137i057a7V51Oku9kSnO9nq6D+HMnZ+o=;
  b=P4KG2i/xstiC4g52SdgxBC4pJvZBwJo5RglxA7Qx1ysveyyk/8soqbYO
   Y8k7GH37TpIggLXBp8h/tRKpp7LpC6a0+/fXZ3IvKVqwh5APqIY4Myfkb
   UluEofaXtYhQoHvd0DgSuX31dnMiLHtLvzypIMy0k3fOIpLhwUrUJPIza
   Y0F5h96BPac1/bw/LDs2SDkhSlsX6A68SbPyZNwbBwqEvyMzDtGaILqxx
   PijRCvtiNVpOSwhD4tXAr41zkIOLnRnXSClwtlvUM8Anflthw1Ck1QaTz
   GTzNfIYKBDc9jgAvKnNIvFDzKypBuJsY24nBD7IdV+VhkxynWgRN/lUUS
   A==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="178765127"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 01:55:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 01:55:24 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 01:55:22 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 fixes for 6.0
Date: Fri, 2 Sep 2022 11:57:44 +0300
Message-ID: <20220902085744.4193554-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.0

for you to fetch changes up to 3d074b750d2b4c91962f10ea1df1c289ce0d3ce8:

  ARM: dts: at91: sama5d2_icp: don't keep vdd_other enabled all the time (2022-08-31 10:28:19 +0300)

----------------------------------------------------------------
AT91 fixes for 6.0

It contains:
- fixes for self-refresh on SAMA7G5 while in AT91 power management modes:
  one disabling a DDR PHY controller DLL which has been proved to be buggy
  and can introduce glitches that can cause unexpected behavior; one
  fixing the DDR PHY recalibration which cannot work for all possible
  cases (due to hardware bug) while using backup and self-refresh AT91
  power management mode;
- one defconfig fix to remove CONFIG_MICROCHIP_PIT64B from all AT91
  defconfigs;
- multiple device tree fixes for regulators to avoid having some of them
  enabled all the time and to describe min and max output ranges
  according to board capabilities.

----------------------------------------------------------------
Claudiu Beznea (8):
      ARM: configs: at91: remove CONFIG_MICROCHIP_PIT64B
      ARM: at91: pm: fix self-refresh for sama7g5
      ARM: at91: pm: fix DDR recalibration when resuming from backup and self-refresh
      ARM: dts: at91: sama5d27_wlsom1: specify proper regulator output ranges
      ARM: dts: at91: sama5d2_icp: specify proper regulator output ranges
      ARM: dts: at91: sama7g5ek: specify proper regulator output ranges
      ARM: dts: at91: sama5d27_wlsom1: don't keep ldo2 enabled all the time
      ARM: dts: at91: sama5d2_icp: don't keep vdd_other enabled all the time

 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi | 21 ++++++++---------
 arch/arm/boot/dts/at91-sama5d2_icp.dts      | 21 ++++++++---------
 arch/arm/boot/dts/at91-sama7g5ek.dts        | 18 +++++++--------
 arch/arm/configs/at91_dt_defconfig          |  1 -
 arch/arm/configs/sama7_defconfig            |  1 -
 arch/arm/mach-at91/pm.c                     | 36 +++++++++++++++++++++++++----
 arch/arm/mach-at91/pm_suspend.S             | 24 +++++++++++++------
 include/soc/at91/sama7-ddr.h                |  8 +++++++
 8 files changed, 86 insertions(+), 44 deletions(-)
