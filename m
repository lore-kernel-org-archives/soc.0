Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A168036E477
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 16:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429828; cv=none; b=tntm4Af9E1W+7rHb2tRh4N9rzYHleav+uUhYhJWTXEf6bBFGKZElx9yZQrQdlKB6DrflIrhMN79xb7ZF+yUO7P0PkOcF8NDcQlA8mns/Jdaq59QKYDGEQIum+KhZ/nVqByTnG3+QhqaQva2jb4AQ4H2dseLCS7cXZJzdjSLOTxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429828; c=relaxed/simple;
	bh=pZbZypc/Onk1irkkN5Xll3re1DNsGFLMikKwreKVOcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BoODltEs3+UU29Qx5/xeHRcQVPsmRm2h1WINu5DHx9CD11MOSE04Jvx8nGM7vxwQEF5KzI7FY1LUapa37ynfYckxOYEFalXjkYBtl/Q4frUdygN1BPa8F5u2NdekeWCoBJZmCe1OwEgfAoK6V1+Kn9aSn/i1g0YbDzrP+fPP9PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BP40uirQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BP40uirQ"
Received: by smtp.kernel.org (Postfix)
	id 593B41F00A3D; Thu, 30 Jul 2026 16:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322171F000E9;
	Thu, 30 Jul 2026 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785429825;
	bh=jVqc4Kssx3SEq5bNXprAfQCPfYdSlNNm3C1Qt98pwZ8=;
	h=From:To:Cc:Subject:Date;
	b=BP40uirQ0/OoLa1zgIyNIk7VlwQcw0Ci+sgl3nrn3OuMfUhG60cVChLdmKH0EMTkV
	 gmguK3LYseRATK7vsx9pqzHHBFMMgU9vgLFMm3SY0xdqjcTerkt9Q2h1uJpsc9L2Bk
	 1Nlrzt3VyMPNE/u538UoWW0xDk0xEnZPq+eNcP3LLaTQOAw3IZOpWbCoCkYjxEKN1m
	 d7R32nBPKI6HXrdL1k4c6K5owe2k42QNNhvNM7I53mbBZyTrq/jUQxt7hoRZzY4Ldk
	 5uX/IUcLLpj5LoO6FkwU91lF6PBbaxEBpTKv7FrHlodgikDErArbFWq06+VDxjKjX7
	 zVoZZ3csFMxcQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Biswapriyo Nath <nathbappai@gmail.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Joe Sandom <jsandom@axon.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	David Heidelberg <david@ixit.cz>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ajit Singh <blfizzyy@gmail.com>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	Esteban Urrutia <esteuwu@proton.me>,
	Konstantin Shabanov <mail@etehtsea.me>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Xin Xu <xxsemail@qq.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Haritha S K <haritha.k@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <jie.luo@oss.qualcomm.com>,
	Navya Malempati <navya.malempati@oss.qualcomm.com>,
	Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Stanislav Zaikin <zstaseg@gmail.com>,
	Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Xilin Wu <sophon@radxa.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Brian Norris <briannorris@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>,
	David Wales <daviewales@disroot.org>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Dipa Mantre <dipa.mantre@oss.qualcomm.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Michael Scott <mike.scott@oss.qualcomm.com>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.3
Date: Thu, 30 Jul 2026 11:43:37 -0500
Message-ID: <20260730164337.177159-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.3

