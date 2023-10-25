Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772E8C07545
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 20:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DD51C433CB; Wed, 25 Oct 2023 20:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A12C433C7;
	Wed, 25 Oct 2023 20:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698264645;
	bh=iQRE+WTl1DkW4ait010QgZoPxgOjsKrtqUOwFfNr3R0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=j5vdlahvKjMeUCggtvomW6c+KWk3yOWT47MjXIMlNDd5+FK/RJlFiEEYeBX8Zn+oe
	 C8mJpkLIPfwxelYpDsjCzQl+X7YfuAXbSi2ErcZsyK1jeMB0CBI+oDqS+bAXY8D1Fi
	 FEoFMU1wGso5jy9/3czA1MtUo/wiHQJW4MMvwl6aoxR9dnmuu9zwoqy0YYFqwgxizN
	 3+FI9KuMbHePp9aSIS8cE/t/q1m5kCKLkiCJf/fXzm6o181UycwmicwBXFuNIT3chE
	 OfTFVpiB7CkOS48KOFIJyxaZD7d+K8bpCLsz2ilWFPaaJTSg5zvuHasJ8y2+ngqSBC
	 CwJyrhZgFWz9g==
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
	Rayyan Ansari <rayyan@ansari.sh>,
	Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] More Qualcomm Arm32 DeviceTree updates for v6.7
Date: Wed, 25 Oct 2023 13:15:02 -0700
Message-ID: <20231025201503.1016435-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2138c32af19740ab54bf5622890fe96ba3530b75:

  ARM: dts: qcom: ipq8064: move keys and leds out of soc node (2023-09-27 16:10:23 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.7-2

for you to fetch changes up to 8677233e59137f78d4d578f3d5a21557c1bab342:

  ARM: dts: qcom: add device tree for Nokia Lumia 830 (2023-10-22 18:40:23 -0700)

----------------------------------------------------------------
More Qualcomm Arm32 DeviceTree updates for v6.7

This introduces new DeviceTree source for Microsoft Lumia 640, Microsoft
Lumia 640 XL, Nokia Lumia 735, and Nokia Lumia 830, built on MSM8226 and
MSM8926.

A few stylistic issues are corrected on MSM8974.

----------------------------------------------------------------
Luca Weiss (3):
      ARM: dts: qcom: msm8974: replace incorrect indentation in interconnect
      ARM: dts: qcom: msm8974: sort nodes by reg
      ARM: dts: qcom: msm8226: provide dsi phy clocks to mmcc

Rayyan Ansari (5):
      ARM: dts: qcom: add common dt for MSM8x26 Lumias along with Nokia Lumia 630
      ARM: dts: qcom: add device tree for Microsoft Lumia 640
      ARM: dts: qcom: add device tree for Microsoft Lumia 640 XL
      ARM: dts: qcom: add device tree for Nokia Lumia 735
      ARM: dts: qcom: add device tree for Nokia Lumia 830

 arch/arm/boot/dts/qcom/Makefile                    |   5 +
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    | 327 +++++++++++++++++++++
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |  17 ++
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |  17 ++
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |  23 ++
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |   4 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |  53 ++++
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |  67 +++++
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  80 ++---
 9 files changed, 551 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
