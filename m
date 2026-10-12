Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC44AC152
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833661; cv=none; b=OOUUKFXXBMK1sswBZp/qkF6jjSHkNL1Kf2jjGK9FF7AAmhHoqNPRRds0ClA04AqUuRVr8NiqETX+Fk7o7dtkLTz5e6Ej4Z87g91xeH6ydDPvGqwu/t35v1Vvqt55qP1GQoAQ6UGM0bspbJSbYASh6Ub8jtQWiq+3r0Z31zAM8J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833661; c=relaxed/simple;
	bh=vnkm87OiC2t155J+t3TwUe4vU2oFhU+xblJLT8Om5so=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GdkX8wQOmXT2V9llM0gCd/Llw4YOCkvWdl/fCAOrOJjRSQ0kkBF155t+x5F8ihIkWECqr1CjBvH//WDs/QPQPiKmOeu+dFxFkyPr1q7VNhcDIQFr7h3BJOZGyRSfDMH16aQmOwhc72527jXAI3KulZnYUHrwms+fbswTTaPp4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqYhSP+v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqYhSP+v"
Received: by smtp.kernel.org (Postfix)
	id 781E61F008A1; Mon, 12 Oct 2026 19:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0381F0089B;
	Mon, 12 Oct 2026 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791833658;
	bh=o9bfM3gNNeoN3+AcqnlIWArV14uYGlsu6rLKxpg7Xy4=;
	h=From:To:Cc:Subject:Date;
	b=KqYhSP+v/uD/+c+o+7gAVxgmPILF2/bT/bkdqYRZqFyTsuCNWCCY1JCEMKHORFpyB
	 2ad1mhnc2ZevhKZVds3RLvQldX4QRnvlXJeVJULPvcy6pnSxaVx9/FskKHXZmS8kwa
	 bLLhOxFeLlgiYMXxtHlH6xpy/gWS0VKdW5BCEWre40Pa3tp2E4ukgzq9SjYd76fZdt
	 EnmWRWh6ZKpkduRlRuv4LEcMAfwp7i+shL28DKoa0AGPKRRBksvqeIe7aBaiXuQXOH
	 bwG7wOqq17Kva7QPyxDtYfVW7hAEKEeLo8rICX2QU2dywlan/ihosjXXbNWKFHKAFz
	 CQitFs++BQOXw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Teguh Sobirin <teguh@sobir.in>,
	David Heidelberg <david@ixit.cz>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Alexandre Hamamdjian <azkali.limited@gmail.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Md Sadre Alam <md.alam@oss.qualcomm.com>,
	=?UTF-8?q?Pablo=20Correa=20G=C3=B3mez?= <pabloyoyoista@postmarketos.org>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Charlie Garner <charlie@akao.au>,
	Daniel J Blueman <daniel@quora.org>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Muzaffer Kadir <muzafferkadir@mainlining.org>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oleksii Onchul <oleksiionchul@gmail.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	William Bright <william.bright@imd-tec.com>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
	Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
	Anurag Pateriya <apateriy@qti.qualcomm.com>,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>,
	Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
	Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Le Qi <le.qi@oss.qualcomm.com>,
	Paul Sajna <sajattack@postmarketos.org>,
	Pavan Kumar <pavan.m@oss.qualcomm.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Robin Snyders <robin@snyders.xyz>,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree updates for v7.4
