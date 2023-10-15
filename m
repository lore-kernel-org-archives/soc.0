Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C276CDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 20:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8FBAC433CA; Sun, 15 Oct 2023 20:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E645C433C7;
	Sun, 15 Oct 2023 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697402185;
	bh=/NNgFC/hanYY3NP4gbc7ng8OV1uHjDTwNjCqyp49pkA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=s9bPEbneDyilQuun7XgRQgdsoQkD9wkSB4CwrPYM3Ywlzym4GSculdYT42d4QGo1P
	 +niz9o6ZsLck4IP/igZlD6C8ijxkTW9PGZwC6Lm/8m1UnUy/JsiujRXcGuTRDypfyc
	 t+X2VI1twCA5Gk+l8TDfb+p8FoCVV4nfEHXQtWmuqM1aXUNfU6nky9MsUqaxHyoIWl
	 Wuo3wa3/hZteL3lEtItiLAmL3GX5WclBJ28pFxsbSNMHqe2V6evBw2vX67e/1QQ2O2
	 h8SWCfnnTYcO/4bXnnqH8UEPIABfWOlMQcWGlD/F4S75zcYl7WXr/AaN7f7X+8p9ey
	 k/+56ADPqQrvg==
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Robert Marko <robimarko@gmail.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
	Kees Cook <keescook@chromium.org>,
	Li Zetao <lizetao1@huawei.com>,
	Lu Hongfei <luhongfei@vivo.com>,
	Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.7
Date: Sun, 15 Oct 2023 13:40:13 -0700
Message-ID: <20231015204014.855672-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.7

for you to fetch changes up to c0989f7d1264b2b1885345a28a32fd5e1e61f9c7:

  soc: qcom: socinfo: Convert to platform remove callback returning void (2023-10-02 11:30:39 -0700)

----------------------------------------------------------------
Qualcomm driver updates for v6.7

This introduces partial support for the Qualcomm Secure Execution
Environment SCM interface, and uses this to implement EFI variable
access on the Windows On Snapdragon devices (for now).

The 32/64-bit calling convention detector of the SCM interface is
updated to not choose 64-bit convention when Linux is 32-bit. The
"extern" specifier is dropped from the interface include file.

The LLCC driver gains support for carrying configuration for multiple
different system/DDR configurations for a given platform, and selecting
between them. Support for Q[DR]U1000 is added to the driver.

All exported symbols are transitioned to EXPORT_SYMBOL_GPL().

The platform_drivers in the Qualcomm SoC are transitioned to the
void-returning remove_new implementation.

The rmtfs memory driver gains support for leaving guard pages around the
used area, to avoid issues if the allocation happens to be placed
adjacent to another protected memory region.

The socinfo driver gains knowledge about IPQ8174, QCM6490, SM7150P and
various PMICs used together with SM8550.

----------------------------------------------------------------
Bartosz Golaszewski (2):
      firmware: qcom-scm: drop unneeded 'extern' specifiers
      firmware: qcom-scm: order includes alphabetically

Bjorn Andersson (3):
      firmware: qcom: qseecom: Add missing AUXILIARY_BUS dependency
      dt-bindings: reserved-memory: rmtfs: Allow guard pages
      soc: qcom: rmtfs: Support discarding guard pages

Danila Tikhonov (3):
      dt-bindings: arm: qcom,ids: Add Soc ID for SM7150P
      soc: qcom: socinfo: Add Soc ID for SM7150P
      dt-bindings: firmware: document Qualcomm SM7150 SCM

Kathiravan Thirumoorthy (1):
      firmware: qcom_scm: use 64-bit calling convention only when client is 64-bit

Kees Cook (1):
      soc: qcom: smem: Annotate struct qcom_smem with __counted_by

Komal Bajaj (6):
      dt-bindings: cache: qcom,llcc: Add LLCC compatible for QDU1000/QRU1000
      soc: qcom: llcc: Refactor llcc driver to support multiple configuration
      nvmem: core: Add stub for nvmem_cell_read_u8
      soc: qcom: Add LLCC support for multi channel DDR
      soc: qcom: llcc: Updating the macro name
      soc: qcom: llcc: Add QDU1000 and QRU1000 LLCC support

Konrad Dybcio (2):
      soc: qcom: socinfo: Add SM8550-adjacent PMICs
      dt-bindings: qcom: geni-se: Allow dma-coherent

Li Zetao (1):
      soc: qcom: wcnss_ctrl: Remove redundant initialization owner in wcnss_ctrl_driver

Lu Hongfei (1):
      soc: qcom: pmic: Fix resource leaks in a device_for_each_child_node() loop

