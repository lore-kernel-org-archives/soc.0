Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726891;
	b=nfeKG0rNmcHzajLQq68c2FwvcuhdHxTVVCSHHyuM86z5cpjLuYy06v51Za2EpVCfhciB
	 XEiczqa1v9/0Rre84K6rmtRPI1VLWIR+C6pKHOSNjcp+2oPfdWGQ7F7VKxslh3DbAeUwi
	 67zeZRb68rDcnY0df05P7t8tpl/WTAhhfhR1nLmvDDOuAGcIrGkC9O1wmTRFGAgx3fV8H
	 mNDQdwHYpak3X2vNVFbv/wVdUfdvaMbBx9fgcui8gHC4nxHRJxsd5UohNWI3xKKykow1s
	 9/n20ZVZlpcvhOOSLrjV3iSfQPJJjSwWOssP3F8RK0aSvlwxUN7Wcr0E9YeGobxt32g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726891;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UfLCI2C2VgE8vnvQ4BUNR/0+DG8PQW0v7T9jVXWda/Q=;
	b=PmSmGlK6ENuDIsG1rn+bZiPjbt0nrHDQw28V6Y0QCdwA9Ro/RB5dXlPjhiC2CfHHSRkh
	 cN0l1qekGLtnhcXUbTCn/wwEY7m1AlUlpbgUmupEBAmJg9Q2WyvPiV/PMxbY6UOhAsTh3
	 Xo5uEm2z2cEFUt04qVysvnAg7NQD8YdwT7Q/1x35Yh7yqN3akBCGDUbuTju6ptDG8dPe7
	 2rQWjMHTctnbd9Jdr4zihH9LfKBhlXVXsZPt9Xt604tOc0O/VWb+XOR31jlMgf4AFa8sk
	 ROFwDfR57NXpRPnwHwGEhnJY+QjmmKFGhDZOvk3TuqFNHtvY3gVvLM3y9nwCAhP0qFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kpHrfLOL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CA7606A326
	for <soc@lists.linux.dev>; Thu, 26 Nov 2026 21:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kpHrfLOL
Received: by smtp.kernel.org (Postfix)
	id 33B8C1F000C1; Thu, 26 Nov 2026 21:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8951F00893;
	Thu, 26 Nov 2026 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726891;
	bh=UfLCI2C2VgE8vnvQ4BUNR/0+DG8PQW0v7T9jVXWda/Q=;
	h=From:To:Cc:Subject:Date;
	b=kpHrfLOLuBJkdVmsbz/kjKDqWNbXD5FPGk7SNpLjs7JIBwtypJiWXBcBSH6jimtMF
	 YQWdERoij0385Og/h+p321vHS7/Nt4RV/tfmRoOZLadVLAoxLmtA/Xux99RkQdncdz
	 8DegCUyRlztLMvSw+e+WwyFW4AUw0TKocpCvQa4SDGD5mcFqaJqta+2oMu69v9ZNhL
	 /gxvnIF2hgx4zugdX5NEKJkP9nyHPwy7EFyyjr4K5CpScIOFnKq+MKYjHSqTF0uTXn
	 y/W32X0xITIXoc6dX53dWXgwPhfRbVSW5unszTsZg6H/IWQRuuI0lptwnGAKTJs8Sr
	 qJcY6LtPAC1qw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	George Moussalem <george.moussalem@outlook.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Demeter Barna <me@fromdisposition.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Andrei-Alexandru Bleortu <me@andrei-z.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Peter Chen <peter.chen@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Nizat Mikayilli <nacht@dxdmail.cc>,
	Shujath Mohd <shujath@outlook.in>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Luo Jie <jie.luo@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Nikunj Kela <quic_nkela@quicinc.com>,
	Oleksii Onchul <oleksiionchul@gmail.com>,
	Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
	Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
	Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Xilin Wu <sophon@radxa.com>,
	Yu Zhang <yu.zhang@oss.qualcomm.com>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
	Ajit Singh <blfizzyy@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Amir Dahan <system64fumo@tuta.io>,
	Arnaud Ferraris <aferraris@debian.org>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Fabricio Akio <fabricioakio@gmail.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>,
	Ivan Verbovoy <ivanverbovoy@gmail.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Jason Pettit <jason.pettit@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Le Qi <le.qi@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	=?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>,
	Luke Macken <luke@phorex.org>,
	Marco Mattiolo <marco.mattiolo@hotmail.it>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michael Auer <mick@yoxcu.de>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>,
	Navya Malempati <navya.malempati@oss.qualcomm.com>,
	Pablo del Arco <pablodelarco1@gmail.com>,
	Paul Sajna <sajattack@postmarketos.org>,
	Pushpendra Singh <pussin@qti.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
	Reza Kurniawan <imkyufie@gmail.com>,
	Roman Linev <admin@mswin.me>,
	Val Packett <val@packett.cool>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Vladlen Grachev <webholt@gmail.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>,
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
	Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.5
