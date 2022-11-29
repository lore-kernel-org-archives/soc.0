Return-Path: <SRS0=wi9A=35=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33304C4332F
	for <soc@archiver.kernel.org>; Tue, 29 Nov 2022 19:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA336C433D6; Tue, 29 Nov 2022 19:18:02 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5BE6C433C1;
	Tue, 29 Nov 2022 19:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5BE6C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id z1so10563251qkl.9;
        Tue, 29 Nov 2022 11:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2vesdglbvJEeLI+inlDR4IuAYaWDjloDZsVUrN08wo=;
        b=RW1c/lilozhQV7O5BwLLnj31i2wZ7Is3ip6egucoQ+IrBtzQGxZHUAIb+JagkYQbKk
         NLZNu/XMu4EC/FHREAhebobzYUjhzDasmhC9zPBmg841jMpwD8Du5dLUofKMcm0z0hBg
         QwkAtMZELG9X7VjOMmltPLWaeCcZcFMcyXr3ZPfDHlnagMeDLSjgtQa0LrrvLbYdex3F
         FaKZpp8hFvj/D3ZavzZZkZNSROBVjQY+aHt1aucgnOdOZjaP4x04ZuQgKrcjDvPiNl4I
         zHKZCuVmugZWwpEtiqA1oor2MwXmFX/0qXs4KmlgNi0WUW2Kha/Sq0ECTI2HtM+tYh5T
         NCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2vesdglbvJEeLI+inlDR4IuAYaWDjloDZsVUrN08wo=;
        b=vEk3A9h94pRrhyQ3c6CKU7DjsI6WM8s9Pwqb508zTDgO90FFT8omhKb99vXPtGy3ux
         nSo4uWEaEzVWJM40uQnpz8+OuMewfIVRrgt8lTgEJLYUqpl41zXKJK7eLyi0NLCkSh7P
         bQwUoSgs8CUXcJquCTP4ywaVmLm1Zhvk2Tc+5rJ9G01UTegNNYnaAcz2srfaUMS2STnG
         PmF4WhY30fpfLk1tdeOjEoEHg57Bo56HK9wIR0NRERMOmlh+9sxtK/43ij6kc+hoEM+i
         PqlpzYitQ8jqqK/ZHetPxfmBmpNBmMPD0o05ZKVnKUT4yMBDBxdLPj1wx94mdheLPzfx
         /qmg==
X-Gm-Message-State: ANoB5pkc4BRoEkQG80mIUoYy+YedWuTcgbJ8QsroIOjEqD/JkLm3wzSZ
	wzjYboBO2rnnS4yb+2CAks/oq5IW9og=
X-Google-Smtp-Source: AA0mqf5ullhLlQYahRhPEhjrpTYqeZIzIfSjaN2bfVdls1/O0QVna4EkY70I9QZ4uRe5Ru4olEfW/w==
X-Received: by 2002:a05:620a:f88:b0:6fc:90e1:85ab with SMTP id b8-20020a05620a0f8800b006fc90e185abmr2938202qkn.345.1669749479992;
        Tue, 29 Nov 2022 11:17:59 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y18-20020a05620a25d200b006eeb3165565sm11230709qko.80.2022.11.29.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 11:17:59 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Alexander Dahl <ada@thorsis.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <maxime@cerno.tech>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 6.2
Date: Tue, 29 Nov 2022 11:17:53 -0800
Message-Id: <20221129191755.542584-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.2/devicetree

