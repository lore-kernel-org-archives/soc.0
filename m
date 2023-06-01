Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21B9C77B7A
	for <soc@archiver.kernel.org>; Thu,  1 Jun 2023 14:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1138C4339E; Thu,  1 Jun 2023 14:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F14C433EF;
	Thu,  1 Jun 2023 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685629273;
	bh=GDJvQxlNj4tiFptfrI4g/+DKmcVCf7e2AficQEqOPMY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=bDKc3kVnXEs42fzveVUd3lZFQQ72fSU2/QTCqSEnBPh4lXR2vhNeOc5xbE6S9jcXj
	 hkhjpdyMerN96x33Zk4ZWteVw7+Lim9MU/ZvKK1ROc+xKLzXOHI1VdgZDxECdDn3w0
	 uXv5Z/l6r2mIOVV+rsogFb2oUC4sWUctyUgXUzqzqp4QrHeSmur46IAxBDw/2hi1hn
	 D6Z7/rNCcEze80N/fK2TPxNVeEJHvnMizYh2jmDcJMPk2QJCAO1JlqvOvrpwo5xHN5
	 HylkA/Gchue2CQo03QoZSnxs7WPu19CFdkd4A/hCGTRubvGrsh6xROM/UOovzz+aJt
	 JvdfinInfnKwA==
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
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for 6.4
Date: Thu,  1 Jun 2023 07:24:54 -0700
Message-Id: <20230601142454.2246259-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.4

for you to fetch changes up to 661a4f089317c877aecd598fb70cd46510cc8d29:

  arm64: dts: qcom: sm8550: Use the correct LLCC register scheme (2023-05-24 21:11:28 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree fixes for 6.4

Register scheme for SM8550 LLCC is corrected to avoid using the wrong
register offsets. SDRAM frequency for misidentified SC7180-lite boards
is handled. The datatype for Soundwire interval on SM8550 is corrected.

The resource controller on SC8280XP is added to the CPU cluster
power-domain to get notified to send cached sleep and wake votes before
going entering the lower power states.

SA8155P power-domains that differ from what's inherited from the SM8150
DeviceTree are adjusted to make the platform boot again.

Remoteproc firmware paths are corrected for Sony Xperia 10 IV.

Cache properties are adjusted across a range of platforms, to meet
changes in the binding.

Panel compatibles are corrected for Xiaomi Mi Pad 5 Pro, to match
binding. Invalid dai-cells are dropped from SC7280 devices, to match
binding.

The incorrect removal of "input-enable" from the LPASS pinctrl node of
SC8280XP was reverted, to get dmic pins in the correct state again.

The incorrect input-enable property is dropped from a msm8974, mdm9615
and apq8026 to resolve a range of DT validation warnings, incorrectly
picked up through the ARM64 tree.

----------------------------------------------------------------
Bjorn Andersson (2):
      arm64: dts: qcom: sc8280xp: Flush RSC sleep & wake votes
      Merge branch '20230411-topic-hanaau-v2-1-fd3d70844b31@linaro.org' into arm64-fixes-for-6.4

Douglas Anderson (1):
      arm64: dts: qcom: sc7180-lite: Fix SDRAM freq for misidentified sc7180-lite boards

Konrad Dybcio (4):
      arm64: dts: qcom: sm6375-pdx225: Fix remoteproc firmware paths
      dt-bindings: power: qcom,rpmpd: Add SA8155P
      arm64: dts: qcom: Split out SA8155P and use correct RPMh power domains
      arm64: dts: qcom: sm8550: Use the correct LLCC register scheme

Krzysztof Kozlowski (12):
      arm64: dts: qcom: sc8280xp: Revert "arm64: dts: qcom: sc8280xp: remove superfluous "input-enable""
      arm64: dts: qcom: sc7280-idp: drop incorrect dai-cells from WCD938x SDW
      arm64: dts: qcom: sc7280-qcard: drop incorrect dai-cells from WCD938x SDW
      arm64: dts: qcom: sm8250-xiaomi-elish-boe: fix panel compatible
      arm64: dts: qcom: sm8250-xiaomi-elish-csot: fix panel compatible
      ARM: dts: qcom: apq8026: remove superfluous "input-enable"
      ARM: dts: qcom: mdm9615: remove superfluous "input-enable"
      ARM: dts: qcom: msm8974: remove superfluous "input-enable"
      arm64: dts: qcom: fix indentation
      arm64: dts: qcom: use decimal for cache level
      arm64: dts: qcom: add missing cache properties
      arm64: dts: qcom: sm8550: use uint16 for Soundwire interval

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 arch/arm/boot/dts/qcom-apq8026-asus-sparrow.dts    |  2 -
 arch/arm/boot/dts/qcom-apq8026-huawei-sturgeon.dts |  1 -
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts        |  3 --
 .../boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts  |  1 -
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  2 -
 .../boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  1 -
 .../arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts |  1 -
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts |  4 --
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  1 -
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  1 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  3 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  3 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  1 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  2 +
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |  2 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  2 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  2 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  1 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              | 10 ++++
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |  2 +-
 arch/arm64/boot/dts/qcom/sa8155p.dtsi              | 40 ++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 20 +++++++
 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi          |  8 +++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  9 ++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  2 -
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |  2 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 ++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 18 ++++++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 20 ++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 13 ++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  9 ++++
 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  |  4 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               | 52 ++++++++++++------
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 13 ++++-
 .../boot/dts/qcom/sm8250-xiaomi-elish-boe.dts      |  2 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-csot.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 61 +++++++++++++---------
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 61 +++++++++++++---------
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 26 +++++++--
 include/dt-bindings/power/qcom-rpmpd.h             |  9 ++++
 47 files changed, 332 insertions(+), 112 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8155p.dtsi
