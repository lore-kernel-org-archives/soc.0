Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE9C0032E
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 19:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4633C433CA; Wed, 25 Oct 2023 19:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCEBC433C7;
	Wed, 25 Oct 2023 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698263796;
	bh=EzptbtRS2lFtsrX3aosba7beQAaRNNUxvLxXfzsBJcQ=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=dcc3MKImitksd9aumUoEjiPMhBKua7rmgMvsgWRCEWAfnoj8ViRo5dgOCthksRzA6
	 OdKJsBg6PdlUibc6lzdODeuToLuz1NvaKt4rcImZKG6i82RH0YWQPSueRVT/svtzzf
	 zfhhuIxnn+jPv/hZBOEcpslmoPkEX2OKfvO4Jv2PXL1ZFnbUSZ01lSNdHzxsdXPsvr
	 WX1p9pqQ9jvMVYYjMXnIvYaF+2NoFWaz38Xw2xQZHDZKraoQshA100lwu/xqpke8+W
	 4HrJqRLFIjzcR0RK0a7eOgzw65pRlNxxZ/iRKNp2DLwEK+Ovau7hYB2xmZGO9WPjWt
	 hhSph11L7da4g==
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
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Anusha Rao <quic_anusha@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Lin,
	Meng-Bo <linmengbo0689@protonmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"J . R . Divya Antony" <d.antony.jr@gmail.com>,
	Jasper Korten <jja2000@gmail.com>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jonathan Albrieux <jonathan.albrieux@gmail.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Priyansh Jain <quic_priyjain@quicinc.com>,
	Raghavendra Kakarla <quic_rkakarla@quicinc.com>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Richard Acayan <mailingradian@gmail.com>,
	Robert Marko <robimarko@gmail.com>
