Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751929D260
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 02:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131932; cv=none; b=sZcZgGhqnOY/5u6VApiXAE5x0wWKJ+Kf93wYIx49uUAqGCK0UDh3tUJsviKu8nLPT6QlOrSJYp6Bu5VIN2Tu2uHTdFBHC/fAxLIVwHw/27/feABawBk4TMjLEN5j2tnavbNL34jg6g8tWamP8lXBk4RHZu09r7lF33kwiQkR9Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131932; c=relaxed/simple;
	bh=gAGMzFC1VvW233/ajuDjLWcMn+ClKl8g6gXSsDPATsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sB6opE0lUOplZ7vQmL0M4TmARG/KWdMzCEizdGn5+KjN8o57OlY3U6flrTz8NJ4qFFxkAtu/LZH+gF7nuBS8pzluHv9ndpAe0iABSwG57cTMxZy0kDVkWBgk3jB7/VhO8DcT1o0st2DP48Pk/hJUIai1KyeiI01BJUH0sKPFBSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfbQ5mFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfbQ5mFT"
Received: by smtp.kernel.org (Postfix)
	id A7E661F00898; Wed, 23 Sep 2026 02:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0641F000FF;
	Wed, 23 Sep 2026 02:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790131921;
	bh=CLTF2Vdmr4gm0128WVupm4njSeiHocvI5hxeTrZWlGc=;
	h=From:To:Cc:Subject:Date;
	b=PfbQ5mFTUetbzuqOOu3ih17GABX2GXu9qW0c6pBOYMqhTG33vVSpsO15//nweOSmt
	 KOhn7XAo2eY1uEFZkWwPbTbFHxV9r1vewU3dgd+3IqWRTm97Zsht8EAdj54kNWUWsl
	 AXivqUqaqqqcY1Jrbmi0K0/D7O3gNPj1SfB6W1k8XFigifbkyF+L0SBYAxHx0YCZdg
	 EUiTAu2YoHFYP9x3XJpP3DICR8VBUXZ8VeNg1H//1C3gf514a/4n+25YxtQP2/PH40
	 GYgiW/4/5YIAVZOZx6a4DWT+5pv+zNZTkxxPp2dS4awK8Jcv+LxGIg6rQ7ldbS5eBI
	 +2+C4aQn+xh0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Alex Elder <elder@riscstar.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Luo Jie <jie.luo@oss.qualcomm.com>,
	Reza Kurniawan <imkyufie@gmail.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	Aditya Sherawat <asherawa@qti.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	Greg Ociepka <greg@ferrisoft.com>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>,
	Jason Pettit <jason.pettit@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
	Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Xilin Wu <sophon@radxa.com>,
	Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
	Abhishek Thomas Varghese <tessolveupstream@gmail.com>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Danila Tikhonov <danila@mainlining.org>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
	Jan Paszkowski <jan.m.paszkowski@gmail.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	KancyJoe <kancy2333@outlook.com>,
	Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oleg Keri <okerixx@gmail.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Shujath Mohd <shujath@outlook.in>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.4
Date: Tue, 22 Sep 2026 21:51:56 -0500
Message-ID: <20260923025156.407351-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.4

