Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA20BCDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 20:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EF39C433CB; Sun, 15 Oct 2023 20:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85569C433C7;
	Sun, 15 Oct 2023 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697402529;
	bh=2QcJxdj1dNEjZSdTGOXK0OBHigtXZ9WZTFrQturLIb4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=p89Mj+ocqDFLrkusXf17YeAys9wWImveMoPZNmuSZN1QWlBNspCoH418klWGHIx46
	 I87kbIXls2bnd0elGoHKkw/65bqzq/BTPIlmPWtkTwRWck7iI4Xey0Pa7k9WFlVejj
	 ABASqFc9P110/s2ZURspUb398IJ8SSRZIc+WeVtLtWAKUZ7stpNShvH49lH27V+Rp/
	 s0HsqfwIjCG8kVeZmaEl8yFvgwbcD/ks/60p+WL01kpzf3UbY6IY+UIWFuAs76FWJP
	 YgsenOHa5p8lh/Kumfx6ZWxMXU0SXy93aGqh3PCeKKawxlFeodthM94o/J2eqk1NDX
	 FKbTMkeVwgZaA==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] Qualcomm ARM DeviceTree updates for v6.7
Date: Sun, 15 Oct 2023 13:45:57 -0700
Message-ID: <20231015204558.855987-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.7

for you to fetch changes up to 2138c32af19740ab54bf5622890fe96ba3530b75:

  ARM: dts: qcom: ipq8064: move keys and leds out of soc node (2023-09-27 16:10:23 -0700)

----------------------------------------------------------------
Qualcomm ARM DeviceTree updates for v6.7

RPM master stats is introduced for MSM8226 and MSM8974. The PCIe PHY of
SDX55 is transitioned to the new binding. The hall sensor on the Samsung
Galaxy Tab 4 is inverted.

A number of fixes reported from DeviceTree validation are fixed.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings

Krzysztof Kozlowski (7):
      ARM: dts: qcom: drop incorrect cell-index from SPMI
      ARM: dts: qcom: apq8064: drop label property from DSI
      ARM: dts: qcom: sdx65: fix SDHCI clocks order
      ARM: dts: qcom: apq8064: drop incorrect regulator-type
      ARM: dts: qcom: apq8060: drop incorrect regulator-type
      ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator
      ARM: dts: qcom: ipq8064: move keys and leds out of soc node

Matti Lehtimäki (3):
      ARM: dts: qcom: apq8026-samsung-matisse-wifi: Fix inverted hall sensor
      ARM: qcom: msm8226: Add rpm-master-stats node
      ARM: qcom: msm8974: Add rpm-master-stats node

 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |   4 +-
 .../arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts |   1 -
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   1 -
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts    |   1 -
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |   1 -
 arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts     |  55 +++++-----
 arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi      | 122 ++++++++++-----------
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi           |  14 +--
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |  32 ++++++
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  32 ++++++
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |  32 ++----
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |   7 +-
 12 files changed, 175 insertions(+), 127 deletions(-)
