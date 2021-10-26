Return-Path: <SRS0=GGsf=PO=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A82C433F5
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 13:58:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41C6461039; Tue, 26 Oct 2021 13:58:57 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2698060D07
	for <soc@kernel.org>; Tue, 26 Oct 2021 13:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2698060D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-oi1-f181.google.com with SMTP id o83so20708413oif.4
        for <soc@kernel.org>; Tue, 26 Oct 2021 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kWZgU+JuFT3e4VWZdwEk4RH2Do7tIF1ny74QqfwM6aU=;
        b=KAwpsckzrPqR2p3Fay61wYUUmQLZeij2KfPAzODLuvDQ2eI7ngke2Dop47vPxBgvjd
         1Dsn3Xs/RD50SVa8USAffsz6kEJrf8AgKbSlrMnW3usb7ZAfU3IgxMW0MPb3rUZ0o+30
         /5U+WMnuiB5ZcuBe2dGv44HpcRC6OR+4EI4YP8mOwi/XUWXetoPTAF3RgL9KPOIZMgcE
         zYRO60E2Nrrd3Zvbzpe2pdNieS6x0TJ5B9KTOX3SfOmK0F+7tycdXPhBZGAVKYivCLth
         HcUC2+waDM6UtS7AqM2RDxm6SM+6I3AwLHBa9qrjfr3duc50gzslbuXS6Hkhp5fMKJoi
         Y7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kWZgU+JuFT3e4VWZdwEk4RH2Do7tIF1ny74QqfwM6aU=;
        b=CjPGEYX3FWNYibdxyQQSnvpgr0rYlG6sMlXp2SneUoDbmaj0VMPS2c1CTwHcrwCWQE
         J7zSyENnI26Q02kUHFKaf89tWG7rtUXK9UkxwVCTlrHLidhgbvJrW1/nqew8uVFxzQpb
         ud9T9xQJgY2UJV2N48UoXtHVnDTgy7rLZRZK4dqUS2+n5h3rclE3qZccVivZLMhlxlqH
         04xkZkgbhIUfy3DzyKZB372XSd7aqawAwu/jwyZaIXB1q0uhf4a4pNTowlOmZK+59ttP
         +BMEazViMvim53XV8p8NXGYRx1xE5sh5l7Wv8dij6yWpyIioUZDrQAl81pb24tZgF2Bs
         BK3w==
X-Gm-Message-State: AOAM531eic0qWya6RwC7KkulHmC5HRWEP0Yd63TmgQw/QQzLRKxmmFNo
	4F0HBtKsIx16Ev+ErmfAyR4A2x55Y3wsJLi7
X-Google-Smtp-Source: ABdhPJy3FKvJLwrDzsDU+3QarCP0LjFyaQTBLcEwMBLFMZsd4/60SkIbgQorpAXlob7bcwwS51/Lvg==
X-Received: by 2002:a54:4f8f:: with SMTP id g15mr17378805oiy.169.1635256736390;
        Tue, 26 Oct 2021 06:58:56 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id t5sm4607363oic.4.2021.10.26.06.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 06:58:55 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	Luca Weiss <luca@z3ntu.xyz>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm DTS more changes for v5.16
Date: Tue, 26 Oct 2021 08:58:54 -0500
Message-Id: <20211026135855.1205262-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9304af37d07b63244e4b3c80e5a245c978beb015:

  dt-bindings: arm: qcom, add missing devices (2021-09-19 23:33:06 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.16-2

for you to fetch changes up to 036e6c9f0336f50532ad6bedfaebf01856168a1d:

  ARM: dts: qcom: fix typo in IPQ8064 thermal-sensor node (2021-10-24 18:45:29 -0500)

----------------------------------------------------------------
Qualcomm DTS more changes for v5.16

The multi-purpose-pin (MPP) driver is finally migrated to use
hierarchical IRQ domains, so this bring the associated changes.

The remainder of the changes are correcting binding issues, primarily
found through DT validation.

----------------------------------------------------------------
David Heidelberg (9):
      ARM: dts: qcom: mdm9615: fix memory node for Sierra Wireless WP8548
      dt-bindings: arm: qcom-ipq4019: add missing device compatible
      ARM: dts: ipq4019-ap.dk01.1-c1: add device compatible in the dts
      dt-bindings: arm: qcom: Fix Nexus 4 vendor prefix
      ARM: dts: qcom: fix memory and mdio nodes naming for RB3011
      ARM: dts: qcom: correct mmc node naming
      ARM: dts: qcom: fix flash node naming for RB3011
      ARM: dts: qcom: fix thermal zones naming
      ARM: dts: qcom: fix typo in IPQ8064 thermal-sensor node

Dmitry Baryshkov (14):
      ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
      ARM: dts: qcom-apq8064: add gpio-ranges to mpps nodes
      ARM: dts: qcom-msm8660: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pm8841: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pm8941: add gpio-ranges to mpps nodes
      ARM: dts: qcom-pma8084: add gpio-ranges to mpps nodes
      ARM: dts: qcom-mdm9615: add gpio-ranges to mpps node, fix its name
      ARM: dts: qcom-apq8060-dragonboard: fix mpps state names
      ARM: dts: qcom-apq8064: add interrupt controller properties
      ARM: dts: qcom-mdm9615: add interrupt controller properties
      ARM: dts: qcom-msm8660: add interrupt controller properties
      ARM: dts: qcom-pm8841: add interrupt controller properties
      ARM: dts: qcom-pm8941: add interrupt controller properties
      ARM: dts: qcom-pma8084: add interrupt controller properties

Luca Weiss (2):
      dt-bindings: arm: qcom: rename vendor of apq8026-lenok
      ARM: dts: qcom: apq8026-lg-lenok: rename board vendor

Shawn Guo (1):
      ARM: dts: qcom: sdx55: Drop '#clock-cells' from QMP PHY node

 Documentation/devicetree/bindings/arm/qcom.yaml    |  5 ++-
 arch/arm/boot/dts/Makefile                         |  2 +-
 ...026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} |  2 +-
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     | 10 ++---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |  2 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |  6 +--
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |  6 +--
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts |  4 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 45 ++++++++--------------
 arch/arm/boot/dts/qcom-apq8084.dtsi                |  8 ++--
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dts    |  2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi      |  1 -
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts          |  8 ++--
 arch/arm/boot/dts/qcom-ipq8064.dtsi                | 26 ++++++-------
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |  2 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                | 16 +++-----
 arch/arm/boot/dts/qcom-msm8660-surf.dts            |  4 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi                | 27 ++++---------
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             |  4 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi                |  4 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 12 +++---
 arch/arm/boot/dts/qcom-pm8841.dtsi                 |  7 ++--
 arch/arm/boot/dts/qcom-pm8941.dtsi                 | 11 ++----
 arch/arm/boot/dts/qcom-pma8084.dtsi                | 11 ++----
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  1 -
 25 files changed, 94 insertions(+), 132 deletions(-)
 rename arch/arm/boot/dts/{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} (99%)
