Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2031C32771
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 22:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6896AC433D7; Wed, 21 Sep 2022 22:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694F6C433C1;
	Wed, 21 Sep 2022 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663799181;
	bh=fYQbaKHWYp/JInLQ3wje9LaiP2YFVT2Frv+/qk4l7qY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=DOnEXfo3+CZaqroLhs8OuhDtNJrMTFORz2PAotiCiFn8s+LFBIWahs8bTYVT8NBe5
	 YC796yTGIy/S72sOqsC7l5FFNFfQA9O3z2wAO8HMxYixIdQp1Tgpe9lId7jJUlEp3V
	 IyZ7WMbxwtdA/eQROD3kR3QSWFLPQlQlz5eDoIgxckJw3ioifaiSnTXdoIWaNDaZmj
	 3n4Fz2Tx2jphiBvfjlGTivBPX7LZv4BamiXvsBZKkhsugFY0070W5JGwA0k1gEKfV0
	 FD84dBAXhGuat7g9sEAYtaQJRwOjHWjFdyfy0Lugspkj5u4RZJCvujsDkkzNtApa4i
	 fcGA5oFCLbR+A==
From: Bjorn Andersson <andersson@kernel.org>
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm ARM DTS updates for 6.1
Date: Wed, 21 Sep 2022 17:26:19 -0500
Message-Id: <20220921222619.1338380-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.1

for you to fetch changes up to 5cbd20166f0ac7ae0272d25401b6ec5472482a19:

  ARM: dts: qcom: apq8026-lg-lenok: Enable ADSP (2022-09-15 13:44:42 -0500)

----------------------------------------------------------------
Qualcomm ARM DTS updates for 6.1

This adds extends the IPQ8064 support with the two variants IPQ8062 and
IPQ8065. MSM8974 and APQ8084 gained RPM stats support.

The Audio DSP remoteproc was added to MSM8226 and enabled for ASUS
ZenWatch 2 and LG G Watch R.

MSM8660 gained one I2C and one SPI bus and the APQ8060 Dragonboard got
the TMA340 Touchscreen described.

A wide range of improvements are done throughout the DTS files to align
with bindings, fix issues and improve structure on things.

----------------------------------------------------------------
Christian Marangi (5):
      ARM: dts: qcom: ipq8064: add v2 dtsi variant
      ARM: dts: qcom: ipq8064: add ipq8062 variant
      ARM: dts: qcom: ipq8064: add ipq8065 variant
      ARM: dts: qcom: ipq8064: reorganize node order and sort them
      ARM: dts: qcom: ipq8064: pad addresses to 8 digit

Dmitry Baryshkov (12):
      ARM: dts: qcom: apq8084: add rpm-stats device node
      ARM: dts: qcom: msm8974: add rpm-stats device node
      ARM: dts: qcom: stop using snps,dw-pcie falback
      ARM: dts: qcom-*: replace deprecated perst-gpio with perst-gpios
      ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
      ARM: dts: qcom: msm8660: fix node names for fixed clocks
      ARM: dts: qcom: apq8064: add clocks to the LCC device node
      ARM: dts: qcom: msm8960: add clocks to the LCC device node
      ARM: dts: qcom: apq8064: add clocks to the GCC device node
      ARM: dts: qcom: msm8960: add clocks to the GCC device node
      ARM: dts: qcom: apq8064: add clocks to the MMCC device node
      ARM: dts: qcom: msm8960: add clocks to the MMCC device node

Krzysztof Kozlowski (12):
      ARM: dts: qcom: msm8960: override nodes by label
      ARM: dts: qcom: msm8226: override nodes by label
      ARM: dts: qcom: msm8660: override nodes by label
      ARM: dts: qcom: msm8660-surf: move fixed regulator out of soc
      ARM: dts: qcom: use GPIO flags for tlmm
      ARM: dts: qcom: align SPMI PMIC ADC node name with dtschema
      ARM: dts: qcom: pm8941: align SPMI PMIC LPG node name with dtschema
      ARM: dts: qcom: pmx55: align SPMI PMIC Power-on node name with dtschema
      ARM: dts: qcom: apq8084: switch TCSR mutex to MMIO
      ARM: dts: qcom: msm8226: switch TCSR mutex to MMIO
      ARM: dts: qcom: align SDHCI reg-names with DT schema
      ARM: dts: qcom: align SDHCI clocks with DT schema

Linus Walleij (3):
      ARM: dts: qcom: msm8660: Add GSBI1 SPI bus
      ARM: dts: qcom: msm8660: Add GSBI3 I2C bus
      ARM: dts: qcom: apq8060-dragonboard: Add TMA340 to APQ8060 DragonBoard

Luca Weiss (3):
      ARM: dts: qcom: msm8226: Add ADSP node
      ARM: dts: qcom: apq8026-asus-sparrow: Enable ADSP
      ARM: dts: qcom: apq8026-lg-lenok: Enable ADSP

 arch/arm/boot/dts/qcom-apq8026-asus-sparrow.dts    |   6 +
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts        |  13 +
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |  71 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts        |   2 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |   2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  37 +-
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts     |   3 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi                |  32 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi      |   3 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi      |   4 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |   5 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   7 +-
 arch/arm/boot/dts/qcom-ipq8062-smb208.dtsi         |  37 +
 arch/arm/boot/dts/qcom-ipq8062.dtsi                |   8 +
 arch/arm/boot/dts/qcom-ipq8064-v2.0-smb208.dtsi    |  37 +
 arch/arm/boot/dts/qcom-ipq8064-v2.0.dtsi           |  69 ++
 arch/arm/boot/dts/qcom-ipq8064.dtsi                | 773 ++++++++++-----------
 arch/arm/boot/dts/qcom-ipq8065-smb208.dtsi         |  37 +
 arch/arm/boot/dts/qcom-ipq8065.dtsi                |   8 +
 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts  |   6 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 103 ++-
 arch/arm/boot/dts/qcom-msm8660-surf.dts            |  57 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi                |  62 +-
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             | 623 +++++++++--------
 arch/arm/boot/dts/qcom-msm8960.dtsi                |  45 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |   2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  29 +-
 arch/arm/boot/dts/qcom-msm8974pro.dtsi             |   6 +-
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |   4 +-
 arch/arm/boot/dts/qcom-pma8084.dtsi                |   2 +-
 arch/arm/boot/dts/qcom-pmx55.dtsi                  |   2 +-
 arch/arm/boot/dts/qcom-sdx65.dtsi                  |   2 +-
 32 files changed, 1284 insertions(+), 813 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-ipq8062-smb208.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq8062.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq8064-v2.0-smb208.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq8064-v2.0.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq8065-smb208.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-ipq8065.dtsi