for you to fetch changes up to 32afff1e816e10185bb571aa9d89dc2eb061d548:

  arm64: dts: qcom: Add device tree for Nord RRD board (2026-09-17 22:15:17 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v7.4

Introduce device trees for the Nord SoC series, including the directly
managed Embedded and SCMI-managed GearVM variants. Add the SA8797P Ride
reference board with UFS and serial ports, and the Dragonwing IQ10 RRD
robotics board with UFS, PMICs, I2C and SPI.

Add the QCS8300-AC Monaco AC EVK, describing its storage, connectivity,
DSPs and peripheral interfaces, and provide an IFP mezzanine combination.
Enable PMIC MBG thermal monitoring on Monaco and Lemans.

Add Glymur-based HP EliteBook X G2q 14 AI, Lenovo Yoga Slim 7x Gen11 and
Asus Zenbook A14 UX3407NA laptop device trees. Describe Glymur PCIe3a
and its shared PCIe3 PHY, correct Mahua's dedicated PCIe3b PHY, and add
missing Glymur USB clock, power and interconnect votes. Fix Glymur CRD
SD-card supply voltages and reserve its EC reset GPIO; describe the Yoga
camera privacy switch and correct the Zenbook A16 microphone sample rate.

Extend Eliza with PCIe controllers and PHYs, EVK M.2 and TC9563 switch
connections, multimedia clock controllers, CDSP, and Adreno A722 GPU
nodes with cooling. Enable the GPU on the MTP and CQS SOM, CDSP on both,
and SD card and keys on the appropriate evaluation boards. Connect the
Eliza USB3 PHY pipe clock and add its GPU, video and camera clock bindings.

Describe the Shikra Adreno A704 GPU, cooling and EVK enablement, along
with CoreSight, crypto, TRNG and TPM support; release GPIOs blocking
SPI5. Add SM8750 GPU clock and IOMMU nodes without enabling the GPU.

Enable WCN6755 WiFi and Bluetooth on the Milos-based Fairphone 6 and
add the associated wireless and Bluetooth bindings. Add power domains
to the Milos camera and video clock controllers. Describe IMX219 camera
modules on either RUBIK Pi 3 connector with separate overlays and a
3.3 V output supply on the base board.

Add SC8280XP thermal zones and correct GPI DMA channel assignments on
its boards. Mark its FastRPC context banks DMA-coherent to fix DSP
library-loading failures; enable higher DisplayPort link rates and DP
audio on the ThinkPad X13s. Mark Glymur USB controllers DMA-coherent.

Describe Hamoa and Purwa IoT EVK M.2 Key E connectors, add Hamoa PCIe
root-port and graph connections, QREF regulator supplies and the USB4
PHY clock, and enable thermal control on the Hamoa CRD. Add DisplayPort
audio and GPIO volume keys on X1 Denali and QoS clocks on X1E80100.

Enable IPQ5018's internal MDIO bus and the external QCA8081 PHY on
RDP432-C2. Add the Raspberry Pi Touch Display 2 overlay for the Talos
EVK. Enable UFS on the Xperia Sagami, NFC on SDM670 Google boards,
display on the AYANEO Pocket S2, and UART, haptics and LED on the
Xiaomi Riva. Add the Fairphone 4 PON correction, Nothing Phone (1)
WiFi calibration variant, Xperia Tama Bluetooth pin fix, and assorted
board-level PCI function and pinctrl cleanups.

Document the Kuno IDP board, the Glymur SDHCI compatible, Kryo 475
CPUs and the SM7250 SoC ID; tidy deprecated SPMI bus IDs and redundant
DT includes.

----------------------------------------------------------------
Aastha Pandey (1):
      arm64: dts: qcom: shikra: Add GPU cooling

Abel Vesa (9):
      arm64: dts: qcom: glymur-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: eliza: Add GPU SMMU node
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-evk: Add power and volume keys
      arm64: dts: qcom: eliza-mtp: Add support for SD card
      arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
      arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC

Abhishek Thomas Varghese (1):
      arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch overlay

Aditya Sherawat (2):
      arm64: dts: qcom: shikra: Add A704 GPU support
      arm64: dts: qcom: shikra-evk: Enable A704 GPU

Alex Elder (6):
      arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
      arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function nodes
      arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function nodes
      arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
      arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes

Bibek Kumar Patro (1):
      arm64: dts: qcom: shikra: Add Adreno SMMU node

Bjorn Andersson (5):
      Merge branch '20260806-eliza-mm-cc-v9-v10-1-6ba52dd14343@oss.qualcomm.com' into HEAD
      arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc thermal sensor provider
      arm64: dts: qcom: hamoa-crd: Add thermal control
      dt-bindings: arm: qcom: Add Asus Zenbook A14 (UX3407NA)
      arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)

Dale Whinham (2):
      arm64: dts: qcom: x1-denali: Add audio playback over DisplayPort
      arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys

Danila Tikhonov (1):
      arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k calibration-variant

