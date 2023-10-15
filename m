Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69445CDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 19:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34CB3C433CC; Sun, 15 Oct 2023 19:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE5AC433C9;
	Sun, 15 Oct 2023 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697396840;
	bh=CkVRuBuhv6T1yUDF+yJffg89lD0RdoZ14dDT4qPmquU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=FmB2YMkUivxc0R6okfvFOkAY/t5hnQjYbWyQ1Rq2GjyXm64+U2eqA2H1MpMTxpn0S
	 bQeSlt9BuJxr4/dWHDz1NAtc0g1MCoREBXVQwy2K4JeypkmM65D2P2Ys4OfAznzSKo
	 3/z11BCEyP6pccneuVQo6qN1Qg7jqhrX5nEA9Clx+eFMXkl69i9KpL1PFIopOjRhvE
	 3wLsnW91iNK4db/Q2vUuHHIgP4rrdIhvWN/h0U5n3HYDNkT926JPEn6MSupM0wtd8N
	 RlMmuZfdjgNHpfnVPhADa3ia//NZ2mp0CLMMiF931lpsnRhtD0Sk3JHTqYkODG8Dsb
	 mZCrTneM3qOwA==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Vignesh Viswanathan <quic_viswanat@quicinc.com>,
	David Wronek <davidwronek@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Adam Skladowski <a39.skl@gmail.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	David Heidelberg <david@ixit.cz>,
	Gaurav Kohli <quic_gkohli@quicinc.com>,
	Robert Marko <robimarko@gmail.com>,
	Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Jasper Korten <jja2000@gmail.com>,
	Markuss Broks <markuss.broks@gmail.com>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Siddharth Manthan <siddharth.manthan@gmail.com>,
	Vignesh Raman <vignesh.raman@collabora.com>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v6.7
Date: Sun, 15 Oct 2023 12:11:05 -0700
Message-ID: <20231015191107.854658-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.7

