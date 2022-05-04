Return-Path: <SRS0=NPTw=VM=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B107AC433FE
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 21:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9AFDCC385B0; Wed,  4 May 2022 21:09:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2785BC385A5;
	Wed,  4 May 2022 21:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2785BC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id j14so2578020plx.3;
        Wed, 04 May 2022 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KFw9/SbRY/cqsVY8A1C4C8gLKOhVo0hppANUmMoC4rk=;
        b=SSKFDTlbiKI7+yJU4TOQWoPkcXlQuN5DXIWcxqjmRLlhN7scHTjm/IG4a5pB8Nnae/
         5W3YZFmA1FMxpscNo4UYC+ZV3CXYTaX+qNsNSGlDl/KmwuQ5I4qaH2IPnjm+z1HQtG43
         GmBpmfr0y8nIyxvs8O42nvjZrFEbZ3ziFbxRBPgP9NOjzKvs0zN+eMIC5y//7xEk9gm0
         la6AE9+nOXMljOgohoOZnVIJSuDeKBHHtRO/xK9hhXa+UN/YKfGiKPrYke03okSexfzA
         o+FhJuQJqDtAfyFh9/bWHtlAkil9rFRuCvtfRO6VP3QgZC1aXlhFEZQz57lnsn+XCPcW
         nhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFw9/SbRY/cqsVY8A1C4C8gLKOhVo0hppANUmMoC4rk=;
        b=1o64lbTnsB3/O1QIYK8VVzuGmPt9WMr06Bd7xkb6tbIHPNumUPlpq2Wl9gHDzC1Gh8
         xrK3nAr+3WAwtZECbFluNUeXA4yO7B/K8VyQI08ZhYgc3QOzY2F739kumG2qRF8zYxY+
         idnFD5/7u9Fef5AcrTyGsUFFC6BwotpmtlZRdNww3XmGK8ZsGtFgzInvr7VLrk5mCJfY
         c8FFI8be2cJN94mvEqVCrsRAFh42ptpMVsXHx1D64J/gwcMQu/jClfHtqcoYg0aeFUXR
         ZA6sZ2/M5pHL4w0T6PTWbzr+9m8jAOUmEShQIYYLgxgpahN98KohzqZnJeZbcP7gJfL3
         t59g==
X-Gm-Message-State: AOAM533+fwub1xhR9I6s8q7UT6FI19xOMUFy/SS9Itcln6c167QcGveG
	enXl+sMYwSC0Eody+Ym7CmOF/8SrJKY=
X-Google-Smtp-Source: ABdhPJyJ43ffI1UgdPkMhSakrSZXDqWuhPA6GO8gDpdLSKVNvGKb2qceSSy6arhGnZ+oJoT3JKS+Tw==
X-Received: by 2002:a17:902:a581:b0:154:8c7d:736a with SMTP id az1-20020a170902a58100b001548c7d736amr23758271plb.74.1651698588351;
        Wed, 04 May 2022 14:09:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r11-20020a63204b000000b003aaf27b5ceasm14820457pgm.1.2022.05.04.14.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 14:09:48 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/6] Broadcom devicetree changes for 5.19
Date: Wed,  4 May 2022 14:09:38 -0700
Message-Id: <20220504210942.1838248-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210942.1838248-1-f.fainelli@gmail.com>
References: <20220504210942.1838248-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/devicetree

