Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6CEC7EE29
	for <soc@archiver.kernel.org>; Sun, 11 Jun 2023 00:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4789CC4339C; Sun, 11 Jun 2023 00:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D07FC433D2;
	Sun, 11 Jun 2023 00:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686444378;
	bh=ymPVeDODqJFXVXrCQbkFtnTVLFzEg4b1tLO0aNB1CKc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=bnwgdVVgPuTc3JI5lysrN6Lx4Y9yWOfvSs+b5cydci7xHXP3cWfOrKUGoWyr6ZSwW
	 q3WS4O+KPcXIfFj8P2xOCfA5gbo+rSm/fo0Sq4krddI+fPrAed3pTaEoKrjrjea10r
	 vVe9riE4N7LhMUlSypDOWmihpayCE761awSTlmEzZQjR+xqX4B1H8zy0uqPp1Y07pW
	 8619D2H+jkjnk0gpke0Be+WLQSWXiWcQA4jKVJpMIRv/RJcPzeQjl4yugHURhWVA4N
	 qIyHZTWoVmkB+hZEo2H9mWz//V+D6UJcHLzljkf0+EolzeGCec2qFVHw+p7PRgkSq5
	 vBUKbLYL9/NOw==
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
	Stephan Gerhold <stephan@gerhold.net>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shazad Hussain <quic_shazhuss@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Nikita Travkin <nikita@trvn.ru>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Dang Huynh <danct12@riseup.net>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Dylan Van Assche <me@dylanvanassche.be>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Parikshit Pareek <quic_ppareek@quicinc.com>,
	Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Vignesh Viswanathan <quic_viswanat@quicinc.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Arnaud Vrac <avrac@freebox.fr>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Robert Marko <robimarko@gmail.com>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Yang Xiwen <forbidden405@outlook.com>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v6.5
Date: Sat, 10 Jun 2023 17:49:44 -0700
Message-Id: <20230611004944.2481596-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.5

