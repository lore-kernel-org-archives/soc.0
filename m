Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DD2C77B7A
	for <soc@archiver.kernel.org>; Sun, 11 Jun 2023 00:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29B32C4339C; Sun, 11 Jun 2023 00:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72289C433D2;
	Sun, 11 Jun 2023 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686445037;
	bh=gQWTxhYcWVPp54cflo2N6CRCleiiaED+Ca6Wbr26k0o=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=f0NHh7ad/btPybW9E8Ly9yXFscQ1ad8NfNOoHUGjj39jx7M4QFJAirT+SR014Inm/
	 xTGFX9w6Aqw8532+tQx0O/86dveWbG/qBLLTGQE2k/X0C+IpLjlayeWRDxBggT6m+8
	 F6YJp+6ciCbbtMiaBUpdD87J21K9zOJOI3a8jSjHqIXD+ZsYRfvommiXbKy2IF+dBh
	 Cvb3rZmDsF8t9c8zjhaHj9RubJXUGWuE/BW054U3QOH+vYMqm4FPOlkTsjKC4ZuJz2
	 WbBj+nChVco+xNtbOjYCWrTAp3TJFuj87B9ohc2sH6KQ+VmsCphL1/PRoWoO+ZMhuW
	 vgC0+700GITOg==
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
	Robert Marko <robimarko@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Min-Hua Chen <minhuadotchen@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [GIT PULL] Qualcomm driver updates for v6.5
Date: Sat, 10 Jun 2023 18:00:44 -0700
Message-Id: <20230611010044.2481875-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.5

for you to fetch changes up to e81a16e77259294cd4ff0a9c1fbe5aa0e311a47d:

  soc: qcom: ocmem: Add OCMEM hardware version print (2023-05-29 14:42:43 -0700)

----------------------------------------------------------------
Qualcomm driver updates for v6.5

Konrad Dybcio is promoted, from reviewer, to co-maintainer.

The mdt_loader gets a fix to the detection of split binaries, where the
previous logic sometimes concluded that the first segments was not
split, in a split image. The unconditional calling of
scm_pas_mem_setup() turns out to cause a regression and is reverted.

The altmode subfunction of pmic_glink is enabled for SM8450.

A new driver for exposing power statistics from the RPM, for debugging
purposes, is introduced.

OCMEM gets a debug prints of the hardware version, QMI helpers are
transitioned to alloc_ordered_workqueue() and an error message in
ramp_controller is improved.

An API is introduced to the SMEM driver to allow other drivers to query
the SoC id, rather than open-coding the parsing of the relevant SMEM
item. This is then used to clean up the Qualcomm NVMEM-based cpufreq
driver.

Socinfo is extended with knowledge about IPQ5018, IPQ5312 and IPQ5302.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      dt-bindings: soc: qcom: aoss-qmp: add compatible for sa8775p

Bhupesh Sharma (1):
      dt-bindings: soc: qcom: eud: Fix compatible string in the example

Christian Marangi (1):
      soc: qcom: mdt_loader: Fix unconditional call to scm_pas_mem_setup

Gokul krishna Krishnakumar (1):
      soc: qcom: mdt_loader: Enhance split binary detection

Kathiravan T (2):
      dt-bindings: arm: qcom,ids: add SoC ID for IPQ5312 and IPQ5302
      soc: qcom: socinfo: Add Soc ID for IPQ5312 and IPQ5302

Konrad Dybcio (3):
      dt-bindings: soc: qcom: Add RPM Master stats
      soc: qcom: Introduce RPM master stats driver
      MAINTAINERS: Add Konrad Dybcio as linux-arm-msm co-maintainer

Krzysztof Kozlowski (1):
      dt-bindings: soc: qcom: smd-rpm: allow MSM8226 over SMD

Luca Weiss (1):
      soc: qcom: ocmem: Add OCMEM hardware version print

Matti Lehtimäki (1):
      dt-bindings: sram: qcom,imem: Document MSM8226

Min-Hua Chen (1):
      soc: qcom: rpmpd: use correct __le32 type

Neil Armstrong (1):
      qcom: pmic_glink: enable altmode for SM8450

Robert Marko (7):
      dt-bindings: arm: qcom,ids: Add IDs for IPQ5018 family
      soc: qcom: socinfo: Add IDs for IPQ5018 family
      soc: qcom: socinfo: move SMEM item struct and defines to a header
      soc: qcom: smem: Switch to EXPORT_SYMBOL_GPL()
      soc: qcom: smem: introduce qcom_smem_get_soc_id()
      cpufreq: qcom-nvmem: use SoC ID-s from bindings
      cpufreq: qcom-nvmem: use helper to get SMEM SoC ID

Tejun Heo (1):
      soc: qcom: qmi: Use alloc_ordered_workqueue() to create ordered workqueues

Uwe Kleine-König (1):
      soc: qcom: ramp_controller: Improve error message for failure in .remove()

 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     |   4 +-
 .../bindings/soc/qcom/qcom,rpm-master-stats.yaml   |  69 +++++++++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |   1 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |   1 +
 MAINTAINERS                                        |   2 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c               |  63 ++------
 drivers/soc/qcom/Kconfig                           |  11 ++
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/mdt_loader.c                      |  41 +++++-
 drivers/soc/qcom/ocmem.c                           |  10 ++
 drivers/soc/qcom/pmic_glink.c                      |   8 +-
 drivers/soc/qcom/qmi_interface.c                   |   2 +-
 drivers/soc/qcom/ramp_controller.c                 |  11 +-
 drivers/soc/qcom/rpm_master_stats.c                | 163 +++++++++++++++++++++
 drivers/soc/qcom/rpmpd.c                           |   4 +-
 drivers/soc/qcom/smem.c                            |  31 +++-
 drivers/soc/qcom/socinfo.c                         |  77 ++--------
 include/dt-bindings/arm/qcom,ids.h                 |  10 ++
 include/linux/soc/qcom/smem.h                      |   2 +
 include/linux/soc/qcom/socinfo.h                   |  70 +++++++++
 21 files changed, 442 insertions(+), 140 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,rpm-master-stats.yaml
 create mode 100644 drivers/soc/qcom/rpm_master_stats.c
 create mode 100644 include/linux/soc/qcom/socinfo.h
