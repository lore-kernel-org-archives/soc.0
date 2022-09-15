Return-Path: <SRS0=isiy=ZS=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E13ECAAD3
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 10:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FB88C433B5; Thu, 15 Sep 2022 10:56:20 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48662C433D6;
	Thu, 15 Sep 2022 10:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48662C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663239378; x=1694775378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NIJxJaUoS0iiRAD/AM04mtSXkW8wPy673UGwZ+JnywU=;
  b=jcUdB0LnuQWYU6v+dTsyP9spnd55I/YeHO1yikRR2/mP7dYmZzOJQKWR
   cbeSYNadrIwgwjGxZ52ap3CpXqEODuVZEGi2/J92LvvEaKEk7j+IbWPAF
   SI8St+g2L2BQdNIPzHLzn8wJRE79fPlDpARgpgJpbeo800HfIjaOLAZFU
   f0S711vQMC9wjOU0syzBhqIcJopmYF2pyc9UPu/wtT0qgYvXUKmAe+rj8
   eUCQthX4E1vyIzMztErnQUjAz+E0zNzZ94CY81Gf+YtNZxWejVci6yUtT
   MRlF/pTFgHO4n9e+8f6cjN+w1cnb2hiPVWApdA2e95Zh/DKwK0K30VfLd
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="113812698"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 03:56:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 03:56:15 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 03:56:12 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 fixes for 6.0 #2
Date: Thu, 15 Sep 2022 13:58:33 +0300
Message-ID: <20220915105833.4159850-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 3d074b750d2b4c91962f10ea1df1c289ce0d3ce8:

  ARM: dts: at91: sama5d2_icp: don't keep vdd_other enabled all the time (2022-08-31 10:28:19 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.0-2

for you to fetch changes up to f5fc22cbbdcd349402faaddf1a07eb8403658ae8:

  ARM: dts: lan966x: Fix the interrupt number for internal PHYs (2022-09-13 10:14:24 +0300)

----------------------------------------------------------------
AT91 fixes for 6.0 #2

It contains a fix for LAN966 SoCs that corrects the interrupt
number for internal PHYs.

----------------------------------------------------------------
Horatiu Vultur (1):
      ARM: dts: lan966x: Fix the interrupt number for internal PHYs

 arch/arm/boot/dts/lan966x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
