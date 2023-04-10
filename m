Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC6C76196
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 15:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9609BC4339C; Mon, 10 Apr 2023 15:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8D7C433D2;
	Mon, 10 Apr 2023 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681140906;
	bh=uUCfv5fpLtT1s3L1BSQA7BrDt9ZDw+p9akYdbAXB/4w=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=VFn2ZzXlte0nQUQbBrwbXFPts7nhC1iS1NWCaPib/YVsNyQxNFJyNjRqMn/dhhs91
	 +TZ23poPV5IUxr7jUm/f2Z19wAkGUc81BGRJL0pmxq9/YZKejfKt6Wq28srCxMM2jB
	 gaYGF4dbnEcf3gQU9kq+bL5mkYaNMcAR8gtkdjnZJSbZ9CT1IaCPMbiOCccLejzsmJ
	 +XB/BB8+PzIR8lZDaWi9u/NuNt7TTLBxFXzW3f1r+TF3OTPnFno4sEUqDmlPg2kD4h
	 44BVpvZqqlXR1pTQL4NpnZK8TXQOk+B4j1MbWd9uwX85k7IaURHJArJ+S4yu+vaHzD
	 jjFCpMC00yHgA==
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] A few more Qualcomm ARM64 DeviceTree fixes for 6.3
Date: Mon, 10 Apr 2023 08:38:50 -0700
Message-Id: <20230410153850.4752-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 07b0883e1f09416d07d25a2158f8cd35b732b686:

  arm64: dts: qcom: sc8280xp-x13s: mark bob regulator as always-on (2023-03-22 07:44:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.3-2

for you to fetch changes up to 75eab749e7aec0b7b515d7c50ed429ef4e1c5f3f:

  arm64: dts: qcom: sc7280: remove hbr3 support on herobrine boards (2023-04-07 09:26:37 -0700)

----------------------------------------------------------------
A few more Qualcomm ARM64 DeviceTree fixes for 6.3

The GPIO polarity of the WSA881x shutdown GPIO was inconsistent and had
to be corrected in the driver, this fixes the polarity in the DeviceTree
for QRB5165 RB5, SM8250 MTP, Samsung Galaxy Book 2 and Lenovo Yoga C630.

The recent rearrangement of nodes among the IPQ8074 accidentally enabled
the PCIe PHYs, rather than the PCIe controllers. This is being
corrected, to restore PCIe functionality.

PMK8280 PON node has the wrong compatible, which recently caused the
driver to stop probing. This is corrected and the required "pbs" region
is added.

With support for HBR3 introduced, it's noted that SC7280 Herobrine
devices are having trouble running at this rate. This drops the claim
that it's supported, until further analysis can be done.

----------------------------------------------------------------
Abhinav Kumar (1):
      arm64: dts: qcom: sc7280: remove hbr3 support on herobrine boards

Dmitry Baryshkov (2):
      arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
      arm64: dts: qcom: ipq8074-hk10: enable QMP device, not the PHY node

Johan Hovold (1):
      arm64: dts: qcom: sc8280xp-pmics: fix pon compatible and registers

Krzysztof Kozlowski (4):
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: sdm850-samsung-w737: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: sm8250-mtp: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: qrb5165-rb5: Use proper WSA881x shutdown GPIO polarity

 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts            | 4 ++--
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi           | 4 ++--
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts             | 4 ++--
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi       | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi         | 5 +++--
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts              | 4 ++--
 8 files changed, 16 insertions(+), 15 deletions(-)
