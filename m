Return-Path: <SRS0=4HkZ=LE=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59D8C48BD1
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 19:48:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 864CD61407; Thu, 10 Jun 2021 19:48:41 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5435D61285;
	Thu, 10 Jun 2021 19:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5435D61285
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f181.google.com with SMTP id y11so578749pgp.11;
        Thu, 10 Jun 2021 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mnph4Dx4RXHwHENdmAbTDS+uczh1pJUrhJLW+yFWyEc=;
        b=iX21xkxUjg0O8jLyrl0bo2cBzND9Zhuw3fGH9qfjmOXEm9BCsha5bbr3cyPcgurzqD
         ZePQDJ3x9RL5EhYYU2w7gjhqS7BDDLOM6UpsvUIAzcdiZRLVs0qq5ZezzDVnJ2gIoUrh
         b0HREC3pVzzDsIwPwWQyOI4aHju1G3rF4ErZVeaxLJBnatc2bg7t6YWCvVprsHQVhmmk
         rIcatoBRH7LNGKl6XXBlE+ujOkPeddsYCpS6ltY0T6k9GE4egMWCkMaCe0pG7zPR5Sxj
         dpRhcfr5Akxp+XL7ibgKloUrDz/XBB4g/Wh9OQ/AZ/ppaN9HzH/JhUViZi3enDOYMM8Q
         fhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mnph4Dx4RXHwHENdmAbTDS+uczh1pJUrhJLW+yFWyEc=;
        b=O0pPkjXVIn994keAJLFVwvhC7G0rxIewUgWkDZZUZdAN8sjiGfMn3RpStGAUugoGoO
         Nc5OXaiOS7XluJ+R3EQJ6adiqeLDMybHOiudBhVIRxhYdvPpXGjP/2Rruf3SaWJZYe3Q
         BhmASql2amYg3W1h+MK9pi7pp78ehvavCZz3YGNuNwFuysVPnjyTZ1VVjKbOGAb57Wgw
         mSFaeeALMW9mRhmfU7M8heLMsqEohXqVq9hObROm0ErNbLhPxTbeJbnlBAPdra9t9GaQ
         mHw9yzm5T1osRNXhYAJ+RrPlsvfKvCzhaMpD1ER2tAMDgOAWVVTCigMSFGNmABkhDrPE
         nLrA==
X-Gm-Message-State: AOAM532gCkx/HWOlpAm2RTLlelYGiXdB7oEJRMLTacaMLKnpDECtMtMZ
	RuWE3FtxZs0tiTmrllgqjYKx8QHGd/U=
X-Google-Smtp-Source: ABdhPJzRuyvf5av4f9lSwGRQMruHcBpRpqEvywR9zNpH78inMMvGmiu2McT8AHH/uovwtO8k5Sm4EA==
X-Received: by 2002:a62:4e86:0:b029:2ea:25ce:b946 with SMTP id c128-20020a624e860000b02902ea25ceb946mr4657676pfb.30.1623354520400;
        Thu, 10 Jun 2021 12:48:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id oc10sm3118297pjb.44.2021.06.10.12.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 12:48:39 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 5.14
Date: Thu, 10 Jun 2021 12:48:34 -0700
Message-Id: <20210610194836.309869-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.14/devicetree