for you to fetch changes up to 417aea4436bb658d8c5c4dcd0e3c255931d0ee96:

  ARM: dts: BCM5301X: Add DT for WZR-1166DHP,DHP2 (2022-05-03 15:02:11 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 5.19, please pull the following:

- Oleksij fixes the ethernet node name for the USB Ethernet adapter on
  BCM283x (Raspberry Pi 1/2/3) platforms

- Kuldeep fixes the PL022 SPI controller clock names to conform to the
  binding

- Rafal updates the various BCM5301X (Northstar) Device Tree include
  files to be dtsschema conforming for pinctrl, NAND

- Arinc adds the Asus RT-AC88U binding, removes some unnecessary
  properties of the Ethernet switch DT node, populates the correct PHY
  interface for port 5 of the switch, adds support for fetching the MAC
  address from the NVMEM provider and finally disables gmac0 on that
  device which is unused

- Phil updates the Raspberry Pi 1/2/3 DTS files to have the latest gpio
  line names conforming to the printed circuit board layout

- Krzysztof updates various Broadcom DTS files to have a conforming SPI
  nor Device Tree node

- Takayoshi adds support for the Buffalo WZR-1166DHP/WZR-1166DHP2
  wireless routers based on the BCM4708 SoC

- William adds support for the BCM47622 ARMv7 Broadband SoC and provides
  a basic DTS to boot upstream Linux on such a system

----------------------------------------------------------------
Arınç ÜNAL (9):
      ARM: dts: BCM5301X: Fix DTC warning for NAND node
      ARM: dts: BCM5301X: Remove cell properties from srab ports on Asus RT-AC88U
      ARM: dts: BCM5301X: Add rgmii to port@5 of Broadcom switch on Asus RT-AC88U
      ARM: dts: BCM5301X: Retrieve gmac1 MAC address from NVRAM on Asus RT-AC88U
      dt-bindings: arm: bcm: fix BCM53012 and BCM53016 SoC strings
      dt-bindings: arm: bcm: create new description for BCM53016
      ARM: dts: BCM5301X: Fix compatible strings for BCM53012 and BCM53016 SoC
      dt-bindings: arm: bcm: add bindings for Asus RT-AC88U
      ARM: dts: BCM5301X: Disable gmac0 and enable port@8 on Asus RT-AC88U

Krzysztof Kozlowski (1):
      ARM: dts: broadcom: align SPI NOR node name with dtschema

Kuldeep Singh (1):
      ARM: dts: bcm-cygnus: Update spi clock properties

Oleksij Rempel (1):
      ARM: dts: bcm283x: fix ethernet node name

Phil Elwell (4):
      ARM: dts: bcm2835-rpi-zero-w: Fix GPIO line name for Wifi/BT
      ARM: dts: bcm2837-rpi-cm3-io3: Fix GPIO line names for SMPS I2C
      ARM: dts: bcm2837-rpi-3-b-plus: Fix GPIO line name of power LED
      ARM: dts: bcm283x: Align ETH_CLK GPIO line name

Rafał Miłecki (1):
      ARM: dts: BCM5301X: Update pin controller node name

SHIMAMOTO Takayoshi (1):
      ARM: dts: BCM5301X: Add DT for WZR-1166DHP,DHP2

Stefan Wahren (2):
      ARM: dts: bcm2835-rpi-b: Fix GPIO line names
      ARM: dts: bcm283x: Remove gpio line name NC

William Zhang (2):
      dt-bindings: arm: add bcmbca device tree binding document
      ARM: dts: add dts files for bcmbca soc 47622

 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |  10 +-
 .../devicetree/bindings/arm/bcm/brcm,bcmbca.yaml   |  33 ++++
 arch/arm/boot/dts/Makefile                         |   4 +
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  12 +-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |  21 ++-
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |  35 ++--
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |  19 +-
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |  35 ++--
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |  48 +++---
 arch/arm/boot/dts/bcm2835-rpi-cm1-io1.dts          |   1 -
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |  25 +--
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |  29 ++--
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |   3 +-
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts         |   1 -
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         |   5 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |   3 +-
 arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts          |   5 +-
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi             |  12 +-
 arch/arm/boot/dts/bcm283x-rpi-smsc9512.dtsi        |   2 +-
 arch/arm/boot/dts/bcm283x-rpi-smsc9514.dtsi        |   2 +-
 .../dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi    | 192 +++++++++++++++++++++
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp.dts  |  26 +++
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp2.dts |  26 +++
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |  19 +-
 arch/arm/boot/dts/bcm47622.dtsi                    | 126 ++++++++++++++
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         |   2 +-
 arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi           |   2 -
 arch/arm/boot/dts/bcm5301x.dtsi                    |   2 +-
 arch/arm/boot/dts/bcm53340-ubnt-unifi-switch8.dts  |   2 +-
 arch/arm/boot/dts/bcm947622.dts                    |  30 ++++
 arch/arm/boot/dts/bcm953012er.dts                  |   2 +-
 arch/arm/boot/dts/bcm953012hr.dts                  |   2 +-
 arch/arm/boot/dts/bcm953012k.dts                   |   2 +-
 arch/arm/boot/dts/bcm958522er.dts                  |   2 +-
 arch/arm/boot/dts/bcm958525er.dts                  |   2 +-
 arch/arm/boot/dts/bcm958525xmc.dts                 |   2 +-
 arch/arm/boot/dts/bcm958622hr.dts                  |   2 +-
 arch/arm/boot/dts/bcm958623hr.dts                  |   2 +-
 arch/arm/boot/dts/bcm958625hr.dts                  |   2 +-
 arch/arm/boot/dts/bcm958625k.dts                   |   2 +-
 arch/arm/boot/dts/bcm988312hr.dts                  |   2 +-
 41 files changed, 596 insertions(+), 158 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcmbca.yaml
 create mode 100644 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi
 create mode 100644 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp.dts
 create mode 100644 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp2.dts
 create mode 100644 arch/arm/boot/dts/bcm47622.dtsi
 create mode 100644 arch/arm/boot/dts/bcm947622.dts
