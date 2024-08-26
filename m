Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE8FC5321E
	for <soc@archiver.kernel.org>; Mon, 26 Aug 2024 15:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A5B3C4AF0C; Mon, 26 Aug 2024 15:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B9DC52FC5;
	Mon, 26 Aug 2024 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724685868;
	bh=q1go5qLNLeGjU71k1ExEemMJQnqj7VFbf2UD7R9UlMU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=bqoZP8tp+qXW68ri/Mbp1LAk0eObzg2Xn5rGis+u5PHSx+Xy6ozWOsIiCfi4BoNjC
	 Qq+YbZ80dBwjvUtq9UhYVHEZLPeH4IaAty06EI7FHrTMKCQimODX4LqzVUyhWM9qkG
	 6eGA4V1Eh/r+g1gpHh+oMgAEtgfmJGiOUk4/dpvjyrovxC4rK6zITYNrRFdrccB8FM
	 shhsLKt0AI9IFM3VvgQ0g/pQ34wf2joS549iF7FEBZro+vsG/2mzUz1Bkw51HERRWn
	 pE5/j1nH4KJkjq69UxdFVwM57mYDkNbcaB5rWaEudT2NqVNXHqdK+IrVvSlvWgh8y2
	 EqCLHXyGbXqZw==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Patrick Wildt <patrick@blueri.se>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.11
Date: Mon, 26 Aug 2024 10:24:25 -0500
Message-ID: <20240826152426.1648383-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.11

for you to fetch changes up to dfbe93f32c12f5628bd83303e10ba63621c259ae:

  arm64: dts: qcom: x1e80100: Fix Adreno SMMU global interrupt (2024-08-14 21:36:45 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v6.11

On X1E the GPU node is disabled by default, to be enabled in the
individual devices once the developers install the required firmware.

The generic EDP panel driver used on the X1E CRD is replaced with the
Samsung ATNA45AF01 driver, in order to ensure backlight is brought back
up after being turned off.

The pin configuration for PCIe-related pins are corrected across all the
X1E targets. The PCIe controllers gain a minimum OPP vote, and PCIe
domain numbers are corrected.

WiFi calibration variant information is added to the Lenovo Yoga Slim
7x, to pick the right data from the firmware packages.

The incorrect Adreno SMMU global interrupt is corrected.

For IPQ5332, the IRQ triggers for the USB controller are corrected.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      arm64: dts: qcom: disable GPU on x1e80100 by default

Johan Hovold (18):
      arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
      arm64: dts: qcom: x1e80100: fix PCIe domain numbers
      arm64: dts: qcom: x1e80100: add missing PCIe minimum OPP
      arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
      arm64: dts: qcom: x1e80100-crd: disable PCIe6a perst pull down
      arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
      arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY supply
      arm64: dts: qcom: x1e80100-qcp: fix up PCIe6a pinctrl node
      arm64: dts: qcom: x1e80100-qcp: disable PCIe6a perst pull down
      arm64: dts: qcom: x1e80100-qcp: fix missing PCIe4 gpios
      arm64: dts: qcom: x1e80100-vivobook-s15: fix PCIe4 PHY supply
      arm64: dts: qcom: x1e80100-vivobook-s15: fix up PCIe6a pinctrl node
      arm64: dts: qcom: x1e80100-vivobook-s15: disable PCIe6a perst pull down
      arm64: dts: qcom: x1e80100-vivobook-s15: fix missing PCIe4 gpios
      arm64: dts: qcom: x1e80100-yoga-slim7x: fix PCIe4 PHY supply
      arm64: dts: qcom: x1e80100-yoga-slim7x: fix up PCIe6a pinctrl node
      arm64: dts: qcom: x1e80100-yoga-slim7x: disable PCIe6a perst pull down
      arm64: dts: qcom: x1e80100-yoga-slim7x: fix missing PCIe4 gpios

Konrad Dybcio (1):
      arm64: dts: qcom: x1e80100: Fix Adreno SMMU global interrupt

Patrick Wildt (1):
      arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant

Stephan Gerhold (1):
      arm64: dts: qcom: x1e80100-crd: Fix backlight

Varadarajan Narayanan (1):
      arm64: dts: qcom: ipq5332: Fix interrupt trigger type for usb

 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  4 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 42 ++++++++++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 70 ++++++++++++++++++----
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 54 ++++++++++++++---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          | 53 +++++++++++++---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 21 +++++--
 6 files changed, 209 insertions(+), 35 deletions(-)
