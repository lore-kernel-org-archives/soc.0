Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D04C77B61
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 03:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 793F9C433A0; Fri, 14 Apr 2023 03:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE17C433D2;
	Fri, 14 Apr 2023 03:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681441932;
	bh=IE+7VM4CIDA8/yImGo7hPPuzp8utm/dJMd53Vyrb8Dc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=mywezqI3wq6Db5RJIZSAPDIRfQQkmQgd/vW7/JXNqj1UspBl+B0SG29MbJUBnc6mj
	 20OKj51KLnG0ieWT1e4gx/YHwcrk8IVLr850Gx/I5/t0BefUtg2rWpOvp+c2+EGj/Y
	 3NuZ1so7FVVNBm06vj3CQ7iqwz3mYiANe/nzmGcaDFCAGO3gvKgCtzOBdnqEftDoGu
	 bHfDI24heiUx+nXBa7AO1wNz2ZYcBO0BjleX/MKZKKjRR9cwfCMwm18O5V3d6nweTM
	 PXDHHVrV23ycTt+lb2nnNBR85tlPSttqe0upSGC9NM9HdsjVkwE5YFE8h4sAbrfx9Q
	 f86ZAGCHWU0Vw==
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
	Douglas Anderson <dianders@chromium.org>,
	Dylan Van Assche <me@dylanvanassche.be>,
	Adam Skladowski <a39.skl@gmail.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Lux Aliaga <they@mint.lgbt>,
	Petr Vorel <pvorel@suse.cz>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] More Qualcomm ARM64 Devicetree updated for v6.4
