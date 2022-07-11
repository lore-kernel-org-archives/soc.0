Return-Path: <SRS0=WXVb=XQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0B2C43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3A91C341CA; Mon, 11 Jul 2022 16:45:14 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAEE0C34115;
	Mon, 11 Jul 2022 16:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAEE0C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id q82so5196843pgq.6;
        Mon, 11 Jul 2022 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sLOcdAj6XWcIpIEBnUQkvMwCh61rt7gFZPF66joI2pE=;
        b=C0J1GC1ylIidcfFYzv+lymSs7X5VL7L7C3Xkf5NWTvVheLczPZWpz68E8xuEOJxXB6
         doiv6d+66sJjg+jJmZJ8Vp7X60HdaYrpnJNbR+HexLmPNSkLRYvBQ56qfGJJ28vjlN+o
         RtjSXPL9NiYXbZIreL5HT2ztAhfIRE1bPDFP5azqwBGThv50Wa34fdlikaA8Elj7wDnJ
         V3M063rDGuZ7rD+fdyfXDN2yYtnuy1M3+r6IjVUKXEZl2ExPHQLCtKkS7Cav9+Os8io0
         YXDWzoqKP8/nNWIidO5pyvufeAIokrHKg9RR/3a9H5RNtoh/O902h/M8THAvakgO/Z6R
         YthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sLOcdAj6XWcIpIEBnUQkvMwCh61rt7gFZPF66joI2pE=;
        b=4uh7PdmjfkyC6RfB5Iftiqi/skO/VgAivP+hHP98XQfouzvtedZKnMrzSw0lWQ8F/y
         Yzdny8iHRlIYOL8/rWa4ZitIv5lb+MfbxbsgjLKii+diMTMYDYUSamMVcb549h2TT+MM
         italwuhTc3CpT9I4zTMI6k4A048+wCkFo8tkYspAsNAoC+RPXowZfq2Giu23RpdQR9zp
         1B+uMjjZ0BW3GkNXB8WqU2RHW23uuH2nKzoLwUD8o+Nbw/9IBst95tWz5l7dMhKOo8AZ
         w9XsO8p++z4PAZlA2HnfxdIlRWI67DR9FSAXOqAVTEdSZRe1CBzPU3jET1ixCyEru8rV
         zZyQ==
X-Gm-Message-State: AJIora9FZzjwzLKK1WqIOw9n4IAwnQ0lhHzSoKWu5v0ZooLpOU7mc+c5
	1U8lPzIuLBD5mnEREZjeRWUvn/UfCOE=
X-Google-Smtp-Source: AGRyM1shg/EWfYujw64HGE9nI7GQk+NBQeIfWzg7ukVsO9/trRoMuLHYkGTQPO7Z2bNwATaj4T/fgA==
X-Received: by 2002:a65:4c0b:0:b0:415:d3a4:44d1 with SMTP id u11-20020a654c0b000000b00415d3a444d1mr11786706pgq.191.1657557909746;
        Mon, 11 Jul 2022 09:45:09 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0052ab9f1fe45sm4961266pfi.120.2022.07.11.09.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:45:09 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Christian Lamparter <chunkeey@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Maxime Ripard <maxime@cerno.tech>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/7] Broadcom devicetree changes for 5.20
Date: Mon, 11 Jul 2022 09:44:47 -0700
Message-Id: <20220711164451.3542127-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/devicetree

