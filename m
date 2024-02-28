Return-Path: <SRS0=Wmst=KF=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED2FC47DD9
	for <soc@archiver.kernel.org>; Wed, 28 Feb 2024 06:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E2C9C43390; Wed, 28 Feb 2024 06:46:54 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D6DDC433C7;
	Wed, 28 Feb 2024 06:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D6DDC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 64A16604A0;
	Wed, 28 Feb 2024 06:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709102812;
	bh=9ubBFJomTelFQYCNQDlraKNfLFIZTTOeZiEYzjEs5/8=;
	h=From:To:Cc:Subject:Date:From;
	b=CYVKp22iq/u04cldd8iOMU8t5si9xc8kkOwSYH+nMT8edRNzV7pDXk/3hkggm4TZX
	 /a4P2X8D6ryem9ltkJAadUPPZOGKyB3eYZIc4R94GEF6M12stCSy7dSXY1eKmhff3d
	 IGyK+KcLNS0BgOK7MPOJDUnAADAbr13ySkdIFd61CWPy4YN9SfiK82bG4VaFfbDcAZ
	 TrcHu2y8RyVpZXvzWIh4XnDdJQ5ht8UKVVr3WC6ewTgFy3bEgul0iTKIr3LIrxkFGo
	 1AN6aiD7dZQrfDCRxjWPcGb1UU2QuNjPt/SpH6TEpzd04ipG6NqSm/JVNRv6xTIsyR
	 C+oa6f2hpyvWw==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Devicetree changes for omaps for v6.9
Date: Wed, 28 Feb 2024 08:46:38 +0200
Message-ID: <pull-1709102762-376748@atomide.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/dt-signed

for you to fetch changes up to 391b3e9abe4423b79a904ac9de3fe7f17914a746:

  ARM: dts: omap4-panda-common: Enable powering off the device (2024-02-26 14:00:04 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for v6.9 merge window

Few device tree warning fixes, updates to use https links, and
add system-power-controller property for omap4-panda and
omap4-epson-embt2ws.

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: omap-embt2ws: system-power-controller for bt200
      ARM: dts: omap4-panda-common: Enable powering off the device

Nishanth Menon (1):
      ARM: dts: omap: Switch over to https:// url

Romain Naour (3):
      ARM: dts: ti: omap: add missing phy_gmii_sel unit address for dra7 SoC
      ARM: dts: ti: omap: add missing sys_32k_ck unit address for dra7 SoC
      ARM: dts: ti: omap: add missing abb_{mpu,ivahd,dspeve,gpu} unit addresses for dra7 SoC

 arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dts              | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dts              | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dts              | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi                    | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi               | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts                    | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-evmsk.dts                      | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts                   | 4 ++--
 arch/arm/boot/dts/ti/omap/am335x-icev2.dts                      | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-igep0033.dtsi                  | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myc.dtsi              | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-nano.dts                       | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dts            | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts            | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dts            | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts                     | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts                       | 3 ++-
 arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts                     | 2 +-
 arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts                    | 2 +-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts                  | 2 +-
 arch/arm/boot/dts/ti/omap/compulab-sb-som.dtsi                  | 2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                          | 2 +-
 arch/arm/boot/dts/ti/omap/dra7.dtsi                             | 8 ++++----
 arch/arm/boot/dts/ti/omap/dra74x-p.dtsi                         | 2 +-
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi                    | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts               | 1 +
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi               | 1 +
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts                         | 2 +-
 arch/arm/boot/dts/ti/omap/omap5-igep0050.dts                    | 2 +-
 arch/arm/boot/dts/ti/omap/twl4030.dtsi                          | 2 +-
 arch/arm/boot/dts/ti/omap/twl6030.dtsi                          | 4 ++--
 39 files changed, 46 insertions(+), 43 deletions(-)