Date: Thu, 26 Nov 2026 22:01:06 +0100
Message-ID: <20261126210107.21961-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.5

for you to fetch changes up to dde0308a2f8867806a444df1fdd7e685b1c56d5b:

  arm64: dts: qcom: glymur: Add ASUS Ascent QN10 (2026-11-16 19:14:16 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v7.5

Introduce the Maili and Kalambo SoCs and their MTP and CRD reference
boards. Add the Lemans GearVM variant and SA8255P Ride board, Nord Ride
Embedded, Glymur SiP CRD and Mahua QCB.

Add initial device trees for the ASUS Ascent QN10, Advantech SOM-DB5830,
Ubiquiti UniFi U6 Enterprise, SDM845 HDK, Samsung Galaxy Tab S9 Wi-Fi,
Galaxy A52 and A72, Xiaomi 17 Ultra and Nothing Phone (4a) Pro. Add
Eliza CQS EVK eMMC and UFS variants.

Expand Nord with PCIe, GPI DMA, PMIC, DSP and bandwidth monitor resources,
and enable WCN7850 wireless on the Ride Embedded and RRD boards. Describe
Glymur UFS and AV1 encoder clock resources, consolidate its power grids,
and enable Mahua GPU support. Add Eliza FastRPC and RPMh sleep statistics,
and Hamoa UFS inline encryption resources.

Add SM8350 CPU capacity, power, OPP and memory bandwidth descriptions,
including CPU and LLCC bandwidth monitors. Enable DSP cooling on Hamoa,
Monaco, Talos, Lemans and Kodiak, and modem cooling on Kodiak. Split
Kaanapali CPU cluster power domains for independent idle management.

Enable display and Iris video on Fairphone 6, and wireless, storage, IPA
and display on Nothing Phone (3a). Extend Sony Xperia Tama with modem,
IPA, storage and LEDs; enable NFC on SDM845 LG devices. Add camera support
to Fairphone 4 and Valve Deckard, and sound support to Motorola Dubai.

Enable Iris video on Shikra EVK and Microsoft Denali, and add Shikra audio
resources. Add audio to Rubik Pi 3 and Arduino Imola, and DisplayPort and
HDMI audio to SM8450, SM8550 and SM8650 reference boards. Add eDP display
overlays for Hamoa and Purwa IoT EVKs.

Add embedded controller support for ASUS Zenbook A14 and A16, thermal
zones for the X1 ThinkPad T14s, a touchpad for the Mahua ThinkPad T14s,
and an LCD backlight for Denali. Add EL2 overlays for Kodiak, Advantech
SOM-DB5830 and Arduino Monza, and separate X1 PAS remoteproc IOMMU mappings
to avoid boot faults on other EL2 systems.

Correct SM8750 CDSP IOMMU stream masks, SC8280XP GPU SMMU interrupts and
the Lemans secure FastRPC context bank. Fix Glymur regulator and GPU
configuration, Eliza GPIO ranges and M.2 polarity, and the SDM845 LG
backlight. Update USB DMA coherency and IPQ USB controller descriptions.

Document additional board compatibles, including the Microsoft Surface
Laptop 8th Edition, Samsung Galaxy Book2 Go, Acer Swift Go Pro AI, HP
OmniBook Ultra and Vicharak Axon Pro. Update wireless, interconnect, RTC
and SRAM bindings for additional hardware.

----------------------------------------------------------------
Abel Vesa (6):
      arm64: dts: qcom: glymur-asus-zenbook: Drop the CMA region
      dt-bindings: arm: qcom: Describe Eliza CQS eMMC and UFS variants
      arm64: dts: qcom: eliza: Add FastRPC support
      arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
      arm64: dts: qcom: eliza: Separate common CQS SoM and eMMC configuration
      arm64: dts: qcom: eliza: Add CQS EVK UFS variant

Ajit Singh (1):
      dt-bindings: arm: qcom: Add Vicharak Axon Pro

Alex Elder (1):
      arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses

Alexander Koskovich (7):
      arm64: dts: qcom: milos: Add Iris VPU v2.0
      arm64: dts: qcom: milos: consolidate IPA properties
      arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
      arm64: dts: qcom: milos-nothing-asteroids: Enable Bluetooth
      arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
      arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
      arm64: dts: qcom: milos-nothing-asteroids: Enable panel

Alexey Klimov (1):
      arm64: dts: qcom: agatti: add LPASS devices

Amir Dahan (1):
      arm64: dts: qcom: sdm845-lg: Fix dark corner in backlight

Anand Tiwari (2):
      arm64: dts: qcom: hamoa-iot-evk: Add eDP display overlay
      arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay

Andrei-Alexandru Bleortu (4):
      dt-bindings: net: wireless: qcom,ath11k-pci: add QCN9074
      dt-bindings: arm: qcom: add Ubiquiti UniFi U6 Enterprise
      arm64: dts: qcom: ipq5018: enable the PRNG by default
      arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise

Arnaud Ferraris (1):
      arm64: dts: qcom: sdm670-google-common: set chassis-type property

Bartosz Golaszewski (5):
      arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
      dt-bindings: arm: qcom: Document Nord Ride Embedded board
      arm64: dts: qcom: Add initial support for Nord Ride Embedded board
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

Bibek Kumar Patro (1):
      arm64: dts: qcom: nord: Add adreno SMMU nodes

Bjorn Andersson (2):
      dt-bindings: arm: qcom: Add ASUS Ascent QN10
      arm64: dts: qcom: glymur: Add ASUS Ascent QN10

Chunkai Deng (1):
      arm64: dts: qcom: Add header file for IPCC physical client IDs for Maili platforms

Dale Whinham (3):
      arm64: dts: qcom: x1-denali: Enable IRIS video codec
      arm64: dts: qcom: x1-denali: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1-denali: Add PWM backlight for LCD

Daniel Lezcano (1):
      arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs

David Heidelberg (2):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable gpi_dma0
      arm64: dts: qcom: sdm845-google: Move panel pins into common

Demeter Barna (6):
      arm64: dts: qcom: sm8350: Add CPU capacities
      arm64: dts: qcom: sm8350: Add CPU dynamic power coefficients
      arm64: dts: qcom: sm8350: Add the EPSS L3 provider
      arm64: dts: qcom: sm8350: Add CPU OPP tables with memory bandwidth
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add SM8350 CPU and LLCC BWMON
      arm64: dts: qcom: sm8350: Add CPU and LLCC BWMON

Dhruvin Rajpura (1):
      arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support

Dipa Ramesh Mantre (1):
      arm64: dts: qcom: hamoa: Enable CDSP cooling

Dmitry Baryshkov (6):
      dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt parent
      arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt pin
      arm64: dts: qcom: add device tree for SDM845-HDK
      arm64: dts: qcom: sdm845-hdk: add display card overlay
      arm64: dts: qcom: msm8996pro: use the MSM8996 Pro CPU clock compatible

Ekansh Gupta (3):
      arm64: dts: qcom: kaanapali: Add memory-region for audio PD
      arm64: dts: qcom: hawi: Add memory-region for audio PD
      arm64: dts: qcom: lemans: Remove secure FastRPC context bank

Erikas Bitovtas (1):
      arm64: dts: qcom: sm7125-samsung: add initial device tree

Fabricio Akio (1):
      arm64: dts: qcom: sdm630: Add interconnect paths to the BLSP I2C and SPI controllers

Fenglin Wu (1):
      arm64: dts: qcom: Add PMIC support for Maili platforms

Gaurav Kohli (5):
      arm64: dts: qcom: monaco: Add passive polling-delay for gpuss thermal zones
      arm64: dts: qcom: kodiak: Enable CDSP & Modem cooling
      arm64: dts: qcom: lemans: Enable CDSP cooling
      arm64: dts: qcom: talos: Enable CDSP cooling
      arm64: dts: qcom: monaco: Enable CDSP cooling

George Moussalem (7):
      arm64: dts: qcom: ipq5018: Flatten usb controller node
      arm64: dts: qcom: ipq5332: Flatten usb controller node
      arm64: dts: qcom: ipq6018: move DR mode to board DTS
      arm64: dts: qcom: ipq6018: Flatten usb controller nodes
      arm64: dts: qcom: ipq8074: move DR mode to board DTS
      arm64: dts: qcom: ipq8074: Flatten usb controller nodes
      arm64: dts: qcom: ipq9574: Flatten usb controller node

Gopikrishna Garmidi (4):
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      dt-bindings: arm: qcom: Document Microsoft Surface Laptop 8th Edition
      dt-bindings: arm: qcom: Add Mahua QCB

Hardevsinh Palaniya (1):
      arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support

Hongyang Zhao (1):
      arm64: dts: qcom: qcs6490-rubikpi3: Add audio support

Igor Belwon (2):
      dt-bindings: arm: qcom: Document Xiaomi 17 Ultra devices
      arm64: dts: qcom: Add support for Xiaomi 17 Ultra phones

Ivan Verbovoy (1):
      arm64: dts: qcom: sm8150-microsoft-surface-duo: fix da7280 pinctrl state name

Jagadeesh Kona (1):
      arm64: dts: qcom: glymur: Add support for AV1E clock controller

Jason Pettit (1):
      dt-bindings: arm: qcom: add HP OmniBook Ultra 14-kg0xxx

Jens Glathe (1):
      arm64: dts: qcom: x1: split PAS remoteproc iommus out of x1-el2

Jie Gan (2):
      arm64: dts: qcom: shikra: Mark tpdm_dcc device as failed
      arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based probing

Jie Zhang (2):
      arm64: dts: qcom: glymur: fix Adreno X2-90 GMU compatible
      arm64: dts: qcom: mahua: Support GPU and GMU

Jingyi Wang (2):
      arm64: dts: qcom: Introduce Maili SoC
      arm64: dts: qcom: maili: Add base MTP board

Juerg Haefliger (2):
      arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate pmics and chassis
      arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop omnibook-x14.dts include

Kaipeng Zeng (1):
      dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)