Subject: [GIT PULL] More Qualcomm ARM64 DeviceTree updates for v6.7
Date: Wed, 25 Oct 2023 13:00:52 -0700
Message-ID: <20231025200053.1015821-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 33e9032a1875bb1aee3c68a4540f5a577ff44130:

  arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators (2023-09-27 16:07:27 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.7-2

for you to fetch changes up to c493a2b37a9e9b7864389d72dd9c67d1d39cfc61:

  dt-bindings: arm: qcom: Document MSM8x26-based Lumia phones (2023-10-22 18:40:15 -0700)

----------------------------------------------------------------
More Qualcomm ARM64 DeviceTree updates for v6.7

This describes the USB components on IPQ5018, and one of the SPI
controllers. The IPQ9574 RDP descriptions are refactored to keep common
dtsi, and the WPS button is described.

GPLL0 is described as a source clock for the mailbox (APCS clock)
across IPQ5332, IPQ6018, IPQ8074, and IPQ9574.

On MSM8916, the asynchronous packet router (APR) is described on the
DSP remoteproc, and audio services are described. Audio and modem are
then enabled on a range of MSM8916- and MSM8939-based devices.
GPU support is enabled on the Samsung Galaxy Tab devices, and RGB LED is
added to BQ Aquaris X5 and BQ Aquaris M5.

The QRB4210 RB2 is no longer hard coded to be in peripheral mode, and
RPMh sleep stats are added to the SA8775P platform.

Camera Control Interface (CCI) controllers are introduced on SC7280.

One of the DP PHY compatibles on X13s is updated, to reflect that the it
should operate in eDP mode. And missing camera LED pin configuration is
added.

Flash LED is described fo the SDM845-based OnePlus and Xiaomi devices.

Missing description of USB PHY regulators are added to Sony Xperia 10
IV, and modem and ath10k-based WiFi are enabled.
The uart for the Bluetooth controller on the SM6375 is added as well.

The true rng block is added for SA8775P, SC7280, SM8450, an SM8550.

----------------------------------------------------------------
André Apitzsch (2):
      arm64: dts: qcom: msm8916-longcheer-l8910: Enable RGB LED
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable RGB LED

Anusha Rao (2):
      arm64: dts: qcom: ipq9574: Add common RDP dtsi file
      arm64: dts: qcom: ipq9574: Enable WPS buttons

Caleb Connolly (2):
      arm64: dts: qcom: qrb4210-rb2: don't force usb peripheral mode
      arm64: dts: qcom: sdm845-oneplus: enable flash LED

Dmitry Baryshkov (1):
      arm64: dts: qcom: sm8150: extend the size of the PDC resource

J.R. Divya Antony (1):
      arm64: dts: qcom: msm8916-asus-z00l: Add sound and modem

Jasper Korten (1):
      arm64: dts: qcom: msm8916-samsung-gt5: Add sound and modem

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable flash led

Johan Hovold (1):
      arm64: dts: qcom: sc8280xp-x13s: add missing camera LED pin config

Jonathan Albrieux (1):
      arm64: dts: qcom: msm8916-longcheer-l8910: Add sound and modem

Kathiravan Thirumoorthy (4):
      arm64: dts: qcom: ipq8074: include the GPLL0 as clock provider for mailbox
      arm64: dts: qcom: ipq6018: include the GPLL0 as clock provider for mailbox
      arm64: dts: qcom: ipq9574: include the GPLL0 as clock provider for mailbox
      arm64: dts: qcom: ipq5332: include the GPLL0 as clock provider for mailbox

Konrad Dybcio (5):
      arm64: dts: qcom: sm6375: Add UART1
      arm64: dts: qcom: sm6375-pdx225: Enable MSS
      arm64: dts: qcom: sm6375-pdx225: Enable ATH10K WiFi
      arm64: dts: qcom: sm6375-pdx225: Add USBPHY regulators
      arm64: dts: qcom: sc8280xp-x13s: Use the correct DP PHY compatible

Lin, Meng-Bo (2):
      arm64: dts: qcom: msm8916-samsung-j5: Add sound and modem
      arm64: dts: qcom: msm8939-samsung-a7: Add sound and modem

Luca Weiss (3):
      arm64: dts: qcom: sc7280: Add ports subnodes in usb/dp qmpphy node
      arm64: dts: qcom: sc7280: Add Camera Control Interface busses
      arm64: dts: qcom: pm7250b: Use correct node name for gpios

Neil Armstrong (2):
      arm64: dts: qcom: sm8550: add TRNG node
      arm64: dts: qcom: sm8450: add TRNG node

Nikita Travkin (1):
      arm64: dts: qcom: msm8916-longcheer-l8150: Add sound and modem

Nitheesh Sekar (2):
      arm64: dts: qcom: ipq5018: Add USB related nodes
      arm64: dts: qcom: ipq5018: Enable USB

Om Prakash Singh (2):
      arm64: dts: qcom: sa8775p: add TRNG node
      arm64: dts: qcom: sc7280: add TRNG node

Priyansh Jain (1):
      arm64: dts: qcom: Enable tsens and thermal for sa8775p SoC

Raghavendra Kakarla (1):
      arm64: dts: qcom: sa8775p: Add RPMh sleep stats

Rayyan Ansari (1):
      dt-bindings: arm: qcom: Document MSM8x26-based Lumia phones

Richard Acayan (1):
      arm64: dts: qcom: sdm670: add specific cpufreq compatible

Robert Marko (1):
      arm64: dts: qcom: ipq5018: add QUP1 SPI controller

Stephan Gerhold (9):
      arm64: dts: qcom: msm8916-samsung-gt5: Enable GPU
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable wcnss_mem
      arm64: dts: qcom: msm8916-*: Fix alphabetic node order
      arm64: dts: qcom: msm8916: Add QDSP6
      arm64: dts: qcom: msm8939: Add QDSP6
      arm64: dts: qcom: msm8916: Add common msm8916-modem-qdsp6.dtsi
      arm64: dts: qcom: msm8916-samsung-a2015: Add sound and modem
      arm64: dts: qcom: msm8916-samsung-serranove: Add sound and modem
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add sound and modem

Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5332: populate the opp table based on the eFuse
      arm64: dts: qcom: ipq9574: populate the opp table based on the eFuse

Vincent Knecht (2):
      arm64: dts: qcom: msm8939: Add BAM-DMUX WWAN
      arm64: dts: qcom: msm8916-alcatel-idol347: Add sound and modem

 Documentation/devicetree/bindings/arm/qcom.yaml    |   10 +
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |   12 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   78 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   23 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |  147 +++
 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts        |   63 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |   91 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts        |   65 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts        |   65 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        |   66 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   25 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |  173 ++-
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |   21 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   31 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |  103 ++
 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi  |  148 +++
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   71 ++
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   10 +-
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |    4 +
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |    4 +
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |   92 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts |   26 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts  |   46 +
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |   14 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |    4 +
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |   13 +
 arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts    |    8 +-
 arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts  |    8 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |   74 ++
 .../arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts |    8 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   49 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   55 +
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |   70 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   79 ++
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    1 -
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 1106 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  167 +++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   11 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |    2 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   23 +
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   22 +
 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  |   29 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   43 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |    5 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |    5 +
 49 files changed, 2775 insertions(+), 407 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi
