Return-Path: <SRS0=PV0F=TM=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE79AC433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 04:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94AFFC340EE; Tue,  1 Mar 2022 04:28:31 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D8C1C340F0
	for <soc@kernel.org>; Tue,  1 Mar 2022 04:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D8C1C340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id i5so15267953oih.1
        for <soc@kernel.org>; Mon, 28 Feb 2022 20:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YO58r2NRDLtztq1Yj6RXQMBYVwhOfdyjo8cGMRWq0MA=;
        b=f6A3OsuDoMWH3ErpSkgmqOWKutlr4QW9EqJpATGsq6JAvg/7aytWrlpey17AB35asQ
         gpFLlSiO3RGB02VelNWkJjaIRZJiGNoA+O+E1dlE4k8mHnZ55H7AxMhPQ0aoTXgSDjp8
         lR1nVSuKALzold7pied2ANJ/RdJSgU9L5GoJLuTUbIkufsxoVIA5rWvbhsIqGTp3dzHJ
         2GvJ6o3YuNT5oQH6GBk3OMH3FlxVo3mWU4YtlZxe46beU1s1ogvqLgJQJaljVMwsbDjS
         tcBmPZA4xBnTc866F3ICrbUYbE9Y7M8/wQ7itNSuKC+TSTDqwtRw3pdDTcUR/4LUCw7v
         sR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YO58r2NRDLtztq1Yj6RXQMBYVwhOfdyjo8cGMRWq0MA=;
        b=RspzaR4u61TN/8Bcv51E5hD4M6BSU86IxXWH/6oedkga8cVdxpQ3BAvBLe1lBBGsRN
         HsB9P2m2AHE55jZxHLkeDnPUjytb7XsPAiqliduFAnaWNFJUOUFRljyxYF2X3Uks1pjD
         gceLieVfneaiMHCHnm/SWmu5xnoDRZI+QboGBYIPs662PDKnhj/dpHUKl6CrUOi4inwN
         Gz4F+2KgBuS0j6D9Uqvi/it3cFXEORLRow8N4cweqmYUetti93n/kpydjN6SFF+84TsX
         jvmymBrQHMP3fiOQdpTSJDsVTZ+QkX1Ona+S7FGdVMkA6cqzsOKMptrj8wc2dh4bp49W
         M3zg==
X-Gm-Message-State: AOAM533cAr0wNdwFcFtsO6rf6PlgLxLCAZBiXwOkQbuEGbYM+wOihgwd
	6Hp6AhpbBqMvkjoQ3ciJYct8cA==
X-Google-Smtp-Source: ABdhPJzlKcqWPkdKFZi9CnB6F8GvGXThcTSRKpeIDcm6Vfqam6kX1VZSkHPWW9/DZ4+RzBjfahxE5A==
X-Received: by 2002:a05:6808:1a22:b0:2d4:f7a6:3d1d with SMTP id bk34-20020a0568081a2200b002d4f7a63d1dmr13839897oib.95.1646108909761;
        Mon, 28 Feb 2022 20:28:29 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0031bf8505320sm5615145ooj.25.2022.02.28.20.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:28:29 -0800 (PST)
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
	David Heidelberg <david@ixit.cz>,
	Luca Weiss <luca@z3ntu.xyz>,
	Ben Wolsieffer <benwolsieffer@gmail.com>,
	Dominik Kobinski <dominikkobinski314@gmail.com>,
	Jack Matthews <jm5112356@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pavel Kubelun <be.dissent@gmail.com>,
	Rayyan Ansari <rayyan@ansari.sh>
Subject: [GIT PULL] Qualcomm dts updates for v5.18
Date: Mon, 28 Feb 2022 22:28:28 -0600
Message-Id: <20220301042828.1805481-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.18

for you to fetch changes up to 13455362518773be2733de94fbd8e99f2b50efdc:

  ARM: dts: qcom: msm8226: add power domains (2022-02-24 14:12:55 -0600)

----------------------------------------------------------------
Qualcomm dts updates for v5.18

The MSM8226 platform gains description of USB, SoC power-domains,
PMIC multi-purpose pins, SPMI regulators, the smbb battery charger and
the LG G Watch R, on this platform, gains description of Bluetooth,
WiFI, fuel gauge, SMBB battery charger and USB.

DeviceTree validation issues in APQ8060, APQ8064, MDM9615, MSM8960,
IPQ4019 and SDX55 are corrected.

----------------------------------------------------------------
Ben Wolsieffer (1):
      ARM: dts: qcom: apq8060-dragonboard: fix typo in eMMC

David Heidelberg (11):
      ARM: dts: qcom: sdx55: use standartized naming for spmi node
      ARM: dts: qcom: apq8064: correct ranges values
      ARM: dts: qcom: apq8064: make pci regs property dt-schema compliant
      ARM: dts: qcom: apq8064: adjust dsi node name to match dt-schema
      ARM: dts: qcom: nexus7: remove vcss supply which never existed
      ARM: dts: qcom: apq8060: correct mvs switch name
      ARM: dts: qcom: rename eth node to ethernet
      ARM: dts: qcom: fix gic_irq_domain_translate warnings for msm8960
      ARM: dts: qcom: add KPSS GCC compatible to clock nodes
      ARM: dts: qcom: msm8960: move vsdcc regulator out of simple-bus
      ARM: dts: qcom: fill missing power-domain-cells for gcc controllers

Dominik Kobinski (1):
      ARM: dts: qcom: pm8226: Support SPMI regulators on PMIC sid 1

Jack Matthews (1):
      ARM: dts: qcom: pm8226: Add vibration motor node

Luca Weiss (10):
      ARM: dts: qcom: pm8226: add smbb charger node
      ARM: dts: qcom: apq8026-lg-lenok: configure SMBB charger
      dt-bindings: phy: qcom,usb-hs-phy: add MSM8226 compatible
      ARM: dts: qcom: msm8226: add USB node
      ARM: dts: qcom: apq8026-lg-lenok: enable USB
      ARM: dts: qcom: apq8026-lg-lenok: add fuel gauge
      ARM: dts: qcom: msm8226: Add pinctrl for sdhci nodes
      ARM: dts: qcom: apq8026-lg-lenok: Add Wifi
      ARM: dts: qcom: apq8026-lg-lenok: Add Bluetooth
      ARM: dts: qcom: msm8226: add power domains

Manivannan Sadhasivam (1):
      ARM: dts: qcom: sdx55: Fix the address used for PCIe EP local addr space

Pavel Kubelun (1):
      ARM: dts: qcom: ipq4019: fix sleep clock

Rayyan Ansari (1):
      ARM: dts: qcom: pm8226: Add node for the MPP

 .../devicetree/bindings/phy/qcom,usb-hs-phy.txt    |   1 +
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts        | 132 ++++++++++++++++++---
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |   6 +-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |   3 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  19 +--
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   4 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |   3 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 125 +++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8660.dtsi                |   3 +-
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             |   2 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi                |  30 +++--
 arch/arm/boot/dts/qcom-pm8226.dtsi                 |  43 +++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |   4 +-
 13 files changed, 326 insertions(+), 49 deletions(-)
