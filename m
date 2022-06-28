Return-Path: <SRS0=DNWo=XD=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5782C43334
	for <soc@archiver.kernel.org>; Tue, 28 Jun 2022 13:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D4F0C341CB; Tue, 28 Jun 2022 13:49:09 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 023BCC3411D;
	Tue, 28 Jun 2022 13:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 023BCC3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656424148; x=1687960148;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Mfoa7XBIJajd+Vj3ReaDjEFsciZ6yUYqRM9HOhXHq4=;
  b=R7LKmFLFcCr9LeWb5KE57VaghSrUz99OGE/6W+9KoAqK0patWVeD3sMR
   XZYBFf2ob3+HC8KHarJpSOAnZ3IYvCd3VNesgIXEmZce9jo1jRC89c5QH
   DwgUuIdbPhLjypO0x/0iKH79so6eerm2X0kuPtN3vsRywjwrvv4FTNdGe
   lr/myy1RdDbsx7wcRjIZg8JIdOKDy0L52cJdgC+JhErZ8MhP1VEbfI3Gr
   5LqEHR0OnLO+yVAauPdL0sk8EEv1ipkWl4LQtQDQjTj6/l/DAm2dVxVSB
   H5TNbnM3LImuNalIh07UxWDnCl/SntNitQth9JG5WesujBdSGVUCZ3xSO
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="162404105"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jun 2022 06:49:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 28 Jun 2022 06:49:03 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 28 Jun 2022 06:49:01 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] ARM: at91: fixes for 5.19
Date: Tue, 28 Jun 2022 16:51:30 +0300
Message-ID: <20220628135130.3114878-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi, Arnd, Olof, ARM SoC maintainers,

Please pull the following AT91 fixes for 5.19.

Thank you,
Claudiu Beznea

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git/ tags/at91-fixes-5.19

for you to fetch changes up to 91d60e259c0f58c855f88f3fe5b7909aec563525:

  ARM: at91: pm: Mark at91_pm_secure_init as __init (2022-06-28 12:55:32 +0300)

----------------------------------------------------------------
AT91 fixes for 5.19

It contains 3 SoC fixes and 2 DT fixes:
SoC:
- fix the wakeup from RTC and RTT for ULP1 mode
- fix section mismatch warning
- fix SAM9X60 SiP detection

DT:
- fixes the EEPROMs compatibles for sama5d2_icp and sam9x60ek and EEPROM
  size for sam9x60ek

----------------------------------------------------------------
Claudiu Beznea (3):
      ARM: at91: pm: use proper compatible for sama5d2's rtc
      ARM: at91: pm: use proper compatibles for sam9x60's rtc and rtt
      ARM: at91: pm: use proper compatibles for sama7g5's rtc and rtt

Eugen Hristev (2):
      ARM: dts: at91: sam9x60ek: fix eeprom compatible and size
      ARM: dts: at91: sama5d2_icp: fix eeprom compatibles

Fabio Estevam (1):
      ARM: at91: pm: Mark at91_pm_secure_init as __init

Mihai Sain (1):
      ARM: at91: fix soc detection for SAM9X60 SiPs

 arch/arm/boot/dts/at91-sam9x60ek.dts   |  3 +--
 arch/arm/boot/dts/at91-sama5d2_icp.dts |  6 +++---
 arch/arm/mach-at91/pm.c                | 12 ++++++------
 drivers/soc/atmel/soc.c                | 12 ++++++------
 4 files changed, 16 insertions(+), 17 deletions(-)
