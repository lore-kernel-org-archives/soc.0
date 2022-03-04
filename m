Return-Path: <SRS0=arFV=TP=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84684C433F5
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 16:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 484AAC340F0; Fri,  4 Mar 2022 16:00:45 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BDEBC340E9;
	Fri,  4 Mar 2022 16:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BDEBC340E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646409644; x=1677945644;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m1ChR7M0tuClOXVONifHVOA2VcoI0G6cdp50B0K6wFI=;
  b=vXogSLmRuIzBNkFsW0VPrXw4OC0h//vseB14NcwuWm7rsl8jTa4y9Y6T
   Kui3RH5N5mXang5f7OFTgEcu18vyuY6wSlCwcFI9T8FbLIDMiS9/5iBXH
   W3j5g+QxFcVzrCrPfp1NyEvivOsfxeGMdx2Rrhot38pL2pzbCmOjMRdfe
   W6fKAXZUheuWoGVvQGoAZmzGPXpWTYUxePHKywPDzlduTmmkmFGnEyhtP
   efFy8dhD5hvRdTUPnn8tl5jtNIRTJWgw1yRKFS/X54e3Bn5fi3bHvloEV
   Lsin872K896CXEo8jg2E1+A0ZYPegmRcBLXSLuj0xhN3YMsoOUIpLMX7J
   A==;
X-IronPort-AV: E=Sophos;i="5.90,155,1643698800"; 
   d="scan'208";a="164553996"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Mar 2022 09:00:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 09:00:42 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 4 Mar 2022 09:00:40 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [GIT PULL] ARM: at91: dt for 5.18 #2
Date: Fri, 4 Mar 2022 17:00:36 +0100
Message-ID: <20220304160036.27392-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Some more dt changes for 5.18.
I had to modify one patch to remove a dependency with the clock tree because of
a modification of the header file in [1] which is already in linux-next.
I tought it would be the simplest solution as I didn't manage to get an
inmutable branch (which could be an overkill solution for such a small change).

I verified that there is no conflict when merging this content with linux-next.
Anyway, tell me if you prefer to not proceed like this.

Thanks, best regards,
  Nicolas

[1]: https://lore.kernel.org/linux-clk/20220111125310.902856-1-tudor.ambarus@microchip.com/T/#u

The following changes since commit 3c8a9c2e2daf51bd3dcaedd321ecc79f10227c41:

  ARM: dts: at91: sama7g5: add opps (2022-02-25 11:32:22 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.18-2

for you to fetch changes up to 92499dec3aa9c251e605b42e1024e805bbaa50ad:

  ARM: dts: at91: sama7g5: Add NAND support (2022-03-04 15:03:53 +0100)

----------------------------------------------------------------
AT91 DT #2 for 5.18:

- Align one sam9x60ek regulator with reality at vdd_1v15
- Clean sama7g5 i2c nodes
- Add EIC and NAND nodes to sama7g5

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: at91: sama7g5: add eic node

Mihai Sain (1):
      ARM: dts: at91: sam9x60ek: modify vdd_1v5 regulator to vdd_1v15

Tudor Ambarus (2):
      ARM: dts: at91: sama7g5: Remove unused properties in i2c nodes
      ARM: dts: at91: sama7g5: Add NAND support

 arch/arm/boot/dts/at91-sam9x60ek.dts |  8 ++--
 arch/arm/boot/dts/sama7g5.dtsi       | 74 ++++++++++++++++++++++++++++++++---
 include/dt-bindings/clock/at91.h     |  1 +
 3 files changed, 73 insertions(+), 10 deletions(-)

-- 
Nicolas Ferre
