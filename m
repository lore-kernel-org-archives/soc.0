Return-Path: <SRS0=AMt0=NF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B48C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Aug 2021 13:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F2260EE0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Aug 2021 13:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9F2260EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBaVtVRflYqT8clUul3RN5c1cqXnlDMfUUMPEtizyo0=; b=rKPPABCLYYkm3h
	tjMUgLP5DMasZ6yvoA8L3cxrl3J/QG1lxg2hy3YB2LRszCm4UwsaO4ZHNXnmffvQQBU4ZQa7YB0Hm
	uHgUbI5BTkcn94/MD10r6VQ/B5lqfe5fS9h0deFrqChOUCCss8PVUeq0mPyCv+EyVij5RShl9SVNZ
	s9RrV56zKwtwf6Rs8Twt9UWBEQFttUwvO28/PZik6HNxN0crOmsH7icWuCnYgm2Dlw7u0S57jAHsC
	JQ8hmInhDeCR68iM/u/BX+jR4stj/CGPwUeDQmuI9BgMFHR8EceZzR6Frplb5ta9HYM0XQf4UBw2k
	rvQBJoq4xQYZD10tza1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEtsl-00ECuq-KK; Sat, 14 Aug 2021 13:39:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEtsX-00ECtD-6I
 for linux-arm-kernel@lists.infradead.org; Sat, 14 Aug 2021 13:39:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3782860F92;
 Sat, 14 Aug 2021 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628948352;
 bh=LX+ERigAyoR/GYeAckGr0gGDAcTboOLSNey/VX1tzmY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ryp8v8cDVte1CyM9BTDvBVvjIezKkOAQ/NkajkfZTY8NJNIUjxXyIrjDB8gM2ZjtG
 GRnCCC2CDZCPevPM8XpBn2axRgUOg1Aw6CdMdVbnUSFY0Q5+c0XpHKbEkug1DA1ca7
 xJ+xuWzMv7AsZ2fqSgNSh7uWxKORMcK/5XuZ3JaacZ/9XdvYPywgat+53MMstdfBwt
 xV/KbxqC8a9y2RyIEIYTGkEHjxvSa6Z0qVceVpn6SMDO+0sfqaycgvS3KBUBNptufb
 hDomRIK8L2pxvjbDhqcOxKPZn8aHHR+oaaAC/KSc4OJLz/odwTPkzbutBw+LEsfkYT
 W82GoYr6HCqpw==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] i.MX arm32 device tree changes for 5.15
