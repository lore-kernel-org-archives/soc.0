Return-Path: <SRS0=L2b6=3K=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1AAC433FE
	for <soc@archiver.kernel.org>; Thu, 10 Nov 2022 11:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67CA5C433C1; Thu, 10 Nov 2022 11:49:45 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31D84C433D6;
	Thu, 10 Nov 2022 11:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31D84C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668080983; x=1699616983;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hUj8olwA6fRNGSUgKrjATcQXXup7XfzdfwHhZpCIk30=;
  b=tKbI9q1Wm+eP218Mw/DcMZoorE9Zqo8DJmqWa19+oIi05RyXUJGiB8ZU
   jiZSvZyfvRBqvmB1c2M+jU6QW228FOh077NpA/ZXp6V4qlkzk3BF+V7Kh
   VPzXpVgd/Rth7JwUOm1MyA2yKChoAWSjzszuVUDeBS8a01/Eov7RQKVVc
   /+NffkOJALsC0/+Q/lMe2DB0rXNZF1ifsvdzrZ6YOujRTaGxM7IsElZt6
   6/zTfKONni2Biaxz6pTDmQOgrNCiPbvY+mXqyh+oqdhQCyZzXVWt2352N
   PVqfmZ1BMbL7SJKspDALjTvgMhWPbq1b5M2zFfxcOOddnoQno8TwSy+/k
   w==;
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="188471813"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2022 04:49:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 10 Nov 2022 04:49:41 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 10 Nov 2022 04:49:39 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 device tree updates for 6.2
Date: Thu, 10 Nov 2022 13:54:31 +0200
Message-ID: <20221110115431.180908-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.2

for you to fetch changes up to 5258d30f33bdbb495f6de7601db5d60e13223a5b:

  ARM: dts: at91: sam9x60ek: remove status = "okay" for regulators (2022-11-01 12:28:58 +0200)

----------------------------------------------------------------
AT91 DT for 6.2

It contains:
- interrupt support for ethernet PHYs on pcb8290 board
- thermal management support for SAMA7G5 by adding OTP controller
  (that keeps temperature sensor calibration data), proper ADC
  bindings and describing thermal zones
- securam node from SAMA7G5 is now described with generic name (sram)
- remove of status = "okay" from SAM9X60-EK regulators

----------------------------------------------------------------
Claudiu Beznea (7):
      ARM: dts: at91: sama7g5: add otpc node
      ARM: dts: at91: sama7g5: add io-channel-cells to adc node
      ARM: dts: at91: sama7g5: add cells for temperature calibration
      ARM: dts: at91: sama7g5: add temperature sensor
      ARM: dts: at91: sama7g5: add thermal zones node
      ARM: dts: at91: sama7g5: use generic name for securam
      ARM: dts: at91: sam9x60ek: remove status = "okay" for regulators

Horatiu Vultur (1):
      ARM: dts: lan966x: Add interrupt support for PHYs on pcb8290

 arch/arm/boot/dts/at91-sam9x60ek.dts  |  4 ---
 arch/arm/boot/dts/lan966x-pcb8290.dts | 16 +++++++++
 arch/arm/boot/dts/sama7g5.dtsi        | 67 ++++++++++++++++++++++++++++++++++-
 3 files changed, 82 insertions(+), 5 deletions(-)
