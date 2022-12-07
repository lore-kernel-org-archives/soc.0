Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E063C352A1
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 15:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEC72C433B5; Wed,  7 Dec 2022 15:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1323C433C1;
	Wed,  7 Dec 2022 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670427123;
	bh=3fN5dk7HK8qS690hwTEn801sBN6XGjU2MuzzfBlNkIk=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=KNEa+3CaAbUL/HkuJxBcqEfVeGeoELgHv7WDNrX9vS7JRZucpjid8IvdEIdR1wcG0
	 ujgcSnyKTxBrawYPhMV01wtx8thFX8uxjyPz4ohdfwTSPz2mQfQZE9eKFjDsS3BHql
	 ZQ0XpTIATFmXhf56tn5qNJhzy8yrSubNRbN6Aq1qJvdSvAFTfju1DwWX7WtpAV7s5D
	 DJHcoyRMC27cgjYa5ASsIbzIEVIybXtFCCqIhwjM2c97qXdCWYOkhzzAr+sqPrmbwW
	 Iff5NePLc2vrfBtumy+/0Ye+XBpEkBExeH1AVVBJ6nmEnrWu3avF9N8kQgZSsWPN28
	 TzkEwn+DKgrPw==
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
	Luca Weiss <luca@z3ntu.xyz>,
	Julian Goldsmith <julian@juliangoldsmith.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Owen Yang <ecs.taipeikernel@gmail.com>,
	Parikshit Pareek <quic_ppareek@quicinc.com>
Subject: [GIT PULL] More Qualcomm DTS updates for 6.2
Date: Wed,  7 Dec 2022 09:32:01 -0600
Message-Id: <20221207153201.3233015-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 37b5e8c48b9d295aca92caf0fdd3f4b85cc662bc:

  dt-bindings: arm: add xiaomi,sagit board based on msm8998 chip (2022-11-15 10:58:02 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.2-2

for you to fetch changes up to 812e13ddb56aa5c4534c96b522d2e39e094df677:

  dt-bindings: arm: qcom: Add zombie (2022-12-05 17:02:10 -0600)

----------------------------------------------------------------
More Qualcomm DTS updates for 6.2

This introduces support for the OnePlus One, on MSM8974Pro, and properly
marks other Pro devices as compatible thereof. Also on MSM8974, the
description of USB devices and their PHYs are cleaned up.

On the binding side compatibles for recently added ARM and ARM64 boards
are added.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      dt-bindings: arm: qcom: split MSM8974 Pro and MSM8974
      arm: dts: qcom: use qcom,msm8974pro for pro devices

Julian Goldsmith (1):
      ARM: dts: qcom: msm8974: Add OnePlus One

Konrad Dybcio (1):
      dt-bindings: arm: qcom: Add Xperia 5 IV (PDX224)

Krzysztof Kozlowski (1):
      ARM: dts: qcom: align LED node names with dtschema

Luca Weiss (2):
      ARM: dts: qcom: msm8974: clean up USB nodes
      dt-bindings: arm: qcom: Document oneplus,bacon device

Marijn Suijten (1):
      dt-bindings: arm: qcom: Document msm8956 and msm8976 SoC and devices

Owen Yang (1):
      dt-bindings: arm: qcom: Add zombie

Parikshit Pareek (1):
      dt-bindings: arm: qcom: Document additional sa8540p device

 Documentation/devicetree/bindings/arm/qcom.yaml    |  32 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts     |  42 +--
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dts   |   6 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dts       |   6 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  48 ++-
 .../boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  48 ++-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   6 +-
 .../arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts |  50 ++-
 .../arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts | 417 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts |  44 ++-
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  50 ++-
 12 files changed, 591 insertions(+), 159 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
