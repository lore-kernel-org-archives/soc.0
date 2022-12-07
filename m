Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CA8C352A1
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 15:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB0C7C433D7; Wed,  7 Dec 2022 15:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0891C433D6;
	Wed,  7 Dec 2022 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670427696;
	bh=PsU9qvGNIgVaTE+688XrL5a/xqu/LZwJefKEVljFw4k=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=PFBqHXi5WrpimSBzroZ6X+/McC9w+s0p+FMUbzol01IMByfC0JFVUr2AiI6wX2zqt
	 6NNLgWOGF7TjjM57cYycktKLFOg6NiXjjz3wY2BVpclPLeyzYXvrr/vypfhX+H/6FH
	 F/Uyo0IK4G/AHve8L5rK/BGBfNWRO2a1jc+4gNb8RzbbMxEe0gkvy6Q4lmVK8XDRqk
	 h6svcsNw8rg4wy7sTnSPmfZ1N50usA6U/1faSUi5Epq2ckoOpxKhQvBtnx7zXYokCv
	 2YVoKsuZQKUjFiQmkh6DktOLpMG5fgNFrpVsm5h/dAUnEPV0ng30vquopvNXOwENaG
	 gwk34lDSqKJWg==
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
	Abel Vesa <abel.vesa@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] More Qualcomm driver updates for 6.2
Date: Wed,  7 Dec 2022 09:41:34 -0600
Message-Id: <20221207154134.3233779-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit aa9f474014b1e2665194a97dc4675aa187534bb9:

  dt-bindings: firmware: scm: add sdm670 compatible (2022-11-11 21:28:52 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.2-2

for you to fetch changes up to f33ca7ec5e5e3a53d5636a4eab270bacac751f6e:

  soc: qcom: socinfo: Add SM6115 / SM4250 SoC IDs to the soc_id table (2022-12-05 16:50:40 -0600)

----------------------------------------------------------------
More Qualcomm driver updates for 6.2

Socinfo is extended with knowledge about MSM8956, MSM8976, SM6115,
SM4250, SM8150, SA8155 and SM8550.

Support for RSC v3, as found in SM8550 is added to the RPMH RSC driver.

Support for SM8550 and SM4250 ARC regulators are added to the RPM(h)
power-domain drivers. SM8550 support is added to the LLCC driver.
The AOSS QMP binding is declared compatible for SM8550.

BWMON and LLCC now selects REGMAP_MMIO to ensure dependencies are built
properly.

----------------------------------------------------------------
Abel Vesa (9):
      dt-bindings: power: rpmpd: Add SM8550 to rpmpd binding
      soc: qcom: rpmhpd: Add SM8550 power domains
      soc: qcom: rpmh-rsc: Add support for RSC v3 register offsets
      soc: qcom: rpmh-rsc: Avoid unnecessary checks on irq-done response
      soc: qcom: socinfo: Add SM8550 ID
      soc: qcom: llcc: Add v4.1 HW version support
      dt-bindings: arm: msm: Add LLCC compatible for SM8550
      soc: qcom: llcc: Add configuration data for SM8550
      dt-bindings: soc: qcom: aoss: Add compatible for SM8550

AngeloGioacchino Del Regno (2):
      dt-bindings: arm: qcom,ids: Add SoC IDs for MSM8956 and MSM8976
      soc: qcom: socinfo: Add MSM8956/76 SoC IDs to the soc_id table

Bhupesh Sharma (6):
      dt-bindings: power: rpmpd: Add SM4250 support
      soc: qcom: rpmpd: Add SM4250 support
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM8150 and SA8155
      soc: qcom: socinfo: Add SM8150 and SA8155 SoC IDs to the soc_id table
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM6115 / SM4250 and variants
      soc: qcom: socinfo: Add SM6115 / SM4250 SoC IDs to the soc_id table

Krzysztof Kozlowski (1):
      dt-bindings: soc: qcom: apr: document generic qcom,apr compatible

Manivannan Sadhasivam (2):
      soc: qcom: Select REMAP_MMIO for LLCC driver
      soc: qcom: Select REMAP_MMIO for ICC_BWMON driver

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |   1 +
 drivers/soc/qcom/Kconfig                           |   2 +
 drivers/soc/qcom/llcc-qcom.c                       | 166 ++++++++++++++++++-
 drivers/soc/qcom/rpmh-internal.h                   |  11 +-
 drivers/soc/qcom/rpmh-rsc.c                        | 181 ++++++++++++---------
 drivers/soc/qcom/rpmh.c                            |  10 +-
 drivers/soc/qcom/rpmhpd.c                          |  24 +++
 drivers/soc/qcom/rpmpd.c                           |  18 ++
 drivers/soc/qcom/socinfo.c                         |   9 +
 drivers/soc/qcom/trace-rpmh.h                      |  11 +-
 include/dt-bindings/arm/qcom,ids.h                 |   9 +
 include/dt-bindings/power/qcom-rpmpd.h             |  26 +++
 include/linux/soc/qcom/llcc-qcom.h                 |  12 ++
 16 files changed, 383 insertions(+), 101 deletions(-)
