Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2EEC433FE
	for <soc@archiver.kernel.org>; Thu, 24 Nov 2022 10:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E355DC43470; Thu, 24 Nov 2022 10:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874F3C433C1;
	Thu, 24 Nov 2022 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669284414;
	bh=Xjq1a+QOe+sLI/8munb11AVD+UWTZAVISnAalw4SDkQ=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=DLmcz84ad9gb8A9i45+yPD7YtZDLD6rONsKB1V068FDQRTXFRCcMNvm07eIi+UtSR
	 FuQOF60598lW3dKoiFLmJJ7pGhIWk+eTg+p9ZOhWI92Wtr3ARz5lUVcBnyeyUfXcBK
	 ERBSMFJmYlUQiZm7s4g0Gc0fw07XuBXp2t6pXr80YhClBDlxQUnNj4p9Ah/X5SuNji
	 EzTHQIpQ54zEIUfzbYafYRv0Y83uU6NlvBctg1PkksTuKXOBMPbnrFUKxbUsmuucgW
	 6tgCWANwaE/H9Qj/rT+hfgdTxKG/t1HQHZAV95m+H885PY3CO7aG8bPKe2BnOeibdG
	 FJFo1T1Qp/6RQ==
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
	Johan Hovold <johan+linaro@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Harry Austen <hpausten@protonmail.com>,
	Iskren Chernev <iskren.chernev@gmail.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Caleb Connolly <caleb@connolly.tech>,
	Douglas Anderson <dianders@chromium.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
	Alex Elder <elder@linaro.org>,
	Dylan Van Assche <me@dylanvanassche.be>,
	Jami Kettunen <jami.kettunen@somainline.org>,
	Job Noorman <job@noorman.info>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Rajeev Nandan <quic_rajeevny@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [GIT PULL] Qualcomm ARM64 DTS updates for 6.2
Date: Thu, 24 Nov 2022 04:06:50 -0600
Message-Id: <20221124100650.1982448-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.2

for you to fetch changes up to afcd946be11c937ed400b1d4727e2b5fe04ba693:

  arm64: dts: qcom: sdm845-polaris: Don't duplicate DMA assignment (2022-11-15 11:45:51 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DTS updates for 6.2

This introduces support for SM4250, SM6115, SM6375 and SDM670 platforms
and Sony Xperia 10 IV, Google Pixel 3a, OnePlus 3, OnePlus 3T, Google
Pazquel and OnePlus Nord N100.

A wide variety of updates to align with DeviceTree bindings across
many/most platforms is introduced, and incorrectly styled comments are
adjusted across the tree.

Apps RSC is added to the cluster-idle power-domain across SM8150,
SM8250, SM8350 and SM8450, to ensure sleep and wake votes are flushed as
the last core is being powered down.

Remoteproc firmware patches are aligned with agreed upon structure used
in linux-firmware across Inforce 6560, Lenovo Miix 630, various Sony
Xperia devices and Samsung Galaxy Book2 (although these are not
available in linux-firmware today).

On IPQ8074 CPU clocks are added, thermal zones are introduced and vqmmc
supply is specified for the HK01 board.

Alcatel OneTouch Idol 3 gains LED nodes and Samsung Galaxy A3U gained
vibrator support.

The application subsystem's IOMMU and the display subsystem is enabled
for MSM8953.

A new CPU frequency table is introduced for MSM8996Pro, to properly
describe it separate of MSM8996. The GPU opp-table is extended as well.

On SC7180 USB is marked as a wakeup source, USB gains required-opps to
ensure that the core voltage rail is voted for as needed. The
description of the fingerprint sensor in Trogdor is corrected.

On SC7280 Wake-on-WLAN is introduced, and PHY parameters for the SNPS
USB PHY is defined across SC7280.

The memory map across Google Herobrine is adjusted, to regain unused
memory on the WiFi SKUs.  A LTE SKU of the Evoker board is introduced
and the bard gains touchscreen.
NVME support is disabled on Villager boards, as it's not used.

