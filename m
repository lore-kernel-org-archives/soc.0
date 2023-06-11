Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BF5C77B7A
	for <soc@archiver.kernel.org>; Sun, 11 Jun 2023 01:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02D67C4339B; Sun, 11 Jun 2023 01:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE85DC433EF;
	Sun, 11 Jun 2023 01:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686445515;
	bh=fW6c+EgKV15BRnATkYwXonZVtbspOtgztUrIeJWBmWw=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Ux4pCg5ZSYOJ8GIBk0evxQKbChRmZFsKwkaOp410Tn8pnzEncMLRXsiWYP6CfY5Tb
	 rjS8xtuzZKB7Bbl5B3c2+YK6WwTSDTa2bKlnW9z1XxO7r3hIGHHIgmV0OPZFH16NtR
	 5VJjVMxMh2XpprZAW5lv+DAAjvgIrpDWYPldYS8e5wV2dR6wXbafIA6SWkyzHdxLBg
	 wloJ3F2py0wYOJLj4o7Dm4ttSnU/BNPX/ClXt4zmudlxwceBeqB/BQUM4JdCNH8KgA
	 jCHCy1kFAPPySBw6dLtbpCJLWT++Lf1VwOH/4ACsrwc4sU2T44ekQCxx5a22s8rQgB
	 k2VG81sPXZjzQ==
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
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] Qualcomm ARM32 DeviceTree updates for v6.5
Date: Sat, 10 Jun 2023 18:08:43 -0700
Message-Id: <20230611010843.2482142-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.5

for you to fetch changes up to 925bac3caa46c5790d21ee236869b017090aad2d:

  ARM: dts: qcom: apq8074-dragonboard: enable DSI panel (2023-05-30 07:54:19 -0700)

----------------------------------------------------------------
Qualcomm ARM32 DeviceTree updates for v6.5

NAND support on IPQ4019 boards is restored, after a faulty node rename.

On MSM8226 IMEM, PMU and RPM stats are introduced. The Huawei Watch
gains vibrator support.

On MSM8974, the LGE Nexus 5 gains vibrator support. The APQ8074
Dragonboard marks BLSP2 BAM controlled remotely, DSI panel, audio and
modem DSPs are enabled.

On SDX65 PCIe controller and PHY are introduced, to provide endpoint
functionality. This is enabled on the related MTP.

A range of DeviceTree cleanups are also included.

----------------------------------------------------------------
Dmitry Baryshkov (3):
      ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely controlled
      ARM: dts: qcom: apq8074-dragonboard: enable adsp and MSS
      ARM: dts: qcom: apq8074-dragonboard: enable DSI panel

Krzysztof Kozlowski (14):
      ARM: dts: qcom: msm8974: do not use underscore in node name (again)
      ARM: dts: qcom: msm8974: drop unit addresses from USB phys
      ARM: dts: qcom: ipq4019: fix broken NAND controller properties override
      ARM: dts: qcom: ipq4019: correct syscon unit-address
      ARM: dts: qcom: sdx55: correct rsc unit-address
      ARM: dts: qcom: msm8974: correct pronto unit-address
      ARM: dts: qcom: ipq8064: drop leading 0 from unit-address
      ARM: dts: qcom: ipq8064: drop invalid GCC thermal-sensor unit-address
      ARM: dts: qcom: ipq8064: correct LED node names
      ARM: dts: qcom: ipq8064: align USB node names with bindings
      ARM: dts: qcom: apq8060-dragonboard: move regulators out of simple-bus
      ARM: dts: qcom: msm8960-cdp: move regulator out of simple-bus
      ARM: dts: qcom: apq8084: correct thermal sensor unit-address
      ARM: dts: qcom: msm8974: align WCNSS Bluetooth node name with bindings

Linus Walleij (1):
      ARM: dts: qcom: msm8660: Fix regulator node names

Luca Weiss (2):
      ARM: dts: qcom: msm8974-hammerhead: Add vibrator
      ARM: dts: qcom: apq8026-huawei-sturgeon: Add vibrator

Matti Lehtimäki (3):
      ARM: dts: qcom: msm8226: Add PMU node
      ARM: dts: qcom: msm8226: Add rpm-stats device node
      ARM: dts: qcom: msm8226: Add IMEM node

Rohit Agarwal (4):
      ARM: dts: qcom: sdx65: Add support for PCIe PHY
      ARM: dts: qcom: sdx65: Add support for PCIe EP
      ARM: dts: qcom: sdx65-mtp: Enable PCIe PHY
      ARM: dts: qcom: sdx65-mtp: Enable PCIe EP

 arch/arm/boot/dts/qcom-apq8026-huawei-sturgeon.dts | 28 +++++++
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     | 84 ++++++++++-----------
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts     | 83 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8084.dtsi                |  2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts    |  8 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi      | 10 +--
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi      | 12 +--
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts          |  2 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi           | 10 +--
 arch/arm/boot/dts/qcom-ipq8064.dtsi                | 12 +--
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 25 +++++++
 arch/arm/boot/dts/qcom-msm8960-cdp.dts             | 16 ++--
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 35 +++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 10 +--
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  4 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts               | 42 +++++++++++
 arch/arm/boot/dts/qcom-sdx65.dtsi                  | 87 ++++++++++++++++++++++
 17 files changed, 381 insertions(+), 89 deletions(-)