David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Set i2c3 frequency to 400 kHz
      arm64: dts: qcom: sdm845-google: Improve NFC pins description

Deepti Jaggi (2):
      arm64: dts: qcom: Add device tree for Nord GearVM variant
      arm64: dts: qcom: Add device tree for Nord Ride board

Gaurav Kohli (1):
      arm64: dts: qcom: eliza: Add GPU cooling

Greg Ociepka (2):
      arm64: dts: qcom: glymur: Add missing USB clock, power and bandwidth votes
      arm64: dts: qcom: glymur: Mark USB controllers dma-coherent

Hardeep Sharma (1):
      dt-bindings: arm: qcom: Document Kuno IDP board

Hongyang Zhao (2):
      arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
      arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219 camera overlays

Icenowy Zheng (6):
      arm64: dts: qcom: sc8280xp-crd: set GPI DMA channels
      arm64: dts: qcom: sc8280xp-huawei-gaokun3: set GPI DMA channels
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: set GPI DMA channels
      arm64: dts: qcom: sc8280xp-microsoft-arcata: set GPI DMA channels
      arm64: dts: qcom: sc8280xp-microsoft-blackrock: set GPI DMA channels
      arm64: dts: qcom: sc8280xp: remove GPI DMA channel masks

Jan Paszkowski (1):
      arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS

Jason Pettit (2):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI

Jens Glathe (2):
      arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on external DPs
      arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio playback support

Jie Gan (1):
      arm64: dts: qcom: shikra: Add coresight nodes

Kamal Wadhwa (1):
      arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage for SD-card

KancyJoe (1):
      arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display nodes

Khalid Faisal Ansari (1):
      arm64: dts: qcom: shikra: enable ST33 TPM

Konrad Dybcio (7):
      arm64: dts: qcom: agatti: Flatten the USB node
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
      arm64: dts: qcom: glymur-asus-zenbook-a16: Fix up the mic sample rate
      arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Drop NOP override
      dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
      arm64: dts: qcom: glymur: Add Lenovo Yoga Slim 7x Gen11
      arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4

Krishna Chaitanya Chundru (3):
      arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes
      arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
      arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch

Krzysztof Kozlowski (1):
      arm64: dts: qcom: sdm845-oneplus: Drop redundant status=okay

Kuldeep Singh (1):
      arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes

Luca Weiss (10):
      dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
      arm64: dts: qcom: kodiak: Sort pinctrl subnodes by pins
      arm64: dts: qcom: kodiak: Add camera mclk pinctrl definitions
      arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Use common pinctrl
      arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350 PON
      dt-bindings: bluetooth: qcom,wcn6750-bt: Document WCN6755 Bluetooth
      arm64: dts: qcom: milos: Split up uart11 pinctrl
      arm64: dts: qcom: milos: Add WCN6755 WiFi node
      arm64: dts: qcom: milos-fairphone-fp6: Enable Bluetooth
      arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi

Luo Jie (3):
      arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
      arm64: dts: qcom: ipq5018: Enable mdio0 for SoC-integrated EPHY
      arm64: dts: qcom: ipq5018-rdp432-c2: Enable mdio1 and add QCA8081 PHY

Monish Chunara (1):
      dt-bindings: mmc: sdhci-msm: Document the Glymur compatible

Neil Armstrong (1):
      arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound card to ayaneo,pocket-s2-sndcard

Oleg Keri (1):
      arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the camera privacy switch

Puranam V G Tejaswi (2):
      arm64: dts: qcom: eliza: Add GPU nodes
      arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU

Qiang Yu (6):
      arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a controller nodes
      arm64: dts: qcom: glymur-crd: Add PHY supplies for pcie3_phy
      arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy with dedicated pcie3b_phy
      arm64: dts: qcom: mahua-crd: Add PHY supplies for pcie3b_phy
      arm64: dts: qcom: hamoa: Drop unused #reset-cells from TCSR node
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

Raviteja Laggyshetty (1):
      arm64: dts: qcom: x1e80100: Add clocks for QoS configuration

