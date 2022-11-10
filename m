Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9A4C4332F
	for <soc@archiver.kernel.org>; Thu, 10 Nov 2022 04:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48A5BC433C1; Thu, 10 Nov 2022 04:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231DCC433D6;
	Thu, 10 Nov 2022 04:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668053197;
	bh=+eUM0x2xmmCPnRFzrYtnLSAiStVke1zulIuvV0l82LU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=NU+ekzUWyrrsJkuWC3mkgg5K0b3zfgYvThgCJ0YZtSO6RUxmYPDGP5BIIvP6kCs4/
	 hDmP/Ej5tmHZAbQHu8wS+ggQWl9Gmr1s3a4Ib4R2U1fJGybGWz6I7f/YguObIcG2tP
	 wmacAqZJofhYeOfLfWAXr70PQ6CfFHwxuE5WCyCvGKiNlo5m0k1LgseOnjDsnDoszU
	 sqHodZ16O046B5amUoDRfZ/dYqi8F/YPHbrLDANWB6bDpOt5OWMqTGyaEOBL/n6mtR
	 VY68mNxForBpk8PXSAZ1fTzXBvr9sYFcMpKgPyjyPg3yEnhH5BYzMrZdvsas9Gnchl
	 4fikh9HHfyBEA==
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
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS fixes for 6.1
Date: Wed,  9 Nov 2022 22:06:35 -0600
Message-Id: <20221110040635.795921-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.1

for you to fetch changes up to cadaa773bcf161184fa428180516bae33a7bc667:

  arm64: dts: qcom: sm8250: Disable the not yet supported cluster idle state (2022-10-28 16:18:59 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS fixes for 6.1

This fixes the APCS register region on IPQ8074 to not overlap
with adjacent nodes.

It lists the valid LDO modes on a variety of platforms, as this is not
required by the binding and implementation.

The reference clocks for the two UFS instances on SC8280XP are
corrected, to avoid relying on the state left by most versions of the
bootloader.

A number of issues are corrected with regards to the QMP PHY register
ranges on SC8280XP.

SC7280 gains a missing lpass reset region.

Lastly cluster idle is termporarily disabled on SM8250 to avoid issues
with booting the platform, until the last missing pieces lands.

----------------------------------------------------------------
Brian Masney (1):
      arm64: dts: qcom: sc8280xp: correct ref clock for ufs_mem_phy

Dmitry Baryshkov (1):
      Revert "arm64: dts: qcom: msm8996: add missing TCSR syscon compatible"

Douglas Anderson (6):
      arm64: dts: qcom: sa8155p-adp: Specify which LDO modes are allowed
      arm64: dts: qcom: sa8295p-adp: Specify which LDO modes are allowed
      arm64: dts: qcom: sc8280xp-crd: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8150-xperia-kumano: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8250-xperia-edo: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8350-hdk: Specify which LDO modes are allowed

Johan Hovold (6):
      arm64: dts: qcom: sc8280xp: fix ufs_card_phy ref clock
      arm64: dts: qcom: sc8280xp: fix USB0 PHY PCS_MISC registers
      arm64: dts: qcom: sc8280xp: fix USB1 PHY RX1 registers
      arm64: dts: qcom: sc8280xp: fix USB PHY PCS registers
      arm64: dts: qcom: sc8280xp: drop broken DP PHY nodes
      arm64: dts: qcom: sc8280xp: fix UFS PHY serdes size

Robert Marko (1):
      arm64: dts: qcom: ipq8074: correct APCS register space size

Satya Priya (1):
      arm64: dts: qcom: sc7280: Add the reset reg for lpass audiocc on SC7280

Ulf Hansson (1):
      arm64: dts: qcom: sm8250: Disable the not yet supported cluster idle state

 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           | 13 +++++++-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           | 12 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  6 ++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 36 +++++-----------------
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |  6 ++++
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |  6 ++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 12 ++++++++
 11 files changed, 67 insertions(+), 32 deletions(-)
