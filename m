Return-Path: <SRS0=l92L=FC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44927C63697
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 16:34:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 16F4A246CE; Sat, 28 Nov 2020 16:34:21 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB5A8246CA;
	Sat, 28 Nov 2020 16:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUdIYG51"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB5A8246CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pf1-f175.google.com with SMTP id x24so7130331pfn.6;
        Sat, 28 Nov 2020 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hQskfhWKOgjfdeD0ih4b6Q44JvqmpM72cv1EEv2HQH0=;
        b=SUdIYG51FBSUWv8U3MWthxI9oY9pCS1KMXX3ue3PDQiI2PyBKQztOLU1m97CY/jiUK
         /V7nP5AM7OAMTyO2XYBAw+VdbdsF0se5itsuUYX7bzA41kym0mVubK7RCRdHREgQjmd+
         If6aIvaXb0rOpiSdOjdlxB+aIdHttc/XNZjjQC06BDw8djKRDQGa5SfRvlw5A2v3P7Vs
         X+PBaov784UDSybLubQrnWadVyw5te4qPxPeRGIHfxqhKYG7k9krmKKwHgDtBAJUxgjG
         /NwIJVcrXtf8bY6km1n7o1mI/pbIBHCyQ4tZSL6vofpZxKpwZlJAaJ8vFzjMDJ+Zunq6
         Vl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hQskfhWKOgjfdeD0ih4b6Q44JvqmpM72cv1EEv2HQH0=;
        b=mOpf25v8N1mqVharCW/ANoqhAX+387SAIYieYSjpeWkSsq2GqIQb9P+MC5+jV5LImH
         Mc76/RTKlkJbTEIH7mJupEln3ZnUqUYgJAYblI++WqS+5FsIg7aD6p4trleMq4IcT2BM
         tmjQJKDn4XmdCiyZZWOBBac9pN7eEeGfEV5Bh5My8lS/d53RDAm6SQDgrMuIpjBqniFH
         8pNR+Z86RrOGBCBK9RIPW3a72f4TF3VaAYnxbSrXrtbShLnEE+GsJfgUpdVJw4+H5seE
         +vccDbGM4WV4YURHKthzau77zZ1K0GVwyth8Iz/gBrrtEJOon5bsE5V1CTEm1TSZDuU9
         NakA==
X-Gm-Message-State: AOAM5329/Zeg5RMuFlRbR0Ks4dvUOmkyKr5VacFMjveiJsx+AtXZitvE
	KiWNa6X8gfwEGHUvpnQOAiCQm0QYNAA=
X-Google-Smtp-Source: ABdhPJwPoRX6oJ+vzb4WxHgfnKW6DTZWjml5J8U4g1RoSUMIRNO97Vq5fBGkmcQ4bau2SKv9U+dY3w==
X-Received: by 2002:a63:4703:: with SMTP id u3mr10666858pga.199.1606581259772;
        Sat, 28 Nov 2020 08:34:19 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 08:34:19 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Kurt Kanzenbach <kurt@kmk-computers.de>,
	Rob Herring <robh@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Pavel Hofman <pavel.hofman@ivitera.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	Maxime Ripard <maxime@cerno.tech>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	kernel test robot <lkp@intel.com>,
	Vivek Unune <npcomplete13@gmail.com>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/5] Broadcom devicetree changes for 5.11
Date: Sat, 28 Nov 2020 08:34:08 -0800
Message-Id: <20201128163410.1691529-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201128163410.1691529-1-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree

for you to fetch changes up to f722fbac1e533ea1fe750d99d09c244efff59d59:

  Merge tag 'tags/bcm2835-dt-next-2020-11-20' into devicetree/next (2020-11-20 19:14:01 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs changes for 5.11,
please pull the following:

- Vivek updates the Linksys EA9500 DTS by adding the two additional
  switch port nodes (5 & 7), providing a flash partition layout to
  make the device usable with OpenWrt, and finally switches to using
  the pin controller rather than using mdio-mux to get the same outcome.

- Serge fixes the USB Device Tree nodes unit name to be conformant to
  the recommended name patterns.

- Rafal re-arranges all the nodes that belonged to the CRU block to be
  under the CRU node (such as PLLs). He also disables the USB3 PHY node
  for devices that lack USB3 and adds USB3 support to the Luxul XWR-3150
  DTS.

- Jonathan drops the incorrect 'io-channel-ranges' from the Cygnus SoC
  DTSI.

- Maxime disables the Wi-Fi frequencies (around 2.4GHz) for HDMI on the
  Raspberry Pi 4 due to some cross-talk between the two blocks.

- Pavel updates the DWC2 USB controller RX FIFO sizes to be more
  accurate for all BCM283x (Raspberr Pi) SoCs.

- Florian updates all BCM5301x and NSP Device Tree files to allow
  switching the Broadcom B53 Ethernet switch device tree binding to YAML.

----------------------------------------------------------------
Florian Fainelli (10):
      dt-bindings: net: dsa: Extend switch nodes pattern
      dt-bindings: net: dsa: Document sfp and managed properties
      ARM: dts: BCM5301X: Update Ethernet switch node name
      ARM: dts: BCM5301X: Add a default compatible for switch node
      ARM: dts: BCM5301X: Provide defaults ports container node
      ARM: dts: NSP: Update ethernet switch node name
      ARM: dts: NSP: Fix Ethernet switch SGMII register name
      ARM: dts: NSP: Add a SRAB compatible string for each board
      ARM: dts: NSP: Provide defaults ports container node
      Merge tag 'tags/bcm2835-dt-next-2020-11-20' into devicetree/next

Jonathan Cameron (1):
      ARM: dts: Cygnus: Drop incorrect io-channel-ranges property.

Kurt Kanzenbach (1):
      dt-bindings: net: dsa: b53: Add YAML bindings

Maxime Ripard (1):
      ARM: dts: rpi-4: disable wifi frequencies

Pavel Hofman (1):
      ARM: dts: bcm283x: increase dwc2's RX FIFO size

Rafał Miłecki (3):
      ARM: dts: BCM5301X: Move CRU devices to the CRU node
      ARM: dts: BCM5301X: Disable USB 3 PHY on devices without USB 3
      ARM: dts: BCM5301X: Enable USB 3 PHY on Luxul XWR-3150

Serge Semin (2):
      ARM: dts: BCM5301X: Harmonize EHCI/OHCI DT nodes name
      ARM: dts: BCM5310X: Harmonize xHCI DT nodes name

Vivek Unune (4):
      ARM: dts: BCM5301X: Linksys EA9500 add port 5 and port 7
      ARM: dts: BCM5301X: Linksys EA9500 add fixed partitions
      ARM: dts: BCM5301X: Use corretc pinctrl compatible for 4709x
      ARM: dts: BCM5301X: Linksys EA9500 make use of pinctrl

 Documentation/devicetree/bindings/net/dsa/b53.txt  | 149 ------------
 .../devicetree/bindings/net/dsa/brcm,b53.yaml      | 249 +++++++++++++++++++++
 Documentation/devicetree/bindings/net/dsa/dsa.yaml |   6 +-
 MAINTAINERS                                        |   2 +-
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   1 -
 arch/arm/boot/dts/bcm-nsp.dtsi                     |   8 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |   2 +
 arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi         |   2 +-
 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi  |   2 +-
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       |   7 -
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |   7 -
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |   3 -
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |   4 -
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts      |   7 -
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |   7 -
 arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts |   4 -
 arch/arm/boot/dts/bcm4709.dtsi                     |   4 +
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |  94 +++++---
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts      |   3 -
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |   3 -
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |   3 -
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |   7 +-
 arch/arm/boot/dts/bcm47094.dtsi                    |  13 ++
 arch/arm/boot/dts/bcm5301x.dtsi                    |  67 +++---
 arch/arm/boot/dts/bcm53573.dtsi                    |   4 +-
 arch/arm/boot/dts/bcm953012er.dts                  |   3 -
 arch/arm/boot/dts/bcm958522er.dts                  |   4 +
 arch/arm/boot/dts/bcm958525er.dts                  |   4 +
 arch/arm/boot/dts/bcm958525xmc.dts                 |   4 +
 arch/arm/boot/dts/bcm958622hr.dts                  |   3 -
 arch/arm/boot/dts/bcm958623hr.dts                  |   3 -
 arch/arm/boot/dts/bcm958625hr.dts                  |   3 -
 arch/arm/boot/dts/bcm958625k.dts                   |   3 -
 arch/arm/boot/dts/bcm988312hr.dts                  |   3 -
 34 files changed, 405 insertions(+), 283 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/dsa/b53.txt
 create mode 100644 Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