Reza Kurniawan (3):
      arm64: dts: qcom: msm8917-xiaomi-riva: Enable debug UART console
      arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO haptic vibrator
      arm64: dts: qcom: msm8917-xiaomi-riva: Add notification LED support

Richard Acayan (1):
      arm64: dts: qcom: sdm670-google: Add NFC support

Sachin Gupta (2):
      arm64: dts: qcom: lemans-pmics: Enable PMIC MBG thermal monitor
      arm64: dts: qcom: monaco-pmics: Enable PMIC MBG thermal monitor

Shawn Guo (6):
      arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI nodes
      arm64: dts: qcom: Drop redundant qcom-rpmpd.h includes
      arm64: dts: qcom: Add device tree for Nord SoC series
      arm64: dts: qcom: Add device tree for Nord Embedded variant
      dt-bindings: arm: qcom: Document Nord reference boards
      arm64: dts: qcom: Add device tree for Nord RRD board

Shujath Mohd (1):
      arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth UART pinctrl

Sreeshankar K (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
      dt-bindings: arm: cpus: Document Kryo 475 CPUs

Taniya Das (7):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      arm64: dts: qcom: milos: Add power-domains for camcc and videocc
      arm64: dts: qcom: eliza: Add support for MM clock controllers

Umang Chheda (3):
      dt-bindings: arm: qcom: Add monaco-ac-evk support
      arm64: dts: qcom: monaco: Add monaco-ac EVK board
      arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine

Viken Dadhaniya (1):
      arm64: dts: qcom: talos-evk-som: Add firmware-name to QUPv3 nodes

Wei Deng (4):
      arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_port0 and uart14
      arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
      arm64: dts: qcom: purwa-iot-evk: Describe the PCIe M.2 Key E connector

Xilin Wu (2):
      arm64: dts: qcom: sc8280xp: Add more thermal zones
      arm64: dts: qcom: sc8280xp: Mark FastRPC context banks as dma-coherent

Xueyao An (1):
      arm64: dts: qcom: shikra: Unreserve GPIOs 14-17 blocking SPI5 access

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   15 +
 .../bindings/clock/qcom,milos-camcc.yaml           |   39 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../devicetree/bindings/mmc/qcom,sdhci-msm.yaml    |    1 +
 .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |   10 +-
 .../bindings/net/wireless/qcom,ath11k.yaml         |   16 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   27 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   76 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi        |   15 +
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  243 ++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |   34 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  774 +++-
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 1140 +++++
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  |    2 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |    8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   13 +-
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    |  940 ++++
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 1221 ++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  396 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  130 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |   21 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |   21 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |    1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   40 +-
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |   10 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   21 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  979 +++--
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |   12 +-
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi         |  116 +
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |    5 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |   89 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  191 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |   86 +-
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts         |  938 ++++
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    |   12 +-
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi         |   62 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |   35 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 1820 ++++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi          | 2848 ++++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts             |  254 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |  424 ++
 arch/arm64/boot/dts/qcom/nord.dtsi                 | 4605 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         |  129 +-
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |   21 +
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |   24 +-
 .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso |   13 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   12 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |   12 +-
 .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  |  115 +
 .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  |  115 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |   23 +
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts       |   12 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |    1 -
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    3 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |    3 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   37 +
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |    3 +
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |    3 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  574 ++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |   42 +
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   36 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    1 -
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    2 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    2 -
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |    1 -
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   18 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi       |    1 -
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1776 +++++++-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    4 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |    2 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |    1 -
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |   17 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |    2 -
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |  232 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 -
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |   70 +-
 .../boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso |   88 +
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |    4 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |    1 -
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |   21 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   21 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   21 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |   21 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |   21 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |   89 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   21 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   21 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  119 +
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   21 +
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |   21 +
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   21 +
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |   25 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   21 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   21 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   21 +
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |   21 +
 include/dt-bindings/arm/qcom,ids.h                 |    1 +
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 +
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 108 files changed, 20896 insertions(+), 1036 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso
 create mode 100644 include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-videocc.h
