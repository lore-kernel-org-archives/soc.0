Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E49FEE499C
	for <soc@archiver.kernel.org>; Sat, 19 Aug 2023 03:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA194C433CC; Sat, 19 Aug 2023 03:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C0CC433C8;
	Sat, 19 Aug 2023 03:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692416593;
	bh=KY4mof5DhD6n24PmxV1LpeHFhRQ9FKiz29ZckOE04wg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=MscDILjgMYjfm3hiZI2OGiRth9RRI7zMRC6eVNSj57e8XxWkByEFml0qFgxUSaKtU
	 AwtWHpRWoVzlQkszpTnLFJLuk3TC7v4XjnH7uhv8fvyd/MG6cz/G2umXW+fcgTaO2o
	 D7Rm89DGXR+N1kjx31/1V57nluu4x+e2iuXuyIxHovznE1mPgcn3gn1ldq7Vgn1TS8
	 Xioix2lKg/ABoc+bbVdSrl/jCgXfgr9jgUi3q6QdqMfgc4QLjBH88/4fIqfDhodgUK
	 6Tu0MY5pgGwuyU3vj6MWDbONpoht7MMnPmzZUBd/f1jyvO5VCeao4dOVP/cZ/C1v0l
	 XfDStM6cPCV5g==
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
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Lin,
	Meng-Bo <linmengbo0689@protonmail.com>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Amit Pundir <amit.pundir@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Wronek <davidwronek@gmail.com>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Eric Chanudet <echanude@redhat.com>,
	Jakob Hauser <jahau@rocketmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Rob Herring <robh@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Zeyan Li <qaz6750@outlook.com>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v6.6
Date: Fri, 18 Aug 2023 20:45:49 -0700
Message-ID: <20230819034551.2537866-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.6

for you to fetch changes up to 110e70fccce4f22b53986ae797d665ffb1950aa6:

  arm64: dts: qcom: sdm845-db845c: Mark cont splash memory region as reserved (2023-08-17 19:50:45 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree updates for v6.6

Initial support for the SM4450 platform and the QRD device thereon is
added.

The IPQ5018 platform is introduced, and the RDP432-C2 board thereon.

A shared definition of the IPQ5332 RDP is introduced, as is GPIO-based
LEDs and buttons.

On the IPQ9574 RDP433 USB, CPU cooling maps and regulators are added.

On MSM8916, the D3 camera mezzanine is improved and refactored out to
its own dts. The Samsung Galaxy S4 Mini gains support for its PMIC with
charger, while Samsung Galaxy J5 and E5 gains touchscreen support.

A few fixes for MSM8939 are introduced, and initial support for Samsung
Galaxy A7 is add.

Support for scaling the cache bus fabric is introduced on MSM8996. A
missing interrupt for the USB2 controller is added. The touchscreen vio
supply on Xiaomi Mi 5 is corrected, and a few other cleanups are
introduces across other devices.

The display controller is introduced for MSM8998, a few clock fixes are
introduced and missing power domains are added for the multimedia
subsystem iommu.

Reserved memory-regions and reserved GPIO lists are updated for the
QDU/QRU1000 IDPs.

USB3 PHY is added to the QCM2290, the RB1 gains regulators and GPU is
enabled for the RB2.

PCIe and Ethernet support is introduced on SA8775P, and enabled for the
Ride board.

On SC7180 the PSCI integration is refactored, to allow supporting
devices with the Qualcomm firmware. BWMON is introduced, alongside the
CPUfreq-based bus voting.

A number of fixes are added for SC8180X, on the Primus and Lenovo Flex
5G devices pmic_glink is introduced and wired up, to provide support for
external display.

Missing SCM interconnect is added to SC8280XP, and the PDC is marked as
wakeup-parent of TLMM. On the CRD the gpio for vreg_misc_3p3 is
corrected and a few regulators are renamed to align with schematics. The
Lenovo Thinkpad X13s gains camera activity LED and a set of previously
reserved GPIOs are released. The SA8540P Ride platform gains RTC
support.

For SDM670 CPU and L3 frequency scaling is added, the PDC is introduced
and wired up as wakeup-parent of the TLMM.

On SDM845 the UFS controller gains interconnect path description,
power-domain information is added to GCC and minimum frequency of the
UFS ICE is corrected. On RB3 continuous splash memory region is
described, and the camera subsystem is enabled. On the Lenovo Yoga C630
a missing power supply for the display panel is added, and the debug
UART is introduced.

SDX75 RPMh power-domains and SPMI controller are introduces, the PMX75
PMIC is described and added to the IDP.

GPU description is added to SM6115, and together with display enabled on
the Lenovo Tab P11.

On SM635 BWMON is introduced for LLCC and DDR scaling. Display and GPU
is added, and the PDC is registered as wakeup-parent of TLMM.

L3 cache scaling is introduced on SM6375.

The DSI PHY compatible and an interrupt for I2C7 are corrected for
SM8150, on the Sony Xperia 1 and 5 the ramoops pmsg size is corrected.

On SM8250 BWMONs are introduced for DDR and LLCC scaling, the UFS node
gains interconnect paths, SMMU is marked as DMA coherent and dynamic
power coefficients are updated. On Sony Xperia 1 II and 5 II GPIO line
names are updated.

On SM8350 missing cluster sleep states and LMH interrupts are added,
the CPU compatibles are corrected and APR and LPASS pinctrl support is
introduced. The HDK gains uSD card support and PMK8350 is added.

For SM8450 support for RNG and RPMh stats are added, the ICE handling is
extracted from the UFS node and the display subsystem gains a missing
interconnect path. Thermal description is improved for the HDK.

On SM8550 MTP and QRD the pmic_glink is introduced, to provide
DisplayPort output. A missing regulator supply is also added.

A few platforms that happens to share the RPMH power-domain resource
identifier constants are migrated to new generic defines. ADC channel
names are generalized on various PMICs.

A variety of devices gain chassis-type, and the GIC_SPI constant is
replacing the 0 across a few different platforms.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: sm8550-mtp: Add missing supply for L1B regulator

Alexander Stein (1):
      arm64: dts: qcom: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties

Amit Pundir (1):
      arm64: dts: qcom: sdm845-db845c: Mark cont splash memory region as reserved

AngeloGioacchino Del Regno (1):
      arm64: dts: qcom: msm8998: Add DPU1 nodes

Bartosz Golaszewski (14):
      arm64: dts: qcom: sa8775p: add the SGMII PHY node
      arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface
      arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY
      arm64: dts: qcom: sa8775p-ride: add pin functions for ethernet0
      arm64: dts: qcom: sa8775p-ride: enable ethernet0
      arm64: dts: qcom: sa8775p: add a node for the second serdes PHY
      arm64: dts: qcom: sa8775p: add a node for EMAC1
      arm64: dts: qcom: sa8775p-ride: enable the second SerDes PHY
      arm64: dts: qcom: sa8775p-ride: move the reset-gpios property of the PHY
      arm64: dts: qcom: sa8775p-ride: index the first SGMII PHY
      arm64: dts: qcom: sa8775p-ride: add the second SGMII PHY
      arm64: dts: qcom: sa8775p-ride: sort aliases alphabetically
      arm64: dts: qcom: sa8775p-ride: add an alias for ethernet0
      arm64: dts: qcom: sa8775p-ride: enable EMAC1

Bjorn Andersson (12):
      arm64: dts: qcom: Drop undocumented "svid" property
      Merge branch 'd1c5aa4a8535c645fdb06df62a562918516ba0c6.1686289721.git.quic_varada@quicinc.com' into HEAD
      arm64: dts: qcom: sc8280xp-crd: Correct vreg_misc_3p3 GPIO
      arm64: dts: qcom: sc8280xp-crd: Fix naming of regulators
      Merge branch '20230620-topic-sc8280_gccgdsc-v2-2-562c1428c10d@linaro.org' into arm64-for-6.6
      Merge branch '1689744162-9421-2-git-send-email-quic_rohiagar@quicinc.com' into arm64-for-6.6
      arm64: dts: qcom: sc8180x: Add USB Type-C of_graph anchors
      arm64: dts: qcom: sc8180x-primus: Wire up USB Type-C
      arm64: dts: qcom: sc8180x-flex5g: Wire up USB Type-C
      arm64: dts: qcom: sc8180x: Fix LLCC reg property
      Merge branch '1690533192-22220-2-git-send-email-quic_srichara@quicinc.com' into arm64-for-6.6
      Merge branch '20230622-topic-8998clk-v2-1-6222fbc2916b@linaro.org' into arm64-for-6.6

Bryan O'Donoghue (8):
      arm64: dts: qcom: sdm845: Enable CAMSS on the bare rb3 board
      arm64: dts: qcom: msm8916: Define CAMSS ports in core dtsi
      arm64: dts: qcom: apq8016-sbc: Fix ov5640 regulator supply names
      arm64: dts: qcom: apq8016-sbc: Fix ov5640 data-lanes declaration
      arm64: dts: qcom: apq8016-sbc: Set ov5640 assigned-clock
      arm64: dts: qcom: apq8016-sbc: Rename ov5640 enable-gpios to powerdown-gpios
      arm64: dts: qcom: apq8016-sbc-d3-camera-mezzanine: Move default ov5640 to a standalone dts
      arm64: dts: qcom: apq8016-sbc: Enable camss for non-mezzanine cases

Caleb Connolly (3):
      arm64: dts: qcom: c630: add panel bridge 1p2 regulator
      arm64: dts: qcom: c630: add debug uart
      arm64: dts: qcom: sdm850-*: fix uart6 aliases

David Wronek (1):
      arm64: dts: qcom: msm8996: Fix dsi1 interrupts

Devi Priya (1):
      arm64: dts: qcom: ipq9574: Use assigned-clock-rates for QUP I2C core clks

Dmitry Baryshkov (12):
      arm64: dts: qcom: sm8150: use proper DSI PHY compatible
      Revert "arm64: dts: qcom: msm8996: rename labels for HDMI nodes"
      arm64: dts: qcom: msm8996: rename labels for HDMI nodes
      arm64: dts: qcom: pm8350: fix thermal zone name
      arm64: dts: qcom: pm8350b: fix thermal zone name
      arm64: dts: qcom: pmr735b: fix thermal zone name
      arm64: dts: qcom: pmk8350: fix ADC-TM compatible string
      arm64: dts: qcom: sm8450-hdk: remove pmr735b PMIC inclusion
      arm64: dts: qcom: sm8450-hdk: define DIE_TEMP channels
      arm64: dts: qcom: sm8450-hdk: add ADC-TM thermal zones
      arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq
      arm64: dts: qcom: sm8450: provide MDSS cfg interconnect

Eric Chanudet (1):
      arm64: dts: qcom: sa8540p-ride: enable rtc

Jakob Hauser (1):
      arm64: dts: qcom: msm8916-samsung-serranove: Add RT5033 PMIC with charger

Johan Hovold (1):
      arm64: dts: qcom: sc8280xp-pmics: add explicit rtc interrupt parent

Komal Bajaj (4):
      arm64: dts: qcom: qdu1000-idp: Add reserved gpio list
      arm64: dts: qcom: qru1000-idp: Add reserved gpio list
      arm64: dts: qcom: qdu1000-idp: Update reserved memory region
      arm64: dts: qcom: qru1000-idp: Update reserved memory region

Konrad Dybcio (56):
      arm64: dts: qcom: qcm2290: Add USB3 PHY
      arm64: dts: qcom: sm6350: Add GPUCC node
      arm64: dts: qcom: sm6350: Add QFPROM node
      arm64: dts: qcom: sm6350: Add GPU nodes
      arm64: dts: qcom: sm6350: Fix ZAP region
      arm64: dts: qcom: sm6350: Add DPU1 nodes
      arm64: dts: qcom: sc7180: Hook up BWMONs
      arm64: dts: qcom: sm8250-edo: Add gpio line names for TLMM
      arm64: dts: qcom: sm8250-edo: Add GPIO line names for PMIC GPIOs
      arm64: dts: qcom: sm8250-pdx203: Configure SLG51000 PMIC
      arm64: dts: qcom: sm8250-edo: Rectify gpio-keys
      arm64: dts: qcom: sm6115: Add GPU nodes
      arm64: dts: qcom: sm6115p-j606f: Hook up display
      arm64: dts: qcom: sm6115p-j606f: Enable GPU
      arm64: dts: qcom: qrb4210-rb2: Enable GPU
      arm64: dts: qcom: sc8280xp: Add missing SCM interconnect
      dt-bindings: clock: qcom,gcc-sc8280xp: Add missing GDSCs
      arm64: dts: qcom: sm6375: Set up L3 scaling
      arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names
      arm64: dts: qcom: msm8939: Drop "qcom,idle-state-spc" compatible
      arm64: dts: qcom: msm8939: Add missing 'cache-unified' to L2
      arm64: dts: qcom: apq8039-t2: Drop inexistent property
      arm64: dts: qcom: msm8996: Add missing interrupt to the USB2 controller
      arm64: dts: qcom: sdm845-tama: Set serial indices and stdout-path
      arm64: dts: qcom: msm8998: Provide XO to RPMCC
      arm64: dts: qcom: sm8350: Add missing cluster sleep state
      arm64: dts: qcom: sm8350: Fix CPU idle state residency times
      arm64: dts: qcom: sm8350: Add missing LMH interrupts to cpufreq
      arm64: dts: qcom: sc8180x: Fix cluster PSCI suspend param
      arm64: dts: qcom: sm8350: Use proper CPU compatibles
      arm64: dts: qcom: sm8250: Mark PCIe hosts as DMA coherent
      arm64: dts: qcom: sm8250: Mark SMMUs as DMA coherent
      arm64: dts: qcom: sm8250: Add BWMONs
      arm64: dts: qcom: sm6350: Add BWMONs
      arm64: dts: qcom: sc7180: Bring back cpufreq-based DDR votes
      arm64: dts: qcom: qrb2210-rb1: Add regulators
      arm64: dts: qcom: pm6150l: Add missing short interrupt
      arm64: dts: qcom: pm660l: Add missing short interrupt
      arm64: dts: qcom: pmi8950: Add missing OVP interrupt
      arm64: dts: qcom: pmi8994: Add missing OVP interrupt
      arm64: dts: qcom: sc8180x: Add missing 'cache-unified' to L3
      dt-bindings: qcom: Allow SoC names ending in "pro"
      arm64: dts: qcom: sm8450: Add PRNG
      dt-bindings: clk: qcom,gcc-msm8998: Add missing GPU/MMSS GPLL0 legs
      arm64: dts: qcom: msm8998: Use the correct GPLL0 leg for GPUCC
      arm64: dts: qcom: msm8998: Use the correct GPLL0_DIV leg for MMCC
      arm64: dts: qcom: sm8450: Add RPMh stats
      arm64: dts: qcom: msm8998: Drop bus clock reference from MMSS SMMU
      arm64: dts: qcom: msm8998: Add missing power domain to MMSS SMMU
      arm64: dts: qcom: sc8280xp-x13s: Unreserve NC pins
      arm64: dts: qcom: sc8280xp-x13s: Add camera activity LED
      arm64: dts: qcom: sdm670: Add PDC
      arm64: dts: qcom: sc8280xp: Hook up PDC as wakeup-parent of TLMM
      arm64: dts: qcom: sa8775p: Hook up PDC as wakeup-parent of TLMM
      arm64: dts: qcom: sdm670: Hook up PDC as wakeup-parent of TLMM
      arm64: dts: qcom: sm6350: Hook up PDC as wakeup-parent of TLMM

Krzysztof Kozlowski (44):
      arm64: dts: qcom: sm8450: correct crypto unit address
      arm64: dts: qcom: apq8039-t2: remove superfluous "input-enable"
      arm64: dts: qcom: sc8180x-flex-5g: remove superfluous "input-enable"
      arm64: dts: qcom: msm8916-gt5: drop incorrect accelerometer interrupt-names
      arm64: dts: qcom: msm8916-l8150: correct light sensor VDDIO supply
      arm64: dts: qcom: apq8016-sbc: drop label from I2C and SPI
      arm64: dts: qcom: apq8096-db820c: drop label from I2C
      arm64: dts: qcom: msm8939: drop incorrect smp2p Hexagon properties
      arm64: dts: qcom: msm8996-xiaomi: drop label from I2C
      arm64: dts: qcom: msm8996-xiaomi: use generic node names
      arm64: dts: qcom: sc7180-aspire1: use generic ADC channel node names
      arm64: dts: qcom: sc8180x: use generic ADC channel node names
      arm64: dts: qcom: sc8180x: align thermal node name with bindings
      arm64: dts: qcom: sc8180x-flex-5g: correct panel ports
      arm64: dts: qcom: sc8180x-primus: correct panel ports
      arm64: dts: qcom: sc8180x-flex-5g: align gpio-keys node name with bindings
      arm64: dts: qcom: sm6115-pro1x: fix incorrect gpio-key,wakeup
      arm64: dts: qcom: sm8350-hdk: correct FSA4480 port
      arm64: dts: qcom: sm8450-hdk: correct FSA4480 port
      arm64: dts: qcom: sm6125-pdx201: correct ramoops pmsg-size
      arm64: dts: qcom: sm6125-sprout: correct ramoops pmsg-size
      arm64: dts: qcom: sm6350: correct ramoops pmsg-size
      arm64: dts: qcom: sm8150-kumano: correct ramoops pmsg-size
      arm64: dts: qcom: sm8250-edo: correct ramoops pmsg-size
      arm64: dts: qcom: minor whitespace cleanup around '='
      arm64: dts: qcom: add missing space before {
      arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys wakeup again
      arm64: dts: qcom: sdm850-c630: add missing panel supply
      arm64: dts: qcom: sc8180x-primus: remove superfluous "input-enable"
      arm64: dts: qcom: sm8250-pdx203: add required pin function
      arm64: dts: qcom: sm8350-hdk: include PMK8350
      arm64: dts: qcom: sm8350-hdk: add uSD card
      arm64: dts: qcom: sm8350: add APR and LPASS TLMM
      arm64: dts: qcom: msm8953-vince: drop duplicated touschreen parent interrupt
      arm64: dts: qcom: msm8996-gemini: fix touchscreen VIO supply
      arm64: dts: qcom: msm8996-sagit: drop unsupported syna,codes
      arm64: dts: qcom: sc8180x-pmics: add missing qcom,spmi-gpio fallbacks
      arm64: dts: qcom: sc8180x-pmics: add missing gpio-ranges
      arm64: dts: qcom: sc8180x-pmics: align SPMI PMIC Power-on node name with dtschema
      arm64: dts: qcom: sc8180x-pmics: align LPG node name with dtschema
      arm64: dts: qcom: use defines for interrupts
      arm64: dts: qcom: msm8953-tissot: use 0 as speaker DAI cells
      arm64: dts: qcom: sdm845-enchilada: use 0 as speaker DAI cells
      arm64: dts: qcom: msm8953-daisy: use new speaker maxim,interleave-mode

Lin, Meng-Bo (5):
      arm64: dts: qcom: msm8916-samsung-e2015: Add accelerometer
      arm64: dts: qcom: msm8916-samsung-j5-common: Add touchscreen
      dt-bindings: qcom: Document msm8939,a7
      arm64: dts: qcom: msm8939-samsung-a7: Add initial dts
      arm64: dts: qcom: msm8916-samsung-e5: Add touchscreen

Luca Weiss (2):
      arm64: dts: qcom: pm8953: Add thermal zone
      arm64: dts: qcom: sm8450: Use standalone ICE node for UFS

Manivannan Sadhasivam (4):
      arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC
      arm64: dts: qcom: sdm845: Fix the min frequency of "ice_core_clk"
      arm64: dts: qcom: sdm845: Add interconnect paths to UFSHC
      arm64: dts: qcom: sm8250: Add interconnect paths to UFSHC

Marijn Suijten (1):
      arm64: dts: qcom: Use labels with generic node names for ADC channels

Mrinmay Sarkar (2):
      arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes
      arm64: dts: qcom: sa8775p-ride: enable pcie nodes

Neil Armstrong (8):
      arm64: dts: qcom: sm8[1235]50-mtp: add chassis-type property
      arm64: dts: qcom: sm8[45]50-qrd: add chassis-type property
      arm64: dts: qcom: sm8[1234]50-hdk: add chassis-type property
      arm64: dts: qcom: msm89xx-mtp: add chassis-type property
      arm64: dts: qcom: sdm845-mtp: add chassis-type property
      arm64: dts: qcom: sm8550: add ports subnodes in usb/dp qmpphy node
      arm64: dts: qcom: sm8550-mtp: add pmic glink port/endpoints
      arm64: dts: qcom: sm8550-qrd: add pmic glink port/endpoints

Nikita Travkin (1):
      arm64: dts: qcom: sc7180: Split up TF-A related PSCI configuration

Praveenkumar I (1):
      arm64: dts: qcom: ipq9574: Add cpu cooling maps

Raymond Hackley (1):
      arm64: dts: qcom: msm8939-sony-xperia-kanuti-tulip: Add missing 'chassis-type'

Richard Acayan (3):
      arm64: dts: qcom: sdm670: add osm l3
      arm64: dts: qcom: sdm670: add cpu frequency scaling
      arm64: dts: qcom: sdm670: add frequency profile

Rob Herring (1):
      arm64: dts: qcom: Fix "status" value

Rohit Agarwal (12):
      dt-bindings: power: qcom,rpmhpd: Add Generic RPMh PD indexes
      arm64: dts: qcom: sm8250: Update the RPMHPD bindings entry
      arm64: dts: qcom: sm8350: Update the RPMHPD bindings entry
      arm64: dts: qcom: sm8450: Update the RPMHPD bindings entry
      arm64: dts: qcom: sm8550: Update the RPMHPD bindings entry
      arm64: dts: qcom: sdx75: Add spmi node
      arm64: dts: qcom: Add pinctrl gpio support for pm7250b
      arm64: dts: qcom: Add pm7550ba PMIC dtsi
      arm64: dts: qcom: Add pmx75 PMIC dtsi
      arm64: dts: qcom: sdx75-idp: Add pmics supported in SDX75
      arm64: dts: qcom: sdx75: Add rpmhpd node
      arm64: dts: qcom: sdx75-idp: Add regulator nodes

Sricharan Ramabadhran (3):
      dt-bindings: clock: Add IPQ5018 clock and reset
      dt-bindings: qcom: Add ipq5018 bindings
      arm64: dts: Add ipq5018 SoC and rdp432-c2 board support

Sridharan S N (2):
      arm64: dts: qcom: ipq5332: Add common RDP dtsi file
      arm64: dts: qcom: ipq5332: enable GPIO based LEDs and Buttons

Stephan Gerhold (3):
      arm64: dts: qcom: Add rpm-proc node for SMD platforms
      arm64: dts: qcom: Add rpm-proc node for GLINK gplatforms
      arm64: dts: qcom: msm8939-samsung-a7: Drop internal pull for SD CD

Tengfei Fan (3):
      dt-bindings: arm: qcom: Document SM4450 SoC and boards
      arm64: dts: qcom: Adds base SM4450 DTSI
      arm64: dts: qcom: Add base SM4450 QRD DTS

Varadarajan Narayanan (4):
      dt-bindings: clock: Add USB related clocks for IPQ9574
      arm64: dts: qcom: ipq9574: Add USB related nodes
      arm64: dts: qcom: ipq9574: Add LDO regulator node
      arm64: dts: qcom: ipq9574: Enable USB

Vincent Guittot (1):
      arm64: dts: qcom: sm8250: correct dynamic power coefficients

Zeyan Li (1):
      arm64: dts: qcom: sm8150: Fix the I2C7 interrupt

 .../devicetree/bindings/arm/qcom-soc.yaml          |   2 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |  14 +
 .../bindings/clock/qcom,ipq5018-gcc.yaml           |  63 +++
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts   |  81 ++++
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |  85 +---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            |   2 -
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |  27 +-
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  72 +++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 250 +++++++++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |  78 ++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts        |  26 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts        |  26 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts        |  24 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts        |  47 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  48 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   8 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |  48 ++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              | 182 +++++++-
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |   2 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |   2 +-
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |   2 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |   2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |   2 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |   1 +
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |  21 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dts    |  20 +
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |   1 -
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |  29 ++
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |   8 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dts   |  26 ++
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |  70 ++-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  14 +-
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    | 495 +++++++++++++++++++++
 .../dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts  |   3 +-
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 132 +++---
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |   4 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts |   2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |   3 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 136 +++---
 arch/arm64/boot/dts/qcom/msm8976.dtsi              | 154 +++----
 arch/arm64/boot/dts/qcom/msm8994.dtsi              | 101 ++---
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts           |   1 +
 .../dts/qcom/msm8996-sony-xperia-tone-dora.dts     |   2 +-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   2 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |   8 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 193 +++++---
 .../boot/dts/qcom/msm8996pro-xiaomi-natrium.dts    |   2 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |   2 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |   1 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |   4 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |   1 -
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 417 ++++++++++++++---
 arch/arm64/boot/dts/qcom/pm6125.dtsi               |  18 +-
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |  13 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |  33 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |   5 +-
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |  34 +-
 arch/arm64/boot/dts/qcom/pm7550ba.dtsi             |  70 +++
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |   6 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |   8 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |   6 +-
 arch/arm64/boot/dts/qcom/pm8350.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pm8350b.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |  14 +-
 arch/arm64/boot/dts/qcom/pm8950.dtsi               |  39 +-
 arch/arm64/boot/dts/qcom/pm8953.dtsi               |  45 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi               |  12 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |  17 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |   5 +-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/pmp8074.dtsi              |  27 +-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi               |  21 +-
 arch/arm64/boot/dts/qcom/pmx75.dtsi                |  64 +++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 158 ++++---
 arch/arm64/boot/dts/qcom/qcs404.dtsi               | 160 +++----
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts           |  26 ++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 266 +++++++++++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   8 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  15 +-
 arch/arm64/boot/dts/qcom/qru1000-idp.dts           |  16 +
 arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi        |  11 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |  15 +
 arch/arm64/boot/dts/qcom/sa8540p.dtsi              |   2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          | 279 +++++++++++-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 289 +++++++++++-
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |   6 +-
 arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi  | 107 +++++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   1 +
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts     |   4 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   3 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   3 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |   2 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |   2 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r2.dts     |   2 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |   3 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   3 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   4 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 216 +++++++--
 .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 209 ++++++++-
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |  36 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        | 209 ++++++++-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  66 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  16 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  46 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   2 +
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |   2 +-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 160 +++----
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |   2 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 186 ++++++++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  10 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  16 +
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  13 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   6 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   2 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |   9 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   7 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  57 ++-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   2 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             | 230 ++++++++++
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |  79 +++-
 arch/arm64/boot/dts/qcom/sm4450-qrd.dts            |  18 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi               | 431 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |   2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 233 +++++++---
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |  65 ++-
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  19 +-
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |   4 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 140 +++---
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 494 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               | 227 ++++++++--
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   6 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |   1 +
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   6 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |  22 +-
 .../dts/qcom/sm8250-sony-xperia-edo-pdx203.dts     | 366 +++++++++++++++
 .../dts/qcom/sm8250-sony-xperia-edo-pdx206.dts     | 243 ++++++++++
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |  63 ++-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |   2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 414 +++++++++++------
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |  35 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 399 ++++++++++-------
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            | 303 ++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 274 ++++++------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |  61 ++-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  92 +++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 251 ++++++-----
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   2 +-
 include/dt-bindings/clock/qcom,gcc-ipq5018.h       | 183 ++++++++
 include/dt-bindings/clock/qcom,gcc-msm8998.h       |   3 +
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h      |  10 +
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |   2 +
 include/dt-bindings/power/qcom,rpmhpd.h            |  30 ++
 include/dt-bindings/reset/qcom,gcc-ipq5018.h       | 122 +++++
 174 files changed, 8956 insertions(+), 1972 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pm7550ba.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmx75.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm4450-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm4450.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq5018.h
 create mode 100644 include/dt-bindings/power/qcom,rpmhpd.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq5018.h
