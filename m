Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE56EC77B61
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 15:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83892C433D2; Mon, 10 Apr 2023 15:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2437C433EF;
	Mon, 10 Apr 2023 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681140038;
	bh=9aBIN0Ze80trWv+bhwwMOtyJodZ6uhRiV8OtcH4VttI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=M3b457xNp57Y45F74DVLjYFxnbbjysMNgQoRDg1KCQRvtGNzPWz1RqwEsEKfxRFJu
	 qXomc4prcwUcGwf3ryFjR3YIAlvOUBlq/fGcPm42ZSLM9uEBrkQZDDnhHkufh/QHmo
	 GE+xEAzMJ45xo6v7GJkjlzhT23g53H+dy+MVx2uOz/Fsu1X8+ir0B/SuIHWrtJucN1
	 c5c5zySeHnmiJqY/9mwST2JKoQO0i2iAgmR38//X9TcVbkRDuJMeu9+PQUqElzz91D
	 SXccxUvxkBM/sh8RxDOg4WI8g/QV2bfrirBcCUXAHrsq9z4Ms/NN2ywCW30OcUvwl3
	 zqHKy0ZR+mwtw==
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
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	David Wronek <davidwronek@gmail.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Visweswara Tanuku <quic_vtanuku@quicinc.com>,
	Ye Xingchen <ye.xingchen@zte.com.cn>
Subject: [GIT PULL] Qualcomm driver updates for v6.4
Date: Mon, 10 Apr 2023 08:24:21 -0700
Message-Id: <20230410152421.4477-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.4

for you to fetch changes up to c78ad8597ed961e822bf86ce7f1916dbfba255ef:

  dt-bindings: firmware: document Qualcomm SC8180X SCM (2023-04-04 20:23:56 -0700)

----------------------------------------------------------------
Qualcomm driver updates for v6.4

The Qualcomm SCM driver will now always clear the download bit, avoiding
entering download mode on a clean reboot because the bootloader left it
set. The vmid bitmap passed to qcom_scm_assign_mem() is transitioned to
a well defined size. SM6375 support is added, and SC8180X,
QDU1000/QRU1000, IPQ5332 and IPQ9574 compatibles are documented.

GENI gains support for newer hardware with deeper FIFOs.

The BWMON driver is updated to better handle the two register blocks,
which are not consistent between MSM8998 and newer platforms.

The LLCC driver no longer assumes a fixes stride across the various
banks, and instead acquire the bank placement from DeviceTree. EDAC
support for polling is introduced. EDAC support on SDM845 is disabled,
as its been observed that accessing relevant registers is not permitted
on most devices.

PMIC GLINK is reworked to support defining which auxiliary children to
spawn per platform, support for spawning a UCSI child is added and
SM8450 and SM8550 is introduced.

The RPM power-domain driver is cleaned up by moving and generalizing
structures that are common between platforms, rather than duplicating
everything. Macros are replaced with just direct definition of the
relevant structures. Support for defining parent relationships between
the power-domains is introduced, like it has been in rpmhpd for a long
time.

Number of processors has gone up, so max processor count in SMEM
is bumped again. Error handling in SMSM is cleaned up using
dev_err_probe().

Socinfo is taught about IPQ9574, QCM2290, QRB2210, QRB4210, SM7150,
SA8775P and a number of PMICs.

----------------------------------------------------------------
Bartosz Golaszewski (3):
      soc: qcom: smem: update max processor count
      dt-bindings: arm: qcom: add the SoC ID for SA8775P
      soc: qcom: socinfo: add support for SA8775P

Bhupesh Sharma (2):
      dt-bindings: arm: qcom,ids: Add IDs for QRB4210
      soc: qcom: socinfo: Add IDs for QRB4210

Danila Tikhonov (2):
      dt-bindings: arm: msm: Add LLCC for SM7150
      soc: qcom: llcc: Add configuration data for SM7150

David Wronek (2):
      dt-bindings: arm: qcom,ids: Add Soc ID for SM7150
      soc: qcom: socinfo: Add Soc ID for SM7150

Devi Priya (1):
      dt-bindings: soc: qcom: smd-rpm: Add IPQ9574 compatible

Elliot Berman (1):
      firmware: qcom_scm: Use fixed width src vm bitmap

Kathiravan T (1):
      dt-bindings: firmware: qcom,scm: document IPQ5332 SCM

