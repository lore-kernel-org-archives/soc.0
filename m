Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E100DC4345F
	for <soc@archiver.kernel.org>; Sat, 20 Apr 2024 16:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92721C32783; Sat, 20 Apr 2024 16:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E43DC072AA;
	Sat, 20 Apr 2024 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713629404;
	bh=n6w7e910JsspGkx3sGfSrk8Rx5qwNfTimmGjdhOMJHU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=fpj2uZjErEc064k/oHLx/3eXt4bM9ZKQLtDJOUll/CUaugyNs+coLJarQUVc3mx3e
	 Vk4I9pTSxjbLeieEDnc4UdrtvgPIA6sESHtGzXgfR3qDdFB9vBJQ3Pwu+78pC1Q2yA
	 fMPZLyEpkRGg3rOM2pLnTrgt8EL+Tvt9b8UkLJGY4xTYRoleCfCEKFlhyu/wVPaN1j
	 P6cM1XVoISnheVHRyuYXCVe4rsgb/eV1qQ47FnKJWTG4izMcdFSOFj0UzjhzCQOQd9
	 cMiQrqpNV1JRvhBTLTDiSt+fqg3GT0eugxRh+2EFZ4Wt3b4FCuKHK+xvjxC+L/DX5C
	 5dqXlIXlLi0tg==
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.9
Date: Sat, 20 Apr 2024 11:10:01 -0500
Message-ID: <20240420161002.1132240-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.9

for you to fetch changes up to ecda8309098402f878c96184f29a1b7ec682d772:

  arm64: dts: qcom: sc8180x: Fix ss_phy_irq for secondary USB controller (2024-04-12 12:21:47 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v6.9

This corrects the watchdog IRQ flags for a number of remoteproc
instances, which otherwise prevents the driver from probe in the face of
a probe deferral.

Improvements in other areas, such as USB, have made it possible for CX
rail voltage on SC8280XP to be lowered, no longer meeting requirements
of active PCIe controllers. Necessary votes are added to these
controllers.

The MSI definitions for PCIe controllers in SM8450, SM8550, and SM8650
was incorrect, due to a bug in the driver. As this has now been fixed
the definition needs to be corrected.

Lastly, the SuperSpeed PHY irq of the second USB controller in SC8180x,
and the compatible string for X1 Elite domain idle states are corrected.

----------------------------------------------------------------
Johan Hovold (1):
      arm64: dts: qcom: sc8280xp: add missing PCIe minimum OPP

Luca Weiss (1):
      arm64: dts: qcom: Fix type of "wdog" IRQs for remoteprocs

Manivannan Sadhasivam (3):
      arm64: dts: qcom: sm8450: Fix the msi-map entries
      arm64: dts: qcom: sm8550: Fix the msi-map entries
      arm64: dts: qcom: sm8650: Fix the msi-map entries

Maximilian Luz (1):
      arm64: dts: qcom: sc8180x: Fix ss_phy_irq for secondary USB controller

Rajendra Nayak (1):
      arm64: dts: qcom: x1e80100: Fix the compatible for cluster idle states

 arch/arm64/boot/dts/qcom/sc7280.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 11 ++++++++---
 arch/arm64/boot/dts/qcom/sm6350.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sm6375.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi   |  6 +++---
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 16 ++++------------
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 10 ++++------
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 10 ++++------
 arch/arm64/boot/dts/qcom/x1e80100.dtsi |  4 ++--
 10 files changed, 31 insertions(+), 38 deletions(-)