Luca Weiss (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for QCM6490
      soc: qcom: socinfo: Add SoC ID for QCM6490

Maximilian Luz (3):
      lib/ucs2_string: Add UCS-2 strscpy function
      firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
      firmware: Add support for Qualcomm UEFI Secure Application

Robert Marko (5):
      dt-bindings: arm: qcom,ids: Add IDs for IPQ8174 family
      soc: qcom: socinfo: Add IDs for IPQ8174 family
      dt-bindings: firmware: qcom,scm: support indicating SDI default state
      firmware: qcom_scm: disable SDI if required
      dt-bindings: firmware: qcom,scm: document IPQ5018 compatible

Unnathi Chalicheemala (1):
      soc: qcom: Switch to EXPORT_SYMBOL_GPL()

Uwe Kleine-König (13):
      soc: qcom: llcc: Handle a second device without data corruption
      soc: qcom: icc-bwmon: Convert to platform remove callback returning void
      soc: qcom: llcc-qcom: Convert to platform remove callback returning void
      soc: qcom: ocmem: Convert to platform remove callback returning void
      soc: qcom: pmic_glink: Convert to platform remove callback returning void
      soc: qcom: qcom_aoss: Convert to platform remove callback returning void
      soc: qcom: qcom_gsbi: Convert to platform remove callback returning void
      soc: qcom: qcom_stats: Convert to platform remove callback returning void
      soc: qcom: rmtfs_mem: Convert to platform remove callback returning void
      soc: qcom: smem: Convert to platform remove callback returning void
      soc: qcom: smp2p: Convert to platform remove callback returning void
      soc: qcom: smsm: Convert to platform remove callback returning void
      soc: qcom: socinfo: Convert to platform remove callback returning void

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  10 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |  10 +
 .../bindings/reserved-memory/qcom,rmtfs-mem.yaml   |  11 +
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   2 +
 MAINTAINERS                                        |  12 +
 drivers/firmware/Kconfig                           |  33 +
 drivers/firmware/Makefile                          |   2 +
 drivers/firmware/qcom_qseecom.c                    | 120 +++
 drivers/firmware/qcom_qseecom_uefisecapp.c         | 871 +++++++++++++++++++++
 drivers/firmware/qcom_scm.c                        | 448 ++++++++++-
 drivers/firmware/qcom_scm.h                        |   1 +
 drivers/soc/qcom/cmd-db.c                          |   8 +-
 drivers/soc/qcom/icc-bwmon.c                       |   6 +-
 drivers/soc/qcom/kryo-l2-accessors.c               |   4 +-
 drivers/soc/qcom/llcc-qcom.c                       | 367 ++++++---
 drivers/soc/qcom/ocmem.c                           |  12 +-
 drivers/soc/qcom/pdr_interface.c                   |   8 +-
 drivers/soc/qcom/pmic_glink.c                      |   6 +-
 drivers/soc/qcom/pmic_glink_altmode.c              |  30 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  38 +-
 drivers/soc/qcom/qcom_aoss.c                       |  12 +-
 drivers/soc/qcom/qcom_gsbi.c                       |   6 +-
 drivers/soc/qcom/qcom_stats.c                      |   6 +-
 drivers/soc/qcom/qmi_encdec.c                      |   6 +-
 drivers/soc/qcom/qmi_interface.c                   |  20 +-
 drivers/soc/qcom/rmtfs_mem.c                       |  15 +-
 drivers/soc/qcom/rpmh.c                            |   8 +-
 drivers/soc/qcom/smd-rpm.c                         |   2 +-
 drivers/soc/qcom/smem.c                            |  10 +-
 drivers/soc/qcom/smp2p.c                           |   6 +-
 drivers/soc/qcom/smsm.c                            |   6 +-
 drivers/soc/qcom/socinfo.c                         |  17 +-
 drivers/soc/qcom/wcnss_ctrl.c                      |   3 +-
 include/dt-bindings/arm/qcom,ids.h                 |   5 +
 include/linux/firmware/qcom/qcom_qseecom.h         |  46 ++
 include/linux/firmware/qcom/qcom_scm.h             | 123 +--
 include/linux/nvmem-consumer.h                     |   6 +
 include/linux/soc/qcom/llcc-qcom.h                 |   2 +-
 include/linux/ucs2_string.h                        |   1 +
 lib/ucs2_string.c                                  |  52 ++
 40 files changed, 2090 insertions(+), 261 deletions(-)
 create mode 100644 drivers/firmware/qcom_qseecom.c
 create mode 100644 drivers/firmware/qcom_qseecom_uefisecapp.c
 create mode 100644 include/linux/firmware/qcom/qcom_qseecom.h