for you to fetch changes up to 23da74833df803c5e8bea71feb878173764ef121:

  arm64: dts: qcom: eliza: Describe the ADSP GPR node (2026-07-29 16:22:07 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v7.3

Introduce DeviceTree support for the Shikra SoC, its GCC and RPM clock
controllers, CQM, CQS, and IQS SoM platforms, and their evaluation boards.
Document the Hawi and Maili SoCs.

Add the Eliza CQS SoM and EVK platforms, the QCS8550 RB5 Gen 2, Vicharak
Axon Mini, HONOR MagicBook Art 14, Microsoft Surface Pro 12, Xiaomi 12 Lite,
Motorola Edge 30, Sony Xperia M2, and Motorola Moto G2 device trees.

Extend Eliza support with USB, SD card, touchscreen, PMIC, interconnect,
thermal, CPU and LLCC bandwidth-monitor, QUPv3, and ADSP GPR descriptions.

Expand Glymur support with GPU, camera and EVA clock controllers, LPASS
audio, CoreSight, PCIe, USB, IMEM and PIL memory regions, power domains,
thermal cooling, and CRD peripherals. Add SoCCP, PMIC regulator, TRNG, and
CPU-capacity descriptions.

Add display, IPA, camera, USB, audio, crypto, TRNG, CoreSight, and thermal
support to the Kaanapali, Milos, Hamoa, and related platforms. Add embedded
controller support for Hamoa and Glymur boards.

Improve networking-platform descriptions with IPQ PCIe port, PHY, clock,
PWM, regulator, and interrupt updates. Update CTCU, display, Iris, audio,
camera, PCIe, USB-C, power-domain, memory-region, and thermal descriptions
across established Qualcomm platforms.

Correct bindings and DeviceTree validation for Qualcomm compatible strings,
legacy fallback compatibles, node naming and formatting, address ranges,
clock specifiers, reserved memory, regulators, GPIOs, and peripheral wiring.

----------------------------------------------------------------
Abel Vesa (10):
      dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      arm64: dts: qcom: eliza: Add Eliza CQS SoM platform
      arm64: dts: qcom: eliza: Add Eliza CQS EVK board
      arm64: dts: qcom: eliza: Add PMIC nodes for CQS SoM and MTP
      arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
      arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by default
      arm64: dts: qcom: eliza-mtp: Enable touchscreen
      arm64: dts: qcom: glymur: Add CX power domain to GCC
      arm64: dts: qcom: eliza-evk: Add support for USB and SD card
      arm64: dts: qcom: eliza: Describe the ADSP GPR node

Ajit Singh (3):
      dt-bindings: vendor-prefixes: Add prefix for Vicharak
      dt-bindings: arm: qcom: Add Vicharak Axon Mini
      arm64: dts: qcom: qcs6490: Add Vicharak Axon Mini

Akhil P Oommen (1):
      arm64: dts: qcom: Add GPU support for Glymur

Alexander Koskovich (1):
      arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb

Ananthu C V (3):
      dt-bindings: sram: document glymur as compatible
      arm64: dts: qcom: glymur: add IMEM and PIL regions
      arm64: dts: qcom: glymur: fix SoCCP memory mappings

Biswapriyo Nath (5):
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter

Bjorn Andersson (3):
      Merge branch '20260617-evacc_glymur-v2-2-905108dacaaa@oss.qualcomm.com' into arm64-for-7.3
      Merge branch '20260608-shikra-gcc-rpmcc-clks-v5-2-94cefe092ee3@oss.qualcomm.com' into HEAD
      Merge branch '20260624-glymur_camcc-v5-1-a321df74b1a1@oss.qualcomm.com' into HEAD

Brian Norris (1):
      arm64: dts: qcom: Add #{address,size}-cells to Chromium-based /firmware

Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Christopher Obbard (1):
      arm64: dts: qcom: msm8996: add blsp2_spi5 node

Cristian Cozzolino (4):
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable WiFi/Bluetooth
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable Hall sensor

David Heidelberg (4):
      dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDM 850
      arm64: dts: qcom: sdm845-oneplus: Update compatible to include model
      arm64: dts: qcom: qcm6490-shift-otter: Convert fb to use memory-region
      arm64: dts: qcom: qcm6490-fairphone-fp5: Convert fb to use memory-region

David Wales (1):
      dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)

Devi Priya (1):
      arm64: dts: qcom: ipq6018: add pwm node

Dipa Mantre (1):
      arm64: dts: qcom: kaanapali: Enable cpufreq cooling devices

Dmitry Baryshkov (12):
      arm64: dts: qcom: sdm845: consolidate IPA properties
      arm64: dts: qcom: sm6350: consolidate IPA properties
      arm64: dts: qcom: sm8350: consolidate IPA properties
      arm64: dts: qcom: sm8650: consolidate IPA properties
      arm64: dts: qcom: kodiak: consolidate IPA properties
      arm64: dts: qcom: sc8280xp: sort reserved memory regions
      arm64: dts: qcom: sm8350: add Iris device
      arm64: dts: qcom: sm8350-hdk: enable Iris core
      arm64: dts: qcom: sm6115: add venus device
      arm64: dts: qcom: qrb4210-rb2: enable venus device
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

Ekansh Gupta (2):
      arm64: dts: qcom: hamoa: add audio PD remote heap region
      arm64: dts: qcom: talos: Add memory-region for audio PD

Erikas Bitovtas (1):
      dt-bindings: arm: qcom: Add Sony Xperia M2

Esteban Urrutia (3):
      arm64: dts: qcom: sm8450: Add missing PCM_OUT port
      arm64: dts: qcom: sm8450: Remove unneeded reserved memory nodes
      arm64: dts: qcom: sm8450: Add mode-switch property to qmpphy

Fenglin Wu (1):
      arm64: dts: qcom: Add gpio device node for pm8010

George Moussalem (5):
      arm64: dts: qcom: ipq5018: add pwm node
      arm64: dts: qcom: ipq5332: add pwm node
      arm64: dts: qcom: ipq9574: add pwm node
      arm64: dts: qcom: ipq5018: Correct CMN PLL reference clock rate
      arm64: qcom: ipq5018: Add GEPHY RX and TX clocks

Gopikrishna Garmidi (4):
      arm64: dts: qcom: glymur: Fix unit-address mismatch for spmi_bus2
      arm64: dts: qcom: glymur-crd: Move common board nodes to shared DTSI
      arm64: dts: qcom: glymur: Fix gcc clock specifier for usb_mp_qmpphy nodes
      arm64: dts: qcom: glymur-crd: merge duplicate &pmh0101_gpios node extensions

Hans de Goede (2):
      arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
      arm64: dts: qcom: hamoa: Remove mem-reservations which are already covered by EFI

Haritha S K (2):
      arm64: dts: qcom: talos: Add passive polling-delay for gpu-thermal zone
      arm64: dts: qcom: eliza: Enable cpufreq cooling devices

Harrison Vanderbyl (1):
      arm64: dts: qcom: purwa: Add Microsoft Surface Pro 12in

Harshal Dev (1):
      arm64: dts: qcom: glymur: add TRNG node

Hongyang Zhao (1):
      arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to root ports

Imran Shaik (2):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller

Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      arm64: dts: qcom: glymur: Add camera clock controller support

Jens Glathe (1):
      arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc offset

Jianping Li (1):
      arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap

Jie Gan (13):
      arm64: dts: qcom: lemans: Add label properties to CoreSight devices
      arm64: dts: qcom: talos: Add label properties to CoreSight devices
      arm64: dts: qcom: monaco: Add label properties to CoreSight devices
      arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
      arm64: dts: qcom: kaanapali: Add label properties to CoreSight devices
      arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
      arm64: dts: qcom: hamoa: Add label properties to CoreSight devices
      arm64: dts: qcom: monaco: fix wrong connection for the replicator
      arm64: dts: qcom: glymur: Add label properties to CoreSight devices
      dt-binding: document QCOM platforms for CTCU device
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      arm64: dts: qcom: sm8750: enable ETR and CTCU devices
      arm64: dts: qcom: glymur: enable ETR and CTCU devices

Jie Zhang (1):
      arm64: dts: qcom: talos-evk-som: Enable Adreno 612 GPU

Jingyi Wang (4):
      dt-bindings: cache: qcom,llcc: Document Maili SoC
      arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
      arm64: dts: qcom: kaanapali-mtp: Add SoCCP node

Joe Sandom (5):
      arm64: dts: qcom: sm8550: add PCIe MHI register regions
      arm64: dts: qcom: sm8550: add PCIe port labels
      arm64: dts: qcom: sm8550: move IPA properties to SoC device tree
      dt-bindings: arm: qcom: document QCS8550 RB5Gen2 board
      arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support

Jérôme de Bretagne (10):
      arm64: dts: qcom: sc8280xp-arcata: Enable backlight
      arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
      arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
      arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
      arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
      arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
      arm64: dts: qcom: sc8280xp-arcata: Add lid switch
      arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board wcn6855
      arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
      arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies

Kathiravan Thirumoorthy (4):
      dt-bindings: arm: qcom: sort compatibles alphabetically by base SoC
      arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
      arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node
      arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs

Komal Bajaj (5):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      arm64: dts: qcom: Add Shikra EVK boards

Konrad Dybcio (12):
      arm64: dts: qcom: hamoa: Add interconnects to primary USB3 controller
      arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
      arm64: dts: qcom: sc8280xp: Add Iris core
      arm64: dts: qcom: sc8280xp-x13s: Enable Iris
      arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
      arm64: dts: qcom: sc8180x-primus: Describe the display power net
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the display power net
      arm64: dts: qcom: monaco-arduino-monza: Remove duplicate includes
      arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable GPIO
      arm64: dts: qcom: smb2370: Disable SMB2370_2 by default
      arm64: dts: qcom: glymur: Add PCIe port compatibles and ports

Konstantin Shabanov (3):
      dt-bindings: vendor-prefixes: Add HONOR
      dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
      arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree

Krishna Kurapati (4):
      arm64: dts: qcom: sm8750: Add wakeup-source property to usb controller
      arm64: dts: qcom: kaanapali: Add missing properties to usb controller
      arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node
      arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node

Krzysztof Kozlowski (14):
      arm64: dts: qcom: sm6115-pro1x: Correct touchscreen GPIO flags
      arm64: dts: qcom: talos: Fix GMU unit address
      arm64: dts: qcom: sm8650: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct and complete DP address spaces
      arm64: dts: qcom: sm8750: Correct DPU VBIF address space size
      arm64: dts: qcom: Use hyphen in node names
      arm64: dts: qcom: Use tab for indentation
      arm64: dts: qcom: Use lowercase hex for unit addresses and values
      arm64: dts: qcom: Correct whitespace around '='
      arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
      dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
      dt-bindings: arm: qcom-soc: Allow WSA88xx speaker compatible

Kuldeep Singh (3):
      arm64: dts: qcom: sm8750: wire UFS to ice instance
      arm64: dts: qcom: kaanapali: Add TRNG node
      arm64: dts: qcom: kaanapali: Add qcrypto node support

Loic Poulain (3):
      arm64: dts: qcom: monaco-arduino-monza: add USB-C controller and connector
      arm64: dts: qcom: monaco-arduino-monza: Add fan controller and thermal cooling
      arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

Luca Weiss (10):
      arm64: dts: qcom: milos: Add interconnects to camcc
      arm64: dts: qcom: milos: Add IMEM node
      arm64: dts: qcom: milos: Add display (MDSS)
      arm64: dts: qcom: milos: Add IPA node
      arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
      arm64: dts: qcom: sm6350: Add interconnects for GPU, MPSS & CDSP
      arm64: dts: qcom: sm6350: Add PIL info region
      arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261 amplifiers
      arm64: dts: qcom: milos: Add reset for sdhc_2

Luo Jie (2):
      arm64: dts: qcom: ipq5332: Add CMN PLL node for networking hardware
      arm64: dts: qcom: ipq5332: Represent xo_board as fixed-factor clock

Mahadevan P (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane DisplayPort Alt Mode

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: glymur: Add GPU cooling

Michael Scott (1):
      arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on

Monish Chunara (1):
      arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply for UHS-I mode

Mukesh Ojha (25):
      arm64: dts: qcom: sdm845: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sdm670: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sc7180: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sc7280: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sc8180x: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8150: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8250: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8350: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8450: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8550: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm8650: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: x1e80100: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sm6350: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sar2130p: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: talos: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: monaco: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: lemans: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: sdx75: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: qdu1000: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: eliza: Reduce OS PDC DRV span to 0x10000
      arm64: dts: qcom: kaanapali: Switch SCMI perf protocol to use power-domain-cells
      dt-bindings: arm: qcom: Document Hawi SoC and its reference boards

Navya Malempati (2):
      arm64: dts: qcom: monaco: Remove the little/big_cpu_sleep_0 idle states
      arm64: dts: qcom: lemans: Remove the gold_cpu_sleep idle state

Neil Armstrong (3):
      arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      arm64: dts: qcom: sm8650: add CPU cache size properties
      arm64: dts: qcom: sm8650: fix soundwire ports properties

Pengyu Luo (3):
      arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
      arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
      arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl

Pradyot Kumar Nayak (2):
      arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
      arm64: dts: qcom: glymur: add CPU capacity-dmips-mhz

Qiang Yu (2):
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

Rakesh Kota (1):
      arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints

Richard Acayan (1):
      arm64: dts: qcom: sdm670-google: add lpi reserved gpios

Shawn Guo (1):
      arm64: dts: qcom: Remove sa8775p-ride board

Sibi Sankar (4):
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node
      arm64: dts: qcom: glymur: add SoCCP DT node

Srinivas Kandagatla (3):
      arm64: dts: qcom: Add Display Port audio on Arduino Monza
      arm64: dts: glymur: Add LPASS macro codecs and pinctrl
      arm64: dts: qcom: glymur-crd: add Audio sound card node

Stanislav Zaikin (2):
      dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
      arm64: dts: qcom: sm7325: Add Xiaomi 12 Lite 5G (taoyao) DTS

Swati Agarwal (2):
      arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
      arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode

Taniya Das (2):
      dt-bindings: clock: qcom: Add EVA clock and reset controller for Glymur SoC
      arm64: dts: qcom: glymur: Add EVA clock controller node

Teguh Sobirin (1):
      arm64: dts: qcom: sm8750: Add UART15

Val Packett (1):
      arm64: dts: qcom: sm7325: Add Motorola Edge 30 (dubai) DTS

Vinayak Katoch (2):
      arm64: dts: qcom: glymur: Add memory-region for audio PD
      arm64: dts: qcom: sm8250: Add memory-region for audio PD

Wangao Wang (2):
      arm64: dts: qcom: purwa: Override Iris clocks and operating points
      arm64: dts: qcom: purwa-iot-som: enable video

Wei Deng (2):
      arm64: dts: qcom: lemans: Add compatible to the PCIe Root Port
      arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector

Xilin Wu (2):
      arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake GPIOs to PCIe port nodes
      arm64: dts: qcom: sc8280xp: Add reg and clocks for QoS configuration

Xin Liu (1):
      arm64: dts: qcom: talos: Add EL2 overlay for talos-evk

Xin Xu (3):
      arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
      arm64: dts: qcom: sm8250: Add cam_mclk3_default pinctrl
      arm64: dts: qcom: sm8250-xiaomi-elish: Add ov8856 front camera

Yedaya Katsman (1):
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel compatible

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    4 +
 .../devicetree/bindings/arm/qcom-soc.yaml          |   92 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |  529 ++++---
 .../devicetree/bindings/cache/qcom,llcc.yaml       |   63 +-
 .../bindings/clock/qcom,glymur-evacc.yaml          |   72 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   65 +-
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 Documentation/devicetree/bindings/sram/sram.yaml   |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi      |    2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |    4 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    |    2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |    2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |    2 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   19 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |    2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts         |   14 +
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi        |  399 +++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  112 ++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |   44 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  149 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  415 +-----
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  556 ++++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 1108 ++++++++++++--
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   16 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  284 +++-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   15 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |   24 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts        |   16 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   53 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |   12 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   24 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   34 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   58 +-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   58 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  190 ++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   36 +-
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi          |  104 --
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |    2 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  251 +++-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |    4 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   55 +-
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |   16 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |   13 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   29 +-
 .../boot/dts/qcom/milos-nothing-asteroids.dts      |   38 -
 arch/arm64/boot/dts/qcom/milos.dtsi                |  282 +++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  120 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |   85 +-
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts |  138 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   41 +
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   61 +
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi     |   20 +
 arch/arm64/boot/dts/qcom/pm8010.dtsi               |   20 +
 arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi     |   63 +
 arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi     |   63 +
 arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi        |   87 ++
 arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi        |   63 +
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |    4 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   60 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   64 +-
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |   16 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |    7 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |    6 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |   20 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |    7 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |   18 +-
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |   20 +-
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1014 +++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts       | 1573 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |    4 +-
 .../dts/qcom/qrb2210-rb1-vision-mezzanine.dtso     |    4 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |    4 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    6 +
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   32 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   16 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts       |   17 -
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |   17 -
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    5 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |    2 +-
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |    2 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |    5 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    5 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |   57 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |   56 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   22 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   14 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   38 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  301 +++-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   25 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  343 ++++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |    5 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |    3 -
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    2 -
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    4 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |    2 -
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    2 -
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    2 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    2 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |    5 +-
 .../dts/qcom/sdm850-huawei-matebook-e-2019.dts     |    2 -
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    2 -
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |    3 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    2 +-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   40 +
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |  156 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   40 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   14 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   40 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi       |  170 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  842 +++++++++++
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   65 +
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |   64 +-
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  168 ++-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   19 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    5 +-
 .../dts/qcom/sm7325-motorola-dubai-common.dtsi     | 1454 ++++++++++++++++++
 .../boot/dts/qcom/sm7325-motorola-dubai-csot.dts   |   13 +
 .../boot/dts/qcom/sm7325-motorola-dubai-tianma.dts |   13 +
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts |    3 -
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |    2 -
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts  |  913 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    2 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  153 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   57 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   11 +-
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |    2 -
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    2 -
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |    3 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   86 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   38 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |    4 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |    3 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |    3 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  129 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  266 +++-
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |    2 +
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |    8 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  140 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   16 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |    2 +
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   | 1341 +++++++++++++++++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    | 1194 +++++++++++++++
 include/dt-bindings/arm/qcom,ids.h                 |    1 +
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 include/dt-bindings/clock/qcom,glymur-evacc.h      |   38 +
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++++
 161 files changed, 16108 insertions(+), 1795 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,shikra-gcc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-evk.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs-d-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs-g-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-evk.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/shikra.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-csot.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-tianma.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
 create mode 100644 include/dt-bindings/clock/qcom,glymur-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-evacc.h
 create mode 100644 include/dt-bindings/clock/qcom,shikra-gcc.h