PCIe support is introduced on SC8280XP, with NVMe, SDX55 (5G) and WiFi
enabled on the Lenovo Thinkpad X13s and Compute Reference Device. ADCs
and thermal zones are intrduced for the same. Lenovo Thinkpad X13s
gains LID switch support.

Fairphone FP3 gains touchscreen support.

Support for Xiaomi Poco F1 variant with EBBG panel.

The round-robin ADC is enabled across DB845c, OnePlus devices and
Pocophone F1 devices.

The displayport controller on SDM845 is introduced.

SM6350 gains SDHCI support and on Sony Xperia 10 III sd-card,
touchscreen and GPI DMA is enabled.

Fairphone FP4 got SD-card support.

UFS PHY register ranges are corrected across SM8150, SM8250, SM8350 and
SM8450.

Sony Xperia 1 II got NFC support and Sony Xperia 5 III got PMIC
regulators defined and USB definition corrected, to enable USB3.

The SDHCI controller is described for SM8450 and microSD support is
enabled for the HDK and QRD devices.

SM8450 also gains camera CCI interface and display clock controller.

----------------------------------------------------------------
Alex Elder (1):
      arm64: dts: qcom: sc7280-idp: don't modify &ipa twice

Bjorn Andersson (2):
      Merge branch '20220818220628.339366-8-robimarko@gmail.com' into HEAD
      arm64: dts: qcom: sc8280xp-x13s: Add LID switch

Bryan O'Donoghue (9):
      arm64: dts: qcom: msm8916: Drop redundant phy-names from DSI controller
      arm64: dts: qcom: msm8996: Drop redundant phy-names from DSI controller
      arm64: dts: qcom: sc7180: Drop redundant phy-names from DSI controller
      arm64: dts: qcom: sc7280: Drop redundant phy-names from DSI controller
      arm64: dts: qcom: sdm660: Drop redundant phy-names from DSI controller
      arm64: dts: qcom: sdm630: Drop redundant phy-names from DSI controller
      arm64: dts: qcom: sdm845: Drop redundant phy-names from DSI controller
      arm64: dts: qcom: sm8250: Drop redundant phy-names from DSI controller
      arm64: dts: qcom: msm8916: Fix lpass compat string to match yaml

Caleb Connolly (6):
      arm64: dts: qcom: sdm845: commonize bluetooth UART pinmux
      arm64: dts: qcom: sdm845-*: fix uart6 aliases
      arm64: dts: qcom: pmi8998: add rradc node
      arm64: dts: qcom: sdm845-oneplus: enable rradc
      arm64: dts: qcom: sdm845-db845c: enable rradc
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable rradc

Dmitry Baryshkov (26):
      dt-bindings: arm: qcom: separate msm8996pro bindings
      arm64: dts: qcom: msm8996: fix supported-hw in cpufreq OPP tables
      arm64: dts: qcom: msm8996: add support for speed bin 3
      arm64: dts: qcom: msm8996: fix GPU OPP table
      arm64: dts: qcom: msm8996pro: expand Adreno OPP table
      arm64: dts: qcom: sdm845: switch usb_1 phy to use combo usb+dp phy
      arm64: dts: qcom: sdm845: add displayport node
      arm64: dts: qcom: sm8450: add display clock controller
      arm64: dts: qcom: w737: correct firmware paths
      arm64: dts: qcom: miix-630: correct firmware paths
      arm64: dts: qcom: ifc6560: correct firmware paths
      arm64: dts: qcom: sagami: correct firmware paths
      arm64: dts: qcom: pdx223: correct firmware paths
      arm64: dts: qcom: nile: correct firmware paths
      arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
      arm64: dts: qcom: msm8996: change DSI PHY node name to generic one
      arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
      arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
      arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
      arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
      arm64: dts: qcom: sm8250: change DSI PHY node name to generic one
      arm64: dts: qcom: msm8996: change HDMI PHY node name to generic one
      dt-bindings: qcom: add another exception to the device naming rule
      arm64: dts: qcom: msm8996: use hdmi_phy for the MMCC's hdmipll clock
      arm64: dts: qcom: msm8996: use dsi1_phy for the MMCC's dsi1 clocks
      arm64: dts: qcom: msm8996: change order of SMMU clocks on this platform

