Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98441EB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A021C433CA; Thu, 15 Jun 2023 16:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AADC433C8;
	Thu, 15 Jun 2023 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686845843;
	bh=9huE0pBeVtGxWV16VpaXs3MD1C5hdcQi/1szKAo6jWA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=b6Vru3psbo9IZL8EyTF4H8kODyX6lhqEYXqh+Upc+0GHHroJzqiD1EB2J+LA1geJI
	 +5bEUjTpBRacF1BUgNSot8XDZcC26hHUTZOtbXwmuRbxQJ5gx8VX6d2FQ9zayTDtGZ
	 I0Gz0phkroskp+O+Oe7lf/bMBWABepH0zO3dQe69Elu+vJwsZH53/K5Q0RrGR04VoP
	 BvbRqCWw4iZ6Dgww20JO0XlQom+ksVQkJ7afaM9lNshtZrOIaTUMJWcz0vT14VPj5m
	 +liT36HzO5D3scGETe65M2ymR6AeS2z97uJwJGJbolaHJ7dCUFrERsXCouZTkXJ14U
	 cuIi/wgvN0+nw==
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
	Stephan Gerhold <stephan@gerhold.net>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Anusha Rao <quic_anusha@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Artur Weber <aweber.kernel@gmail.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Robert Marko <robimarko@gmail.com>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [GIT PULL] More Qualcomm ARM64 DTS changes for v6.5
