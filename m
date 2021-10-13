Return-Path: <SRS0=qGb1=PB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644B6C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 17:40:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3925C61151; Wed, 13 Oct 2021 17:40:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC7B600D3;
	Wed, 13 Oct 2021 17:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AC7B600D3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id c29so3144617pfp.2;
        Wed, 13 Oct 2021 10:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vf/DRQn3ztUjDfKpKGRqb5Y0TxJSVc90uZuxdy9B52c=;
        b=NjNuLmBXlAbeGGOLDONuR5SQro7yeNy0YBg/8fx4XKHc8ZWzFNfZRJcVYTsF+tLUQ1
         RSFP41/4ThXQh1gB60PIsAUCGB8A8k4wwCkSmNnHpWjIVZtrxSea5iMYr9BSO9R70Y+7
         WGrv77w8zYOcJh6dpjiRzAKfY/05p1I0pg8IQEf2o2quWGQgXh4lVCQt+DTFiJcsEgiI
         OOfs5mYEnxphlZoJSFIGHQ8QbcQTo8PDuftJ585Wnw2H+D8nIDQ0zwJIfYPJHhp98nm6
         ilxWpZXLv4WlWbCNhLFnCWNugkgswm7ZZMqMDzXadrtBhvDNz72ST4eo4Rn2YbC/53ou
         Mykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vf/DRQn3ztUjDfKpKGRqb5Y0TxJSVc90uZuxdy9B52c=;
        b=3J1sszzWGUKBg5pV0pZCLYbt3FXikJCBLlB3RGhUtHA/hsnmRGGC2aAk+VNsZviL0T
         zc85QoSobebCibOmNxb2hemZEKzhNy8y6XmDFPA1/F1pjKqNxBEeNkSLCq+TYEqM5HP/
         cyKGfbZwXvJD1T20vPOm7TECHYC9nG1Yuwht+72OvKI5w0jV7eoCckbIiwOME4RhhMqw
         lkeP5D2u4M9Mm3AujrCxilk0Uit0PqPoWhg/pcoqF1hd0wwMKA2npLipDMUNNIb4rjVN
         O0o6anwMk7gD2lfVGufSpFqrlzv9t512aEV4+G/5ommR9y0zeTOqjHte6UW5wyxaYXN3
         A5kg==
X-Gm-Message-State: AOAM530UQ50UFCgEre8Iykbpli+Af9OwR8mJjoLBrjQGVwQAROKWA0LW
	JcG7W6ooS8Hg1YUniesqnu3UCMEazp0=
X-Google-Smtp-Source: ABdhPJxtsO4ZfcWAyEdpuMhWhVPm+9VqnpSbfQEGCCuu7fZF0jECgehBBvoCQbmrUs962wNqULapuQ==
X-Received: by 2002:a63:fb18:: with SMTP id o24mr449361pgh.8.1634146820914;
        Wed, 13 Oct 2021 10:40:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e15sm133794pfc.134.2021.10.13.10.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 10:40:19 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Christian Lamparter <chunkeey@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 5.16
Date: Wed, 13 Oct 2021 10:40:14 -0700
Message-Id: <20211013174016.831348-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree

for you to fetch changes up to 0f937bc2f2ab48f5ef494d86225ef952198b2240:

  Merge tag 'tags/bcm2835-dt-next-2021-10-06' into devicetree/next (2021-10-08 15:29:25 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 5.16, please pull the following:

- Matthew provides a set of updates to the Northstar Plus Device Tree
files to fix a number of warnings, and prepare the files to support the
addition of the Cisco Meraki MX64/MX65 wireless controller devices and
finally adds support for those boards.

- Rafal continues to provide updates to the BCM5301X Device Tree files
in order to fix warnings with the various node names, MDIO muxes and
memory nodes. He also adds support for the external switches on the
BCM53573 SoC and adds Tenda AC9 switch ports.

- Christian provides the description of the Ethernet switch ports for
the Cisco Meraki MR32 based on the 53016 SoC

- Arinc adds support for the Asus RT-AC88U device based on the BCM4709
and featuring 8 Ethernet ports over the integrated and the external
Realtek switch (not supported yet)

- Stefan adds support for the Raspberry Pi Compute Module 4 IO board and
does a number of preparatory changes to get there to the Device Tree
files before doing the actual addition

----------------------------------------------------------------
Arınç ÜNAL (1):
      ARM: dts: BCM5301X: Add DT for Asus RT-AC88U

Christian Lamparter (2):
      ARM: BCM53016: Specify switch ports for Meraki MR32
      ARM: BCM53016: MR32: get mac-address from nvmem

Florian Fainelli (1):
      Merge tag 'tags/bcm2835-dt-next-2021-10-06' into devicetree/next

Matthew Hagan (16):
      ARM: dts: NSP: add device names to compatible
      dt-bindings: arm: bcm: add NSP devices to SoCs
      ARM: dts: NSP: enable DMA on bcm988312hr
      ARM: dts: NSP: disable qspi node by default
      ARM: dts: NSP: add MDIO bus controller node
      ARM: dts: NSP: Move USB3 PHY to internal MDIO bus
      dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
      ARM: dts: NSP: Add common bindings for MX64/MX65
      ARM: dts: NSP: Add Ax stepping modifications
      ARM: dts: NSP: Add DT files for Meraki MX64 series
      ARM: dts: NSP: Add DT files for Meraki MX65 series
      ARM: dts: NSP: Add bcm958623hr board name to dts
      ARM: dts: NSP: Fix mpcore, mmc node names
      ARM: dts: NSP: Fix MDIO mux node names
      ARM: dts: NSP: Fix MX64/MX65 eeprom node name
      ARM: dts: NSP: Fix MX65 MDIO mux warnings

Rafał Miłecki (6):
      ARM: dts: BCM5301X: Fix nodes names
      ARM: dts: BCM5301X: Fix MDIO mux binding
      ARM: dts: BCM5301X: Fix memory nodes names
      ARM: dts: BCM5301X: Specify switch ports for more devices
      ARM: dts: BCM53573: Describe on-SoC BCM53125 rev 4 switch
      ARM: dts: BCM53573: Add Tenda AC9 switch ports

Stefan Wahren (6):
      dt-bindings: display: bcm2835: add optional property power-domains
      ARM: dts: bcm283x-rpi: Move Wifi/BT into separate dtsi
      dt-bindings: arm: bcm2835: Add Raspberry Pi Compute Module 4
      ARM: dts: Add Raspberry Pi Compute Module 4
      ARM: dts: Add Raspberry Pi Compute Module 4 IO Board
      arm64: dts: broadcom: Add reference to RPi CM4 IO Board

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   1 +
 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml      |  65 ++++-
 .../bindings/display/brcm,bcm2835-dsi0.yaml        |   3 +
 .../bindings/display/brcm,bcm2835-hdmi.yaml        |   3 +
 .../bindings/display/brcm,bcm2835-v3d.yaml         |   3 +
 .../bindings/display/brcm,bcm2835-vec.yaml         |   3 +
 arch/arm/boot/dts/Makefile                         |   8 +
 arch/arm/boot/dts/bcm-nsp-ax.dtsi                  |  70 +++++
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  52 +++-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |  38 +--
 arch/arm/boot/dts/bcm2711-rpi-cm4-io.dts           | 138 ++++++++++
 arch/arm/boot/dts/bcm2711-rpi-cm4.dtsi             | 113 +++++++++
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |  31 +--
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts         |  36 +--
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         |  36 +--
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |  36 +--
 arch/arm/boot/dts/bcm283x-rpi-wifi-bt.dtsi         |  34 +++
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |  39 ++-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |  37 +++
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts        |   2 +-
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |   2 +-
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts       |   2 +-
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts        |   2 +-
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |  44 +++-
 arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts  |   2 +-
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       | 200 +++++++++++++++
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  42 +++
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |  37 +++
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |  37 +++
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |   2 +-
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts           |  37 +++
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         |  35 ++-
 arch/arm/boot/dts/bcm5301x.dtsi                    |  10 +-
 arch/arm/boot/dts/bcm53573.dtsi                    |  18 ++
 arch/arm/boot/dts/bcm94708.dts                     |   2 +-
 arch/arm/boot/dts/bcm94709.dts                     |   2 +-
 arch/arm/boot/dts/bcm958522er.dts                  |   3 +-
 arch/arm/boot/dts/bcm958525er.dts                  |   3 +-
 arch/arm/boot/dts/bcm958525xmc.dts                 |   3 +-
 arch/arm/boot/dts/bcm958622hr.dts                  |   3 +-
 arch/arm/boot/dts/bcm958623hr.dts                  |   3 +-
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi      | 281 +++++++++++++++++++++
 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi    | 163 ++++++++++++
 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts     |  25 ++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts        |  24 ++
 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts    |  33 +++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts       |  32 +++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts        |  24 ++
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts       |  32 +++
 .../arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi | 129 ++++++++++
 arch/arm/boot/dts/bcm958625hr.dts                  |   3 +-
 arch/arm/boot/dts/bcm958625k.dts                   |   3 +-
 arch/arm/boot/dts/bcm988312hr.dts                  |   7 +-
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 .../arm64/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts |   2 +
 56 files changed, 1816 insertions(+), 182 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm-nsp-ax.dtsi
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-cm4-io.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-cm4.dtsi
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-wifi-bt.dtsi
 create mode 100644 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