Dmitry Torokhov (5):
      arm64: dts: qcom: msm8916-samsung-a2015: fix polarity of "enable" line of NFC chip
      arm64: dts: qcom: msm8996: fix sound card reset line polarity
      arm64: dts: qcom: sm8250-mtp: fix reset line polarity
      arm64: dts: qcom: sc7280: fix codec reset line polarity for CRD 3.0/3.1
      arm64: dts: qcom: sc7280: fix codec reset line polarity for CRD 1.0/2.0

Douglas Anderson (2):
      arm64: dts: qcom: sc7280: Villager doesn't have NVME
      arm64: dts: qcom: sc7280: Make herobrine-audio-rt5682 mic dtsi's match more

Dylan Van Assche (1):
      arm64: dts: qcom: sdm845-shift-axolotl: fix Bluetooth

Dzmitry Sankouski (2):
      dt-bindings: arm: add samsung,starqltechn board based on sdm845 chip
      arm64: dts: qcom: starqltechn: add initial device tree for starqltechn

Harry Austen (4):
      arm64: dts: qcom: msm8996: standardize blsp indexing
      arm64: dts: qcom: msm8996: add blsp1_i2c6 node
      dt-bindings: arm: qcom: add oneplus3(t) devices
      arm64: dts: qcom: msm8996: add support for oneplus3(t)

Iskren Chernev (4):
      dt-bindings: arm: qcom: Add compatible for oneplus,billie2 phone
      arm64: dts: qcom: sm6115: Add basic soc dtsi
      arm64: dts: qcom: sm4250: Add soc dtsi
      arm64: dts: qcom: sm4250: Add support for oneplus-billie2

Jami Kettunen (1):
      arm64: dts: qcom: msm8998-oneplus-common: enable RRADC

Job Noorman (1):
      arm64: dts: qcom: sdm632: fairphone-fp3: add touchscreen

Joel Selvaraj (3):
      arm64: dts: qcom: split beryllium dts into common dtsi and tianma dts
      dt-bindings: arm: qcom: Add Xiaomi Poco F1 EBBG variant bindings
      arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce Xiaomi Poco F1 EBBG variant

Johan Hovold (18):
      arm64: dts: qcom: sc8280xp: add rpmh-stats node
      arm64: dts: qcom: sc8280xp: add TCSR node
      arm64: dts: qcom: sm8150: fix UFS PHY registers
      arm64: dts: qcom: sm8250: fix UFS PHY registers
      arm64: dts: qcom: sm8350: fix UFS PHY registers
      arm64: dts: qcom: sm8450: fix UFS PHY registers
      arm64: dts: qcom: sm8250: drop bogus DP PHY clock
      arm64: dts: qcom: sm6350: drop bogus DP PHY clock
      arm64: dts: qcom: sc8280xp: fix USB MP QMP PHY nodes
      arm64: dts: qcom: sc8280xp/sa8540p: add PCIe2-4 nodes
      arm64: dts: qcom: sa8295p-adp: enable PCIe
      arm64: dts: qcom: sc8280xp-crd: rename backlight and misc regulators
      arm64: dts: qcom: sc8280xp-crd: enable NVMe SSD
      arm64: dts: qcom: sc8280xp-crd: enable SDX55 modem
      arm64: dts: qcom: sc8280xp-crd: enable WiFi controller
      arm64: dts: qcom: sc8280xp-x13s: enable NVMe SSD
      arm64: dts: qcom: sc8280xp-x13s: enable modem
      arm64: dts: qcom: sc8280xp-x13s: enable WiFi controller

