Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36CEC77B61
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 15:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B00FAC433EF; Mon, 10 Apr 2023 15:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E63C433D2;
	Mon, 10 Apr 2023 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681142171;
	bh=s0dFkWru1JVdVqU+tJc8gh6YQLlqGuu75tswK87ecwE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=bf0bylOcQaqZzkWynzTFHNZWkBZ7ggY8FUykoC6+3NoVFWMs38zTL02Ca5Zaz3jlJ
	 xgTZ4wfSHKLepFTaSxsx6mHb4ublvQRR1J4DSNEkMM/7oNhWHTA2WTYIBN3yVV5eCl
	 CX+hu2eDemv5SEkP3bCvIgncvMm33ogdTm35VH2vV+zU04M6YMatigISbx7a4dGTxH
	 1gszGUfSOjKTECiwy4PnRxwtziD2X64AfHh6gXFYFxHa2oQIfCqRlipsh07cJu9Ks1
	 u6ouWCwE6WlJZsGyxwO0x4GQ4YzL78llwaBp1Xi8ze+vJyRXa1gMLfu8aDUYUoQ0Xs
	 owyu/o9YYO9jw==
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Petr Vorel <pvorel@suse.cz>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.4
Date: Mon, 10 Apr 2023 08:59:55 -0700
Message-Id: <20230410155955.5329-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.4

for you to fetch changes up to 34d1a90bdb8a2759b9646c8596eea495b4cb02ac:

  arm64: defconfig: Enable IPQ9574 SoC base configs (2023-04-07 10:30:30 -0700)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v6.4

This enables a range of TLMM pinctrl drivers, needed to boot related
platforms. Multimedia clock drivers for MSM8994 and MSM8998 are enabled
and the MSM8996 is flagged as a module instead of builtin.

The PMIC_GLINK drivers are enabled, providing USB Type-C and battery
support on various platforms, and eUSB2 drivers found on SM8550 are
enabled.

Base drivers for IPQ5332 and IPQ9574 are enabled.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: defconfig: Enable QCOM eUSB2 SNPS PHY and repeater

Devi Priya (1):
      arm64: defconfig: Enable IPQ9574 SoC base configs

Kathiravan T (1):
      arm64: defconfig: Enable IPQ5332 SoC base configs

Krzysztof Kozlowski (1):
      arm64: defconfig: enable Qualcomm pin controller drivers

Neil Armstrong (2):
      arm64: defconfig: add PMIC GLINK modules
      arm64: defconfig: remove duplicate TYPEC_UCSI & QCOM_PMIC_GLINK

Petr Vorel (2):
      arm64: defconfig: Switch msm8996 clk drivers to module
      arm64: defconfig: Enable qcom msm899{4,8} clk drivers

 arch/arm64/configs/defconfig | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)