for you to fetch changes up to b23024676a2f135dbde2221481e2f4af616d0445:

  arm: dts: Update cache properties for broadcom (2022-11-28 15:37:14 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 6.2, please pull the following:

- Linus adds support for the D-Link DWL-8610AP which is based upon the
  BCM53016 SoC and the D-Link DIR-890L routers

- Maxime resolves a long standing issue affecting Raspberry Pi devices
  by switching entirely over to the VPU firmware clock provider rather
  than mixing the "bare metal" clock driver and VPU

- Rafal corrects the description of the TP-Link router partitions to
  use the "safeloader" partition parser

- Stefan fixes a number of invalid underscores in the bcm283x DTS files
  and also moves the ACT LED into a separate DTS include file for better
  re-use

- Krzysztof aligns the LEDs DT nodes to the proper schema format

- Pierre adds missing cache properties to various SoCs

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: broadcom: align LED node names with dtschema

Linus Walleij (4):
      dt-bindings: ARM: add bindings for the D-Link DWL-8610AP
      ARM: dts: bcm53016: Add devicetree for D-Link DWL-8610AP
      dt-bindings: ARM: add bindings for the D-Link DIR-890L
      ARM: dts: bcm47094: Add devicetree for D-Link DIR-890L

Maxime Ripard (2):
      ARM: dts: bcm283x: Remove bcm2835-rpi-common.dtsi from SoC DTSI
      ARM: dts: bcm2835-rpi: Use firmware clocks for display

Pierre Gondois (1):
      arm: dts: Update cache properties for broadcom

Rafał Miłecki (1):
      ARM: dts: BCM5301X: Correct description of TP-Link partitions

Stefan Wahren (2):
      ARM: dts: bcm283x: Fix underscores in node names
      ARM: dts: bcm283x: Move ACT LED into separate dtsi

 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |   2 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |  31 +--
 arch/arm/boot/dts/bcm2711-rpi-400.dts              |  16 +-
 arch/arm/boot/dts/bcm2711-rpi-cm4-io.dts           |  27 +--
 arch/arm/boot/dts/bcm2711-rpi-cm4.dtsi             |   4 +-
 arch/arm/boot/dts/bcm2711.dtsi                     |  95 +++++-----
 arch/arm/boot/dts/bcm2835-common.dtsi              |  18 +-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |  28 +--
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |  12 +-
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |  28 +--
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |  12 +-
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |  12 +-
 arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi             |   6 +
 arch/arm/boot/dts/bcm2835-rpi-common.dtsi          |  17 ++
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |  12 +-
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |  12 +-
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |  10 -
 arch/arm/boot/dts/bcm2835.dtsi                     |   1 -
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |  27 +--
 arch/arm/boot/dts/bcm2836-rpi.dtsi                 |   1 +
 arch/arm/boot/dts/bcm2836.dtsi                     |   4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts         |  27 +--
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         |  27 +--
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |  11 +-
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi             |   8 -
 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts         |  11 +-
 arch/arm/boot/dts/bcm2837.dtsi                     |   2 +-
 arch/arm/boot/dts/bcm283x-rpi-led-deprecated.dtsi  |  18 ++
 arch/arm/boot/dts/bcm283x.dtsi                     |  70 +++----
 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        |  15 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        |   8 +-
 .../dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi    |  16 +-
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |  16 +-
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       |   6 +-
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |   2 +-
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |  10 +-
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |  10 +-
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |  22 +--
 arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        |  10 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |  14 +-
 arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |  16 +-
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts      |   6 +-
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |  20 +-
 arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts |  43 ++---
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts        |   6 +-
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |  18 +-
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts        |  16 +-
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |  22 +--
 arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dts  |  43 ++---
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts       |  12 +-
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  14 +-
 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts      | 211 +++++++++++++++++++++
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |  28 +--
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |   4 +-
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts      |   6 +-
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |   4 +-
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |  20 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |  10 +-
 arch/arm/boot/dts/bcm47094-netgear-r8500.dts       |  14 +-
 arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts      |   4 +-
 arch/arm/boot/dts/bcm47189-luxul-xap-810.dts       |  10 +-
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts           |  14 +-
 arch/arm/boot/dts/bcm47622.dtsi                    |   1 +
 arch/arm/boot/dts/bcm53016-dlink-dwl-8610ap.dts    | 131 +++++++++++++
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts         |   6 +-
 arch/arm/boot/dts/bcm63148.dtsi                    |   1 +
 arch/arm/boot/dts/bcm63178.dtsi                    |   1 +
 arch/arm/boot/dts/bcm6756.dtsi                     |   1 +
 arch/arm/boot/dts/bcm6846.dtsi                     |   1 +
 arch/arm/boot/dts/bcm6855.dtsi                     |   1 +
 arch/arm/boot/dts/bcm6878.dtsi                     |   1 +
 arch/arm/boot/dts/bcm947189acdbmr.dts              |   6 +-
 74 files changed, 863 insertions(+), 510 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-led-deprecated.dtsi
 create mode 100644 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts
 create mode 100644 arch/arm/boot/dts/bcm53016-dlink-dwl-8610ap.dts