Judy Hsiao (3):
      arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
      arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
      arm64: dts: qcom: sc7280: Include sc7280-herobrine-audio-rt5682.dtsi in herobrine-r1

Konrad Dybcio (20):
      arm64: dts: qcom: sm8250-edo: Add NXP PN553 NFC
      arm64: dts: qcom: msm8998-yoshino: Fix up SMD regulators formatting
      MAINTAINERS: Update Konrad Dybcio's email address
      arm64: dts: qcom: msm/apq8x16-*: Fix up comments
      arm64: dts: qcom: msm/apq8x96-*: Fix up comments
      arm64: dts: qcom: msm8953: Fix up comments
      arm64: dts: qcom: msm8998-*: Fix up comments
      arm64: dts: qcom: sc8280xp-x13s: Fix up comments
      arm64: dts: qcom: sdm845-*: Fix up comments
      arm64: dts: qcom: ipq8074-*: Fix up comments
      arm64: dts: qcom: msm8992-*: Fix up comments
      arm64: dts: qcom: msm8994-*: Fix up comments
      arm64: dts: qcom: qcs404-*: Fix up comments
      arm64: dts: qcom: pm6150/l/pm7325/pms405: Fix up comments
      dt-bindings: arm: cpus: Add Kryo 660 CPUs
      arm64: dts: qcom: Add initial device tree for SM6375
      arm64: dts: qcom: Add device tree for Sony Xperia 10 IV
      arm64: dts: qcom: sm8350-sagami: Add most RPMh regulators
      arm64: dts: qcom: sm8350-sagami: Wire up USB regulators and fix USB3
      arm64: dts: qcom: sdm845-polaris: Don't duplicate DMA assignment

Krishna Kurapati (2):
      arm64: dts: qcom: sc7280: Update SNPS Phy params for SC7280
      arm64: dts: qcom: sc7280: Update SNPS Phy params for SC7280 IDP device

