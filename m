Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B59AC76196
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 16:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C6B6C433A0; Mon, 10 Apr 2023 16:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCECC433D2;
	Mon, 10 Apr 2023 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681145930;
	bh=YF1PIu3/QYzyx0Sp5+EfDNA8oQIwe0/PqvZJ3JlfgkE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=vD5aYyEaI2ieCn4YkkZB9Qw88xJd14kRTYNSACLq7/aaKH/QmWj5rd2uAQcr1K/6M
	 MIC4DNT9uQ3oOlRfKN8Aa2WzxEKkyol8aRBCknayikESeKrqECxCuVLw+4omqE0Way
	 2ao8Dr/MyE3Y6dN++u4JVMbKpJHRUiQbGqhGE/8aNpGHhJGP3AkiuUc/Vqi8tJV+Da
	 MMus+JeX1veSJmo3k/yecNuUgk3u0UUwTRT2hH0pP8sl9vwHF4UNEyoqhxVnSA77aH
	 RyVYrhE7k4feGO3HKpNRXCUHELIDz+8/v2gcJ0sGuJzl5f2eyEjkxGiYmA4ex7YmN3
	 KaIda4ugTuiFA==
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
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Gergo Koteles <soyer@irl.hu>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Steev Klimaszewski <steev@kali.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yang Xiwen <forbidden405@foxmail.com>
Subject: [GIT PULL] Qualcomm ARM64 updates for v6.4
Date: Mon, 10 Apr 2023 10:02:33 -0700
Message-Id: <20230410170233.5931-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 07b0883e1f09416d07d25a2158f8cd35b732b686:

  arm64: dts: qcom: sc8280xp-x13s: mark bob regulator as always-on (2023-03-22 07:44:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.4

for you to fetch changes up to 105560b4fca4df0d42dba6656105b5e4131d8ad3:

  arm64: dts: qcom: sc8280xp-x13s: Add bluetooth (2023-04-04 20:51:38 -0700)

----------------------------------------------------------------
Qualcomm ARM64 updates for v6.4

PCI I/O and MEM ranges are corrected across all targets with PCIe
enabled. Likewise is CPU clocks defined to be provided from CPUfreq for
a wide range of platforms, to satisfy the OPP definitions, and LLCC bank
information is corrected for all relevant platforms.

IPQ5332 gains SMEM, CPUfreq and support for triggering download mode.
The MI01.2 board is introduced.

On MSM8916 WCN compatibles are moved to be defined per board, to avoid
issues when boards rely on the incorrect defaults. Support for Yiming
UZ801 4G modem stick is introduced.

XO clock is defined and fed to RPMCC on MSM8953 and MSM8976, to ensure
clock trees are properly rooted. DSI clocks feeding into gcc are
described on MSM8953.

On MSM8996 the external audio components are moved from the SoC dtsi. A
few DWC3 quirks are added.

On MSM8998 GPIO names are introduced for Sony Xperia XZ Premium, XZ1 and
XZ1 Compact. A numbe of boards have GPIO keys properly marked as
wakeup-source.

The SA8775P platform is extended with CPUfreq, UARTs, I2C controllers,
SPI controllers, SPMI and PMICs, PDC support. The associated PMICs gains
reset and power key support, as well as thermal zones defined. Nodes are
sorted. On top of this the SA8775P Ride board/platform is introduced.

On SC7180 and SC7280 a range of fixes coming from DeviceTree validation are
introduced, some clearing up unused properties, others correcting
errors. A number of Google rev0 boards on SC7180 are dropped, as these
are not considered to be in use by anyone anymore.

On SC8280XP RTC support is introduced and enabled for the CRD and Lenovo
Thinkpad X13s. It gains another UART, upon which Bluetooth is enabled on
the Lenovo ThinkPad X13s. The touchpad definition is altered to attempt
to probe both devices seen in the wild. A number of bug fixes are also
introduced, and the regulator definitions on X13s are corrected.

On SDM845 dynamic power coefficients are improved. BWMON compatible is
corrected. Xiaomi Pocophone F1 gains notification LED. Sony Xperia XZ2,
XZ2 Compact and XZ3 gains display, touchscreen, gpu and remoteproc
support. OnePlus 6 and 6T gains hall sensor.

GPU clock controller and remoteproc nodes are added for SM6115. CPU
clock are defined to come from CPUfreq. Board-specific USB-properties
are moved out of the SoC dtsi.

On SM6375 L3 scaling, IMEM, RMTFS, RPM sleep stats, Tsens, modem
remoteproc and WiFi nodes are added. Tsens thermal zones are defined and additional low power states
are defined. Sony Xperia 10 IV gains volume down key support.

On SM8150 another UART is introduced, to be used by GNSS on the SA8155
ADP. Support for the Flash LED block in PM8150L is added.

On SM8250 TPDM MM and PRNG is defined, MHI region is added to PCIe node.
A few bug fixes are introduced after Devicetree validation.

The DisplayPort controller on both SM8350 and SM8450 is defined and the
related QMP instance is transitioned to the USB3/DP combo variant. IMEM
and PIL info is introduced, for post mortem debugging of remoteprocs. On
the HDK PMIC GLINK is enabled and role switch is enabled. Some audio
resources are corrected.

A typo in the USB role property of the Microsoft Surface is corrected,
thanks to DeviceTree validation.

PCIe controllers and PHYs descriptions are corrected, and pinctrl state
definitions are moved from the soc to the board definition. BWMON
compatibles are corrected. PM8550B gains the definition of the eUSB2
repeater and this is enabled on the MTP. PMIC GLINK is also defined for
the MTP and connected to DWC3, for role switching support.

In addition to this, a range of cleanups based on Devicetree validation
is introduced.

A few clock bindings are introduced, from topic-branches shared with the
clock tree, to aid introduction of references to these.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: sm8550: Fix PCIe PHYs and controllers nodes
      arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater node

Adam Skladowski (5):
      arm64: dts: qcom: msm8976: Add and provide xo clk to rpmcc
      arm64: dts: msm8953: Replace xo_board with rpmcc sourced xo
      arm64: dts: msm8953: Provide dsi_phy clocks to gcc
      arm64: dts: msm8953: Drop unsupported dwc3 flag
      arm64: dts: msm8953: Pad regs to 8 digits

Bartosz Golaszewski (25):
      arm64: dts: sm8150: add the QUPv3 high-speed UART node
      arm64: dts: qcom: sa8155p-adp: enable the GNSS high-speed UART
      arm64: dts: qcom: add initial support for qcom sa8775p-ride
      arm64: dts: qcom: sa8775p: add cpufreq node
      arm64: dts: qcom: sm8150: fix the uart9 label
      arm64: dts: qcom: sa8775p: add the QUPv3 #2 node
      arm64: dts: qcom: sa8775p-ride: enable QUPv3 #2
      arm64: dts: qcom: sa8775p: add the i2c18 node
      arm64: dts: qcom: sa8775p-ride: enable i2c18
      arm64: dts: qcom: sa8775p: add the spi16 node
      arm64: dts: qcom: sa8775p-ride: enable the SPI node
      arm64: dts: qcom: sa8775p: add high-speed UART nodes
      arm64: dts: qcom: sa8775p-ride: enable the GNSS UART port
      arm64: dts: qcom: sa8775p-ride: enable the BT UART port
      arm64: dts: qcom: sa8775p: pad reg properties to 8 digits
      arm64: dts: qcom: sa8775p: sort soc nodes by reg property
      arm64: dts: qcom: sa8775p: add the pdc node
      arm64: dts: qcom: sa8775p: add the spmi node
      arm64: dts: qcom: sa8775p: add support for the on-board PMICs
      arm64: dts: qcom: sa8775p: add the Power On device node
      arm64: dts: qcom: sa8775p: pmic: add the power key
      arm64: dts: qcom: sa8775p: pmic: add support for the pmm8654 RESIN input
      arm64: dts: qcom: sa8775p: pmic: add thermal zones
      arm64: dts: qcom: sa8775p: add PMIC GPIO controller nodes
      arm64: dts: qcom: sa8775p-ride: set gpio-line-names for PMIC GPIOs

Bhupesh Sharma (5):
      arm64: dts: qcom: sm6115: Add remoteproc nodes
      arm64: dts: qcom: sm6115: Cleanup USB node's label
      arm64: dts: qcom: sm6115: Move USB node's 'maximum-speed' and 'dr_mode' properties to dts
      arm64: dts: qcom: sm6115: Move SDHC node(s)'s 'pinctrl' properties to dts
      arm64: dts: qcom: sdm845: Fix the BAM DMA engine compatible string

Bjorn Andersson (4):
      Merge branch '20230307062232.4889-1-quic_kathirav@quicinc.com' into arm64-for-6.4
      Merge branch 'arm64-fixes-for-6.3' into arm64-for-6.4
      Merge branch '20230208091340.124641-1-konrad.dybcio@linaro.org' into HEAD
      arm64: dts: qcom: sc8280xp: Define uart2

Danila Tikhonov (1):
      arm64: dts: qcom: pm8150l: add spmi-flash-led node

Dmitry Baryshkov (2):
      arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
      arm64: dts: qcom: ipq8074-hk10: enable QMP device, not the PHY node

Douglas Anderson (4):
      arm64: dts: qcom: sc7180: Delete wormdingler-rev0
      arm64: dts: qcom: sc7180: Delete kingoftown-rev0
      arm64: dts: qcom: sc7180: Delete lazor-rev0
      arm64: dts: qcom: sc7180: Delete mrbland

Gergo Koteles (1):
      arm64: dts: qcom: sdm845-oneplus-common: add Hall sensor

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: add notification LED

Johan Hovold (12):
      arm64: dts: qcom: sc8280xp-pmics: add pmk8280 rtc
      arm64: dts: qcom: sc8280xp-pmics: add pmk8280 sdam nvram
      arm64: dts: qcom: sc8280xp-crd: enable rtc
      arm64: dts: qcom: sc8280xp-x13s: enable rtc
      arm64: dts: qcom: sc8280xp: fix external display power domain
      arm64: dts: qcom: sc8280xp-x13s: add pmic regulator supplies
      arm64: dts: qcom: sc8280xp-x13s: add hid 1.8V supplies
      arm64: dts: qcom: sc8280xp-x13s: add wifi calibration variant
      arm64: dts: qcom: sc8280xp-pmics: fix sdam 'reg' property
      arm64: dts: qcom: sc8280xp-x13s: enable alternate touchpad
      arm64: dts: qcom: sc8280xp-x13s: drop bogus 'input-enable'
      arm64: dts: qcom: sc8280xp-pmics: fix pon compatible and registers

Kathiravan T (5):
      dt-bindings: clock: Add Qualcomm IPQ5332 GCC
      arm64: dts: qcom: add IPQ5332 SoC and MI01.2 board support
      arm64: dts: qcom: ipq5332: enable the download mode support
      arm64: dts: qcom: ipq5332: add SMEM support
      arm64: dts: qcom: ipq5332: enable the CPUFreq support

Komal Bajaj (1):
      arm64: dts: qcom: qdu1000: Add LLCC/system-cache-controller

Konrad Dybcio (40):
      dt-bindings: clock: Add Qcom SM6125 GPUCC
      dt-bindings: clock: Add Qcom SM6375 GPUCC
      dt-bindings: clock: Add Qcom SM6115 GPUCC
      arm64: dts: qcom: sm6375: Add RMTFS
      arm64: dts: qcom: msm8998: Fix stm-stimulus-base reg name
      arm64: dts: qcom: pm8998: Add a specific compatible for coincell chg
      arm64: dts: qcom: sc7280: Add qcom,smmu-500 to Adreno SMMU
      arm64: dts: qcom: sm8150: Add qcom,smmu-500 to Adreno SMMU
      arm64: dts: qcom: sm8250: Add qcom,smmu-500 to Adreno SMMU
      arm64: dts: qcom: sm8350: Add qcom,smmu-500 to Adreno SMMU
      arm64: dts: qcom: msm8996: Add missing DWC3 quirks
      arm64: dts: qcom: sc8280xp: Use correct CPU compatibles
      arm64: dts: qcom: sc7180: Add SoC-specific compatible to cpufreq_hw
      arm64: dts: qcom: sdm845: Add SoC-specific compatible to cpufreq_hw
      arm64: dts: qcom: sm6115: Add SoC-specific compatible to cpufreq_hw
      arm64: dts: qcom: sm6350: Add SoC-specific compatible to cpufreq_hw
      arm64: dts: qcom: sm8150: Add SoC-specific compatible to cpufreq_hw
      arm64: dts: qcom: msm8998-yoshino: Use SONY GPIO names
      arm64: dts: qcom: msm8998-yoshino: Use actual pin names for pin nodes
      arm64: dts: qcom: sm6115: Add GPUCC and Adreno SMMU
      arm64: dts: qcom: sc7280: Use the correct BWMON fallback compatible
      arm64: dts: qcom: sc8280xp: Use the correct BWMON fallback compatible
      arm64: dts: qcom: sdm845: Use the correct BWMON compatible
      arm64: dts: qcom: sm8550: Use the correct BWMON fallback compatible
      arm64: dts: qcom: sm6375: Add RPM sleep stats
      arm64: dts: qcom: sm6375: Add IMEM
      arm64: dts: qcom: sm6375: Add wifi node
      arm64: dts: qcom: sm6375: Add modem nodes
      arm64: dts: qcom: sm6375: Add CPUCP L3 node
      arm64: dts: qcom: sm6375: Add TSENS
      arm64: dts: qcom: sm6375: Configure TSENS thermal zones
      arm64: dts: qcom: sm6375: Bump CPU rail power collapse index
      arm64: dts: qcom: sm6375: Introduce C3 power state for both ARM clusters
      arm64: dts: qcom: sm6375-pdx225: Add volume down GPIO key
      arm64: dts: qcom: sdm845-tama: Add display nodes
      arm64: dts: qcom: sdm845-tama: Add Synaptics Touchscreen
      arm64: dts: qcom: sdm845-tama: Add regulator-system-load to l14a/l28a
      arm64: dts: qcom: sdm845-tama: Enable remoteprocs
      arm64: dts: qcom: sdm845-tama: Enable GPU
      arm64: dts: qcom: sdm845-tama: Enable GPI_DMA0/1

Krzysztof Kozlowski (67):
      arm64: dts: qcom: sm8550-qrd: add QRD8550
      arm64: dts: qcom: msm8996: move WCD9335 audio codec to boards
      arm64: dts: qcom: apq8096-db820c: fix indentation
      arm64: dts: qcom: drop incorrect cell-index from SPMI
      arm64: dts: qcom: sm8250: drop incorrect Coresight funnel properties
      arm64: dts: qcom: qdu1000: drop incorrect serial properties
      arm64: dts: qcom: sdm845-db845c: drop SPI label
      arm64: dts: qcom: apq8096-db820c: drop SPI label
      arm64: dts: qcom: ipq6018-cp01-c1: drop SPI cs-select
      arm64: dts: qcom: msm8953: correct RPMCC node name
      arm64: dts: qcom: msm8953: drop clocks from RPMPD
      arm64: dts: qcom: msm8994: correct RPMCC node name
      arm64: dts: qcom: sc7280: fix EUD port properties
      arm64: dts: qcom: msm8996-oneplus: do not enable incomplete nodes
      arm64: dts: qcom: sm8150-kumano: correct GPIO keys wakeup
      arm64: dts: qcom: msm8998-fxtec: correct GPIO keys wakeup
      arm64: dts: qcom: msm8998-sony-xperia: correct GPIO keys wakeup
      arm64: dts: qcom: sc7280-idp: correct GPIO keys wakeup
      arm64: dts: qcom: sdm630-sony-xperia: correct GPIO keys wakeup
      arm64: dts: qcom: sm6115p-lenovo-j606f: correct GPIO keys wakeup
      arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys wakeup
      arm64: dts: qcom: sm8250-xiaomi-elish: correct GPIO keys wakeup
      arm64: dts: qcom: sm8250-xiaomi-elish: fix USB maximum speed property
      arm64: dts: qcom: sm8350-microsoft-surface: fix USB dual-role mode property
      arm64: dts: qcom: pm660: align thermal node names with bindings
      arm64: dts: qcom: sdm845-db845c: drop empty node override
      arm64: dts: qcom: drop redundant line breaks
      arm64: dts: qcom: sm8450-hdk: use recommended drive strength for speaker SD_N
      arm64: dts: qcom: sm8450-hdk: use precise WCD9385 compatible
      arm64: dts: qcom: sm8450-hdk: align WCD9385 reset pin with downstream config
      arm64: dts: qcom: sc7180-trogdor-pazquel360: drop incorrect RT5682S VBAT-supply
      arm64: dts: qcom: sc7280-herobrine-audio-rt5682: add missing supplies
      arm64: dts: qcom: sc7280: align RPMh regulator nodes with bindings
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: sdm850-samsung-w737: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: sm8250-mtp: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: qrb5165-rb5: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: apq8096-db820c: drop simple-bus from clocks
      arm64: dts: qcom: msm8994-msft-lumia: drop simple-bus from clocks
      arm64: dts: qcom: msm8996-xiaomi: drop simple-bus from clocks
      arm64: dts: qcom: sdm630: move DSI opp-table into DSI node
      arm64: dts: qcom: sdm845-cheza: use just "port" in Innolux panel
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: use just "port" in panel
      arm64: dts: qcom: sc8280xp-crd: use just "port" in panel
      arm64: dts: qcom: sc7180-idp: use just "port" in panel
      arm64: dts: qcom: sc7180-trogdor-quackingstick: use just "port" in panel
      arm64: dts: qcom: sc7180-trogdor-wormdingler: use just "port" in panel
      arm64: dts: qcom: sc7180-qcard: use just "port" in panel
      arm64: dts: qcom: sc7180-trogdor-lazor: correct panel compatible
      arm64: dts: qcom: sdm845-oneplus: drop invalid panel properties
      arm64: dts: qcom: sdm845-xiaomi-beryllium: drop invalid panel properties
      arm64: dts: qcom: sdm845-xiaomi-beryllium: correct compatible
      arm64: dts: qcom: sda660-inforce: correct key node name
      arm64: dts: qcom: sc7280-herobrine-villager: correct trackpad supply
      arm64: dts: qcom: sc7180-trogdor-lazor: correct trackpad supply
      arm64: dts: qcom: sc7180-trogdor-pazquel: correct trackpad supply
      arm64: dts: qcom: msm8998-oneplus-cheeseburger: revert "fix backlight pin function"
      arm64: dts: qcom: msm8994-kitakami: drop unit address from PMI8994 regulator
      arm64: dts: qcom: msm8994-msft-lumia-octagon: drop unit address from PMI8994 regulator
      arm64: dts: qcom: apq8096-db820c: drop unit address from PMI8994 regulator
      arm64: dts: qcom: sm8250: drop incorrect domain idle states properties
      arm64: dts: qcom: sdm845: drop incorrect domain idle states properties
      arm64: dts: qcom: sm6375: drop incorrect domain idle states properties
      arm64: dts: qcom: sm8150: drop incorrect domain idle states properties
      arm64: dts: qcom: sm8350: drop incorrect domain idle states properties
      arm64: dts: qcom: sc8280xp: drop incorrect domain idle states properties
      arm64: dts: qcom: sc8280xp: correct Soundwire wakeup interrupt name

Manivannan Sadhasivam (37):
      arm64: dts: qcom: sdm845: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sc7280: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sm6350: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sm8550: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sm8250: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: qdu1000: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sc7180: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sm8150: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sm8350: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sc8280xp: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sm6375: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sm6115: Supply clock from cpufreq node to CPUs
      arm64: dts: qcom: sdm845: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sc7180: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sc7280: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sc8280xp: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sm8150: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sm8250: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sm8350: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sm8450: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sm6350: Fix the base addresses of LLCC banks
      arm64: dts: qcom: sdm845: Fix the PCI I/O port range
      arm64: dts: qcom: msm8998: Fix the PCI I/O port range
      arm64: dts: qcom: sc7280: Fix the PCI I/O port range
      arm64: dts: qcom: sm8550: Fix the PCI I/O port range
      arm64: dts: qcom: ipq8074: Fix the PCI I/O port range
      arm64: dts: qcom: ipq6018: Fix the PCI I/O port range
      arm64: dts: qcom: msm8996: Fix the PCI I/O port range
      arm64: dts: qcom: sm8250: Fix the PCI I/O port range
      arm64: dts: qcom: qcs404: Use 0x prefix for the PCI I/O and MEM ranges
      arm64: dts: qcom: sc8280xp: Fix the PCI I/O port range
      arm64: dts: qcom: sm8150: Fix the PCI I/O port range
      arm64: dts: qcom: sm8450: Fix the PCI I/O port range
      arm64: dts: qcom: sm8350: Fix the PCI I/O port range
      arm64: dts: qcom: sdm845: Add "mhi" region to the PCIe nodes
      arm64: dts: qcom: sm8250: Add "mhi" region to the PCIe nodes
      arm64: dts: qcom: sc8280xp: Add "mhi" region to the PCIe nodes

Mao Jinlong (1):
      arm64: dts: qcom: sm8250: Add tpdm mm/prng

Mukesh Ojha (1):
      arm64: dts: qcom: sm8450: Add IMEM and PIL info region

Neil Armstrong (16):
      arm64: dts: qcom: pm8550b: Add eUSB2 repeater node
      arm64: dts: qcom: sm8550: fix qup_spi0_cs node
      arm64: dts: qcom: sm8550: misc style fixes
      arm64: dts: qcom: sm8350: add port subnodes in dwc3 node
      arm64: dts: qcom: sm8450: add port subnodes in dwc3 node
      arm64: dts: qcom: sm8550: add port subnodes in dwc3 node
      arm64: dts: qcom: sm8350-hdk: add pmic glink node
      arm64: dts: qcom: sm8450-hdk: add pmic glink node
      arm64: dts: qcom: sm8550-mtp: add pmic glink node
      arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
      arm64: dts: qcom: sm8350: add dp controller
      arm64: dts: qcom: sm8450: switch to usb3/dp combo phy
      arm64: dts: qcom: sm8450: add dp controller
      arm64: dts: qcom: sm8450: remove invalid power-domain-names in pcie nodes
      arm64: dts: qcom: sm8450: fix pcie1 gpios properties name
      arm64: dts: qcom: sm8450: remove invalid properties in cluster-sleep nodes

Richard Acayan (1):
      arm64: dts: qcom: sdm670: add opps for peripherals

Steev Klimaszewski (1):
      arm64: dts: qcom: sc8280xp-x13s: Add bluetooth

Stephan Gerhold (2):
      arm64: dts: qcom: msm8916: Fix tsens_mode unit address
      arm64: dts: qcom: msm8916: Move WCN compatible to boards

Vincent Guittot (1):
      arm64: dts: qcom: sdm845: correct dynamic power coefficients

Yang Xiwen (1):
      arm64: dts: qcom: msm8916-yiming-uz801v3: Add initial device tree

 .../bindings/clock/qcom,ipq5332-gcc.yaml           |  53 ++
 .../bindings/clock/qcom,sm6115-gpucc.yaml          |  58 ++
 .../bindings/clock/qcom,sm6125-gpucc.yaml          |  64 ++
 .../bindings/clock/qcom,sm6375-gpucc.yaml          |  60 ++
 arch/arm64/boot/dts/qcom/Makefile                  |  14 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |  15 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |  65 +-
 arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts        |  75 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              | 320 +++++++
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |   1 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   4 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  13 +-
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |  12 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |  12 +-
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |  12 +-
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |  12 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |  12 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |  12 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |  12 +-
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi       |  22 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   4 -
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   8 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |  14 +-
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |   8 +
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |  16 +-
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |  12 +-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |  16 +-
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |  12 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |  12 +-
 .../arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts |  35 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  16 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 123 ++-
 .../boot/dts/qcom/msm8956-sony-xperia-loire.dtsi   |   4 +
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |  10 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |   5 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |   3 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   2 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |  67 +-
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts      |   6 +
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts     |   6 +
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  62 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  47 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |   4 +-
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |   2 +-
 .../dts/qcom/msm8998-sony-xperia-yoshino-maple.dts | 179 +++-
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 264 +++++-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   5 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |   2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |   6 +
 arch/arm64/boot/dts/qcom/pm8550b.dtsi              |   6 +
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |   2 -
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |  21 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   4 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   5 +
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi        | 211 +++++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          | 198 +++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 981 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |  11 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  38 -
 .../boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts |  17 -
 ...ngoftown.dtsi => sc7180-trogdor-kingoftown.dts} |  10 +-
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts |   2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts |   2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |  34 -
 .../dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts   |  22 -
 .../dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts   |  22 -
 .../boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  36 -
 .../dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts   |  22 -
 .../dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts   |  24 -
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi      | 320 -------
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi      |   2 +-
 .../boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi   |   1 +
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |  11 +-
 .../qcom/sc7180-trogdor-wormdingler-rev0-boe.dts   |  22 -
 .../qcom/sc7180-trogdor-wormdingler-rev0-inx.dts   |  22 -
 .../dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi  |  36 -
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  11 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  15 +-
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         |   2 +-
 .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |   2 +
 .../dts/qcom/sc7280-herobrine-audio-rt5682.dtsi    |   2 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts  |   2 +-
 .../boot/dts/qcom/sc7280-herobrine-villager.dtsi   |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   6 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |  15 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  33 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  23 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 147 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |  23 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  95 +-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |   2 +-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  39 +-
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |   1 -
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 109 +++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   8 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   5 -
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  27 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   1 -
 .../dts/qcom/sdm845-sony-xperia-tama-akari.dts     |   4 +
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |  47 +-
 .../dts/qcom/sdm845-sony-xperia-tama-apollo.dts    |   6 +
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     | 199 ++++-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |  14 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  49 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   4 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   4 +-
 .../arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts |  19 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 265 +++++-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |  11 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   1 -
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |   2 -
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  15 +-
 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  |  27 +
 arch/arm64/boot/dts/qcom/sm6375.dtsi               | 916 ++++++++++++++++++-
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |   6 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  52 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   4 +-
 .../dts/qcom/sm8250-sony-xperia-edo-pdx206.dts     |   2 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |   2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts   |   4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 222 ++++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |  47 +-
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |   3 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 170 +++-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  56 +-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   1 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 180 +++-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |  62 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 439 +++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 110 ++-
 include/dt-bindings/clock/qcom,ipq5332-gcc.h       | 356 ++++++++
 include/dt-bindings/clock/qcom,sm6115-gpucc.h      |  36 +
 include/dt-bindings/clock/qcom,sm6125-gpucc.h      |  31 +
 include/dt-bindings/clock/qcom,sm6375-gpucc.h      |  36 +
 142 files changed, 6503 insertions(+), 1371 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5332.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-kingoftown.dtsi => sc7180-trogdor-kingoftown.dts} (95%)
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-qrd.dts
 create mode 100644 include/dt-bindings/clock/qcom,ipq5332-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6125-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6375-gpucc.h