Konrad Dybcio (17):
      soc: qcom: socinfo: Add some PMICs
      dt-bindings: arm: qcom,ids: Add IDs for QCM2290/QRB2210
      soc: qcom: socinfo: Add IDs for QCM2290/QRB2210
      soc: qcom: rpmpd: Remove SoC names from RPMPD definitions
      soc: qcom: rpmpd: Bring all definitions to the top
      soc: qcom: rpmpd: Unify Low Power Island definitions
      soc: qcom: rpmpd: Remove vdd* from struct names
      soc: qcom: rpmpd: Expand struct definition macros
      soc: qcom: rpmpd: Improve the naming
      soc: qcom: rpmpd: Make bindings assignments consistent
      soc: qcom: rpmpd: Add parent PD support
      soc: qcom: rpmpd: Hook up VDDMX as parent of SM6375 VDDGX
      soc: qcom: rpmpd: Remove useless comments
      firmware: qcom_scm: Add SM6375 compatible
      soc: qcom: icc-bwmon: Remove unused struct member
      soc: qcom: icc-bwmon: Handle global registers correctly
      dt-bindings: sram: qcom,imem: document SM6375 IMEM

Krzysztof Kozlowski (4):
      soc: qcom: gsbi: mark OF related data as maybe unused
      soc: qcom: restrict L2 accessors to ARM64 build tests
      dt-bindings: soc: qcom,apr: correct qcom,intents type
      dt-bindings: soc: qcom: smd-rpm: re-add missing qcom,rpm-msm8994

Manivannan Sadhasivam (5):
      dt-bindings: arm: msm: Update the maintainers for LLCC
      dt-bindings: arm: msm: Fix register regions used for LLCC banks
      qcom: llcc/edac: Fix the base address used for accessing LLCC banks
      qcom: llcc/edac: Support polling mode for ECC handling
      soc: qcom: llcc: Do not create EDAC platform device on SDM845

Melody Olvera (2):
      dt-bindings: firmware: qcom,scm: Update QDU1000/QRU1000 compatible
      dt-bindings: soc: qcom: aoss: Document QDU1000/QRU1000 compatible

Mukesh Ojha (1):
      firmware: qcom_scm: Clear download bit during reboot

Neil Armstrong (3):
      dt-bindings: soc: qcom: qcom,pmic-glink: document SM8450 compatible
      dt-bindings: soc: qcom: qcom,pmic-glink: document SM8550 compatible
      soc: qcom: pmic_glink: register ucsi aux device

Poovendhan Selvaraj (1):
      dt-bindings: scm: Add compatible for IPQ9574

Rob Herring (1):
      soc: qcom: Use of_property_present() for testing DT property presence

Varadarajan Narayanan (2):
      dt-bindings: arm: qcom,ids: Add IDs for IPQ9574 and its variants
      soc: qcom: socinfo: Add IDs for IPQ9574 and its variants

Vinod Koul (1):
      dt-bindings: firmware: document Qualcomm SC8180X SCM

Visweswara Tanuku (1):
      soc: qcom: geni-se: Update Tx and Rx fifo depth based on QUP HW version

Ye Xingchen (1):
      soc: qcom: smsm: Use dev_err_probe()

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     | 129 +++-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   4 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |   9 +-
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |   2 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |   3 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |   1 +
 drivers/edac/qcom_edac.c                           |  64 +-
 drivers/firmware/qcom_scm.c                        |  16 +-
 drivers/misc/fastrpc.c                             |   2 +-
 drivers/net/wireless/ath/ath10k/qmi.c              |   4 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |   8 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |   2 +-
 drivers/soc/qcom/Kconfig                           |   2 +-
 drivers/soc/qcom/icc-bwmon.c                       | 231 +++++-
 drivers/soc/qcom/llcc-qcom.c                       | 104 ++-
 drivers/soc/qcom/pmic_glink.c                      |  65 +-
 drivers/soc/qcom/qcom_aoss.c                       |   2 +-
 drivers/soc/qcom/qcom_gsbi.c                       |   2 +-
 drivers/soc/qcom/rmtfs_mem.c                       |   2 +-
 drivers/soc/qcom/rpmpd.c                           | 833 ++++++++++++++-------
 drivers/soc/qcom/smem.c                            |   4 +-
 drivers/soc/qcom/smsm.c                            |  11 +-
 drivers/soc/qcom/socinfo.c                         |  16 +
 include/dt-bindings/arm/qcom,ids.h                 |  11 +
 include/linux/firmware/qcom/qcom_scm.h             |   2 +-
 include/linux/soc/qcom/geni-se.h                   |  42 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   6 +-
 28 files changed, 1161 insertions(+), 417 deletions(-)