Krzysztof Kozlowski (72):
      arm64: dts: qcom: align RPM regulators node name with bindings
      arm64: dts: qcom: sdm630: align APR services node names with dtschema
      arm64: dts: qcom: sdm845: align APR services node names with dtschema
      arm64: dts: qcom: sm8250: align APR services node names with dtschema
      arm64: dts: qcom: msm8996: fix APR services nodes
      arm64: dts: qcom: sdm845: align dai node names with dtschema
      arm64: dts: qcom: msm8996: align dai node names with dtschema
      arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
      arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
      arm64: dts: qcom: sm8150: align TLMM pin configuration with DT schema
      arm64: dts: qcom: ipq6018-cp01-c1: use BLSPI1 pins
      arm64: dts: qcom: ipq6018: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm8250: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm8250-sony-xperia-edo: fix touchscreen bias-disable
      arm64: dts: qcom: sc8280xp: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sc7280: align TLMM pin configuration with DT schema (really)
      arm64: dts: qcom: sc7280-herobrine: correct number of gpio-line-names
      arm64: dts: qcom: sc7280-idp-ec-h1: add missing QUP GPIO functions
      arm64: dts: qcom: msm8953: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sdm845: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm6125-sony-xperia: add missing SD CD GPIO functions
      arm64: dts: qcom: sm6125: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: correct I2C12 pins drive strength
      arm64: dts: qcom: sdm850-samsung-w737: correct I2C12 pins drive strength
      arm64: dts: qcom: sdm845-xiaomi-polaris: fix codec pin conf name
      arm64: dts: qcom: sdm630: fix UART1 pin bias
      arm64: dts: qcom: sdm845-db845c: correct SPI2 pins drive strength
      arm64: dts: qcom: sdm845-cheza: fix AP suspend pin bias
      arm64: dts: qcom: correct white-space before {
      arm64: dts: qcom: use generic node name "gpio" in SPMI PMIC
      arm64: dts: qcom: sdm845: drop unused slimbus properties
      arm64: dts: qcom: msm8996: drop unused slimbus reg-mames
      arm64: dts: qcom: sdm845: correct slimbus children unit addresses
      arm64: dts: qcom: mms8996: correct slimbus children unit addresses
      arm64: dts: qcom: sdm845: drop unused slimbus dmas
      arm64: dts: qcom: msm8996: drop unused slimbus dmas
      arm64: dts: qcom: sdm845: align node names with DT schema
      arm64: dts: qcom: msm8996: align node names with DT schema
      dt-bindings: qcom: document preferred compatible naming
      arm64: dts: qcom: sdm630: add UART pin functions
      arm64: dts: qcom: sdm630: correct I2C8 pin functions
      arm64: dts: qcom: sdm630: align TLMM pin configuration with DT schema
      arm64: dts: qcom: msm8998: add gpio-ranges to TLMM
      arm64: dts: qcom: msm8998-oneplus-cheeseburger: fix backlight pin function
      arm64: dts: qcom: msm8998: align TLMM pin configuration with DT schema
      dt-bindings: arm: qcom: document Google Cheza
      arm64: dts: qcom: sc7280: drop clock-cells from LPASS TLMM
      arm64: dts: qcom: sc7280: align LPASS pin configuration with DT schema
      arm64: dts: qcom: sm8250: correct LPASS pin pull down
      arm64: dts: qcom: sm8250: align LPASS pin configuration with DT schema
      arm64: dts: qcom: sc7280: Add GPI DMA compatible fallback
      arm64: dts: qcom: sm8350: Add GPI DMA compatible fallback
      arm64: dts: qcom: sm8450: Add GPI DMA compatible fallback
      arm64: dts: qcom: sc7180-trogdor-homestar: fully configure secondary I2S pins
      arm64: dts: qcom: sc7180: revert "arm64: dts: qcom: sc7180: Avoid glitching SPI CS at bootup on trogdor"
      arm64: dts: qcom: sc7180: align TLMM pin configuration with DT schema
      arm64: dts: qcom: msm8996-sony-xperia-tone: drop incorrect wlan pin input
      arm64: dts: qcom: msm8996: align TLMM pin configuration with DT schema
      arm64: dts: qcom: msm8916: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm8450: move SDHCI pin configuration to DTSI
      arm64: dts: qcom: sm8450: disable SDHCI SDR104/SDR50 on all boards
      arm64: dts: qcom: sm8450-hdk: add SDHCI for microSD
      arm64: dts: qcom: sm8450-qrd: add SDHCI for microSD
      arm64: dts: qcom: msm8994: Correct SPI10 CS pin
      arm64: dts: qcom: msm8994: Align TLMM pin configuration with DT schema
      arm64: dts: qcom: qcs404: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm6125: fix SDHCI CQE reg names
      arm64: dts: qcom: ipq8074: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm8450: drop incorrect spi-max-frequency
      arm64: dts: msm8998: add MSM8998 specific compatible
      arm64: dts: msm8998: unify PCIe clock order withMSM8996
      arm64: dts: qcom: trim addresses to 8 digits

Luca Weiss (7):
      arm64: dts: qcom: msm8996: remove bogus ufs_variant node
      arm64: dts: qcom: sc7280: Fix cpufreq-epss compatible
      arm64: dts: qcom: pm6350: add temp sensor and thermal zone config
      arm64: dts: qcom: pm6150l: add temp sensor and thermal zone config
      arm64: dts: qcom: pm8150b: change vbus-regulator node name
      arm64: dts: qcom: pm8998: adjust coincell node name to bindings
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable SD card

Manikanta Pubbisetty (1):
      arm64: dts: qcom: sc7280: Add nodes to support WoW on WCN6750

Manivannan Sadhasivam (12):
      dt-bindings: iio: qcom: adc7-pm8350: Allow specifying SID for channels
      arm64: dts: qcom: sc8280xp-pmics: Add temp alarm for PM8280_{1/2} PMICs
      arm64: dts: qcom: sc8280xp-pmics: Add thermal zones for PM8280_{1/2} PMICs
      arm64: dts: qcom: sc8280xp-pmics: Add support for PMK8280 RESIN input
      arm64: dts: qcom: sc8280xp-pmics: Add PMK8280 ADC7 block
      arm64: dts: qcom: sc8280xp-pmics: Add support for TM5 block in PMK8280
      arm64: dts: qcom: sc8280xp-x13s: Enable PMK8280 RESIN input
      arm64: dts: qcom: sc8280xp-x13s: Add PMK8280 VADC channels
      arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} VADC channels
      arm64: dts: qcom: sc8280xp-x13s: Add PMR735A VADC channel
      arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} ADC_TM5 channels
      arm64: dts: qcom: sc8280xp-x13s: Add thermal zone support