Kamal Wadhwa (1):
      arm64: dts: qcom: glymur-crd: Mark L4C regulator as boot-on to save power

Kathiravan Thirumoorthy (1):
      dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332

Komal Bajaj (2):
      arm64: dts: qcom: sm8750: Add watchdog node
      arm64: dts: qcom: shikra-evk: Add GPIO expanders

Konrad Dybcio (22):
      arm64: dts: qcom: kodiak: Use ICC tag defines
      arm64: dts: qcom: sc7180: Use ICC tag defines
      arm64: dts: qcom: sc8180x: Use ICC tag defines
      arm64: dts: qcom: sdm670: Use ICC tag defines
      arm64: dts: qcom: sdm845: Use ICC tag defines
      arm64: dts: qcom: sm8150: Set active-only tags for CPU interconnects
      arm64: dts: qcom: sm8250: Set active-only tags for CPU interconnects
      arm64: dts: qcom: Unify Glymur/Mahua regulator handles
      arm64: dts: qcom: Consolidate Glymur CoB power grid
      arm64: dts: qcom: glymur: Drop L4F0
      arm64: dts: qcom: glymur-crd: Fix L8B0 voltage
      dt-bindings: arm: qcom: Add Glymur SIP CRD
      arm64: dts: qcom: Consolidate Glymur SiP power grid
      arm64: dts: qcom: glymur-crd: Move DP0/DP1 to common dtsi
      arm64: dts: qcom: glymur: Add Glymur SiP CRD
      arm64: dts: qcom: msm8953-flipkart-rimob: Fix panel compatible
      arm64: dts: qcom: msm8994-octagon: Remove ad7147_captouch
      arm64: dts: qcom: sdm845-tama: Enable RGB and flash LEDs
      arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
      arm64: dts: qcom: sm6125: Fix QUSB2 compatible
      arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller
      arm64: dts: qcom: glymur-zenbook-a14: Add Embedded Controller