for you to fetch changes up to 20dea72a393c6d5572088b8ad01dbb9e9aca64ce:

  arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G (2023-05-30 10:18:30 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree updates for v6.5

This introduces the RDP442 and RDP433 reference devices on IPQ5332 and
IPQ9574, respectively. RDP418, RDP433, RDP449 and RDP453 on the IPQ9574
are added. On MSM8939 the Square T2 board and the Sony Xperia M4 Aqua is
added. Support for Acer Apire 1, built on the Snapdragon 7c platform is
introduced. Fxtec Pro1X on SM6115 is added.  Lastly long floating
support for SC8180X and the Lenovo Flex 5G, and the Primus reference
device, has been added.

On IPQ5332 and IPQ6018 QFPROM support is introduced, and as described
above the RDP442 board on the prior. Download mode support and various
reserved-memory regions are also introduced on IPQ6018.
IPQ8074 gains another SPI controller.

On IPQ9574 CPU frequency scaling, low speed busses, RNG, Watchdog,
qfprom, SMEM and RPM are introduced. As are support for four new board,
mentioned above.

MSM8916 gains a range of structural improvements, to better suite the
various boards supported. Regulator constraints are corrected and their
states are adjusted to match reality (e.g. always-on regulators marked
as always-on). BQ Aquaris X5 gains support for front flash LED.

As mentioned above, MSM8939 support is introduced with support for
boards from Sony and Square.

MSM8953 gains DMA support in I2C masters.

MSM8996-based Sony Xperia boards gains description of their RGB
notification LED.

On SA8775P support for UFS, USB, GPU clock and iommu controllers, PMU,
AOSS, watchdog and missing low-speed controllers are added. On the Ride
platform UFS, USB and an i2c bus are enabled.

iommu properties are added to QSPI on both SC7180 and SC7280. LPASS
clocks are adjusted and MDP node cleaned up slightly, on SC7180. As
mentioned above, support for Acer Aspire 1 is introduced.

Long lingering patches introducing SC8180X, the Lenovo Flex 5G and the
Primus reference device has been merged.

On SC8280XP ethernet is added and enabled on the automotive ride
platform. An SDC controller is introduced and enabled on the SC8280XP
CRD. On the Lenovo Thinkpad X13s and the CRD reference device the USB
SuperSpeed phy is added to the Type-C graph, to enable support for
orientation switching.

Fairphone 3 gains support for its notification LED.

On SDM845 the iommu stream for QSPI is defined, SHIFT SHIFT6mq gains
support for flash LED and the RB3 (DB845c) board gains support for
bonded/dual DSI-mode, to allow 4k output.

On SM6115 CPU idle-states, crypto engine support and SuperSpeed USB PHY
are introduced. As mentioned above Fxtec Pro1X is introduced. On the
QRB4210 Robotics Platform RB2 USB, Audio and Compute DSPs, display,
CAN-bus and GPIO LEDs are introduced, fixed regulators are described and
the SD-card description is corrected.

Support for crypto engine is added to SM8150, while Sony Xperia 1 and 5
gains SD-card support, camera regulators and GPIO line names sorted out.

SM8250 also gets support for crypto engine, and Sony Xperia 1 II and 5
II gains support for hardware video accelerator.

Crypto engine is introduced for SM8350 as well. The HDK gets the USB
Type-C graph described for Superspeed orientation switching and
DisplayPort output.

On SM8450 video clock controller and crypto engine are added, missing
opp levels are introduced and the USB Type-C graph is defined for
orientation switching and altmode.

SM8550 gains GPU and video clock controllers and missing opp levels are
added. The WCD9385 audio codec is added for the SM8550 MTP and on the
QRD PCIe, USB, audio display and flash LED are added.

----------------------------------------------------------------
Andrew Halaney (6):
      arm64: dts: qcom: sc8280xp: Add ethernet nodes
      arm64: dts: qcom: sa8540p-ride: Add ethernet nodes
      arm64: dts: qcom: sa8155p-adp: Make compatible the first property
      arm64: dts: qcom: Make -cells decimal
      arm64: dts: qcom: sa8155p-adp: Remove unneeded rgmii_phy information
      arm64: dts: qcom: sa8155p-adp: Move mtl nodes into ethernet node

André Apitzsch (1):
      arm64: dts: qcom: msm8916-longcheer-l8910: Add front flash LED

Arnaud Vrac (1):
      arm64: dts: qcom: msm8998: add blsp spi nodes

Bartosz Golaszewski (9):
      arm64: dts: qcom: sa8775p: add the PMU node
      arm64: dts: qcom: sa8775p: add UFS nodes
      arm64: dts: qcom: sa8775p-ride: enable UFS
      arm64: dts: qcom: sa8775p: add the pcie smmu node
      arm64: dts: qcom: sa8775p: add the GPU clock controller node
      arm64: dts: qcom: sa8775p: add the GPU IOMMU node
      arm64: dts: qcom: sa8775p: add the watchdog node
      arm64: dts: qcom: sa8775p: enable AOSS
      arm64: dts: qcom: sa8775p: mark the UFS controller as dma-coherent

Bhupesh Sharma (13):
      arm64: dts: qcom: qrb4210-rb2: Add SD pinctrl states
      arm64: dts: qcom: qrb4210-rb2: Fix CD gpio for SDHC2
      arm64: dts: qcom: qrb4210-rb2: Enable aDSP and cDSP remoteproc nodes
      arm64: dts: qcom: sc7280: Fix EUD dt node syntax
      arm64: dts: qcom: sm6115: Add CPU idle-states
      arm64: dts: qcom: sdm8550: Fix the BAM DMA engine compatible string
      arm64: dts: qcom: sdm845: Fix the slimbam DMA engine compatible string
      arm64: dts: qcom: sm6115: Add Crypto Engine support
      arm64: dts: qcom: sm8150: Add Crypto Engine support
      arm64: dts: qcom: sm8250: Add Crypto Engine support
      arm64: dts: qcom: sm8350: Add Crypto Engine support
      arm64: dts: qcom: sm6115: Add USB SS qmp phy node
      arm64: dts: qcom: qrb4210-rb2: Enable USB node

Bjorn Andersson (8):
      arm64: dts: qcom: sc8280xp-crd: Add QMP to SuperSpeed graph
      arm64: dts: qcom: sc8280xp-x13s: Add QMP to SuperSpeed graph
      arm64: dts: qcom: sc8280xp: Add SDC2 and enable on CRD
      Merge branch '20230524140656.7076-2-quic_tdas@quicinc.com' into HEAD
      Merge branch 'sm8450-sm8550-gpucc-binding' into arm64-for-6.5
      arm64: dts: qcom: Introduce the SC8180x platform
      arm64: dts: qcom: sc8180x: Introduce Primus
      arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G

Bryan O'Donoghue (4):
      dt-bindings: vendor-prefixes: Add Square
      arm64: dts: qcom: Add msm8939 SoC
      arm64: dts: qcom: Add Square apq8039-t2 board
      arm64: dts: qcom: Add msm8939 Sony Xperia M4 Aqua

Dang Huynh (2):
      dt-bindings: arm: qcom: Add Fxtec Pro1X
      arm64: dts: qcom: Add Fxtec Pro1X (QX1050) DTS

Devi Priya (13):
      arm64: dts: qcom: ipq9574: Update the size of GICC & GICV regions
      arm64: dts: qcom: ipq9574: Drop bias_pll_ubi_nc_clk input
      arm64: dts: qcom: ipq9574: rename al02-c7 dts to rdp433
      arm64: dts: qcom: ipq9574: Add support for APSS clock controller
      arm64: dts: qcom: ipq9574: Add RPM related nodes
      arm64: dts: qcom: ipq9574: Add SMPA1 regulator node
      arm64: dts: qcom: ipq9574: Add cpufreq support
      dt-bindings: arm: qcom: document AL02-C2 board based on IPQ9574 family
      arm64: dts: qcom: ipq9574: add support for RDP418 variant
      dt-bindings: arm: qcom: document AL02-C6 board based on IPQ9574 family
      arm64: dts: qcom: ipq9574: add support for RDP449 variant
      dt-bindings: arm: qcom: document AL02-C8 board based on IPQ9574 family
      arm64: dts: qcom: ipq9574: add support for RDP453 variant

Dmitry Baryshkov (2):
      arm64: dts: qcom: enable dual ("bonded") DSI mode for DB845c
      arm64: dts: qcom: pm8998: don't use GIC_SPI for SPMI interrupts

Dylan Van Assche (2):
      arm64: dts: qcom: pmi8998: add flash LED controller
      arm64: dts: qcom: sdm845-shift-axolotl: enable flash LEDs

Jagadeesh Kona (3):
      arm64: dts: qcom: sm8550: Add video clock controller
      dt-bindings: clock: qcom: Add SM8550 graphics clock controller
      arm64: dts: qcom: sm8550: Add graphics clock controller

Jianhua Lu (1):
      arm64: dts: qcom: sm8250-xiaomi-elish: remove redundant empty line

Kathiravan T (7):
      arm64: dts: qcom: ipq9574: add few device nodes
      dt-bindings: nvmem: qfprom: add compatible for few IPQ SoCs
      arm64: dts: qcom: ipq5332: add QFPROM node
      arm64: dts: qcom: ipq6018: add QFPROM node
      arm64: dts: qcom: ipq9574: add QFPROM node
      dt-bindings: arm: qcom: document MI01.3 board based on IPQ5332 family
      arm64: dts: qcom: ipq5332: add support for the RDP442 variant

Konrad Dybcio (16):
      dt-bindings: power: qcom,rpmpd: add missing RPMH levels
      dt-bindings: power: qcom,rpmpd: Format RPMh levels better
      arm64: dts: qcom: sm8550: Add missing RPMhPD OPP levels
      arm64: dts: qcom: qrb4210-rb2: Describe fixed regulators
      arm64: dts: qcom: qrb4210-rb2: Enable display out
      arm64: dts: qcom: qrb4210-rb2: Add GPIO LEDs
      arm64: dts: qcom: qrb4210-rb2: Enable load setting on SDHCI VQMMC
      arm64: dts: qcom: qrb4210-rb2: Enable CAN bus controller
      arm64: dts: qcom: sm8150-kumano: Add GPIO line names for PMIC GPIOs
      arm64: dts: qcom: sm8150-kumano: Add GPIO line names for TLMM
      arm64: dts: qcom: sm8150-kumano: Set up camera fixed regulators
      arm64: dts: qcom: sm8150-kumano: Enable SDHCI2
      arm64: dts: qcom: sm8250-edo: Enable Venus
      arm64: dts: qcom: msm8996-tone: Enable LPG LEDs
      arm64: dts: qcom: sm8450: Add missing RPMhPD OPP levels
      dt-bindings: clock: Add Qcom SM8450 GPUCC

Krzysztof Kozlowski (49):
      arm64: dts: qcom: sm8150: drop incorrect serial properties
      arm64: dts: qcom: sm8150: add missing qcom,smmu-500 fallback
      arm64: dts: qcom: sm8150: drop snps,dw-pcie fallback compatible
      arm64: dts: qcom: sc8280xp: correct GIC child node name
      arm64: dts: qcom: sm8550-qrd: add PCIe0
      arm64: dts: qcom: sm8550-qrd: add USB OTG
      arm64: dts: qcom: ipq6018: correct qrng unit address
      arm64: dts: qcom: msm8916: correct camss unit address
      arm64: dts: qcom: msm8916: correct MMC unit address
      arm64: dts: qcom: msm8916: correct WCNSS unit address
      arm64: dts: qcom: msm8953: correct IOMMU unit address
      arm64: dts: qcom: msm8953: correct WCNSS unit address
      arm64: dts: qcom: msm8976: correct MMC unit address
      arm64: dts: qcom: msm8994: correct SPMI unit address
      arm64: dts: qcom: msm8996: correct camss unit address
      arm64: dts: qcom: sdm630: correct camss unit address
      arm64: dts: qcom: sdm845: correct camss unit address
      arm64: dts: qcom: sm6115: correct thermal-sensor unit address
      arm64: dts: qcom: sm8350: correct DMA controller unit address
      arm64: dts: qcom: sm8350: correct PCI phy unit address
      arm64: dts: qcom: sm8350: correct USB phy unit address
      arm64: dts: qcom: sm8550: correct crypto unit address
      arm64: dts: qcom: sm8550: correct pinctrl unit address
      arm64: dts: qcom: sdm845-polaris: add missing touchscreen child node reg
      arm64: dts: qcom: ipq6018: add unit address to soc node
      arm64: dts: qcom: ipq8074: add unit address to soc node
      arm64: dts: qcom: msm8994: add unit address to soc node
      arm64: dts: qcom: msm8996: add unit address to soc node
      arm64: dts: qcom: msm8998: add unit address to soc node
      arm64: dts: qcom: sdm630: add unit address to soc node
      arm64: dts: qcom: sm6125: add unit address to soc node
      arm64: dts: qcom: sm8550-qrd: add WCD9385 audio-codec
      arm64: dts: qcom: sm8550-mtp: add WCD9385 audio-codec
      arm64: dts: qcom: pm8550: add flash LED controller
      arm64: dts: qcom: sm8550-qrd: add flash LEDs
      arm64: dts: qcom: sm8550: enable DISPCC by default
      arm64: dts: qcom: sm8550-mtp: drop redundant MDP status
      arm64: dts: qcom: sm8550-qrd: add display and panel
      arm64: dts: qcom: ipq6018: drop incorrect SPI bus spi-max-frequency
      arm64: dts: qcom: ipq8074: drop incorrect SPI bus spi-max-frequency
      arm64: dts: qcom: qdu1000: add missing qcom,smmu-500 fallback
      arm64: dts: qcom: sm8250: add missing qcom,smmu-500 fallback
      arm64: dts: qcom: sm8550-qrd: add missing PCIE1 PHY AUX clock frequency
      arm64: dts: qcom: sm6125-sprout: align ADC channel node names with bindings
      arm64: dts: qcom: sdm630-nile: correct duplicated reserved memory node
      arm64: dts: qcom: msm8996: correct /soc/bus ranges
      arm64: dts: qcom: msm8916: correct LPASS CPU clocks order
      arm64: dts: qcom: msm8996: correct MMCC clocks order
      arm64: dts: qcom: apq8096: fix fixed regulator name property

Luca Weiss (6):
      arm64: dts: qcom: pm8953: add GPIOs
      arm64: dts: qcom: msm8953: Add BLSP DMAs for I2C
      arm64: dts: qcom: sm6350: Move wifi node to correct place
      arm64: dts: qcom: Add PMI632 PMIC
      arm64: dts: qcom: sdm632-fairphone-fp3: Add notification LED
      arm64: dts: qcom: pm7250b: add missing spmi-vadc include

Neil Armstrong (7):
      arm64: dts: qcom: sm8350: add ports subnodes in usb1 qmpphy node
      arm64: dts: qcom: sm8450: add ports subnodes in usb1 qmpphy node
      arm64: dts: qcom: sm8350-hdk: Add QMP & DP to SuperSpeed graph
      arm64: dts: qcom: sm8450-hdk: Add QMP & DP to SuperSpeed graph
      arm64: dts: qcom: pmk8350: add reboot-mode node using sdam_2 nvmem
      arm64: dts: qcom: pmk8550: add reboot-mode node using sdam_2 nvmem
      arm64: dts: qcom: sm8450: add crypto nodes

Nikita Travkin (4):
      arm64: dts: qcom: sc7180: Don't enable lpass clocks by default
      arm64: dts: qcom: sc7180: Drop redundant disable in mdp
      dt-bindings: arm: qcom: Add Acer Aspire 1
      arm64: dts: qcom: Add Acer Aspire 1

Parikshit Pareek (2):
      arm64: dts: qcom: sa8775p: pmic: remove the PON modes
      arm64: dts: qcom: sa8775p: pmic: add the sdam_0 node

Poovendhan Selvaraj (2):
      arm64: dts: qcom: ipq9574: Enable the download mode support
      arm64: dts: qcom: ipq9574: Add SMEM support

Robert Marko (1):
      arm64: dts: qcom: ipq8074: Add QUP5 SPI node

Rudraksha Gupta (1):
      dt-bindings: arm: qcom: Add missing msm8960

Shazad Hussain (7):
      arm64: dts: qcom: sa8775p: add USB nodes
      arm64: dts: qcom: sa8775p-ride: enable USB nodes
      arm64: dts: qcom: sa8775p: add the QUPv3 #0 and #3 node
      arm64: dts: qcom: sa8775p: add missing i2c nodes
      arm64: dts: qcom: sa8775p: add missing spi nodes
      arm64: dts: qcom: sa8775p: add uart5 and uart9 nodes
      arm64: dts: qcom: sa8775p-ride: enable i2c11

Stephan Gerhold (15):
      arm64: dts: qcom: apq8016-sbc: Fix regulator constraints
      arm64: dts: qcom: apq8016-sbc: Fix 1.8V power rail on LS expansion
      arm64: dts: qcom: msm8916: Fix regulator constraints
      arm64: dts: qcom: msm8916: Disable audio codecs by default
      arm64: dts: qcom: pm8916: Move default regulator "-supply"s
      arm64: dts: qcom: msm8916-pm8916: Clarify purpose
      arm64: dts: qcom: msm8916: Define regulator constraints next to usage
      arm64: dts: qcom: msm8916-pm8916: Mark always-on regulators
      arm64: dts: qcom: Add msm8939-pm8916.dtsi include
      arm64: dts: qcom: msm8916: Rename &msmgpio -> &tlmm
      arm64: dts: qcom: msm8916/39: Rename &blsp1_uartN -> &blsp_uartN
      arm64: dts: qcom: msm8916/39: Use consistent name for I2C/SPI pinctrl
      arm64: dts: qcom: msm8916/39: Clean up MDSS labels
      arm64: dts: qcom: pm8916: Rename &wcd_codec -> &pm8916_codec
      arm64: dts: qcom: msm8916: Move aliases to boards

Taniya Das (2):
      dt-bindings: clock: qcom: Add SM8450 video clock controller
      arm64: dts: qcom: sm8450: Add video clock controller

Vignesh Viswanathan (2):
      arm64: dts: qcom: enable the download mode support
      arm64: dts: qcom: add few more reserved memory region

Vijaya Krishna Nivarthi (3):
      arm64: dts: qcom: sc7180: Add stream-id of qspi to iommus
      arm64: dts: qcom: sc7280: Add stream-id of qspi to iommus
      arm64: dts: qcom: sdm845: Add stream-id of qspi to iommus

Vinod Koul (7):
      arm64: dts: qcom: sc8180x: Add interconnects and lmh
      arm64: dts: qcom: sc8180x: Add thermal zones
      arm64: dts: qcom: sc8180x: Add QUPs
      arm64: dts: qcom: sc8180x: Add PCIe instances
      arm64: dts: qcom: sc8180x: Add remoteprocs, wifi and usb nodes
      arm64: dts: qcom: sc8180x: Add display and gpu nodes
      arm64: dts: qcom: sc8180x: Add pmics

Yang Xiwen (1):
      arm64: dts: qcom: msm8916-ufi: make UDC dual mode

 Documentation/devicetree/bindings/arm/qcom.yaml    |   18 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   75 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   77 +
 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |    3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |  213 +-
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            |  492 +++
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |    4 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts        |  117 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |    7 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   32 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   51 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts        |  124 +
 .../{ipq9574-al02-c7.dts => ipq9574-rdp433.dts}    |   21 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts        |   80 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts        |   80 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  343 +-
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |  135 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |  140 +-
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |  136 +-
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |  136 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |  183 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |  136 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |  150 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |    4 +-
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi         |   58 +-
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi       |  125 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  166 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   18 +-
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |    6 +-
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |    6 +-
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |    6 +-
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |  130 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts |   12 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts  |    8 +-
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |  125 +-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |  151 +-
 arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts    |    8 +-
 arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts  |   10 +-
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |  114 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |  141 +-
 .../arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts |    8 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  116 +-
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |   82 +
 .../dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts  |  183 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 2452 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   56 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    5 +-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   29 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  311 +-
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |    1 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |    6 +
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |    6 +-
 arch/arm64/boot/dts/qcom/pm8953.dtsi               |   10 +
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pmi632.dtsi               |  165 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |    6 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |   23 +
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |   23 +
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts       |    4 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  277 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   56 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |  238 ++
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi        |   23 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |  126 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 1445 ++++++-
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |  845 ++++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |    4 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    7 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   37 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  583 +++
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |  326 ++
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  706 ++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 4030 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  109 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   28 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  139 +-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |    9 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   29 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   36 +
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   22 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |    5 +-
 .../arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts |    3 +
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |  250 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  198 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |    3 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |    8 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   44 +-
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |  335 ++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   39 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    5 +
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    1 -
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   34 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   76 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   54 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   73 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   93 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   64 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  237 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   72 +-
 include/dt-bindings/clock/qcom,sm8450-gpucc.h      |   48 +
 include/dt-bindings/clock/qcom,sm8450-videocc.h    |   38 +
 include/dt-bindings/clock/qcom,sm8550-gpucc.h      |   48 +
 include/dt-bindings/power/qcom-rpmpd.h             |   38 +-
 include/dt-bindings/reset/qcom,sm8450-gpucc.h      |   20 +
 113 files changed, 16128 insertions(+), 2107 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/apq8039-t2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts
 rename arch/arm64/boot/dts/qcom/{ipq9574-al02-c7.dts => ipq9574-rdp433.dts} (67%)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi632.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8180x-primus.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8180x.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-gpucc.h
 create mode 100644 include/dt-bindings/reset/qcom,sm8450-gpucc.h