Marijn Suijten (16):
      dt-bindings: mfd: qcom-spmi-pmic: Add pm6125 compatible
      arm64: dts: qcom: pm660: Use unique ADC5_VCOIN address in node name
      arm64: dts: qcom: Add PM6125 PMIC
      arm64: dts: qcom: sm6125-seine: Include PM6125 and configure PON
      arm64: dts: qcom: sm6125-seine: Configure additional trinket thermistors
      arm64: dts: qcom: sm6350: Add resets for SDHCI 1/2
      arm64: dts: qcom: sm6350: Add pinctrl for SDHCI 2
      arm64: dts: qcom: sm6350-lena: Add SD Card Detect to sdc2 on/off pinctrl
      arm64: dts: qcom: pm6350: Include header for KEY_POWER
      arm64: dts: qcom: sm6350-lena: Include pm6350 and configure buttons
      arm64: dts: qcom: sm6350-lena: Define pm6350 and pm6150l regulators
      arm64: dts: qcom: sm6350-lena: Provide power to SDHCI 2 (SDCard slot)
      arm64: dts: qcom: sm6350-lena: Enable QUP and GPI DMA
      arm64: dts: qcom: sm6350-lena: Configure Samsung touchscreen
      arm64: dts: qcom: sm6350: Add apps_smmu with streamID to SDHCI 1/2 nodes
      arm64: dts: qcom: sm6125: Enable Command Queue Engine (CQE) for SDHCI 1

Matthias Kaehlcke (1):
      arm64: dts: qcom: sc7180: Configure USB as wakeup source

Maulik Shah (1):
      arm64: dts: qcom: Add power-domains property for apps_rsc

Nikita Travkin (1):
      arm64: dts: qcom: msm8916-samsung-a2015: Add vibrator

Rajeev Nandan (1):
      arm64: dts: qcom: sc7280: assign DSI clock source parents

Rajendra Nayak (2):
      arm64: dts: qcom: sc7180: Add required-opps for USB
      arm64: dts: qcom: sc7280: Add required-opps for i2c

Richard Acayan (2):
      arm64: dts: qcom: add gpi-dma fallback compatible
      arm64: dts: qcom: add sdm670 and pixel 3a device trees

Robert Marko (14):
      arm64: dts: qcom: ipq8074: add A53 PLL node
      arm64: dts: qcom: ipq8074: correct APCS register space size
      arm64: dts: qcom: ipq8074: add thermal nodes
      arm64: dts: qcom: ipq8074: add clocks to APCS
      arm64: dts: qcom: add PMP8074 DTSI
      arm64: dts: qcom: ipq8074-hk01: add VQMMC supply
      arm64: dts: qcom: ipq6018: fix NAND node name
      arm64: dts: qcom: ipq6018: move ARMv8 timer out of SoC node
      arm64: dts: qcom: cp01-c1: remove bootargs-append
      arm64: dts: qcom: cp01-c1: use "okay" instead of "ok"
      arm64: dts: qcom: ipq8074: pass XO and sleep clocks to GCC
      arm64: dts: qcom: hk10: use "okay" instead of "ok"
      arm64: dts: qcom: hk10: use GPIO flags for tlmm
      arm64: dts: qcom: hk01: use GPIO flags for tlmm