Krishna Chaitanya Chundru (3):
      arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
      arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
      arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Krishna Kurapati (7):
      arm64: dts: qcom: talos: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sdx75: Mark USB controller as DMA coherent
      arm64: dts: qcom: lemans: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sm8450: Mark USB controller as DMA coherent
      arm64: dts: qcom: qdu1000: Mark USB controller as DMA coherent
      arm64: dts: qcom: kodiak: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sm8350: Mark USB controllers as DMA coherent

Krzysztof Kozlowski (4):
      arm64: dts: qcom: eliza: Use GIC_SPI macro for interrupt-map
      arm64: dts: qcom: eliza: Correct number of TLMM pins in gpio-ranges
      arm64: dts: qcom: Correct white-space style
      arm64: dts: qcom: qcs8550-ayntec: Use hyphens for nodenames

Le Qi (1):
      arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio link

Loic Poulain (1):
      arm64: dts: qcom: monaco-monza-som: Add ADC thermal channels

Luca Weiss (4):
      dt-bindings: arm: qcom: Add Samsung Galaxy Book2 Go
      arm64: dts: qcom: sm6350: Add memory-region for audio PD
      arm64: dts: qcom: milos-fairphone-fp6: Enable display
      arm64: dts: qcom: milos-fairphone-fp6: Enable Iris