Date: Thu, 13 Apr 2023 20:15:50 -0700
Message-Id: <20230414031550.2412379-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 105560b4fca4df0d42dba6656105b5e4131d8ad3:

  arm64: dts: qcom: sc8280xp-x13s: Add bluetooth (2023-04-04 20:51:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.4-2

for you to fetch changes up to 8d58a8c0d930c52dd30bd50af24b786d55509cbf:

  arm64: dts: qcom: Add base qrb4210-rb2 board dts (2023-04-11 05:44:51 -0700)

----------------------------------------------------------------
More Qualcomm ARM64 Devicetree updated for v6.4

Devicetree for the QCM2210/QCM2290 is introduced. Support for the RB1
board is introduced on QRB2210, RB2 on QRB4210, the AL02 board on
IPQ9574, the MI01.6 board is introduced on IPQ5332 and initial support
for Xiaomi Mi A3 is introduced on SM6125.

Support for the output-enable/disable flag is introduced in the
pinctrl-msm driver, and the non-standard "input-enable" is dropped from
a range of platforms.

A wide range of smaller fixes are introduced, based on Devicetree
validation.

MSM8953 gains LPASS, MPSS and Wireless subsystem support.

The iommus property is removed from PCIe nodes in all platforms, as the
only the child devices should be associated with iommu groups, through
the existing iommu-map property.

A few QUP instances are introduced on the IPQ5332 platform, and support
for the MI01.6 board is introduced.

The reserved-memory map on Huawei Nexus 6P is updated with the addition
of splash screen framebuffer memory and adjustment to the reserved
memory region overlapping the smem region.

Regulators are introduces for the SA8775P Ride platform.

A regulator is marked always-on, for correctness, on Trogdor. Pinconf
fixes are introduced to both sc7180 and sc7280 devices. A dedicated
reviewers list is added for boards relevant to the Chromebook engineers.

A set of pinconf fixes are introduced for sc8280xp, labels are
introduced for Soundwire nodes.

The sensor core remoteproc and FastRPC thereon, is introduce in SDM845
and enabled for OnePlus 6/6T and Shift Shift6mq.

RMTFS, remoteprocs, ath10k and ramoops is introduced for the Lenovo Tab
P11.

UFS support is introduced on SM6125.

SM8150 no longer defines the GPU to be in headless mode by default, GPU
speedbins are introduced.

GPU speedbins are introduced for SM8250 as well, as is support for
display on Xiaomi Mi Pad 5 Pro, with two different panels supported.

Soundwire controllers, ADSP audio codec macros and the Inline Crypto
Engine support is added to the SM8550 platform.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: sm8550: Add the Inline Crypto Engine node

Adam Skladowski (3):
      arm64: dts: MSM8953: Add wcnss nodes
      arm64: dts: MSM8953: Add mpss nodes
      arm64: dts: MSM8953: Add lpass nodes

Bartosz Golaszewski (1):
      arm64: dts: qcom: sa8775p-ride: add PMIC regulators

Bhupesh Sharma (1):
      arm64: dts: qcom: Add base qrb4210-rb2 board dts

Bjorn Andersson (2):
      Merge branch '20230316072940.29137-2-quic_devipriy@quicinc.com' into HEAD
      Merge branch 'ib-qcom-quad-spi' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into arm64-for-6.4

Devi Priya (2):
      dt-bindings: clock: Add ipq9574 clock and reset definitions
      arm64: dts: qcom: Add ipq9574 SoC and AL02 board support

Douglas Anderson (14):
      dt-bindings: pinctrl: qcom: tlmm should use output-disable, not input-enable
      dt-bindings: pinctrl: qcom: Add output-enable
      pinctrl: qcom: Support OUTPUT_ENABLE; deprecate INPUT_ENABLE
      MAINTAINERS: qcom: Add reviewer for Qualcomm Chromebooks
      arm64: dts: sc7180: Rename qspi data12 as data23
      arm64: dts: sc7280: Rename qspi data12 as data23
      arm64: dts: sdm845: Rename qspi data12 as data23
      arm64: dts: qcom: sc7180: Annotate l13a on trogdor to always-on
      arm64: dts: qcom: sc7180: Remove superfluous "input-enable"s from trogdor
      arm64: dts: qcom: sc7280: Remove superfluous "input-enable"s from idp-ec-h1
      arm64: dts: qcom: sdm845: Remove superfluous "input-enable"s from cheza
      arm64: dts: qcom: sc7180: Fix trogdor qspi pin config
      arm64: dts: qcom: sc7280: Fix qspi pin config
      arm64: dts: qcom: sdm845: Fix cheza qspi pin config

Dylan Van Assche (5):
      arm64: dts: qcom: sdm845: add SLPI remoteproc
      dt-bindings: firmware: qcom: scm: add SSC_Q6 and ADSP_Q6 VMIDs
      arm64: dts: qcom: sdm845: add SLPI FastRPC support
      arm64: dts: qcom: sdm845-oneplus: enable SLPI
      arm64: dts: qcom: sdm845-shift-axolotl: enable SLPI

Jianhua Lu (3):
      arm64: dts: qcom: Split elish dts into common dtsi and elish-boe dts
      arm64: dts: qcom: sm8250-xiaomi-elish-boe: Add mdss and dsi panel
      arm64: dts: qcom: sm8250-xiaomi-elish-csot: Add Xiaomi Mi Pad 5 Pro CSOT variant

Kathiravan T (2):
      arm64: dts: qcom: ipq5332: add few device nodes
      arm64: dts: qcom: ipq5332: add support for the RDP468 variant

Konrad Dybcio (15):
      arm64: dts: qcom: sm6115: Use the correct DSI compatible
      arm64: dts: qcom: sc7280: Fix up the gic node
      arm64: dts: qcom: pm8916: Fix pm8941-misc node name
      arm64: dts: qcom: sdm845-oneplus: Fix speaker GPIO node
      arm64: dts: qcom: sdm845-polaris: Drop inexistent properties
      arm64: dts: qcom: Add initial QCM2290 device tree
      arm64: dts: qcom: Add initial PM2250 device tree
      arm64: dts: qcom: Add initial QTI RB1 device tree
      arm64: dts: qcom: sm6115-j606f: Add ramoops node
      arm64: dts: qcom: sm6115: Add RMTFS
      arm64: dts: qcom: sm6115p-j606f: Enable remoteprocs
      arm64: dts: qcom: sm6115p-j606f: Enable ATH10K WiFi
      arm64: dts: qcom: sm8150: Don't start Adreno in headless mode
      arm64: dts: qcom: sm8150: Add GPU speedbin support
      arm64: dts: qcom: sm8250: Add GPU speedbin support

Krzysztof Kozlowski (33):
      arm64: dts: qcom: sc8280xp: label the Soundwire nodes
      arm64: dts: qcom: sm8450: label the Soundwire nodes
      arm64: dts: qcom: sc8280xp: simplify interrupts-extended
      arm64: dts: qcom: sm8250: simplify interrupts-extended
      arm64: dts: qcom: sm8450: simplify interrupts-extended
      arm64: dts: qcom: sm8550: add ADSP audio codec macros
      arm64: dts: qcom: ipq8074: add compatible fallback to mailbox
      arm64: dts: qcom: msm8976: add compatible fallback to mailbox
      arm64: dts: qcom: msm8998: add compatible fallback to mailbox
      arm64: dts: qcom: sdm630: add compatible fallback to mailbox
      arm64: dts: qcom: sm6115: add compatible fallback to mailbox
      arm64: dts: qcom: sm6125: add compatible fallback to mailbox
      arm64: dts: qcom: qcs404: add compatible fallback to mailbox
      arm64: dts: qcom: sc7180: add compatible fallback to mailbox
      arm64: dts: qcom: sm8150: add compatible fallback to mailbox
      arm64: dts: qcom: msm8994: remove superfluous "input-enable"
      arm64: dts: qcom: msm8996: remove superfluous "input-enable"
      arm64: dts: qcom: msm8998: remove superfluous "input-enable"
      arm64: dts: qcom: qcs404: remove superfluous "input-enable"
      arm64: dts: qcom: sc8280xp: remove superfluous "input-enable"
      arm64: dts: qcom: sdm845: remove superfluous "input-enable"
      arm64: dts: qcom: sm6125: remove superfluous "input-enable"
      arm64: dts: qcom: sm6350: remove superfluous "input-enable"
      arm64: dts: qcom: sm8250: remove superfluous "input-enable"
      arm64: dts: qcom: sm8450: remove superfluous "input-enable"
      arm64: dts: qcom: sc8280xp-crd: correct pin drive-strength
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad: correct pin drive-strength
      arm64: dts: qcom: apq8016: remove superfluous "input-enable"
      arm64: dts: qcom: sm8150: remove superfluous "input-enable"
      arm64: dts: qcom: sm8350: remove superfluous "input-enable"
      arm64: dts: qcom: msm8916-thwc-ufi001c: add function to pin config
      arm64: dts: qcom: sdm630: move DSI opp-table out of DSI node
      arm64: dts: qcom: sm8550: add Soundwire controllers

Lux Aliaga (2):
      arm64: dts: qcom: sm6125: Add UFS nodes
      arm64: dts: qcom: sm6125: Initial support for xiaomi-laurel-sprout

Manivannan Sadhasivam (1):
      arm64: dts: qcom: Remove "iommus" property from PCIe nodes

Petr Vorel (2):
      arm64: dts: qcom: msm8994-angler: Fix cont_splash_mem mapping
      arm64: dts: qcom: msm8994-angler: removed clash with smem_region

 .../bindings/clock/qcom,ipq9574-gcc.yaml           |   61 +
 .../bindings/pinctrl/qcom,tlmm-common.yaml         |    4 +-
 MAINTAINERS                                        |    6 +
 arch/arm64/boot/dts/qcom/Makefile                  |    8 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |    2 -
 arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts        |   14 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts        |  103 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   67 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts       |   84 ++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  270 ++++
 arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts  |    3 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  358 +++++
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |    5 -
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     |   11 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |    1 -
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |    1 -
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |    1 -
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |    2 -
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |    3 -
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/pm2250.dtsi               |   63 +
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 1561 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |    1 -
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  112 ++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  227 +++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |  233 +++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    9 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   41 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   14 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   25 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   14 +-
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi     |    2 -
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   13 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   27 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    4 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |    4 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   12 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   41 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   37 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   20 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    7 +-
 arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi       |    1 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    4 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   80 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    5 -
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   15 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |   35 +
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |    1 -
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |  421 ++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   67 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |    1 -
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    5 +
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    1 -
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    5 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   36 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    1 -
 .../boot/dts/qcom/sm8250-xiaomi-elish-boe.dts      |   18 +
 ...i-elish.dts => sm8250-xiaomi-elish-common.dtsi} |   79 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-csot.dts     |   18 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   35 +-
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |    1 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |    2 -
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |    1 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  315 +++-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   36 +-
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |  213 +++
 include/dt-bindings/firmware/qcom,scm.h            |    2 +
 include/dt-bindings/reset/qcom,ipq9574-gcc.h       |  164 ++
 75 files changed, 4863 insertions(+), 203 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm2250.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcm2290.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
 rename arch/arm64/boot/dts/qcom/{sm8250-xiaomi-elish.dts => sm8250-xiaomi-elish-common.dtsi} (92%)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-gcc.h