Date: Sat, 14 Aug 2021 21:38:51 +0800
Message-ID: <20210814133853.9981-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210814133853.9981-1-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210814_063913_307704_B518F757 
X-CRM114-Status: GOOD (  11.11  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210814133851.hkLO2MQyXmyGoDRdP7-KZyF3d2Qtg5Z3srA_azExa_0@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.15

for you to fetch changes up to 87a8c7164022d2e5c558bc0e14075c7a50af7f95:

  ARM: dts: imx6qp-prtwd3: configure ENET_REF clock to 125MHz (2021-08-14 13:45:58 +0800)

----------------------------------------------------------------
i.MX arm32 device tree changes for 5.15:

- A series from Christoph Niedermaier to clean up i.MX6 DHCOM support.
- New board support: DHCOM based PicoITX, DHSOM based DRC02, SolidRun
  SolidSense, SKOV i.MX6 boards.
- Add WiFi support for i.MX7D base reMkarkable2 device.
- Add FTM devices for i.MX7 to have Flex Timers support.
- Configure ENET_REF clock to 125MHz for imx6qp-prtwd3 to support RGMII
  PHY mode.
- Drop unneeded #address-cells and #size-cells from vf610-zii SPI EEPROM
  device node.
- Add missing USB OTG OC pinmux and Crypto device for i.MX6QDL Gateworks
  boards.

----------------------------------------------------------------
Alistair Francis (1):
      ARM: dts: imx7d-remarkable2: Add WiFi support

Aswath Govindraju (1):
      ARM: dts: vf610-zii-dev-rev-b: Remove #address-cells and #size-cells property from at93c46d dt node

Christoph Niedermaier (15):
      ARM: dts: imx6q-dhcom: Add the parallel system bus
      ARM: dts: imx6q-dhcom: Add interrupt and compatible to the ethernet PHY
      ARM: dts: imx6q-dhcom: Fill GPIO line names on DHCOM SoM
      ARM: dts: imx6q-dhcom: Adding Wake pin to the PCIe pinctrl
      ARM: dts: imx6q-dhcom: Align stdout-path with other DHCOM SoMs
      ARM: dts: imx6q-dhcom: Add keys and leds to the PDK2 board
      ARM: dts: imx6q-dhcom: Remove ddc-i2c-bus property
      ARM: dts: imx6q-dhcom: Set minimum memory size of all DHCOM i.MX6 variants
      ARM: dts: imx6q-dhcom: Use 1G ethernet on the PDK2 board
      ARM: dts: imx6q-dhcom: Rework of the DHCOM GPIO pinctrls
      ARM: dts: imx6q-dhcom: Rearrange of iomux
      ARM: dts: imx6q-dhcom: Cleanup of the devicetrees
      ARM: dts: imx6qdl-dhcom: Split SoC-independent parts of DHCOM SOM and PDK2
      ARM: dts: imx6qdl-dhcom: Add DHCOM based PicoITX board
      ARM: dts: imx6qdl-dhcom: Add DHSOM based DRC02 board

Oleksij Rempel (1):
      ARM: dts: imx6qp-prtwd3: configure ENET_REF clock to 125MHz

Russell King (1):
      ARM: dts: add SolidRun SolidSense support

Sam Ravnborg (1):
      ARM: dts: add SKOV imx6q and imx6dl based boards

Thomas Perrot (1):
      ARM: dts: imx7: add ftm nodes for Flex Timers

Tim Harvey (2):
      ARM: dts: imx6qdl-gw5xxx: add missing USB OTG OC pinmux
      ARM: dts: imx6qdl-gw5904: atecc508a support

 arch/arm/boot/dts/Makefile                         |  11 +-
 arch/arm/boot/dts/imx6dl-dhcom-picoitx.dts         |  20 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts         |  13 +
 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts         | 106 ++++
 arch/arm/boot/dts/imx6dl-solidsense.dts            |  54 ++
 arch/arm/boot/dts/imx6q-dhcom-pdk2.dts             | 270 +--------
 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts          |  36 ++
 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts          | 128 +++++
 .../boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
 arch/arm/boot/dts/imx6q-solidsense.dts             |  54 ++
 arch/arm/boot/dts/imx6qdl-dhcom-drc02.dtsi         | 139 +++++
 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi          | 361 ++++++++++++
 arch/arm/boot/dts/imx6qdl-dhcom-picoitx.dtsi       |  69 +++
 ...imx6q-dhcom-som.dtsi => imx6qdl-dhcom-som.dtsi} | 631 +++++++++++++++------
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi              |   1 +
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              |   1 +
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi              |   1 +
 arch/arm/boot/dts/imx6qdl-gw553x.dtsi              |   1 +
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi              |   5 +
 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi       |  54 ++
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi            | 477 ++++++++++++++++
 arch/arm/boot/dts/imx6qdl-solidsense.dtsi          | 160 ++++++
 arch/arm/boot/dts/imx6qp-prtwd3.dts                |   2 +
 arch/arm/boot/dts/imx6s-dhcom-drc02.dts            |  30 +
 arch/arm/boot/dts/imx7d-remarkable2.dts            |  91 +++
 arch/arm/boot/dts/imx7s.dtsi                       |  28 +
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts          |   2 -
 27 files changed, 2431 insertions(+), 441 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-dhcom-picoitx.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-solidsense.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
 create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
 create mode 100644 arch/arm/boot/dts/imx6q-solidsense.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-drc02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-pdk2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-dhcom-picoitx.dtsi
 rename arch/arm/boot/dts/{imx6q-dhcom-som.dtsi => imx6qdl-dhcom-som.dtsi} (57%)
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-solidsense.dtsi
 create mode 100644 arch/arm/boot/dts/imx6s-dhcom-drc02.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