Lukas Märdian (1):
      arm64: dts: qcom: mahua-t14s: Enable GPU and GMU

Luke Macken (1):
      arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add Elan touchpad at 0x15

Luo Jie (2):
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: ipq5210: Update xo_board to use fixed factor clock

Manivannan Sadhasivam (2):
      arm64: dts: qcom: glymur: Move the PCIe graph nodes to the board DTs
      arm64: dts: qcom: glymur-crd: Move the PCIe slot supplies to the Port nodes

Marco Mattiolo (1):
      arm64: dts: qcom: sdm845-google: Configure qup_i2c2 pins

Marek Szyprowski (1):
      arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware memory reserved

Michael Auer (1):
      arm64: dts: qcom: sdm845: Route the SPMI interrupt through the PDC

Mohammad Rafi Shaik (3):
      arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5 on CRD
      arm64: dts: qcom: shikra: Add QAIF CPU node for audio
      arm64: dts: qcom: shikra: Add gpr node

Monish Chunara (1):
      arm64: dts: qcom: glymur-crd: Add pull-up for SD card detect

Mukesh Ojha (3):
      arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and drop redundant wifi memory-region
      arm64: dts: qcom: kodiak: Add EL2 overlay
      arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node

Navya Malempati (1):
      arm64: dts: qcom: eliza: Add RPMh sleep stats

Neil Armstrong (10):
      arm64: dts: qcom: sm8650: Add watchdog node
      arm64: dts: qcom: sm8650-valve-deckard: enable the watchdog
      arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
      arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

Nikunj Kela (2):
      dt-bindings: arm: qcom: add SA8255p Ride board
      arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support

Nizat Mikayilli (3):
      arm64: dts: qcom: sm8550: Add missing CPU7 3.36GHz OPP
      dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9 Wi-Fi
      arm64: dts: qcom: sm8550: Add support for Samsung Galaxy Tab S9 Wi-Fi

Oleksii Onchul (2):
      dt-bindings: arm: qcom: Add Nothing Phone (4a) Pro
      arm64: dts: qcom: Add initial Nothing Phone (4a) Pro support

Pablo del Arco (1):
      arm64: dts: qcom: monaco: Add EL2 overlay for monaco-arduino-monza

