Return-Path: <SRS0=jiom=XK=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CBDC433EF
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 08:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E6DDC341CE; Tue,  5 Jul 2022 08:44:25 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61878C341CB;
	Tue,  5 Jul 2022 08:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61878C341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657010663; x=1688546663;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XAdgFKI91yLdNA/2RVNY+qkaB/6LuZCuxN9UEX+97FI=;
  b=ZUHCjmcJzvrZkeIPCr44j5q1iMuwK/sWDzlzhWMTf5dIKBAopyq/0ElO
   xdxyJGnJk1qFHY16430gebDTUe1x5Cs96IPjE5prux38VCCw3k5vs/1b8
   ueWT6DOzlyIzvpc2Hp4f7sP5o2ARNsQICRyUrEoagA9l9pfCvrDonlaUu
   QH56+xG+gOhFXVJFufe6n4z85TsTWZlbXdbBv5oC7ajNAK14XsR0YSblN
   +IvXEg98cqo3iCYgY7qHYLw6qObWhpG1ek8AzOKimPChZJ8uG+1wOKFOd
   zn7YB8a7nbWIbcxzJ232Ikq22Ov0n/HM3fsiCbpHY8q62sFFcPn8XSkxB
   A==;
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="166387716"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 01:44:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 01:44:17 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 01:44:13 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] AT91 device tree changes for v5.20
Date: Tue, 5 Jul 2022 11:46:37 +0300
Message-ID: <20220705084637.818216-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi, Arnd, Olof, ARM SoC maintainers,

Please pull the following AT91 fixes for v5.20.

Thank you,
Claudiu Beznea

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.20

for you to fetch changes up to 4dd1a613e464e9036d5163fc8ec5f7dc6e394b53:

  ARM: dts: lan966x: Add UDPHS support (2022-07-05 10:42:18 +0300)

----------------------------------------------------------------
AT91 DT for v5.20

It contains:
- compilation warning fixes for SAMA5D2
- updates for all AT91 device tree to use generic name for reset
  controller
- reset controller node for SAMA7G5
- MCAN1 and UDPHS nodes for LAN966 SoCs
- Flexcom3 bindings were updated for lan966x-pcb8291.dts board to cope
  with reality

----------------------------------------------------------------
Claudiu Beznea (4):
      ARM: dts: at91: sama5d2: fix compilation warning
      ARM: dts: at91: sama5d2: fix compilation warning
      ARM: dts: at91: use generic name for reset controller
      ARM: dts: at91: sama7g5: add reset-controller node

Herve Codina (2):
      dt-bindings: usb: atmel: Add Microchip LAN9662 compatible string
      ARM: dts: lan966x: Add UDPHS support

Kavyasree Kotagiri (2):
      ARM: dts: lan966x: Add mcan1 node.
      ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl settings.

 .../devicetree/bindings/usb/atmel-usb.txt          |  3 +++
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi          |  2 ++
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi        |  2 ++
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts          |  2 ++
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |  2 ++
 arch/arm/boot/dts/at91sam9260.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9261.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9263.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9g45.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9n12.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9rl.dtsi                  |  2 +-
 arch/arm/boot/dts/at91sam9x5.dtsi                  |  2 +-
 arch/arm/boot/dts/lan966x-pcb8291.dts              | 18 ++++-----------
 arch/arm/boot/dts/lan966x.dtsi                     | 26 ++++++++++++++++++++++
 arch/arm/boot/dts/sam9x60.dtsi                     |  2 +-
 arch/arm/boot/dts/sama5d2.dtsi                     | 24 +++++++++-----------
 arch/arm/boot/dts/sama5d3.dtsi                     |  2 +-
 arch/arm/boot/dts/sama5d4.dtsi                     |  2 +-
 arch/arm/boot/dts/sama7g5.dtsi                     |  7 ++++++
 19 files changed, 69 insertions(+), 37 deletions(-)