for you to fetch changes up to 3a3907c4cb66e08dba11766b806b3a974385ed30:

  Merge tag 'tags/bcm2835-dt-next-2021-06-08-v2' into devicetree/next (2021-06-09 12:04:28 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 5.14, please pull the following:

- Rafal updates the BCM5301x, HR2, BCM63xx, BCM5301x, NSP and Cygnus DTS
  files to resolve a number of DT binding check warnings pertaining to
  NAND, pinmux, clocks, SPI

- Stefan provides a fix for an increase in the DWC2 controller's RX FIFO
  causing regressions on the Raspberry Pi 4B

- Mateusz adds a BCM2711 specific VEC compatible string to allow keying
  off that variant properly

- Stefan adds support for the Raspberry Pi 400 by doing some DTS/DTSI
  re-organization work and finally adding the DTS file proper

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/bcm2835-dt-next-2021-06-08-v2' into devicetree/next

Mateusz Kwiatkowski (1):
      ARM: boot: dts: bcm2711: Add BCM2711 VEC compatible

Rafał Miłecki (9):
      ARM: dts: BCM5301X: Fix NAND nodes names
      ARM: brcmstb: dts: fix NAND nodes names
      ARM: Cygnus: dts: fix NAND nodes names
      ARM: NSP: dts: fix NAND nodes names
      ARM: dts: BCM63xx: Fix NAND nodes names
      ARM: dts: Hurricane 2: Fix NAND nodes names
      ARM: dts: BCM5301X: Fix pinmux subnodes names
      dt-bindings: clock: brcm, iproc-clocks: convert to the json-schema
      ARM: dts: BCM5301X: Fixup SPI binding

Stefan Wahren (7):
      Revert "ARM: dts: bcm283x: increase dwc2's RX FIFO size"
      ARM: dts: bcm283x: Fix up MMC node names
      ARM: dts: Move BCM2711 RPi specific into separate dtsi
      dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to DT schema
      ARM: dts: bcm283x: Fix up GPIO LED node names
      ARM: dts: Add Raspberry Pi 400 support
      arm64: dts: broadcom: Add reference to RPi 400

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   1 +
 .../bindings/clock/brcm,iproc-clocks.txt           | 313 ----------------
 .../bindings/clock/brcm,iproc-clocks.yaml          | 395 +++++++++++++++++++++
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   2 +-
 arch/arm/boot/dts/bcm-hr2.dtsi                     |   2 +-
 arch/arm/boot/dts/bcm-nsp.dtsi                     |   2 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |  85 +----
 arch/arm/boot/dts/bcm2711-rpi-400.dts              |  45 +++
 arch/arm/boot/dts/bcm2711-rpi.dtsi                 |  74 ++++
 arch/arm/boot/dts/bcm2711.dtsi                     |   3 +-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |   4 +-
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |   2 +-
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |   4 +-
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |   2 +-
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |   2 +-
 arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi             |   2 +-
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |   2 +-
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |   2 +-
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   2 +-
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |   4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts         |   4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         |   4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |   2 +-
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi             |   2 +-
 arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi         |   2 +-
 arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi  |   2 +-
 arch/arm/boot/dts/bcm283x.dtsi                     |   2 +-
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |   4 +-
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |   4 +-
 arch/arm/boot/dts/bcm47094.dtsi                    |   2 +-
 arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi           |   4 +-
 arch/arm/boot/dts/bcm5301x.dtsi                    |  26 +-
 arch/arm/boot/dts/bcm63138.dtsi                    |   2 +-
 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts         |   4 +-
 arch/arm/boot/dts/bcm7445.dtsi                     |   2 +-
 arch/arm/boot/dts/bcm911360_entphn.dts             |   4 +-
 arch/arm/boot/dts/bcm953012k.dts                   |   4 +-
 arch/arm/boot/dts/bcm958300k.dts                   |   4 +-
 arch/arm/boot/dts/bcm958305k.dts                   |   4 +-
 arch/arm/boot/dts/bcm958522er.dts                  |   4 +-
 arch/arm/boot/dts/bcm958525er.dts                  |   4 +-
 arch/arm/boot/dts/bcm958525xmc.dts                 |   4 +-
 arch/arm/boot/dts/bcm958622hr.dts                  |   4 +-
 arch/arm/boot/dts/bcm958623hr.dts                  |   4 +-
 arch/arm/boot/dts/bcm958625hr.dts                  |   4 +-
 arch/arm/boot/dts/bcm958625k.dts                   |   4 +-
 arch/arm/boot/dts/bcm963138dvt.dts                 |   4 +-
 arch/arm/boot/dts/bcm988312hr.dts                  |   4 +-
 arch/arm64/boot/dts/broadcom/Makefile              |   3 +-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts   |   2 +
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  |   2 +-
 52 files changed, 610 insertions(+), 464 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-400.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts
