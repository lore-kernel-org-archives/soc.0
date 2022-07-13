Return-Path: <SRS0=fa5v=XS=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FBDC43334
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 03:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EBCFC3411E; Wed, 13 Jul 2022 03:20:32 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF4CFC341C8
	for <soc@kernel.org>; Wed, 13 Jul 2022 03:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF4CFC341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id n206so4048837oia.6
        for <soc@kernel.org>; Tue, 12 Jul 2022 20:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tuX00UNEnkoMhbb92fIr1Y1+kfdnX/DuneoPIzC+JyU=;
        b=y38M8nIsfZG+U6NyuzgeEp5f+HRe/nlBpcRr3X7KvGht1lXtg7sytnewJCPjY31dF8
         t6W18ONPkPEx7j9K1sXrKLUzwRFYajbx64v/Sgk5TdgRg7iLBIWX3mXS5aQtp3XcZcc5
         sL3Cr46epPJBkwunbkAcAsHCuKRqvMmBWJGCPtPRfqNWW+sKZ4VrqGMVy0AjTKSsnxiw
         APLTipgOeY6maFw4GGw43wcLlv9qjkSKxON7Y/RV12KUVGiZe02bqXrFvo/Ompo+zPmK
         PXarmCX8moC15fhMFHRP3lGdsdrhP6mNKmAlYrWChQYC2/2kbHTWmWZeW2qyT12MgE1N
         rU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tuX00UNEnkoMhbb92fIr1Y1+kfdnX/DuneoPIzC+JyU=;
        b=p7bkFccSfPFA6Zs1LllWjGdPWuz/0D3iHNDlG5GutCWTKYA3HUuBy/cocQVkGLN6na
         NfrohdPRN+3InRa4Xko3ypeQ3WbxZmMFXmhIvqqlc+YzSTQZxNdAnSVaLNAfYRpiBM3O
         WxY5DdVqrBtkfGoPoyLB6kxdyuPQONgzJQPIbofzMoXIFceFsUS1szQ3k6ZEGTos8gvs
         1Ck2kih7ngqvl4Kjwx3sw8uhtSbj+BRy+SriNMtwt+ldTK/izOMZx1/yykJMN4nEP+A6
         GvoNQ1+RoQ7uzewfpH/ZUFHODOz7adznIYQgUJBP/q+M16lEycAf6nU/cODE/xVA6tmX
         FLJA==
X-Gm-Message-State: AJIora8gwBz/EGsrp5R/4ckB4vbmoNE+R83br13wD+JJc8mP/AhzQHWn
	IT/3O2XBRreIf4hMKm3dnOz5Iw==
X-Google-Smtp-Source: AGRyM1t2QoyVc+P+8edpBSuAeW6KDe349ti674WDN+u8iV/id5+dksryPF1b5u3rGz5mT2ZdFWt5lQ==
X-Received: by 2002:a54:4105:0:b0:2ef:3f6a:5a1e with SMTP id l5-20020a544105000000b002ef3f6a5a1emr179414oic.296.1657682425799;
        Tue, 12 Jul 2022 20:20:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r17-20020a4ae5d1000000b0043540f7701esm3246829oov.31.2022.07.12.20.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 20:20:25 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Kaushal Kumar <quic_kaushalk@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Ansuel Smith <ansuelsmth@gmail.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] Qualcomm DTS updates for v5.20
Date: Tue, 12 Jul 2022 22:20:24 -0500
Message-Id: <20220713032024.1372427-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.20

for you to fetch changes up to 864cfdeb76735909a9afcc314416ccaa1ce82a1a:

  ARM: dts: qcom: msm8974: rename GPU's OPP table node (2022-07-06 16:04:22 -0500)

----------------------------------------------------------------
Qualcomm DTS updates for v5.20

This adds USB, NAND, QPIC BAM, CPUfreq, remoteprocs, SMEM, SCM,
watchdog, interconnect providers to the SDX65 5G modem platform and
enables relevant devices for the MTP.

The BAM DMUX interface used to exchange Ethernet/IP data with the modem
is described on the MSM8974 platform.

It fixes up the PXO supply clock to L2CC on IPQ6084, as the platform is
transitioned away from global clock lookup.

SDX55 has it's debug UART interrupt level corrected.

Lastly it contains a wide variety of fixes for DeviceTree validation
issues across most of the platforms.

----------------------------------------------------------------
Ansuel Smith (1):
      ARM: dts: qcom: replace gcc PXO with pxo_board fixed clock

Bhupesh Sharma (1):
      ARM: dts: qcom: Fix sdhci node names - use 'mmc@'

David Heidelberg (1):
      ARM: dts: qcom: extend scm compatible to match dt-schema

Dmitry Baryshkov (5):
      ARM: dts: qcom: apq8064-ifc6410: drop hdmi-mux-supply
      ARM: dts: qcom: apq8064: drop phy-names from HDMI device node
      ARM: dts: qcom: apq8064: rename DSI PHY iface clock
      ARM: dts: qcom: apq8064: disable DSI and DSI PHY by default
      ARM: dts: qcom: msm8974: rename GPU's OPP table node

Kaushal Kumar (4):
      ARM: dts: qcom: sdx65: Add QPIC BAM support
      ARM: dts: qcom: sdx65: Add QPIC NAND support
      ARM: dts: qcom: sdx65-mtp: Enable QPIC BAM support
      ARM: dts: qcom: sdx65-mtp: Enable QPIC NAND support

Krzysztof Kozlowski (21):
      ARM: dts: qcom: align PMIC GPIO pin configuration with DT schema
      ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
      ARM: dts: qcom: pmx65: add fallback compatible to PMIC GPIO
      ARM: dts: qcom: add missing gpio-ranges in PMIC GPIOs
      ARM: dts: qcom: use dedicated QFPROM compatibles
      ARM: dts: qcom: cleanup QFPROM nodes
      ARM: dts: qcom: apq8064: add unit addresses to QFPROM regions
      ARM: dts: qcom: ipq4019: fix Micron SPI NOR compatible
      ARM: dts: qcom: adjust whitespace around '='
      ARM: dts: qcom: align gpio-key node names with dtschema
      ARM: dts: qcom: apq8060-dragonboard: add function and color to LED nodes
      ARM: dts: qcom: apq8060-ifc6410: add color to LED node
      ARM: dts: qcom: ipq4018-ap120c-ac: add function and color to LED nodes
      ARM: dts: qcom: ipq8064-rb3011: add color to LED node
      ARM: dts: qcom: ipq8064: add function to LED nodes
      ARM: dts: qcom: use generic sram as name for imem and ocmem nodes
      ARM: dts: qcom: apq8064-asus-nexus7: add dedicated IMEM compatible
      ARM: dts: qcom: msm8974: add dedicated IMEM compatible
      ARM: dts: qcom: sdx55: add dedicated IMEM and syscon compatibles
      ARM: dts: qcom: msm8974: add required ranges to OCMEM
      ARM: dts: qcom: pm8841: add required thermal-sensor-cells

Luca Weiss (2):
      ARM: dts: qcom: msm8974: Add BAM DMUX Ethernet/IP device
      ARM: dts: qcom-msm8974: fix irq type on blsp2_uart1

Manivannan Sadhasivam (1):
      ARM: dts: qcom: sdx55: Fix the IRQ trigger type for UART

Rohit Agarwal (12):
      ARM: dts: qcom: sdx65: Add Shared memory manager support
      ARM: dts: qcom: sdx65: Add interconnect nodes
      ARM: dts: qcom: sdx65: Add USB3 and PHY support
      ARM: dts: qcom: sdx65-mtp: Enable USB3 and PHY support
      ARM: dts: qcom: sdx65: Add CPUFreq support
      ARM: dts: qcom: sdx65: Add modem SMP2P node
      ARM: dts: qcom: sdx65: Add IMEM and PIL info region
      ARM: dts: qcom: sdx65: Add SCM node
      ARM: dts: qcom: sdx65: Add Modem remoteproc node
      ARM: dts: qcom: sdx65-mtp: Enable modem
      ARM: dts: qcom: sdx65: Add pshold support
      ARM: dts: qcom: sdx65: Add Watchdog support

 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |  25 +-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |  24 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |  14 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |  25 +-
 .../dts/qcom-apq8064-sony-xperia-lagan-yuga.dts    |  10 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 162 ++++++------
 arch/arm/boot/dts/qcom-apq8084.dtsi                |  10 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts   |   6 +
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts       |   7 +
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi      |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi      |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |   2 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   4 +-
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts          |   6 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi           |   9 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  36 +--
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |   2 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |   7 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                |   6 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi                | 112 ++++-----
 arch/arm/boot/dts/qcom-msm8960.dtsi                |  54 ++--
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  12 +-
 .../boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  10 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  49 +++-
 .../arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts |  14 +-
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts |  20 +-
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  18 +-
 arch/arm/boot/dts/qcom-pm8841.dtsi                 |   1 +
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |   2 +-
 arch/arm/boot/dts/qcom-pmx55.dtsi                  |   1 +
 arch/arm/boot/dts/qcom-pmx65.dtsi                  |   3 +-
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |   8 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts               |  61 ++++-
 arch/arm/boot/dts/qcom-sdx65.dtsi                  | 271 ++++++++++++++++++++-
 34 files changed, 682 insertions(+), 313 deletions(-)