Date: Thu, 15 Jun 2023 09:20:43 -0700
Message-Id: <20230615162043.1461624-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 20dea72a393c6d5572088b8ad01dbb9e9aca64ce:

  arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G (2023-05-30 10:18:30 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.5-2

for you to fetch changes up to c2951581e69c8fef39120068d1ef5b1974d54ff1:

  Revert "arm64: dts: adapt to LP855X bindings changes" (2023-06-15 08:45:29 -0700)

----------------------------------------------------------------
More Qualcomm ARM64 DTS changes for v6.5

This introduces support for the Qualcomm SDX75 platform, with the IDP
reference board. On IPQ5332 the RDP474 board is added and on IPQ9574 the
RDP454 is introduced.
On SC8280XP, and hence Lenovo ThinkPad X13s, GPU support is added.

For QDU1000, SDM845, SM670, SC8180X, SM6350 and SM8550 the RSC is added
to the CPU cluster power-domain to flush sleep & wake votes as the
cluster goes down.

On IPQ5332 additional reserved-memory regions to improve post mortem
debugging. UART1 is added. The MI01.2 board is renamed RDP441 and the
RDP474 is added.

On IPQ8074 critical thermal trip points are defined.

As with IPQ5332 additional reserved-memory regions are used to improve
post mortem debugging. Thermal sensors (tsens) are added and zones
defined. The crypto engine is added, and support for the RDP454 board is
added.

Across MSM8916 and MSM8939 pinctrl state definitions are cleaned up and
the purpose of msm8939-pm8916 is documented. MSM8939 has regulator
definitions cleaned up, following to the previous effort on MSM8916.

CPU Bus Fabric scaling support is added to MSM8996 Pro.

On QCM2290 CPU idle states are added.

For QDU1000 SDHCI is introduced and enabled on the IDP to gain eMMC
support. IMEM and PIL information regions are defined for improved post
mortem debugging.

The Qualcomm Robotics RB2 kit gets its on-board buttons described.

A few fixes are introduced for the newly merged SC8180X, in particluar
the DisplayPort blocks are moved to the MMCX power domain to avoid power
being reduced prematurely during boot.

The SC8280XP GPU is added and enabled for the Lenovo Thinkpad X13s,
and resets for the soundwire controllers are added. The OUI is
specified for ethernet phys on SA8540P Ride platform, to avoid reset
issues.

Charger description is added to the PMI8998 PMIC and enabled across
OnePlus 6/6T, SHIFT SHIFT6mq and Xiaomi Pocophone F1.

On SM6350 CPU idle states and UART1 are added. And SM6375 gains GPU
clock controller and IOMMU definitions.

The Fairphone FP4 gains Bluetooth support.

SM8150 is transitioned to use 2 interconnect-cells, and the USB
interconnect path is described to ensure buses are adequately voted for.

The same changes are done for SM8250, and the resolution of the
static framebuffer on Sony Xperia 1 II and 5 II are corrected.

The USB bus paths are also added to SM8350, SM8450 and SM8550.

On SM8550 DisplayPort nodes are added, as is the PWM controller for
driving the notification LED and the RTC is enabled. For the MTP and QRD
boards, the soundcard and audio codecs are defined.

A Tegra change, related to LP855X binding changes, was accidentally
picked up and dropped again later.

A number of DeviceTree fixes identified through validation was
introduced as well. Additionally a few nodes got their default status
changed to avoid unnecessarily having to enable them (e.g. the mdp/dpu
node).

----------------------------------------------------------------
Abel Vesa (7):
      arm64: dts: qcom: sm8150: Use 2 interconnect cells
      arm64: dts: qcom: sm8150: Add missing interconnect paths to USB HCs
      arm64: dts: qcom: sm8250: Use 2 interconnect cells
      arm64: dts: qcom: sm8250: Add missing interconnect paths to USB HCs
      arm64: dts: qcom: sm8350: Add missing interconnect paths to USB HCs
      arm64: dts: qcom: sm8450: Add missing interconnect paths to USB HC
      arm64: dts: qcom: sm8550: Add missing interconnect path to USB HC

Andrew Halaney (1):
      arm64: dts: qcom: sa8540p-ride: Specify ethernet phy OUI

Anusha Rao (3):
      arm64: dts: qcom: ipq9574: add few more reserved memory region
      dt-bindings: clock: Add crypto clock and reset definitions
      arm64: dts: qcom: ipq9574: Enable crypto nodes

Artur Weber (1):
      arm64: dts: adapt to LP855X bindings changes

Bjorn Andersson (9):
      arm64: dts: qcom: sc8180x-primus: dispcc is already okay
      arm64: dts: qcom: sc8180x: Fix adreno smmu compatible
      arm64: dts: qcom: sc8180x: Move DisplayPort for MMCX
      Merge branch '20230512122347.1219-3-quic_tdas@quicinc.com' into arm64-for-6.5
      Merge branch '20230608125315.11454-2-srinivas.kandagatla@linaro.org' into arm64-for-6.5
      Merge branch '20230526161129.1454-2-quic_anusha@quicinc.com' into arm64-for-6.5
      arm64: dts: qcom: sc8280xp: Add GPU related nodes
      arm64: dts: qcom: sc8280xp: Enable GPU related nodes
      Revert "arm64: dts: adapt to LP855X bindings changes"

Caleb Connolly (4):
      arm64: dts: qcom: pmi8998: enable rradc by default
      arm64: dts: qcom: pmi8998: add charger node
      arm64: dts: qcom: sdm845-oneplus: enable pmi8998 charger
      arm64: dts: qcom: sdm845-shift-axolotl: enable pmi8998 charger

Dmitry Baryshkov (13):
      arm64: dts: qcom: sc7280: Don't disable MDP explicitly
      arm64: dts: qcom: sm8350-hdk: remove useless enablement of mdss_mdp
      arm64: dts: qcom: sm8450-hdk: remove useless enablement of mdss_mdp
      arm64: dts: qcom: qrb5165-rb5: remove useless enablement of mdss_mdp
      arm64: dts: qcom: msm8953: rename labels for DSI nodes
      arm64: dts: qcom: msm8996: rename labels for DSI nodes
      arm64: dts: qcom: sc7180: rename labels for DSI nodes
      arm64: dts: qcom: sc7280: rename labels for DSI nodes
      arm64: dts: qcom: sc8180x: rename labels for DSI nodes
      arm64: dts: qcom: sdm630: rename labels for DSI nodes
      arm64: dts: qcom: sdm845: rename labels for DSI nodes
      arm64: dts: qcom: sm8250: rename labels for DSI nodes
      arm64: dts: qcom: msm8996: rename labels for HDMI nodes

Imran Shaik (1):
      dt-bindings: clock: qcom: Add GCC clocks for SDX75

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable pmi8998 charger

Kathiravan T (5):
      dt-bindings: arm: qcom: document MI01.9 board based on IPQ5332 family
      arm64: dts: qcom: ipq5332: add support for the RDP474 variant
      arm64: dts: qcom: ipq5332: rename mi01.2 dts to rdp441
      arm64: dts: qcom: ipq5332: define UART1
      arm64: dts: qcom: ipq5332: add few more reserved memory region

Komal Bajaj (3):
      arm64: dts: qcom: qdu1000: Add IMEM and PIL info region
      arm64: dts: qcom: qdu1000: Add SDHCI node
      arm64: dts: qcom: qdu1000-idp: add SDHCI for emmc

Konrad Dybcio (10):
      arm64: dts: qcom: sm6350: Add PSCI idle states
      arm64: dts: qcom: qdu1000: Flush RSC sleep & wake votes
      arm64: dts: qcom: sc8180x: Flush RSC sleep & wake votes
      arm64: dts: qcom: sdm670: Flush RSC sleep & wake votes
      arm64: dts: qcom: sdm845: Flush RSC sleep & wake votes
      arm64: dts: qcom: sm6350: Flush RSC sleep & wake votes
      arm64: dts: qcom: sm8550: Flush RSC sleep & wake votes
      arm64: dts: qcom: qcm2290: Add CPU idle states
      arm64: dts: qcom: sm6375: Add GPUCC and Adreno SMMU
      arm64: dts: qcom: qrb4210-rb2: Enable on-board buttons

Krzysztof Kozlowski (4):
      arm64: dts: qcom: sm8550-qrd: add WSA8845 speakers
      arm64: dts: qcom: sm8550-mtp: add WSA8845 speakers
      arm64: dts: qcom: sm8550-qrd: add sound card
      arm64: dts: qcom: sm8550-mtp: add sound card

Luca Weiss (2):
      arm64: dts: qcom: sm6350: add uart1 node
      arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth

Marijn Suijten (1):
      arm64: dts: qcom: sm8250-edo: Panel framebuffer is 2.5k instead of 4k

Neil Armstrong (6):
      arm64: dts: qcom: sm8550: fix low_svs RPMhPD labels
      arm64: dts: qcom: sm8550: add display port nodes
      arm64: dts: qcom: pm8550: add PWM controller
      arm64: dts: qcom: sm8550-qrd: add notification RGB LED
      arm64: dts: qcom: pmk8550: always enable RTC PMIC device
      arm64: dts: qcom: sm8550-qrd: enable PMIC Volume and Power buttons

Poovendhan Selvaraj (2):
      dt-bindings: arm: qcom: document AL02-C9 board based on IPQ9574 family
      arm64: dts: qcom: ipq9574: add support for RDP454 variant

Robert Marko (1):
      arm64: dts: qcom: ipq8074: add critical thermal trips

Rohit Agarwal (2):
      dt-bindings: arm: qcom: Document SDX75 platform and boards
      arm64: dts: qcom: Add SDX75 platform and IDP board support

Rudraksha Gupta (1):
      dt-bindings: arm: qcom: Add Samsung Galaxy Express

Srinivas Kandagatla (3):
      dt-bindings: clock: Add LPASSCC and reset controller for SC8280XP
      dt-bindings: clock: Add LPASS AUDIOCC and reset controller for SC8280XP
      arm64: dts: qcom: sc8280xp: add resets for soundwire controllers

Stephan Gerhold (14):
      arm64: dts: qcom: msm8916/39: Fix SD card detect pinctrl
      arm64: dts: qcom: msm8916/39: Consolidate SDC pinctrl
      arm64: dts: qcom: apq8016-sbc: Drop unneeded MCLK pinctrl
      arm64: dts: qcom: msm8916/39: Cleanup audio pinctrl
      arm64: dts: qcom: msm8916/39: Rename wcnss pinctrl
      arm64: dts: qcom: msm8916: Drop msm8916-pins.dtsi
      arm64: dts: qcom: msm8939-pm8916: Add missing pm8916_codec supplies
      arm64: dts: qcom: msm8939: Disable lpass_codec by default
      arm64: dts: qcom: msm8939-sony-tulip: Fix l10-l12 regulator voltages
      arm64: dts: qcom: msm8939-sony-tulip: Allow disabling pm8916_l6
      arm64: dts: qcom: msm8939: Fix regulator constraints
      arm64: dts: qcom: msm8939-pm8916: Clarify purpose
      arm64: dts: qcom: msm8939: Define regulator constraints next to usage
      arm64: dts: qcom: msm8939-pm8916: Mark always-on regulators

Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq9574: add tsens node
      arm64: dts: qcom: ipq9574: add thermal zone nodes

Yassine Oudjana (1):
      arm64: dts: qcom: msm8996pro: Add CBF scaling support

 Documentation/devicetree/bindings/arm/qcom.yaml    |  12 +
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      |  60 ++
 .../devicetree/bindings/clock/qcom,sdx75-gcc.yaml  |  65 ++
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |  19 +-
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            | 109 +---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |  50 +-
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |   6 +-
 .../{ipq5332-mi01.2.dts => ipq5332-rdp441.dts}     |   0
 arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts        | 112 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  24 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  96 +++
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        |  80 +++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              | 250 +++++++-
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |  15 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |  15 +-
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |  15 +-
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |  15 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |  14 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   9 -
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |  15 +-
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi         | 582 ------------------
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  15 +-
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |  15 +-
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |  15 +-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |   9 -
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |   4 -
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |   9 -
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 489 ++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       | 119 +++-
 .../dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts  | 113 +---
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 166 +++--
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  40 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts           |   4 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |  30 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  22 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |  18 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  52 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-natrium.dts    |  18 +-
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi           |  51 ++
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |   4 -
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |  10 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |  22 +-
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |   1 -
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  61 ++
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts           |  23 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              | 111 ++++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  37 ++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  50 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   1 +
 arch/arm64/boot/dts/qcom/sa8540p.dtsi              |   8 +
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |  32 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |  14 +-
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi     |  10 +-
 .../dts/qcom/sc7180-trogdor-quackingstick-r0.dts   |   2 +-
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |  52 +-
 .../boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |  10 +-
 .../qcom/sc7180-trogdor-wormdingler-rev1-boe.dts   |   2 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  46 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  28 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  22 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   4 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   8 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |   4 -
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  34 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  14 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  14 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 196 ++++++
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  16 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  20 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |  24 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   1 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  40 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 102 ++--
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  86 +--
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  78 +--
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   4 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   4 +
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  86 +--
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |  74 +--
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |  82 +--
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |  76 +--
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  37 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  40 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |  33 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                | 670 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 205 +++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |  37 ++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 103 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  68 ++-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |   7 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 138 ++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 116 ++--
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   4 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   8 +
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   4 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   4 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            | 129 ++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 192 ++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 100 ++-
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |   4 +
 include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h  |  17 +
 include/dt-bindings/clock/qcom,sdx75-gcc.h         | 193 ++++++
 include/dt-bindings/reset/qcom,ipq9574-gcc.h       |   1 +
 104 files changed, 4545 insertions(+), 1835 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml
 rename arch/arm64/boot/dts/qcom/{ipq5332-mi01.2.dts => ipq5332-rdp441.dts} (100%)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdx75-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdx75.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h
 create mode 100644 include/dt-bindings/clock/qcom,sdx75-gcc.h
