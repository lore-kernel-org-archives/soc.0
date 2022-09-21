Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC6FECAAD8
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 23:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88CC8C433D7; Wed, 21 Sep 2022 23:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221C3C433D6;
	Wed, 21 Sep 2022 23:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663804137;
	bh=YM/iIm3TLBsiAWz6E2t6b27vRGD6pwKMxltnvbTNjKc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=XTo2NtbEoQDiVbSF6nQtyo0xtLugpwe/W7dGW6K8w5Pentn+YWPEUvMb4awkhQN2v
	 fe0YBmG6kR54RHzZUgUksInkrCrdGG9f7DfseU9T8WUFL14O5DkjBRYIXTRZrTzHIz
	 Lco2Ek4JNlyuNj62e4xHUhlPnGf7TwDF7TVuN6kqE2V13GQKy8e0GGGy+xwtKepIg+
	 P2yN+WeBelKMuTXI27LNydZKDrRGRSIRgcFD9li2RP2s05xky/Owrhz9QUF7IYO47i
	 3S7Bh0zkTovAf4Co4VQPcnzAz6jjy/MSzLuD2gBZlwQGTeCAR+KC1ell4Fz3kULWnl
	 xEZluoCjuiv4g==
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
	Johan Hovold <johan+linaro@kernel.org>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Lin,
	Meng-Bo <linmengbo0689@protonmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jimmy Chen <jinghung.chen3@hotmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Bob Moragues <moragues@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Eric Biggers <ebiggers@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jakob Hauser <jahau@rocketmail.com>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS updates for 6.1
Date: Wed, 21 Sep 2022 18:48:54 -0500
Message-Id: <20220921234854.1343238-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.1

for you to fetch changes up to 3d59187efc982bf20309ae2fb8514007f9bf2b4e:

  arm64: dts: qcom: sc7280: Add required-opps for USB (2022-09-16 14:09:02 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS updates for 6.1

Support for Samsung Galaxy E5, E7 and Grand Max is added, with support
for both 32-bit and 64-bit variants. The Samsung Galaxy S4 Mini Value
Edition gains magnetometer support.

MSM8996-based Xiaomi devices gains descriptions of the LPG-based LEDs.

On SA8295P ADP problems arising from regulators being switched into
low-power mode is worked around by removing this ability, for now.

The onboard USB Hub on SC7180 Trogdor is finally described and a few ADC
related updates are introduced.

On SC7280 support for the CPU and LLC bwmon instances are introduced.
Soundwire, audio codecs and sound introduced for a variety of boards.
Using required-opps the USB controllers votes for a minimum corner on
VDD_CX.
The onboard USB Hub Herobrine is described. A new board, the Google
Evoker is added, as is another revision of Herobrine Villager.

On SC8280XP the USB controllers are marked as wakeup-sources, to keep
them powered during suspend. The CRD has HID devices marked as
wakeup-sources to enable resuming the system. In addition to these
changes the alternative touchpad is introduced on the Lenovo ThinkPad
X13s.

SDM845 gains RPMh stats support and the LLCC BWMON is added. For SM6350
interconnect providers and GPI DMA is introduced. A description of the
PM7280b PMIC is added to Fairphone FP4 on SM7225.

With the multi-MSI support added in the PCIe controller, SM8250 gets all
its MSI interrupts added.

UFS ICE and the second SDHCI controller is introduced on SM8450. Support
for the Sony Xperia 1 IV is introduced.

Throughout a variety of platforms the TCSR mutex syscon is replaced with
the MMIO-based binding. TCSR nodes gained proper compatibles and halt
syscon nodes are split out from the mutex ranges.

A range of fixes to align with DT bindings are introduced. Among these
are the changes to the follow the TLMM binding and suffix pinctrl states
with -state and subnodes thereof with -pins, another is a number of
changes transitioning to use -gpios and introduction of proper parent
clock references in various clock providers.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: sdm845: Reduce reg size for aoss_qmp
      arm64: dts: qcom: sdm845: Add the RPMh stats node

Akhil P Oommen (1):
      arm64: dts: qcom: sc7280: Update gpu opp table

Bhupesh Sharma (2):
      arm64: dts: qcom: sc8280xp-pmics: Remove reg entry & use correct node name for pmc8280c_lpg node
      arm64: dts: qcom: sa8155p-adp: Remove unused properties from eth node

Bob Moragues (2):
      dt-bindings: arm: qcom: document zoglin board
      arm64: dts: qcom: sc7280: Add support for zoglin

Bryan O'Donoghue (1):
      arm64: dts: qcom: pm8350c: Drop PWM reg declaration

Dmitry Baryshkov (6):
      arm64: dts: qcom: stop using snps,dw-pcie falback
      arm64: dts: qcom: replace deprecated perst-gpio with perst-gpios
      arm64: dts: qcom: msm8916: add clocks to the GCC device node
      arm64: dts: qcom: sm8250: move DSI opp table to the dsi0 node
      arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI PHY node
      arm64: dts: qcom: sm8250: provide additional MSI interrupts

Douglas Anderson (2):
      dt-bindings: arm: qcom: Adjust LTE SKUs for sc7280-villager
      arm64: dts: qcom: sc7280-villager: Adjust LTE SKUs

Eric Biggers (1):
      arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock

Geert Uytterhoeven (1):
      arm64: dts: qcom: sdm845-xiaomi-polaris: Fix sde_dsi_active pinctrl

Jakob Hauser (1):
      arm64: dts: qcom: msm8916-samsung-serranove: Add magnetometer

Jimmy Chen (3):
      dt-bindings: arm: qcom: document sc7280 and villager board
      arm64: dts: qcom: sc7280: Add herobrine-villager-r1
      arm64: dts: qcom: Add LTE SKUs for sc7280-villager family

Johan Hovold (14):
      arm64: dts: qcom: sc8280xp-crd: disable touchscreen pull-up
      arm64: dts: qcom: sc8280xp-crd: move HID pin config
      arm64: dts: qcom: sc8280xp-crd: mark HID wakeup sources
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: disable touchscreen pull-up
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: move HID pin config
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: mark HID wakeup sources
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add alternate touchpad
      arm64: dts: qcom: sc8280xp-crd: disallow regulator mode switches
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: disallow regulator mode switches
      arm64: dts: qcom: sa8295p-adp: disallow regulator mode switches
      arm64: dts: qcom: sc8280xp: mark USB controllers as wakeup-sources
      arm64: dts: qcom: fix syscon node names
      arm64: dts: qcom: ipq8074: fix PCIe PHY serdes size
      arm64: dts: qcom: sm8450: fix UFS PHY serdes size

Judy Hsiao (1):
      arm64: dts: qcom: sc7280: Fix Dmic no sound on villager-r1

Konrad Dybcio (4):
      dt-bindings: arm: qcom: Document Sony Xperia 1 IV (PDX223)
      arm64: dts: qcom: sm8450: Adjust memory map
      arm64: dts: qcom: sm8450: Add SDHCI2
      arm64: dts: qcom: Add device tree for Sony Xperia 1 IV

Krishna chaitanya chundru (2):
      arm64: dts: qcom: sc7280: Add missing aggre0, aggre1 clocks
      dt-bindings: pci: QCOM Add missing sc7280 aggre0, aggre1 clocks

Krzysztof Kozlowski (52):
      arm64: dts: qcom: sdm845: narrow LLCC address space
      arm64: dts: qcom: sdm845: add LLCC BWMON
      arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples
      arm64: dts: qcom: msm8998: add MSM8998 SDCC specific compatible
      dt-bindings: mfd: qcom,tcsr: add several devices
      arm64: dts: qcom: msm8996: split TCSR halt regs out of mutex
      arm64: dts: qcom: msm8996: switch TCSR mutex to MMIO
      arm64: dts: qcom: msm8998: split TCSR halt regs out of mutex
      arm64: dts: qcom: msm8998: switch TCSR mutex to MMIO
      arm64: dts: qcom: sc7180: add missing TCSR syscon compatible
      arm64: dts: qcom: sc7180: split TCSR halt regs out of mutex
      arm64: dts: qcom: sc7180: switch TCSR mutex to MMIO
      arm64: dts: qcom: sc7280: split TCSR halt regs out of mutex
      arm64: dts: qcom: sdm845: split TCSR halt regs out of mutex
      arm64: dts: qcom: sdm845: switch TCSR mutex to MMIO
      arm64: dts: qcom: qcs404: switch TCSR mutex to MMIO
      arm64: dts: qcom: sdm630: split TCSR halt regs out of mutex
      arm64: dts: qcom: sdm630: switch TCSR mutex to MMIO
      arm64: dts: qcom: sm8150: split TCSR halt regs out of mutex
      arm64: dts: qcom: sm8150: switch TCSR mutex to MMIO
      arm64: dts: qcom: sdm845-db845c: drop power-domains from CCI I2C sensors
      arm64: dts: qcom: sdm845-db845c: drop gpios from CCI I2C sensors
      arm64: dts: qcom: use GPIO flags for tlmm
      arm64: dts: qcom: pmk8350: drop incorrect io-channel-ranges
      arm64: dts: qcom: pmk8350: drop interrupt-names from ADC
      arm64: dts: qcom: align SPMI PMIC ADC node name with dtschema
      arm64: dts: qcom: align SPMI PMIC regulators node name with dtschema
      arm64: dts: qcom: align SPMI PMIC LPG node name with dtschema
      arm64: dts: qcom: align SPMI PMIC Power-on node name with dtschema
      arm64: dts: qcom: align PMIC GPIO pin configuration with DT schema
      arm64: dts: qcom: sc7280-idp: correct ADC channel node name and unit address
      arm64: dts: qcom: sdm845-mtp: correct ADC settle time
      arm64: dts: qcom: sc7280: correct CPU BWMON unit address
      arm64: dts: qcom: sm6125: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm6350: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm8350-sagami: correct TS pin property
      arm64: dts: qcom: sm8350: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sm8450: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sc7280: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sc7280-herobrine: correct TLMM gpio-line-names
      arm64: dts: qcom: ipq6018: add missing TCSR syscon compatible
      arm64: dts: qcom: msm8953: add missing TCSR syscon compatible
      arm64: dts: qcom: qcs404: add missing TCSR syscon compatible
      arm64: dts: qcom: msm8996: add missing TCSR syscon compatible
      arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
      arm64: dts: qcom: msm8994: switch TCSR mutex to MMIO
      arm64: dts: qcom: align SDHCI reg-names with DT schema
      arm64: dts: qcom: pmi8994: add missing MPP compatible fallback
      arm64: dts: qcom: msm8994-msft-lumia-octagon: align resin node name with bindings
      arm64: dts: qcom: msm8996-xiaomi: align PMIC GPIO pin configuration with DT schema
      arm64: dts: qcom: sa8295p-adp: add fallback compatible to PMIC GPIOs
      arm64: dts: qcom: sa8295p-adp: add missing gpio-ranges in PMIC GPIOs

Lin, Meng-Bo (5):
      dt-bindings: qcom: Document bindings for new msm8916-samsung-e2015 devices
      arm64: dts: qcom: msm8916-samsung-e2015: Add initial common dtsi
      ARM: dts: qcom-msm8916-samsung-e2015: Include dts from arm64
      arm64: dts: qcom: msm8916-samsung-e2015: Add touchkey
      arm64: dts: qcom: msm8916-samsung-a2015: Rename touchscreen analog regulator

Luca Weiss (5):
      arm64: dts: qcom: sm6350: Add interconnect support
      arm64: dts: qcom: pm6150l: add missing adc channels
      arm64: dts: qcom: sm6350: Add GPI DMA nodes
      arm64: dts: qcom: Add pm7250b PMIC
      arm64: dts: qcom: sm7225-fairphone-fp4: Add pm7250b PMIC

Matthias Kaehlcke (4):
      arm64: dts: qcom: sc7280-herobrine: Don't enable the USB 2.0 port
      arm64: dts: qcom: sc7280-qcard: Add alias 'wifi0'
      arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
      arm64: dts: qcom: sc7280-herobrine: Add nodes for onboard USB hub

Rajendra Nayak (2):
      arm64: dts: qcom: sc7280: Add cpu and llcc BWMON
      arm64: dts: qcom: sc7280: Add required-opps for USB

Satya Priya (2):
      arm64: dts: qcom: sc7280: Cleanup the lpasscc node
      arm64: dts: qcom: sc7280: Update lpasscore node

Sheng-Liang Pan (2):
      dt-bindings: arm: qcom: document sc7280 and evoker board
      arm64: dts: qcom: sc7280: Add device tree for herobrine evoker

Srinivasa Rao Mandadapu (12):
      arm64: dts: qcom: sc7280: Add nodes for soundwire and va tx rx digital macro codecs
      arm64: dts: qcom: sc7280: Enable digital codecs and soundwire for CRD 1.0/2.0 and IDP boards
      arm64: dts: qcom: sc7280: Enable digital codecs and soundwire for CRD 3.0/3.1
      arm64: dts: qcom: sc7280: Add wcd9385 codec node for CRD 1.0/2.0 and IDP boards
      arm64: dts: qcom: sc7280: Add wcd9385 codec node for CRD 3.0/3.1
      arm64: dts: qcom: sc7280: Add max98360a codec for CRD 1.0/2.0 and IDP boards
      arm64: dts: qcom: sc7280: herobrine: Add max98360a codec node
      arm64: dts: qcom: sc7280: Add lpass cpu node
      arm64: dts: qcom: sc7280: Enable lpass cpu node for CRD 1.0/2.0 and IDP boards.
      arm64: dts: qcom: sc7280: Enable lpass cpu node for CRD 3.0/3.1
      arm64: dts: qcom: sc7280: Add sound node for CRD 1.0/2.0 and IDP boards
      arm64: dts: qcom: sc7280: Add sound node for CRD 3.0/3.1

Stephen Boyd (1):
      arm64: dts: qcom: sc7180-trogdor: Keep pm6150_adc enabled for TZ

Taniya Das (4):
      arm64: dts: qcom: sc7280: Update lpassaudio clock controller for resets
      dt-bindings: clock: Add "qcom,adsp-pil-mode" property
      dt-bindings: clock: Add resets for LPASS audio clock controller for SC7280
      dt-bindings: clock: Add support for external MCLKs for LPASS on SC7280

Yassine Oudjana (2):
      arm64: dts: qcom: msm8996-xiaomi-*: Add LEDs
      arm64: dts: qcom: Use WCD9335 DT bindings

Yunlong Jia (2):
      arm64: dts: qcom: Add SKU6 for sc7180-trogdor-pazquel-lte-parade
      dt-bindings: arm: qcom: Document additional sku6 for sc7180 pazquel

 Documentation/devicetree/bindings/arm/qcom.yaml    |  21 +
 .../bindings/clock/qcom,sc7280-lpasscc.yaml        |   6 +-
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |  26 +-
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |   8 +
 .../devicetree/bindings/pci/qcom,pcie.yaml         |  10 +-
 arch/arm/boot/dts/Makefile                         |   3 +
 arch/arm/boot/dts/qcom-msm8916-samsung-e5.dts      |   3 +
 arch/arm/boot/dts/qcom-msm8916-samsung-e7.dts      |   3 +
 .../arm/boot/dts/qcom-msm8916-samsung-grandmax.dts |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |   7 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |  11 +-
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |   2 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  15 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |   4 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   6 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   4 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   4 +-
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |   2 +-
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |  85 +++
 arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dts    |  24 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dts    |  29 +
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |  60 ++
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |   9 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  18 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   6 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |   2 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |   2 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  20 +-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   4 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  52 ++
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |   5 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |  33 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  41 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  24 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |  19 +
 arch/arm64/boot/dts/qcom/pm660.dtsi                |   2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              | 149 +++++
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   3 +-
 arch/arm64/boot/dts/qcom/pm8953.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |   3 -
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  15 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   3 -
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  23 +-
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     |   2 -
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts      |  19 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |  12 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |   2 -
 .../dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts |   2 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |  11 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |  19 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |  20 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  26 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  11 -
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         |  37 ++
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 155 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts  |   7 +-
 .../boot/dts/qcom/sc7280-herobrine-evoker-r0.dts   | 333 +++++++++++
 .../dts/qcom/sc7280-herobrine-herobrine-r1.dts     |   1 +
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +
 .../boot/dts/qcom/sc7280-herobrine-villager-r0.dts | 325 +----------
 .../dts/qcom/sc7280-herobrine-villager-r1-lte.dts  |  14 +
 .../boot/dts/qcom/sc7280-herobrine-villager-r1.dts |  43 ++
 .../boot/dts/qcom/sc7280-herobrine-villager.dtsi   | 326 +++++++++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  87 +--
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi     |   8 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   3 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 240 +++++++-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |  88 ++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 634 +++++++++++++++------
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  31 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  48 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   3 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   4 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  18 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  16 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  12 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   8 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  66 ++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   2 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   2 +-
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |   4 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 182 +++++-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  67 +++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  18 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  56 +-
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |   4 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  44 +-
 .../dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts  | 634 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 233 +++++---
 .../dt-bindings/clock/qcom,lpassaudiocc-sc7280.h   |   5 +
 .../dt-bindings/clock/qcom,lpasscorecc-sc7280.h    |   2 +
 106 files changed, 3724 insertions(+), 996 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-samsung-e5.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-samsung-e7.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8916-samsung-grandmax.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pm7250b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
