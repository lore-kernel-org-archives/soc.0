Return-Path: <SRS0=L2b6=3K=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69134C4332F
	for <soc@archiver.kernel.org>; Thu, 10 Nov 2022 11:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22EA8C433D7; Thu, 10 Nov 2022 11:49:36 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEF86C433D6;
	Thu, 10 Nov 2022 11:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BEF86C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668080975; x=1699616975;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8S3wToDc7FPX6qLp1bdx4Gr+2iTGk9+WjI+qLFFtsM8=;
  b=VhzRzEyPpgNpbUKTOmPN7n7BBshwHRGdJUAZsQ0P/Z8lY/ljOH1MmKPh
   DgdZPUFWnz1HaGmdbLa1YVrurig4Yla0yBVZi9smIbJXkZVgh6xBIkkBq
   2sCZRFdFh6k11VO+6mN/twJDDEGAiLj4TlLoc80ood6LWoST58QyvyqJM
   ngbSxsOY70qyUBD1owwhvPnOZ6rnS16MEpqXAczAyzYW/udMdRcjhnYeZ
   iSk661WjHf2rS6sf0AvRnfUtwlR3af12rV01aSLbH3CGE/EaKOSI0uN01
   ooOvOo/MiJVDQCdhkzls6Mbs5P5e1S2naulokXLmpaGxFTG/vEyAFNXca
   w==;
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="182855190"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2022 04:49:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 10 Nov 2022 04:49:22 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 10 Nov 2022 04:49:20 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 fixes for 6.1
Date: Thu, 10 Nov 2022 13:54:11 +0200
Message-ID: <20221110115411.180876-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.1

for you to fetch changes up to cef8cdc0d0e7c701fe4dcfba4ed3fd25d28a6020:

  ARM: at91: pm: avoid soft resetting AC DLL (2022-11-01 12:25:19 +0200)

----------------------------------------------------------------
AT91 fixes for 6.1

It contains:
- signal name fix for a pin on SAMA7G5
- memory self-refresh fix for SAMA7G5 by avoid soft resetting AC
  DLL which can introduce glitches in RAM controller and lead to
  unexpected behavior
- led support fix for lan966x-pcb8291 board by enabling sgpio node

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: at91: pm: avoid soft resetting AC DLL

Horatiu Vultur (1):
      ARM: dts: lan966x: Enable sgpio on pcb8291

Mihai Sain (1):
      ARM: dts: at91: sama7g5: fix signal name of pin PB2

 arch/arm/boot/dts/lan966x-pcb8291.dts | 20 ++++++++++++++++++++
 arch/arm/boot/dts/sama7g5-pinfunc.h   |  2 +-
 arch/arm/mach-at91/pm_suspend.S       |  7 ++++++-
 include/soc/at91/sama7-ddr.h          |  5 ++++-
 4 files changed, 31 insertions(+), 3 deletions(-)