Date: Mon, 12 Oct 2026 14:34:10 -0500
Message-ID: <20261012193412.14636-1-andersson@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 32afff1e816e10185bb571aa9d89dc2eb061d548:

  arm64: dts: qcom: Add device tree for Nord RRD board (2026-09-17 22:15:17 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.4-2

for you to fetch changes up to d053e38e614fb2e383b298ce8fc308a780d7f209:

  arm64: dts: qcom: shikra-cqs/cqm: Add PMIC thermal support for Shikra IQ2390S SoM platform (2026-10-01 10:04:24 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree updates for v7.4

Introduce the Hawi SoC and MTP, describing its Oryon CPUs, clocks, power
and interconnect topology, storage, PCIe, USB, thermal management and
remote processors. Add the associated CPU, clock and USB bindings.

Add the Valve Steam Frame (Deckard) headset, Lenovo ThinkPad T14s Gen 7,
Advantech SOM-DB5830, Glymur QCB, and IMDT QCS8550 SoM and SBC. Add the
AYN Thor, Odin 2 Mini and Odin 2 Portal, Ayaneo Pocket DS, Retroid Pocket
6 and Pocket Nova gaming devices.

Add Xiaomi Redmi 9T and 11 Lite 5G NE, LeEco Le2, and Motorola One phone
device trees. Add initial support for the MSM8952 binding and General
Mobile vendor prefix, and document the Kalambo SoC and Samsung Galaxy
A52/A72 boards.

Enable Adreno GPUs and thermal cooling on Kaanapali and SM8750 boards.
Expand Nord with LLCC, PMU and multimedia clock controllers, and add
Maili camera and graphics clock bindings. Add camera, SD card, USB,
Type-C, audio clock and PMIC thermal support across the Shikra variants.

Add IPQ9650 PCIe and interconnect support, IPQ5424 watchdog boot status,
and IPQ9574 USB PHY clock and SDHC reset wiring. Enable quad SPI-NAND on
IPQ5332, IPQ5424 and IPQ9574 reference boards.

Rework PCIe PHY and GPIO placement across the older and current SoCs,
correct PCIe WAKE# polarity on affected platforms, and fix SerDes PHY
supplies on the automotive boards. Add GCC CX power domains across the
supported SoCs and enable SDHC inline encryption on Kodiak and Monaco.

Reserve the embedded-controller reset GPIO on X1 laptop platforms to
prevent accidental resets. Add the Lenovo Yoga Slim 7x embedded
controller, and fix PWM backlight and touchscreen support on the Dell
Inspiron 14 Plus 7441.

Enable the MSM8939 Venus accelerator, SM6350 camera subsystem, QCM6490
IPA, Milos bandwidth monitoring, and Glymur SD card. Add DisplayPort
audio on Purwa, improve Monaco Arduino board cooling and controls, and
apply assorted board-level thermal, audio, storage and pinctrl fixes.

----------------------------------------------------------------
Aaron Kling (6):
      dt-bindings: vendor-prefixes: Add Chip Wealth Technology
      dt-bindings: arm: qcom: Add AYN QCS8550 Devices
      dt-bindings: vendor-prefixes: Add Retroid Pocket
      dt-bindings: arm: qcom: Add Retroid Pocket QCS8550 Devices
      arm64: dts: qcom: qcs8550: Add Retroid Pocket 6
      arm64: dts: qcom: qcs8550: Add Retroid Pocket Nova

Abel Vesa (29):
      arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
      arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
      arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-vivobook-s15: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-zenbook-a14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-dell-thena: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-thinkbook-16: Mark the EC reset gpio as reserved
      arm64: dts: qcom: sm8150: Use SM8150_CX for the SDHC power domain
      arm64: dts: qcom: kaanapali: Add GCC CX power domain
      arm64: dts: qcom: monaco: Add GCC CX power domain
      arm64: dts: qcom: sar2130p: Add GCC CX power domain
      arm64: dts: qcom: sdm670: Add GCC CX power domain
      arm64: dts: qcom: sdx75: Add GCC CX power domain
      arm64: dts: qcom: sm4450: Add GCC CX power domain
      arm64: dts: qcom: sm6350: Add GCC CX power domain
      arm64: dts: qcom: sm8150: Add GCC CX power domain
      arm64: dts: qcom: sm8250: Add GCC CX power domain
      arm64: dts: qcom: sm8350: Add GCC CX power domain
      arm64: dts: qcom: sm8450: Add GCC CX power domain
      arm64: dts: qcom: sm8550: Add GCC CX power domain
      arm64: dts: qcom: sm8650: Add GCC CX power domain
      arm64: dts: qcom: sm8750: Add GCC CX power domain
      arm64: dts: qcom: talos: Add GCC CX power domain

Adam Skladowski (7):
      dt-bindings: vendor-prefixes: Add LeEco
      dt-bindings: arm: qcom: Document Motorola Moto One
      dt-bindings: arm: qcom: Document LeEco Le2
      dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
      arm64: dts: qcom: msm8953: Add Motorola One
      arm64: dts: qcom: msm8976: Add LeEco Le2
      arm64: dts: qcom: sm6115: Add Xiaomi Redmi 9T

Akhil P Oommen (3):
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Alexandre Hamamdjian (3):
      dt-bindings: arm: qcom: document the Ayaneo Pocket DS
      arm64: dts: qcom: sm8550: add UART11 node
      arm64: dts: qcom: qcs8550-ayaneo-pocket-ds: add the lower DSI panel

Anandu Krishnan E (1):
      arm64: dts: qcom: shikra: Remove cdsp compute-cb@9

André Apitzsch (2):
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Anurag Pateriya (2):
      arm64: dts: qcom: nord: Add PMU node
      arm64: dts: qcom: nord: Add LLCC node

Anvesh Jain P (1):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add Purwa IOT EVK

Arnd Bergmann (1):
      arm64: dts: qcom: shikra: fix sdhc interrupts property

Bjorn Andersson (5):
      Merge branch '20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.com' into HEAD
      Merge branch '20260915-camcc-hawi-v3-1-5b57f45477f1@oss.qualcomm.com' into HEAD
      Merge branch '20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com' into HEAD
      Merge branch '20260811-ipq9650_icc-v2-1-55b8efbd62c6@oss.qualcomm.com' into arm64-for-7.4
      Merge branch '20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com' into arm64-for-7.4

Charlie Garner (2):
      arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: add PWM backlight
      arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: fix touchscreen i2c address

Cédric Bellegarde (1):
      arm64: dts: qcom: sdm845-oneplus-common: Configure MBHC thresholds

Daniel J Blueman (2):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add Embedded Controller node

David Heidelberg (4):
      arm64: dts: qcom: sdm845-oneplus: Move touchscreen y-axis to the right place
      arm64: dts: qcom: sdm845-oneplus: Define touchscreen in the detail
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Extend the xbl_mem region
      arm64: dts: qcom: sdm845-xiaomi-polaris: Extend the xbl_mem region

Dongfang Zhao (1):
      dt-bindings: clock: qcom: Add Hawi GPU clock controllers

Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      arm64: dts: qcom: msm8939-asus-z00t: add Venus

Gaurav Kohli (3):
      arm64: dts: qcom: kaanapali: Add GPU cooling
      arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal zone
      arm64: dts: qcom: sm8750: Add GPU cooling

Gopikrishna Garmidi (4):
      dt-bindings: arm: qcom: Add Glymur QCB
      dt-bindings: embedded-controller: Add Glymur QCB EC
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Glymur QCB

Hongcheng Zhang (1):
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add PCIe wake GPIO

Imran Shaik (1):
      arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
      dt-bindings: clock: qcom: Add Maili camera clock controllers

Jie Zhang (3):
      arm64: dts: qcom: sm8750: Add GPU and GMU nodes
      arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
      arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add QFPROM node

Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: shikra-cqs/cqm: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: shikra-cqs/cqm: Add PMIC thermal support for Shikra IQ2390S SoM platform

Kathiravan Thirumoorthy (7):
      arm64: dts: qcom: ipq5424: Add the IMEM node
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE clock to GCC
      dt-bindings: interconnect: Add Qualcomm IPQ9650 support
      arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node
      arm64: dts: qcom: ipq9650: add the PCIe support
      arm64: dts: qcom: ipq9650-rdp488: enable PCIe support

Konrad Dybcio (1):
      arm64: dts: qcom: glymur-asus-zenbook-a16: Remove RTC-through-EFIvars

Krishna Chaitanya Chundru (32):
      arm64: dts: qcom: msm8996: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sdm845: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sc8180x: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8150: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8250: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8350: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8450: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8550: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8650: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8750: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: kaanapali: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sar2130p: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: monaco: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: lemans: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: talos: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sa8540p-ride: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: kodiak: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: talos: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: lemans: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to root port node

Krishna Kurapati (3):
      arm64: dts: qcom: shikra: Add support for usb nodes
      arm64: dts: qcom: shikra: Enable USB controllers on CQM, CQS, and EVKs
      arm64: dts: qcom: shikra-cqs/cqm: Add Type-C support on primary controller

Krzysztof Kozlowski (3):
      arm64: dts: qcom: Correct white-space style
      arm64: dts: qcom: Replace spaces indentation with tabs
      arm64: dts: qcom: Correct inconsistent indentation

Le Qi (1):
      arm64: dts: qcom: purwa-evk: add DP0/DP1 audio playback support

Loic Poulain (4):
      arm64: dts: qcom: monaco-arduino-monza: Add sleep button
      arm64: dts: qcom: monaco-arduino-monza: Add GPIO line names
      arm64: dts: qcom: monaco-arduino-monza: microcontroller LEDs
      arm64: dts: qcom: monaco-arduino-monza: Rework fan cooling map

Luca Weiss (4):
      arm64: dts: qcom: milos: Add CPU-to-DDR BWMON support
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent supply for regulators
      arm64: dts: qcom: sm6350: Add CAMSS node
      arm64: dts: qcom: milos: add CPU OPP table with DDR & L3 bandwidths

Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND

Mohd Ayaan Anwar (4):
      arm64: dts: qcom: lemans-evk: fix SerDes PHY regulator supplies
      arm64: dts: qcom: lemans-ride-common: fix SerDes PHY regulator supplies
      arm64: dts: qcom: monaco-evk: fix SerDes PHY regulator supplies
      arm64: dts: qcom: qcs8300-ride: fix SerDes PHY regulator supplies

Monish Chunara (4):
      arm64: dts: qcom: glymur: Add SD Card support
      arm64: dts: qcom: glymur-crd: Enable SD card
      arm64: dts: qcom: shikra: Add SD Card support
      arm64: dts: qcom: shikra-evk: Enable SD card

Mukesh Ojha (8):
      dt-bindings: arm: cpus: Add Oryon PartNum 3 CPU compatibles
      arm64: dts: qcom: hawi: Add header file for IPCC physical client IDs
      arm64: dts: qcom: Introduce Hawi SoC
      arm64: dts: qcom: hawi: Add base MTP board
      arm64: dts: qcom: hawi: Sort IPCC client IDs
      arm64: dts: qcom: hawi: Fix PCIe IOMMU maps
      arm64: dts: qcom: hawi: Enable SoCCP by default
      arm64: dts: qcom: hawi: Trivial fix

Muzaffer Kadir (2):
      dt-bindings: vendor-prefixes: Add General Mobile
      dt-bindings: arm: qcom: Document MSM8952 SoC binding

Neeraj Soni (2):
      arm64: dts: qcom: kodiak: enable inline crypto engine for SDHC
      arm64: dts: qcom: monaco: enable inline crypto engine for SDHC

Neil Armstrong (2):
      dt-bindings: arm: qcom: document the Valve Deckard headset
      arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree

Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node for Shikra
      arm64: dts: qcom: shikra: Add CCI definitions for Shikra
      arm64: dts: qcom: shikra: Add mclks pin configuration for Shikra
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for Shikra

Oleksii Onchul (2):
      dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
      arm64: dts: qcom: sm7325: Add Xiaomi 11 Lite 5G NE

Pablo Correa Gómez (3):
      arm64: dts: qcom: sdm670: add default uart pinctrl nodes
      arm64: dts: qcom: sdm670: add debug uart soc node
      arm64: dts: qcom: sdm670-google-common: enable debug uart

Paul Sajna (1):
      arm64: dts: qcom: sdm845-lg: fix sdcard pinctrl nodes

Pavan Kumar (1):
      arm64: dts: qcom: qcm6490-idp: Add IPA node

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

Robert Marko (1):
      arm64: dts: qcom: ipq9574: add reset to SDHC

Robin Snyders (1):
      arm64: dts: qcom: sm8150: describe download mode register

Ronak Raheja (1):
      dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible

Shawn Guo (2):
      arm64: dts: qcom: kodiak: Use hyphen in rpmhpd OPP node names
      arm64: dts: qcom: lemans: Use hyphen in rpmhpd OPP node names

Sneh Mankad (1):
      arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific

Srinivas Kandagatla (2):
      dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
      arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7

Taniya Das (4):
      dt-bindings: clock: qcom: Add GCC video axi reset clocks for Nord
      dt-bindings: clock: qcom: Add video clock controller on Nord SoC
      dt-bindings: clock: qcom: Add support for Camera Clock Controller for Nord
      arm64: dts: qcom: nord: Add more clock controller nodes

Teguh Sobirin (5):
      arm64: dts: qcom: Add AYN QCS8550 Common
      arm64: dts: qcom: Add AYN Odin 2 Mini
      arm64: dts: qcom: Add AYN Odin 2 Portal
      arm64: dts: qcom: Add AYN Thor
      arm64: dts: qcom: qcs8550: add basic devicetree for Ayaneo Pocket DS gaming console

Viken Dadhaniya (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Increase MCP2518FD SPI frequency to 17MHz

Vinayak Katoch (1):
      arm64: dts: qcom: agatti: Add memory-region for audio PD

Vivek Aknurwar (1):
      dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings

Wei Deng (2):
      arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector

William Bright (2):
      arm64: dts: qcom: qcs8550: Add IMDT QCS8550 SoM
      arm64: dts: qcom: qcs8550: Add IMDT QCS8550 SBC

Xin Liu (3):
      arm64: dts: qcom: purwa-iot-evk: use on-board crystal for PS8830 retimers
      arm64: dts: qcom: hamoa-iot-evk: use on-board crystal for PS8830 retimers
      arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer

Yuanjie Yang (2):
      dt-bindings: arm: qcom: Add Advantech SOM-DB5830
      arm64: dts: qcom: hamoa: Add Advantech SOM-DB5830

 Documentation/devicetree/bindings/arm/cpus.yaml    |    3 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   45 +
 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |   80 +
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   23 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   47 +-
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |    3 +
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |    3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    8 +
 arch/arm64/boot/dts/qcom/Makefile                  |   23 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       |   15 +-
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  |    1 -
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   23 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  699 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  100 +-
 .../boot/dts/qcom/hamoa-advantech-som-6820.dtsi    |   54 +
 .../boot/dts/qcom/hamoa-advantech-som-db5830.dts   |  119 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  131 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |    4 +-
 arch/arm64/boot/dts/qcom/hawi-ipcc.h               |   61 +
 arch/arm64/boot/dts/qcom/hawi-mtp.dts              |  997 +++
 arch/arm64/boot/dts/qcom/hawi.dtsi                 | 6844 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |    2 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |    2 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   16 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |    2 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |  119 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  666 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   10 +-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |    8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  472 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   31 +-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |    4 +-
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |    3 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |   16 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   21 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   24 +-
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1272 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |  393 ++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  201 +-
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |   69 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |   15 +
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |    8 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |    8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   26 +
 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts |  440 ++
 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts      |  442 ++
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |    2 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |    5 +-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |    7 +-
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |    6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   45 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        |  108 +
 arch/arm64/boot/dts/qcom/nord.dtsi                 |   45 +
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |  104 +
 arch/arm64/boot/dts/qcom/pm8005.dtsi               |   35 +
 arch/arm64/boot/dts/qcom/pmh0104-hawi.dtsi         |  103 +
 arch/arm64/boot/dts/qcom/pmi8996.dtsi              |   12 +-
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         |   91 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   54 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    6 +
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |    3 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |    6 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    7 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |    5 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |    4 +-
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |    6 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   12 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |    4 +-
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |    2 +-
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |   16 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |    8 +-
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |   16 +-
 .../boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts     | 1742 +++++
 .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1819 ++++++
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   99 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  250 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      |  401 ++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     |  315 +
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts       |   12 +-
 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   |  116 +
 .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    |  120 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    4 +-
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |    6 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   13 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts      |    4 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts     |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts     |    4 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |    7 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |    7 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   24 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   10 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  116 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |    8 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  272 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   13 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |   13 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   12 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    6 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |    5 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    1 +
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    6 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    6 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    1 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |   72 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   56 +
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |  161 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   52 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   23 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |   72 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   32 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi       |  115 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  548 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    1 +
 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts   |  497 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  234 +
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts    | 1108 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   26 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   49 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   18 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   15 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   25 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   28 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   16 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   20 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |    7 +-
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |    8 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   63 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |   11 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   22 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   16 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   14 +-
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  | 1288 ++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   18 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   10 +-
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |    8 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  339 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |    5 +-
 arch/arm64/boot/dts/qcom/talos-evk.dts             |    2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                |   12 +-
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |    1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |    1 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |    1 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |    3 +-
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |    1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |    3 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |    1 +
 .../qcom/x1e80100-dell-inspiron-14-plus-7441.dts   |   31 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |    1 +
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |    3 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   23 +
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |    1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |    1 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |    1 +
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 +
 include/dt-bindings/clock/qcom,hawi-gpucc.h        |   47 +
 include/dt-bindings/clock/qcom,nord-camcc.h        |  167 +
 include/dt-bindings/clock/qcom,nord-nwgcc.h        |    3 +
 include/dt-bindings/interconnect/qcom,ipq9650.h    |   28 +
 170 files changed, 24697 insertions(+), 575 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-qcb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-advantech-som-6820.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
 create mode 100644 arch/arm64/boot/dts/qcom/hawi-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/hawi-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/hawi.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0104-hawi.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
 create mode 100644 include/dt-bindings/clock/qcom,hawi-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-camcc.h
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq9650.h