Paul Sajna (1):
      arm64: dts: qcom: sdm845-lg: Enable NFC

Peter Chen (4):
      arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB controllers
      arm64: dts: qcom: sm8750: Set snps,resume-hs-terminations for USB controller
      arm64: dts: qcom: kaanapali: Set snps,resume-hs-terminations for USB controller
      arm64: dts: qcom: hawi: Set snps,resume-hs-terminations for USB controller

Pradeep P V K (2):
      arm64: dts: qcom: glymur: Add UFS nodes
      arm64: dts: qcom: glymur-qcb: Enable UFS

Pushpendra Singh (1):
      arm64: dts: qcom: nord: Add bwmon node for Nord

Rakesh Kota (1):
      arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10 voltage range

Reza Kurniawan (1):
      arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB support (peripheral mode)

Roman Linev (1):
      arm64: dts: qcom: sm6125: enlarge reserved_mem1

Shawn Guo (8):
      arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to NEGCC
      dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
      arm64: dts: qcom: nord: Add support for ADSP and CDSPs
      arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
      arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
      arm64: dts: qcom: lemans: Move pinctrl states into lemans-embedded.dtsi
      arm64: dts: qcom: lemans: Move platform resources into lemans-embedded.dtsi
      arm64: dts: qcom: Add device tree for Lemans GearVM variant

Shuai Zhang (2):
      arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
      arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support

Shujath Mohd (3):
      arm64: dts: qcom: sdm845-sony-tama: Add battery properties
      arm64: dts: qcom: sdm845-sony-tama: enable modem, SLPI and IPA
      arm64: dts: qcom: sdm845-sony-tama: Enable UFS host controller and PHY

Sivansh Gupta (2):
      arm64: dts: qcom: Commonize glymur-qcb.dts to glymur-qcb.dtsi
      arm64: dts: qcom: Add Mahua QCB

Srinivas Kandagatla (3):
      arm64: dts: qcom: arduino-imola: add support for sound
      arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for 40-pin JHAT connector
      arm64: dts: qcom: monaco-arduino-monza: Add label to sound node

Val Packett (1):
      arm64: dts: qcom: motorola-dubai: Add sound card with aw88261 speakers

Vikash Garodia (2):
      arm64: dts: qcom: shikra: Add Iris video codec node
      arm64: dts: qcom: shikra-evk: Enable Iris core

Vinayak Katoch (1):
      arm64: dts: qcom: sm8750: Fix iommu stream ID masks for CDSP compute CBs

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8650-valve-deckard: Add initial support of camera sensors

Vladlen Grachev (1):
      arm64: dts: qcom: msm8996-oneplus-common: Drop LVS2 voltage constraints

Wei Deng (1):
      arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2 Key E connector

Wenjia Zhang (1):
      arm64: dts: qcom: hamoa: Add ICE node for UFS inline encryption

Xilin Wu (2):
      arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault interrupts
      arm64: dts: qcom: sc8280xp: add missing QUP pinctrl states

Xin Liu (1):
      arm64: dts: qcom: kaanapali: Split cluster power domains

Yijie Yang (1):
      dt-bindings: arm: qcom: Document Maili SoC and its reference board

Yu Zhang(Yuriy) (2):
      arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
      arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

Yuanjie Yang (2):
      arm64: dts: qcom: hamoa: Add Advantech SOM-DB5830
      arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-advantech-som-db5830

Zhangfei Gao (1):
      dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible

Zhiyuan Sheng (1):
      arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO polarity

 Documentation/devicetree/bindings/arm/qcom.yaml    |   44 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |    3 +
 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |    1 +
 .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   |    3 +
 Documentation/devicetree/bindings/sram/sram.yaml   |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   50 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |  157 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts    |   18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts     |   18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts         |  155 -
 arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi   |   27 +
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi    |   29 +
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi        |   18 -
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  141 +-
 .../boot/dts/qcom/eliza-nothing-froggerpro.dts     |  157 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  183 +-
 .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      |  664 ++
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  |  285 +-
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  |  394 +-
 arch/arm64/boot/dts/qcom/glymur-cob.dtsi           |  320 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |   46 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  429 +-
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    |  225 +-
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    |  326 +-
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  689 +-
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi           |  474 ++
 arch/arm64/boot/dts/qcom/glymur-sip-crd.dts        |   14 +
 arch/arm64/boot/dts/qcom/glymur-sip.dtsi           |  304 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  188 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso    |  124 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  123 +-
 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi       |   54 +
 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts      |  119 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   76 +
 arch/arm64/boot/dts/qcom/hawi.dtsi                 |   13 +
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |    6 +-
 .../boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts   |  235 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   54 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |   27 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts        |    6 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   57 +-
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    2 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   95 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |    4 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  110 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |    6 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   48 +-
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |   60 +-
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts    |   20 +
 .../dts/qcom/kaanapali-xiaomi-nezha-common.dtsi    |  880 +++
 .../boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts   |   20 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |   36 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts           |   14 +
 arch/arm64/boot/dts/qcom/kalambo.dtsi              |  123 +
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso           |   39 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  151 +-
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi      | 3685 +++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi        | 3224 +++++++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts   |  222 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 3687 +----------
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |   27 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  440 +-
 arch/arm64/boot/dts/qcom/mahua-qcb.dts             |   30 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |   37 +-
 arch/arm64/boot/dts/qcom/maili-ipcc.h              |   62 +
 arch/arm64/boot/dts/qcom/maili-mtp.dts             |  960 +++
 arch/arm64/boot/dts/qcom/maili.dtsi                | 6930 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   79 +-
 .../boot/dts/qcom/milos-nothing-asteroids.dts      |  309 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |   88 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts         |   62 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |   14 +-
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi     |   40 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  101 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |   17 +-
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts |    3 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |   13 -
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |    2 -
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi           |    4 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 1029 ++-
 arch/arm64/boot/dts/qcom/nord-ipcc.h               |  144 +
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |  621 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |  216 +
 arch/arm64/boot/dts/qcom/nord.dtsi                 | 1536 +++++
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |    7 +
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi        |  543 ++
 arch/arm64/boot/dts/qcom/pmg1110.dtsi              |   57 +
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi        |   57 +
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi       |   54 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso    |  124 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         |  123 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    2 -
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |    8 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   32 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |    8 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  180 +-
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |    8 +
 .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi |    4 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts       |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts          |    2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    1 +
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  134 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   24 +-
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |   10 +
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |    9 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   24 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   30 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   30 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   30 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |   30 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   30 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 1130 +++-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |   14 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   18 +
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |    2 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   25 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |   18 -
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   28 +-
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     |  109 +
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts            |  826 +++
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |   32 +-
 .../dts/qcom/sdm845-sony-xperia-tama-akari.dts     |    7 +
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |    7 +
 .../dts/qcom/sdm845-sony-xperia-tama-apollo.dts    |    7 +
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |   81 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    4 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   26 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    1 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   38 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  295 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    5 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   19 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |   20 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |   20 +
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi |  535 ++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   54 +-
 .../dts/qcom/sm7325-motorola-dubai-common.dtsi     |  119 +
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   25 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   25 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  465 ++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   52 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   41 +
 .../boot/dts/qcom/sm8550-hdk-display-card.dtso     |    4 +
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   52 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   16 +
 .../boot/dts/qcom/sm8550-samsung-gts9wifi.dts      |  873 +++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   78 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |    2 +-
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     |    4 +
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   51 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  |  221 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   53 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                |   21 +
 arch/arm64/boot/dts/qcom/x1-el2-pas.dtso           |   21 +
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |    8 -
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |    4 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |   14 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  112 +
 .../dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts   |    7 +-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |    2 -
 .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |    4 +
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |    3 +-
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts    |   47 +
 170 files changed, 31706 insertions(+), 7016 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-nothing-froggerpro.dts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-cob.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-sip-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-sip.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts
 create mode 100644 arch/arm64/boot/dts/qcom/kalambo-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/kalambo.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-qcb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/maili-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/maili-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/maili.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmg1110.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-hdk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1-el2-pas.dtso