for you to fetch changes up to 33e9032a1875bb1aee3c68a4540f5a577ff44130:

  arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators (2023-09-27 16:07:27 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree updates for v6.7

The SM7125 platform is introduced, with support for Xiaomi Redmi Note 9
Pro. Support for Fairphone 5, on QCM6490, and BQ Aquaris M5, on MSM8939,
are introduced.

With the various QMP PHY bindings having been refactored, SC7180,
SC7280, SDM845, SM8150, and SM8250 are transitioned to the new USB/DP
combo PHY binding. IPQ6018, IPQ8074 MSM8998, SC7280, SC8180X, SDM845,
SM8150, SM8250, and SM8450 are transitioned to the new PCIe PHY binding,
and SC8180X is transitioned to the new UFS phy binding.

The UFS power supply situation is clarified, and a range of boards
across MSM8996, MSM8998, SM4250, SM6115, SM6125, SM8350, SM8450, and
SM8550 receives corrections for this.

On IPQ5018 watchdog support is introduced, and the SCM driver has SDI
(debug image) enabled - so that it can be disabled. On IPQ5332 USB is
enabled. The hwspinlock identifier is corrected across IPQ5332, IPQ6018,
IPQ8074 and IPQ9574.

The reserved-memory ranges for the remoteprocs on MSM8916 boards are
refactored, to reduce the amount of duplicated boilerplate definitions.
A number of nodes are transitioned to be disabled by default, to
facilitate new boards.
Samsung Galaxy Tab A 8.0 and Samsung Galaxy Tab A 9.7 gains display
support, and the latter capacitive keys. Samsung Galaxy J5 gains
accelerometer support. The Dragonboard 410c gains missing ADC7533
regulator definition, and an overlay forcing the board to operate in
host mode, for automation purposes.

On MSM8976, the outgoing IPC bits for modem and wcss are corrected, and
reserved-memory regions are updated.

Incorrect reserved-memory regions are also corrected for MSM8992 and
MSM8994 devices.

The QRB2210 RB1 board gets debug UART moved per hardware update.
regulator voltage ranges are corrected, remoteprocs are enabled, USB
SuperSpeed PHY is enabled, and GPIO LEDs are introduced for Bluetooth,
WiFi and a user LED.

Interrupts are described for the SGMII PHYs on SA8775P Ride platform,
and the inline crypto engine is introduced for UFS.

On SC7180 the audio DSP remoteproc is introduced. Additional SKUs of the
Lazor boards are added.The RT5682 audio codec part is reorganized to be
easier to maintain. On Trogdor devices, the touchscreen and display
panels are linked to improve the power cycling behavior across the two.

On SC7280 the cpuidle states are rewritten to support OS-initiated PCSI
mode. LMH interrupts are added, to receive feedback when throttling
occurs. The embedded usb debugger (EUD) description  and the dummy
usb-c-connector node is removed, as this is not correctly described. The
USB3 pipe clock input of the global clock controller is properly
described.

Modem remoteproc is introduced on SDM630, and the SDM670 PDC mapping is
corrected.

On the SDM845 MTP PCIe support is introduced. The volumn down and reset
buttons are defined. Remoteproc firmware names and the WiFI
configuration is corrected.
On Sony Xperia XZ2, XZ2 Compact, and XZ3 GPIO lines names are provided
for TLMM and PMICs. The camera regulators are also added.

Display hardware blocks are added to SM6125, and enabled on Sony Xperia
10 II.

The ref clock is wired up to PCIe PHY on SM8150.

On SM8250/QRB5165, and the RB5 board, the DisplayPort controller and the
TCPM is introduced, with all the plumbing to get USB role and
orientation switching, as well as DisplayPort altmode to work.
Interconnects and power-domains are also described for the QUPs on this
platform.

Previously ignored PMICs are described for the SM8350 Hardware
Development Kit (HDK), and PMR735a regulators are introduced. The
pinctrl state for uart18 is corrected.

On SM8450 HDK audio routes are corrected, to enable the analog
microphones on the board. The addition of the PRNG is reverted, in favor
of an upcoming additon of a true RNG.

Constants are replaced with QCOM_SCM_VMID_* defines on a variety of
boards.

The SM8550 QRD board gets Bluetooth support, and the camera clock
controller is described.

Additionally, a number of fixes are introduced in a variety of platforms
and boards, to align with Devicetree bindings.

----------------------------------------------------------------
Adam Skladowski (2):
      arm64: dts: qcom: msm8976: Split lpass region
      arm64: dts: qcom: msm8976: Fix ipc bit shifts

Alexey Minnekhanov (1):
      arm64: dts: qcom: sdm630: Add support for modem remoteproc

Andrew Halaney (2):
      arm64: dts: qcom: sa8775p-ride: Describe sgmii_phy0 irq
      arm64: dts: qcom: sa8775p-ride: Describe sgmii_phy1 irq

André Apitzsch (2):
      dt-bindings: arm: qcom: Add BQ Aquaris M5
      arm64: dts: qcom: msm8939-longcheer-l9100: Add initial device tree

Bartosz Golaszewski (1):
      arm64: dts: qcom: sa8775p: enable the inline crypto engine

Bjorn Andersson (1):
      Merge branch '20230707035744.22245-2-quic_jkona@quicinc.com' into arm64-for-6.7

Bryan O'Donoghue (6):
      arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching
      arm64: dts: qcom: pm8150b: Add a TCPM description
      arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
      arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
      arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1
      arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy

Danila Tikhonov (1):
      arm64: dts: qcom: pm8150l: Add wled node

David Heidelberg (2):
      arm64: dts: qcom: sdm845: Fix PSCI power domain names
      arm64: dts: qcom: sdm845: cheza doesn't support LMh node

David Wronek (4):
      dt-bindings: arm: qcom: Document SM7125 and xiaomi,joyeuse board
      arm64: dts: qcom: pm6150: Add resin and rtc nodes
      arm64: dts: qcom: Add SM7125 device tree
      arm64: dts: qcom: Add support for the Xiaomi SM7125 platform

Dmitry Baryshkov (29):
      arm64: dts: qcom: sc7180: switch USB+DP QMP PHY to new style of bindings
      arm64: dts: qcom: sc7280: link usb3_phy_wrapper_gcc_usb30_pipe_clk
      arm64: dts: qcom: sc7280: switch USB+DP QMP PHY to new style of bindings
      arm64: dts: qcom: sdm845: switch USB+DP QMP PHY to new style of bindings
      arm64: dts: qcom: sm8150: switch USB+DP QMP PHY to new style of bindings
      arm64: dts: qcom: sm8250: switch USB+DP QMP PHY to new style of bindings
      arm64: dts: qcom: sc8180x: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sm8250: Add DisplayPort device node
      arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
      arm64: dts: qcom: qrb5165-rb5: enable displayport controller
      arm64: dts: qcom: qrb5165-rb5: enable DP altmode
      arm64: dts: qcom: ipq6018: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: ipq8074: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: msm8998: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: sc7280: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: sc8180x: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: sdm845: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: sm8150: add ref clock to PCIe PHYs
      arm64: dts: qcom: sm8150: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: sm8250: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: sm8450: switch PCIe QMP PHY to new style of bindings
      arm64: dts: qcom: sm8350: fix pinctrl for UART18
      arm64: dts: qcom: sm8350-hdk: add missing PMICs
      arm64: dts: qcom: sm8350-hdk: add pmr735a regulators
      arm64: dts: qcom: sdm845-mtp: fix WiFi configuration
      arm64: dts: qcom: sdm845-mtp: specify wifi variant
      arm64: dts: qcom: sdm845-mtp: switch to mbn firmware
      arm64: dts: qcom: sdm845-mtp: enable Vol-/reset button
      arm64: dts: qcom: sdm845-mtp: enable PCIe support

Douglas Anderson (3):
      arm64: dts: qcom: sc7180: Link trogdor touchscreens to the panels
      arm64: dts: qcom: sc7180: Move trogdor rt5682s bits to a fragment
      arm64: dts: qcom: sc7180: Reorganize trogdor rt5682 audio codec dts

Gaurav Kohli (2):
      arm64: dts: qcom: msm8916: Fix iommu local address range
      arm64: dts: qcom: msm8939: Fix iommu local address range

Jagadeesh Kona (5):
      dt-bindings: clock: qcom: Add SM8550 camera clock controller
      clk: qcom: clk-alpha-pll: Add support for lucid ole pll configure
      clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
      clk: qcom: camcc-sm8550: Add support for qdss, sleep and xo clocks
      arm64: dts: qcom: sm8550: Add camera clock controller

Jasper Korten (1):
      arm64: dts: qcom: msm8916-samsung-gt510: Add display panel

Konrad Dybcio (13):
      arm64: dts: qcom: sm8250-edo: Set UART alias and stdout-path
      arm64: dts: qcom: sm8250: Add interconnects and power-domains to QUPs
      arm64: dts: qcom: sc7280: Remove qcom,adsp-bypass-mode
      arm64: dts: qcom: sc7280: Add missing LMH interrupts
      arm64: dts: qcom: qrb2210-rb1: Swap UART index
      arm64: dts: qcom: qrb2210-rb1: Fix regulators
      arm64: dts: qcom: qrb2210-rb1: Enable remote processors
      arm64: dts: qcom: qrb2210-rb1: Add GPIO LEDs
      arm64: dts: qcom: qrb2210-rb1: Hook up USB3
      arm64: dts: qcom: sdm670: Fix pdc mapping
      arm64: dts: qcom: sdm845-tama: Add GPIO line names for TLMM
      arm64: dts: qcom: sdm845-tama: Add GPIO line names for PMIC GPIOs
      arm64: dts: qcom: sdm845-tama: Add camera GPIO regulators

Krzysztof Kozlowski (28):
      arm64: dts: qcom: sm8550-mtp: use correct UFS supply
      arm64: dts: qcom: sm8550-qrd: use correct UFS supply
      arm64: dts: qcom: sm8450-hdk: add UFS host controller supply
      arm64: dts: qcom: sm8450-qrd: add UFS host controller supply
      arm64: dts: qcom: sm8350-hdk: add UFS host controller supply
      arm64: dts: qcom: sm8350-mtp: add UFS host controller supply
      arm64: dts: qcom: sm8450-hdk: add other analogue microphones
      arm64: dts: qcom: msm8994: fix duplicated @6c00000 reserved memory
      arm64: dts: qcom: msm8992-libra: drop duplicated reserved memory
      arm64: dts: qcom: sc8180x: align USB DWC3 clocks with bindings
      arm64: dts: qcom: sdm630: align USB DWC3 clocks with bindings
      arm64: dts: qcom: sc7280-crd: add Bluetooth VDDIO supply
      arm64: dts: qcom: sc7280: drop incorrect EUD port on SoC side
      arm64: dts: qcom: sc8180x: drop incorrect cell-index from SPMI
      arm64: dts: qcom: sm7225-fp4: Revert "arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics"
      arm64: dts: qcom: sm6125-sprout: drop incorrect UFS phy max current
      arm64: dts: qcom: sm6125-sprout: correct UFS pad supply
      arm64: dts: qcom: sm6115-pro1x: correct UFS pad supply
      arm64: dts: qcom: sm6115p-j606f: correct UFS pad supply
      arm64: dts: qcom: apq8096-db820c: correct UFS pad supply
      arm64: dts: qcom: msm8996-oneplus: correct UFS pad supply
      arm64: dts: qcom: msm8996-gemini: correct UFS pad supply
      arm64: dts: qcom: msm8998-pro1: correct UFS pad supply
      arm64: dts: qcom: msm8998-mtp: correct UFS pad supply
      arm64: dts: qcom: msm8998-oneplus: correct UFS pad supply
      arm64: dts: qcom: msm8998-sagit: correct UFS pad supply
      arm64: dts: qcom: sm4250-billie2: correct UFS pad supply
      arm64: dts: qcom: sdx75-idp: align RPMh regulator nodes with bindings

Luca Weiss (7):
      arm64: dts: qcom: Use QCOM_SCM_VMID defines for qcom,vmid
      arm64: dts: qcom: sc7280: Mark some nodes as 'reserved'
      arm64: dts: qcom: pm7250b: make SID configurable
      arm64: dts: qcom: pm8350c: Add flash led node
      dt-bindings: arm: qcom: Add QCM6490 Fairphone 5
      arm64: dts: qcom: qcm6490: Add device-tree for Fairphone 5
      ARM: dts: qcom: sdx65-mtp: Specify PM7250B SID to use

Marijn Suijten (6):
      arm64: dts: qcom: sm6125: Pad APPS IOMMU address to 8 characters
      arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
      arm64: dts: qcom: sm6125: Switch fixed xo_board clock to RPM XO clock
      arm64: dts: qcom: sm6125: Add dispcc node
      arm64: dts: qcom: sm6125: Add display hardware nodes
      arm64: dts: qcom: sm6125-seine: Configure MDSS, DSI and panel

Markuss Broks (1):
      arm64: dts: qcom: msm8916-samsung-j5-common: Add accelerometer

Maulik Shah (1):
      arm64: dts: qcom: sc7280: Add power-domains for cpuidle states

Neil Armstrong (4):
      arm64: dts: qcom: sm8550: add UART14 nodes
      arm64: dts: qcom: sm8550-qrd: add bluetooth support
      arm64: dts: qcom: split pmr735d into 2
      Revert "arm64: dts: qcom: sm8450: Add PRNG"

Nikita Travkin (3):
      arm64: dts: qcom: msm8916-samsung-gt510: Add capacitive keys
      arm64: dts: qcom: sc7180: Add tertiary mi2s pinctrl
      arm64: dts: qcom: sc7180: Add ADSP

Robert Marko (2):
      arm64: dts: qcom: ipq5018: add watchdog
      arm64: dts: qcom: ipq5018: indicate that SDI should be disabled

Sheng-Liang Pan (2):
      dt-bindings: arm: qcom: add sc7180-lazor board bindings
      arm64: dts: qcom: sc7180: Add sku_id and board id for lazor/limozeen

Siddharth Manthan (1):
      arm64: dts: qcom: msm8916-samsung-gt58: Add display panel

Stephan Gerhold (11):
      arm64: dts: qcom: pm8916: Drop codec reg-names and mclk
      arm64: dts: qcom: msm8916: Disable venus by default
      arm64: dts: qcom: msm8916/39: Disable GPU by default
      arm64: dts: qcom: msm8916-ufi: Drop gps_mem for now
      arm64: dts: qcom: msm8916: Reserve firmware memory dynamically
      arm64: dts: qcom: msm8916: Reserve MBA memory dynamically
      arm64: dts: qcom: msm8939: Reserve firmware memory dynamically
      arm64: dts: qcom: msm8916/39: Disable unneeded firmware reservations
      arm64: dts: qcom: msm8916/39: Move mpss_mem size to boards
      arm64: dts: qcom: msm8916/39: Fix venus memory size
      arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators

Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5332: Add USB related nodes
      arm64: dts: qcom: ipq5332: Enable USB

Vignesh Raman (1):
      arm64: dts: qcom: apq8016-sbc: Add overlay for usb host mode

Vignesh Viswanathan (5):
      arm64: dts: qcom: ipq8074: Fix hwlock index for SMEM
      arm64: dts: qcom: ipq5332: Fix hwlock index for SMEM
      arm64: dts: qcom: ipq6018: Fix hwlock index for SMEM
      arm64: dts: qcom: ipq9574: Fix hwlock index for SMEM
      arm64: dts: qcom: ipq6018: Fix tcsr_mutex register size

 Documentation/devicetree/bindings/arm/qcom.yaml    |   45 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    8 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |    4 +
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |    8 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   30 +-
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            |    8 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |    2 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |    8 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts        |   23 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   57 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   36 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   69 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |   12 +
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |   12 +
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |   12 +
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |   12 +
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |   12 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   21 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |   12 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   12 +
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |    4 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |    4 +
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |    4 +
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |   12 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts |   86 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts  |   64 +
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |   51 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |    5 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dts   |   15 +
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |   12 +
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |   33 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |   12 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   41 +-
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |  334 ++
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |    4 +
 .../dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts  |    8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   39 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |   15 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |    6 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |    1 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    2 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |    2 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |    4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |    2 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |    2 +-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |    2 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |    2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   33 +-
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |   16 +
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |   14 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |   40 +
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |    6 +
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |    3 -
 .../boot/dts/qcom/{pmr735d.dtsi => pmr735d_a.dtsi} |   45 -
 arch/arm64/boot/dts/qcom/pmr735d_b.dtsi            |   59 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  667 ++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  147 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  125 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |    2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |    8 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    3 +
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dts    |   13 +-
 .../sc7180-trogdor-lazor-limozeen-nots-r10.dts     |   29 +
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts |    1 +
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts |    7 +-
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dts |   45 +
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts  |    2 +
 .../dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts  |   11 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |    1 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts  |   23 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts |   27 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r10.dts     |   19 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |    1 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |    1 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts      |    1 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |    5 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |    5 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts      |    5 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    1 +
 .../dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts |    1 +
 .../dts/qcom/sc7180-trogdor-pazquel-lte-ti.dts     |    1 +
 .../dts/qcom/sc7180-trogdor-pazquel-parade.dts     |    1 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel-ti.dts    |    1 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi   |   13 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    2 +
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |    2 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    1 +
 .../boot/dts/qcom/sc7180-trogdor-rt5682i-sku.dtsi  |   38 +
 .../boot/dts/qcom/sc7180-trogdor-rt5682s-sku.dtsi  |   38 +
 ...sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts |   17 +-
 .../qcom/sc7180-trogdor-wormdingler-rev1-boe.dts   |    1 +
 ...sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts |   15 +-
 .../qcom/sc7180-trogdor-wormdingler-rev1-inx.dts   |    1 +
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |    1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   27 -
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  187 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   24 +
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         |    4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  239 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |    3 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |    3 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  177 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   68 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   32 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   90 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    2 +-
 .../dts/qcom/sdm845-sony-xperia-tama-akari.dts     |  170 +
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |  168 +
 .../dts/qcom/sdm845-sony-xperia-tama-apollo.dts    |  170 +
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |   91 +
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  130 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |    2 +-
 .../arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts |    2 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |    2 +-
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |   59 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |    4 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  257 +-
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi |  423 +++
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts |   16 +
 arch/arm64/boot/dts/qcom/sm7125.dtsi               |   16 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   35 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  117 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    5 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  554 ++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   81 +
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |    5 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   24 +-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |    1 +
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |    2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   90 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   49 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   48 +-
 drivers/clk/qcom/Kconfig                           |    7 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sm8550.c                    | 3564 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   29 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    2 +
 include/dt-bindings/clock/qcom,sm8550-camcc.h      |  187 +
 150 files changed, 8899 insertions(+), 982 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
 rename arch/arm64/boot/dts/qcom/{pmr735d.dtsi => pmr735d_a.dtsi} (55%)
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-rt5682i-sku.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-rt5682s-sku.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7125.dtsi
 create mode 100644 drivers/clk/qcom/camcc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-camcc.h