Sheng-Liang Pan (4):
      arm64: dts: qcom: sc7280: Add LTE SKU for sc7280-evoker family
      arm64: dts: qcom: sc7280: Add touchscreen and touchpad support for evoker
      arm64: dts: qcom: sc7280: add sc7280-herobrine-audio-rt5682-3mic3.dtsi for evoker
      arm64: dts: qcom: sc7280: sort out the "Status" to last property with sc7280-herobrine-audio-rt5682.dtsi

Sibi Sankar (2):
      arm64: dts: qcom: sc7280: Mark all Qualcomm reference boards as LTE
      arm64: dts: qcom: sc7280: Add Google Herobrine WIFI SKU dts fragment

Srinivasa Rao Mandadapu (3):
      arm64: dts: qcom: Update soundwire secondary node names
      arm64: dts: qcom: sm8250: Remove redundant soundwire property
      arm64: dts: qcom: sc7280: Remove redundant soundwire property

Stephan Gerhold (1):
      arm64: dts: qcom: msm8916: Drop MSS fallback compatible

Stephen Boyd (3):
      arm64: dts: qcom: Remove fingerprint node from herobrine-r1
      arm64: dts: qcom: sc7280: Fully describe fingerprint node on Herobrine
      arm64: dts: qcom: sc7180: Fully describe fingerprint node on Trogdor

Vincent Knecht (2):
      arm64: dts: qcom: msm8916-alcatel-idol347: add GPIO torch LED
      arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator

Vladimir Lypak (2):
      arm64: dts: qcom: msm8953: add APPS IOMMU
      arm64: dts: qcom: msm8953: add MDSS

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8450: Add description of camera control interfaces

Yassine Oudjana (2):
      arm64: dts: qcom: msm8996: Add MSM8996 Pro support
      arm64: dts: qcom: msm8996-xiaomi-scorpio, natrium: Use MSM8996 Pro