for you to fetch changes up to daf7c850caabe0f12b10d2310a8420fc6e8abd8f:

  ARM: dts: Add BCM63138 generic board dts (2022-07-08 14:00:45 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree updates
for 5.20, please pull the following:

- Stefan drops the unnecessary "#address-cells" and "#size-cells"
  properties from the DPI node of BCM283x

- Anand documents and adds support for the 63178 and 6858 SoCs

- William migrates the 63138 platform over to ARCH_BCMBCA and ensures
  that it is documented within the BCMBCA Device Tree binding documents.
  He updates the 47622 DTS to remove unnecessary PSCI properties, fix
  the GIC nodes and some minor cosmetic changes. He finally adds support
  for the 63158, 4912, 6846, 6855, 6756, 63146, 6856, 63148, 6813, 6318
  SoCs.

- Peter, Nicolas and Stefan adds the necessary Device Tree nodes to the
  BCM2711 (Raspberry Pi 4) DTS to enable the use of the V3D GPU on these
  platforms.

- Christian adds support for the BCM53015 based Cisco Meraki MR26
  Wi-Fi access point.

- Krzysztof updates the Broadcom platforms DTS to add a missing
  whitespace between the property name and its value.

----------------------------------------------------------------
Anand Gore (5):
      dt-bindings: arm: add BCM63178 SoC to binding document
      ARM: dts: add dts files for bcmbca soc 63178
      dt-bindings: arm64: Add BCM6858 SoC to binding document
      dt-bindings: arm: Add BCM6878 soc
      ARM: dts: Add DTS files for bcmbca SoC BCM6878

Christian Lamparter (2):
      dt-bindings: ARM: add bindings for the Meraki MR26
      ARM: dts: BCM5301X: Add DT for Meraki MR26

Krzysztof Kozlowski (3):
      ARM: dts: broadcom: adjust whitespace around '='
      ARM: dts: broadcom: align gpio-key node names with dtschema
      ARM: dts: broadcom: correct gpio-keys properties

Nicolas Saenz Julienne (4):
      dt-bindings: soc: bcm: bcm2835-pm: Convert bindings to DT schema
      dt-bindings: soc: bcm: bcm2835-pm: Introduce reg-names
      ARM: dts: bcm2835/bcm2711: Introduce reg-names in watchdog node
      ARM: dts: bcm2711: Use proper compatible in PM/Watchdog node

Peter Robinson (1):
      ARM: dts: bcm2711: Enable V3D

Stefan Wahren (2):
      ARM: dts: bcm283x: Drop unnecessary properties from dpi node
      dt-bindings: soc: bcm: bcm2835-pm: Add support for bcm2711

William Zhang (18):
      dt-bindings: arm64: add BCM63158 SoC to binding document
      dt-bindings: arm64: Add BCM4912 SoC to binding document
      dt-bindings: arm: add BCM6846 SoC to device tree binding document
      ARM: dts: Add DTS files for bcmbca SoC BCM6846
      ARM: dts: Update BCM47622 DTS file
      dt-bindings: arm: add BCM6855 SoC to device tree binding document
      ARM: dts: Add DTS files for bcmbca SoC BCM6855
      dt-bindings: arm: Add BCM6756 SoC
      ARM: dts: Add DTS files for bcmbca SoC BCM6756
      dt-bindings: arm64: Add BCM63146 SoC
      dt-bindings: arm64: Add BCM6856 SoC
      dt-bindings: arm: Add BCM63148 SoC
      ARM: dts: Add DTS files for bcmbca SoC BCM63148
      dt-bindings: arm64: Add BCM6813 SoC
      dt-bindings: arm: add BCM63138 SoC
      ARM: dts: Move BCM963138DVT board dts to ARCH_BCMBCA
      ARM: dts: update dts files for bcmbca SoC BCM63138
      ARM: dts: Add BCM63138 generic board dts

 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |   7 +
 .../devicetree/bindings/arm/bcm/brcm,bcmbca.yaml   |  92 ++++++++++++
 .../bindings/soc/bcm/brcm,bcm2835-pm.txt           |  46 ------
 .../bindings/soc/bcm/brcm,bcm2835-pm.yaml          |  86 +++++++++++
 arch/arm/boot/dts/Makefile                         |  13 +-
 arch/arm/boot/dts/bcm2711-rpi.dtsi                 |   4 +
 arch/arm/boot/dts/bcm2711.dtsi                     |  14 +-
 arch/arm/boot/dts/bcm28155-ap.dts                  |   8 +-
 arch/arm/boot/dts/bcm2835-common.dtsi              |   1 +
 arch/arm/boot/dts/bcm283x.dtsi                     |   8 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        |   6 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        |   8 +-
 .../dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi    |  10 +-
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |  10 +-
 arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts    |   4 +-
 arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts    |   4 +-
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       |   2 +-
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |   2 +-
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |   6 +-
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |   6 +-
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |   6 +-
 arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        |   4 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |   8 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |   2 +-
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts      |   2 +-
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |   2 +-
 arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts |   4 +-
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts        |   6 +-
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |  14 +-
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts       |   6 +-
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts        |   8 +-
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |  10 +-
 arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts  |   6 +-
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |   8 +-
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |   6 +-
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |   6 +-
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts      |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |   4 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |   2 +-
 arch/arm/boot/dts/bcm47094-netgear-r8500.dts       |   8 +-
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts          |   2 +-
 arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts      |   2 +-
 arch/arm/boot/dts/bcm47189-luxul-xap-810.dts       |   2 +-
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts           |   6 +-
 arch/arm/boot/dts/bcm47622.dtsi                    |  14 +-
 arch/arm/boot/dts/bcm53015-meraki-mr26.dts         | 166 +++++++++++++++++++++
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         |   4 +-
 arch/arm/boot/dts/bcm5301x.dtsi                    |   6 +-
 arch/arm/boot/dts/bcm63138.dtsi                    |   4 +-
 arch/arm/boot/dts/bcm63148.dtsi                    | 103 +++++++++++++
 arch/arm/boot/dts/bcm63178.dtsi                    | 118 +++++++++++++++
 arch/arm/boot/dts/bcm6756.dtsi                     | 130 ++++++++++++++++
 arch/arm/boot/dts/bcm6846.dtsi                     | 103 +++++++++++++
 arch/arm/boot/dts/bcm6855.dtsi                     | 120 +++++++++++++++
 arch/arm/boot/dts/bcm6878.dtsi                     | 110 ++++++++++++++
 arch/arm/boot/dts/bcm911360_entphn.dts             |   4 +-
 arch/arm/boot/dts/bcm947189acdbmr.dts              |   4 +-
 arch/arm/boot/dts/bcm953012er.dts                  |   4 +-
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi      |   2 +-
 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi    |   2 +-
 arch/arm/boot/dts/bcm963138.dts                    |  27 ++++
 arch/arm/boot/dts/bcm963138dvt.dts                 |   2 +-
 arch/arm/boot/dts/bcm963148.dts                    |  30 ++++
 arch/arm/boot/dts/bcm963178.dts                    |  30 ++++
 arch/arm/boot/dts/bcm96756.dts                     |  30 ++++
 arch/arm/boot/dts/bcm96846.dts                     |  30 ++++
 arch/arm/boot/dts/bcm96855.dts                     |  30 ++++
 arch/arm/boot/dts/bcm96878.dts                     |  30 ++++
 71 files changed, 1389 insertions(+), 183 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
 create mode 100644 arch/arm/boot/dts/bcm53015-meraki-mr26.dts
 create mode 100644 arch/arm/boot/dts/bcm63148.dtsi
 create mode 100644 arch/arm/boot/dts/bcm63178.dtsi
 create mode 100644 arch/arm/boot/dts/bcm6756.dtsi
 create mode 100644 arch/arm/boot/dts/bcm6846.dtsi
 create mode 100644 arch/arm/boot/dts/bcm6855.dtsi
 create mode 100644 arch/arm/boot/dts/bcm6878.dtsi
 create mode 100644 arch/arm/boot/dts/bcm963138.dts
 create mode 100644 arch/arm/boot/dts/bcm963148.dts
 create mode 100644 arch/arm/boot/dts/bcm963178.dts
 create mode 100644 arch/arm/boot/dts/bcm96756.dts
 create mode 100644 arch/arm/boot/dts/bcm96846.dts
 create mode 100644 arch/arm/boot/dts/bcm96855.dts
 create mode 100644 arch/arm/boot/dts/bcm96878.dts
