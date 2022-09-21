Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3D7C6FA82
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 15:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27D25C43470; Wed, 21 Sep 2022 15:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F48C433D6;
	Wed, 21 Sep 2022 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663775793;
	bh=finwfsZojULhllCotko7SAALSZ3CgmEeOhMeX+XJI7A=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=bL4SVvQ0cNWykxXRl3IqcTrBtiJtBEPOFziEjGBP47dfLNnHVsS0eEdDMRx4qwYxH
	 v+GdHMG5HZznILbIwS1uvOyTsOj8L3jswCj8T2BIjkBDZRYDr4m+n5BdPFJJtTP35Y
	 O9o5Uk38QCB2AlG0lPlKx/4WHYe9qtNrBV+ZhLxaKoelsp1g4umGkCjkgrCObF2Jz6
	 YtkWkjAfEaHwDATa4LQ/bNHUZJ2r2seiJ8Lbqs2MCKMvBeFgvQ1O3sVW1rVOZoQrs6
	 6BIvjTOmOHhlrJNzA1BX09ZMyWoCZ77xK5Kk7+zzVhcRAIQC8jD+674P0ZPQGt11AD
	 71pXpSZdba+ww==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Liang He <windhl@126.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Jinpeng Cui <cui.jinpeng2@zte.com.cn>,
	YueHaibing <yuehaibing@huawei.com>
Subject: [GIT PULL] Qualcomm driver updates for 6.1
Date: Wed, 21 Sep 2022 10:56:30 -0500
Message-Id: <20220921155630.1316236-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.1

for you to fetch changes up to df646a17f103c6f18ab85c5e3773763d18dc528b:

  soc: qcom: rpmpd: Add SM6375 support (2022-09-13 22:25:35 -0500)

----------------------------------------------------------------
Qualcomm driver updates for 6.1

The icc-bwmon driver is expected to support measuring LLCC/DDR bandwidth
on SDM845 and SC7280.

The LLCC driver is extended to provide per-platform register mappings to
the LLCC EDAC driver. The QMI encoder/decoder is updated to allow the
passed qmi_elem_info to be const.

Support for SDM845 is added to the sleep stats driver. Power-domains for
the SM6375 platform is added to RPMPD and the platform is added to
socinfo, together with the PM6125 pmic id.

A couple of of_node reference issues are corrected in the smem state and
smsm drivers.

The Qualcomm SCM driver binding is converted to YAML.

----------------------------------------------------------------
Abel Vesa (2):
      soc: qcom: stats: Add SDM845 stats config and compatible
      dt-bindings: soc: qcom: stats: Document SDM845 compatible

Adam Skladowski (1):
      dt-bindings: firmware: document Qualcomm SM6115 SCM

Bjorn Andersson (1):
      Merge tag '20220825043859.30066-3-manivannan.sadhasivam@linaro.org' into drivers-for-6.1

David Heidelberg (1):
      dt-bindings: firmware: convert Qualcomm SCM binding to the yaml

Gaosheng Cui (1):
      firmware: qcom: scm: remove unused __qcom_scm_init declaration

Jeff Johnson (1):
      soc: qcom: qmi: use const for struct qmi_elem_info

Jinpeng Cui (1):
      soc: qcom: icc-bwmon: remove redundant ret variable

Konrad Dybcio (4):
      soc: qcom: socinfo: Add an ID for SM6375
      soc: qcom: socinfo: Add PM6125 ID
      dt-bindings: power: rpmpd: Add SM6375 power domains
      soc: qcom: rpmpd: Add SM6375 support

Krzysztof Kozlowski (10):
      dt-bindings: interconnect: qcom,msm8998-bwmon: add support for SDM845 LLCC BWMON
      soc: qcom: icc-bwmon: re-use IRQ enable/clear define
      soc: qcom: icc-bwmon: drop unused registers
      soc: qcom: icc-bwmon: store reference to variant data in container
      soc: qcom: icc-bwmon: clear all registers on init
      soc: qcom: icc-bwmon: store count unit per variant
      soc: qcom: icc-bwmon: use regmap and prepare for BWMON v5
      soc: qcom: icc-bwmon: add per-variant quirks
      soc: qcom: icc-bwmon: add support for SDM845 LLCC BWMON
      dt-bindings: power: qcom,rpmpd: drop non-working codeaurora.org emails

Liang He (2):
      soc: qcom: smsm: Fix refcount leak bugs in qcom_smsm_probe()
      soc: qcom: smem_state: Add refcounting for the 'state->of_node'

Manivannan Sadhasivam (2):
      soc: qcom: llcc: Rename reg_offset structs to reflect LLCC version
      soc: qcom: llcc: Pass LLCC version based register offsets to EDAC driver

Rajendra Nayak (3):
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add support for sc7280 BWMONs
      soc: qcom: icc-bwmon: add support for sc7280 LLCC BWMON
      soc: qcom: icc-bwmon: force clear counter/irq registers

YueHaibing (1):
      soc: qcom: Make QCOM_RPMPD depend on OF

 .../devicetree/bindings/firmware/qcom,scm.txt      |  61 ---
 .../devicetree/bindings/firmware/qcom,scm.yaml     | 148 +++++++
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   3 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   3 +-
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |   1 +
 drivers/firmware/qcom_scm.h                        |   2 -
 drivers/soc/qcom/Kconfig                           |   2 +-
 drivers/soc/qcom/icc-bwmon.c                       | 479 ++++++++++++++++-----
 drivers/soc/qcom/llcc-qcom.c                       |  92 +++-
 drivers/soc/qcom/qcom_stats.c                      |   9 +
 drivers/soc/qcom/qmi_encdec.c                      |  50 +--
 drivers/soc/qcom/qmi_interface.c                   |  12 +-
 drivers/soc/qcom/rpmpd.c                           |  22 +
 drivers/soc/qcom/smem_state.c                      |   3 +-
 drivers/soc/qcom/smsm.c                            |  20 +-
 drivers/soc/qcom/socinfo.c                         |   2 +
 include/dt-bindings/power/qcom-rpmpd.h             |  12 +
 include/linux/soc/qcom/llcc-qcom.h                 |  30 ++
 include/linux/soc/qcom/qmi.h                       |  20 +-
 samples/qmi/qmi_sample_client.c                    |  10 +-
 20 files changed, 753 insertions(+), 228 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.yaml
