Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AF6C636D4
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 19:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EFBFC4339E; Fri, 10 Feb 2023 19:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3162CC433EF;
	Fri, 10 Feb 2023 19:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676057220;
	bh=ixcLI5lcLfglR2/BnM4PvcyNMcHe1kF1cvDPm/iC1Ig=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=EFzowwceVwNZkNF8+m0YYYFBVDhs6cul5Sdo5ImArS40Q/CTIVnnpkvI3mdIM7vvd
	 xW/fbEVMWXZMDqyeSWWevHIXE5nKG0gnoE9Pqzp+I6tmjccl4VtxFDmbj2pQ91gLHV
	 G9WLeLDRn/IWeRHfpXC7jmZJeD2Tp/gLYvyWRmSYwLA87n+5L86l8Wls3v1ZQxFEFg
	 oDJKM0Ei1u0lJvOCLBqV4uG3oE9Fr1JJZTEus9Wa7ByZsWUvRttzTPezN4XbI3kUOE
	 2bWaK1clZP9vrDEHIapvkNH+VByQc1Fb6PKg7YdAEMxEe1PjI5veLW0IaKTpmzGCYH
	 HdEyV+gIrcNbg==
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Jamie Douglass <jamiemdouglass@gmail.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Petr Vorel <pvorel@suse.cz>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Robert Marko <robimarko@gmail.com>,
	Yang Xiwen <forbidden405@foxmail.com>
Subject: [GIT PULL] More Qualcomm ARM64 DT updates for 6.3
Date: Fri, 10 Feb 2023 11:29:08 -0800
Message-Id: <20230210192908.2039976-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit a63a420d050d47a6afb5e2198181dadd08e71f97:

  arm64: dts: qcom: sc7280: Add a carveout for modem metadata (2023-01-18 21:35:25 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.3-2

for you to fetch changes up to f069ede81ef438d99e76112d8738c4dc3d1766f9:

  arm64: dts: qcom: sc7280: Power herobrine's 3.3 eDP/TS rail more properly (2023-02-08 20:09:36 -0800)

----------------------------------------------------------------
More Qualcomm ARM64 DT updates for 6.3

The new Qualcomm QDU1000 and QRU1000 platforms, and the IDP device on
these are introduced. New support for a couple of USB modem sticks from
THWC are introduced, so is support for Xiaomi Mi Pad 5 Pro and the Pro
SKU of the Herobrine device.

The Core Bus Fabric (CBF) is introduced on MSM8996. Interconnect paths
for UFS are also described.

A few fixes related to the power-grid of herobrine, on SC7280, are
introduced.

QFPROM is introduced on IPQ8074 and Interconnect providers are added for
SDM670.

On SDM845 the duplicated wcd9340 audio coded description is moved from
devices to a common file, audio devices are added to the OnePlus 6 and
6T.

On SM6115 debug UART, SMP2P, watchdog nodes are introduced, and the
platform is switched to use #address/size-cells of 2, in line with most
other platforms.

Camera control interface and clock controllers are added for SM6350, and
the CCI interface is enabled on the Fairphone FP4.

On SM8350 the interconnect reference of SDHCI controller is corrected,
DSI1 PHY clocks are properly described as sources for the Display clock
controller and DSI1 is wired up to the display controller.

The firmware paths are corrected for the Sony Xperia Nagara platform.

The GPR bus, audio servic3es and LPASS pinctrl nodes are added for the
SM8550 platform. Additionally a few small typos/errors are corrected.

gpio-ranges are corrected across MSM8953, SM6115 and SC8280XP and a
range of DT validation issues are corrected.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: sm8550: Fix the aoss_qmp node name

Amit Pundir (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add reserved memory region

Andrew Halaney (2):
      arm64: dts: qcom: sa8540p-ride: Fix some i2c pinctrl settings
      arm64: dts: qcom: sa8540p-ride: Document i2c busses

Bhupesh Sharma (3):
      arm64: dts: qcom: sm6115: Add geni debug uart node for qup0
      arm64: dts: qcom: sm6115: Add watchdog node to dtsi
      arm64: dts: qcom: sm6115: Add smp2p nodes

Bjorn Andersson (3):
      Merge branch 'icc-qdu1000-immutable' of https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into HEAD
      Merge branch '20230112204446.30236-2-quic_molvera@quicinc.com' into arm64-for-6.3
      Merge branch '20221213152617.296426-1-konrad.dybcio@linaro.org' into HEAD

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus-*: add audio devices

Dmitry Baryshkov (6):
      arm64: dts: qcom: sc8280xp-crd: drop #sound-dai-cells from eDP node
      arm64: dts: qcom: sc8280xp: add p1 register blocks to DP nodes
      arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
      arm64: dts: qcom: msm8996: enable UFS interconnects
      arm64: dts: qcom: msm8996 switch from RPM_SMD_BB_CLK1 to RPM_SMD_XO_CLK_SRC
      arm64: dts: qcom: msm8996: add CBF device entry

Douglas Anderson (5):
      arm64: dts: qcom: sc7280: On QCard, regulator L3C should be 1.8V
      arm64: dts: qcom: sc7280: Add 3ms ramp to herobrine's pp3300_left_in_mlb
      arm64: dts: qcom: sc7280: Hook up the touchscreen IO rail on villager
      arm64: dts: qcom: sc7280: Hook up the touchscreen IO rail on evoker
      arm64: dts: qcom: sc7280: Power herobrine's 3.3 eDP/TS rail more properly

Jamie Douglass (1):
      arm64: dts: qcom: msm8992-lg-bullhead: Correct memory overlaps with the SMEM and MPSS memory regions

Jianhua Lu (1):
      arm64: dts: qcom: sm8250: Add device tree for Xiaomi Mi Pad 5 Pro

Johan Hovold (1):
      arm64: dts: qcom: sm8550: fix USB-DP PHY resets

Konrad Dybcio (13):
      arm64: dts: qcom: sm8350: Add missing #address/size-cells to DSIn
      arm64: dts: qcom: sm8350: Fix DSI1 interrupt
      arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to DISPCC
      arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
      arm64: dts: qcom: sm8350: Fix DSI PLL size
      arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn out labels
      arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
      arm64: dts: qcom: sm8450-nagara: Correct firmware paths
      arm64: dts: qcom: sm6115: Add mdss_ prefix to mdss nodes
      arm64: dts: qcom: sm6115: Use 64 bit addressing
      arm64: dts: qcom: sm8450: Fix DSIn PHY compatible
      arm64: dts: qcom: sm8250: Disable wsamacro and swr0 by default
      dt-bindings: clock: add QCOM SM6350 camera clock bindings

Krzysztof Kozlowski (30):
      arm64: dts: qcom: sm8550: add GPR and LPASS pin controller
      arm64: dts: qcom: sc7280-herobrine-audio-wcd9385: drop incorrect properties
      arm64: dts: qcom: sc7280-idp: drop incorrect properties
      arm64: dts: qcom: use generic node name for Bluetooth
      arm64: dts: qcom: sm8350: drop incorrect cells from serial
      arm64: dts: qcom: sm8450: drop incorrect cells from serial
      arm64: dts: qcom: sm8550: drop incorrect cells from serial
      arm64: dts: qcom: sdm845-db845c: add generic sound compatible
      arm64: dts: qcom: sdm845-xiaomi-beryllium: add generic sound compatible
      arm64: dts: qcom: sdm850-lenovo-yoga: correct sound compatible
      arm64: dts: qcom: sdm845: move codec to separate file
      arm64: dts: qcom: sdm845-audio-wcd9340: commonize pinctrl
      arm64: dts: qcom: sdm845-audio-wcd9340: commonize clocks
      arm64: dts: qcom: sa8295p-adp: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sc7180: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sc8280xp: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sdm845: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sm7225: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sm8150: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sm8250: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sm8350: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sm8450: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sm8550: add specific SMMU compatible
      arm64: dts: qcom: sm8550-mtp: correct vdd-l5-l16-supply
      arm64: dts: qcom: sm8350: fixup SDHCI interconnect arguments
      arm64: dts: qcom: sm8350-hdk: align pin config node names with bindings
      arm64: dts: qcom: sm8350-hdk: correct LT9611 pin function
      arm64: dts: qcom: msm8953: correct TLMM gpio-ranges
      arm64: dts: qcom: sm6115: correct TLMM gpio-ranges
      arm64: dts: qcom: sc8280xp: correct LPASS GPIO gpio-ranges

Luca Weiss (4):
      arm64: dts: qcom: sm6350: Add camera clock controller
      arm64: dts: qcom: sm6350: Add CCI nodes
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI busses
      arm64: dts: qcom: sm6350: Use specific qmpphy compatible

Melody Olvera (5):
      dt-bindings: interconnect: Add QDU1000/QRU1000 devices
      interconnect: qcom: Add QDU1000/QRU1000 interconnect driver
      dt-bindings: clock: Add QDU1000 and QRU1000 GCC clocks
      arm64: dts: qcom: Add base QDU1000/QRU1000 DTSIs
      arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs

Neil Armstrong (2):
      arm64: dts: qcom: sm8550: fix DSI controller compatible
      arm64: dts: qcom: pmk8550: fix PON compatible

Petr Vorel (1):
      arm64: dts: qcom: msm8992-lg-bullhead: Enable regulators

Rajendra Nayak (1):
      arm64: dts: qcom: sc7280: Add a herobrine CRD Pro SKU

Richard Acayan (1):
      arm64: dts: qcom: sdm670: add interconnects

Robert Marko (1):
      arm64: dts: qcom: ipq8074: add QFPROM node

Yang Xiwen (1):
      arm64: dts: qcom: msm8916-thwc: Add initial device trees

 .../bindings/clock/qcom,qdu1000-gcc.yaml           |   51 +
 .../bindings/clock/qcom,sm6350-camcc.yaml          |   49 +
 .../bindings/interconnect/qcom,qdu1000-rpmh.yaml   |   70 +
 arch/arm64/boot/dts/qcom/Makefile                  |    6 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |    7 +
 arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts    |   39 +
 arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts  |   39 +
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |  250 ++++
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |   41 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   25 +-
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts           |  453 +++++++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              | 1333 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   12 +-
 arch/arm64/boot/dts/qcom/qru1000-idp.dts           |  453 +++++++
 arch/arm64/boot/dts/qcom/qru1000.dtsi              |   26 +
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |    4 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |    6 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   11 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    4 +-
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   |    4 -
 .../boot/dts/qcom/sc7280-herobrine-crd-pro.dts     |   14 +
 .../boot/dts/qcom/sc7280-herobrine-evoker.dtsi     |    1 +
 .../boot/dts/qcom/sc7280-herobrine-pro-sku.dtsi    |    8 +
 .../boot/dts/qcom/sc7280-herobrine-villager.dtsi   |    1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   18 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    4 -
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |   10 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    7 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |    6 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   20 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   56 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   20 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    6 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  203 ++-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   40 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   29 +
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |    4 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    6 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    6 +-
 arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi       |   87 ++
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   24 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   19 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   60 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   18 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   16 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  328 +++--
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  195 ++-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   24 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    6 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    6 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    6 +-
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |    4 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   12 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    6 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts   |  630 +++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |    4 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   12 +-
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |    4 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   46 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |    8 +-
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |   14 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   69 +-
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/qdu1000.c                | 1067 ++++++++++++++++
 drivers/interconnect/qcom/qdu1000.h                |   95 ++
 include/dt-bindings/clock/qcom,qdu1000-gcc.h       |  175 +++
 include/dt-bindings/clock/qcom,sm6350-camcc.h      |  109 ++
 .../dt-bindings/interconnect/qcom,qdu1000-rpmh.h   |   98 ++
 80 files changed, 6086 insertions(+), 461 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qdu1000-rpmh.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qdu1000-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qdu1000.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qru1000-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qru1000.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-pro-sku.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
 create mode 100644 drivers/interconnect/qcom/qdu1000.c
 create mode 100644 drivers/interconnect/qcom/qdu1000.h
 create mode 100644 include/dt-bindings/clock/qcom,qdu1000-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6350-camcc.h
 create mode 100644 include/dt-bindings/interconnect/qcom,qdu1000-rpmh.h