Yunlong Jia (2):
      dt-bindings: arm: qcom: Document additional skus for sc7180 pazquel360
      arm64: dts: qcom: Add sc7180-pazquel360

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 .../devicetree/bindings/arm/qcom-soc.yaml          |   66 ++
 Documentation/devicetree/bindings/arm/qcom.yaml    |   30 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    1 +
 .../bindings/thermal/qcom-spmi-adc-tm5.yaml        |    6 +-
 MAINTAINERS                                        |    2 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   18 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   16 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |  114 +-
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |   70 +-
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |   11 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   22 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   10 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dts       |    3 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dts       |    3 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |   21 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  136 ++-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |   80 +-
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |   24 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |   24 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   22 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |    8 +-
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi         |  276 ++---
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi       |    2 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |  112 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   14 +-
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |   10 +-
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |   28 +-
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |    2 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |    2 +-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |   45 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |   25 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   17 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  314 +++++-
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts   |    3 +-
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts  |    3 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |   45 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |    4 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |    3 +-
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     |    3 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |   12 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |   10 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  133 +--
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |  787 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts      |   44 +
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts     |   45 +
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   29 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |   17 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |   11 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  389 ++++---
 ...i-natrium.dts => msm8996pro-xiaomi-natrium.dts} |    9 +-
 ...i-scorpio.dts => msm8996pro-xiaomi-scorpio.dts} |   13 +-
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi           |  291 +++++
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |    9 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |   28 +-
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    4 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |   16 +-
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |   10 +-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |   22 +-
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |   67 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   95 +-
 arch/arm64/boot/dts/qcom/pm6125.dtsi               |  154 +++
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |    6 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |   44 +-
 arch/arm64/boot/dts/qcom/pm6350.dtsi               |   41 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |    4 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm7325.dtsi               |    6 +-
 arch/arm64/boot/dts/qcom/pm8005.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/pmp8074.dtsi              |  125 +++
 arch/arm64/boot/dts/qcom/pms405.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/qcs404-evb-1000.dts       |    4 +-
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts       |   24 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |   58 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   70 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   20 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   60 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  171 +++
 arch/arm64/boot/dts/qcom/sa8540p.dtsi              |   59 +
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |  236 ++--
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   36 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   43 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts |   16 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi   |    8 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |   16 +-
 .../boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |   25 +-
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi      |   72 +-
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi     |   32 +-
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi      |    8 +-
 .../dts/qcom/sc7180-trogdor-pazquel360-lte.dts     |   22 +
 .../dts/qcom/sc7180-trogdor-pazquel360-wifi.dts    |   17 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi   |   50 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |   14 +-
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |   56 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    8 +-
 .../boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |   16 +-
 .../dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi  |   25 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   72 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  664 +++++------
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  604 +++++-----
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   15 -
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         |    8 +-
 .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |  195 ++++
 .../dts/qcom/sc7280-herobrine-audio-rt5682.dtsi    |  122 ++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts  |    1 +
 .../boot/dts/qcom/sc7280-herobrine-evoker-lte.dts  |   16 +
 .../boot/dts/qcom/sc7280-herobrine-evoker.dts      |   16 +
 ...-evoker-r0.dts => sc7280-herobrine-evoker.dtsi} |   24 +-
 .../dts/qcom/sc7280-herobrine-herobrine-r1.dts     |    6 +-
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |   19 +
 .../dts/qcom/sc7280-herobrine-villager-r1-lte.dts  |    4 +-
 .../boot/dts/qcom/sc7280-herobrine-villager-r1.dts |   31 +-
 .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     |   37 +
 .../boot/dts/qcom/sc7280-herobrine-villager.dtsi   |   11 -
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |   11 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   71 +-
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi     |   10 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |    6 -
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   35 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |   22 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  406 ++++---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  209 +++-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  439 +++++++-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   84 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  565 +++++++++-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |   12 +-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   24 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  140 ++-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   16 +-
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |    2 +-
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |   10 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |  531 +++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 1160 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   49 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   84 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |    2 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   39 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |  460 ++++++++
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    9 +
 ...ium.dts => sdm845-xiaomi-beryllium-common.dtsi} |   46 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts |   15 +
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    |   15 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   36 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  159 ++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   10 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   24 +-
 .../arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts |  241 ++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi               |   38 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  854 ++++++++++++++
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  164 ++-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    8 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |  337 ++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   51 +-
 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  |   86 ++
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |  804 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   39 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  393 +++----
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   40 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |   29 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  639 +++++------
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  374 ++++++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   19 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   19 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   19 +
 .../dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts  |   28 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  221 +++-
 include/dt-bindings/iio/qcom,spmi-adc7-pm8350.h    |   90 +-
 175 files changed, 12538 insertions(+), 3719 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom-soc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
 rename arch/arm64/boot/dts/qcom/{msm8996-xiaomi-natrium.dts => msm8996pro-xiaomi-natrium.dts} (97%)
 rename arch/arm64/boot/dts/qcom/{msm8996-xiaomi-scorpio.dts => msm8996pro-xiaomi-scorpio.dts} (97%)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996pro.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm6125.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmp8074.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
 rename arch/arm64/boot/dts/qcom/{sc7280-herobrine-evoker-r0.dts => sc7280-herobrine-evoker.dtsi} (94%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
 rename arch/arm64/boot/dts/qcom/{sdm845-xiaomi-beryllium.dts => sdm845-xiaomi-beryllium-common.dtsi} (94%)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6375.dtsi
