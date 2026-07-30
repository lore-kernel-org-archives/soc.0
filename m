Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A954130568B
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429656; cv=none; b=m0rmVYSHdSWjpz6enKPz6Ua4/FMjBdIzprQG7t3O/Tw7SGsFzHQZU/ep3DAo1PnKP+iVmJLrX90aoWmJYp45BdEzuBAr6HTkLhqTbLA2WFNg/bxcyp3RJFPDEfWMLaIMTrRWXC6gAfyoFToyGL73yUEaYZSmVgbFZPnZKldva/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429656; c=relaxed/simple;
	bh=wmIAcXC/31QOHhElKMkv99yGY6JwN5ZF8GjiYzQzbpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EOVj4UMWHdok2Ku5GAef0ujhmM84/nmUYy1jTbS9csUUgA07heHBH1m9TTee3eTEl9Vlu3QpUPci1NVExbL/4runxE0cvEEP5k4nsPiQxZxVqqXcYSH0SSP1aXAtMdGGOyAJwBscm299Ov9CQx69y1f4Cp1I8nB1mdUezbcLcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzI2sCib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzI2sCib"
Received: by smtp.kernel.org (Postfix)
	id 7C8151F00A3A; Thu, 30 Jul 2026 16:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D241B1F000E9;
	Thu, 30 Jul 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785429655;
	bh=eOClrm/u2VRY9VSgrwD7HR56oauHzrkY9aLE4Ys3yG8=;
	h=From:To:Cc:Subject:Date;
	b=IzI2sCib+1llKImo2BoNONVnf54FVGWgowOMSlcU4rwp4GKOIS9NqwRtNt7C5rsbT
	 MJKDn9m4jbExjd96TYZe8UFKlMj7ehxcxTVhMuulKAav/AsGFGU4xKOr9Qt3NtQ9iB
	 XrIcHravELEV1XngGoPqo5/oUykgVeoX52brE8VzB+KIZbEHPNBkF8ZP8+HFmk16rW
	 BZHWeIk1C/5alpUs1FY4OJasT69VspeCM9HS6j4HVvDlpN5ErzuCR8k9INlv6WXUpj
	 6c7jIyW/9GHoHy8IAa1oYZJZ8fYpVkXAGQOinGvYdysSwZiWeBQ2CPzV1tS6AojT2L
	 Aq+ARZBQCP6gA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>,
	Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	Konstantin Shabanov <mail@etehtsea.me>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Mayur Kumar <kmayur809@gmail.com>,
	Nabige Aala <nabige.aala@oss.qualcomm.com>,
	Ruoyu Wang <ruoyuw560@gmail.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v7.3
Date: Thu, 30 Jul 2026 11:40:52 -0500
Message-ID: <20260730164052.176832-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.3

for you to fetch changes up to 43584144a46bccbe90482cd8eede9596d8fc47dc:

  soc: qcom: llcc: Skip ECC interrupt setup on Shikra, pre-configured by DSF (2026-07-17 17:22:44 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v7.3

Add Maili platform bindings for SCM, IMEM, AOSS, and PMIC GLINK. Add
Shikra IMEM, RPM SMD, LLCC, and UBWC support, including handling for
firmware-configured LLCC ECC interrupts.

Add the generic Peripheral Authentication Service with SCM and OP-TEE
backends, and migrate the MSM DRM and IPA drivers to it.

Add SCM SMC-call tracepoints and configurable minidump delivery through
always-on SRAM. Correct SCM download-mode pointer ordering and improve
download-mode probe diagnostics.

Rework the UBWC configuration database and add Milos and Shikra
configuration. Add protection-domain mappings for SA8775P and QCS8300,
support newer ICE versions, Hawi subsystem statistics, and SDM850
identification.

Simplify Qualcomm SoC Kconfig selection and architecture dependencies.
Use managed resources in EBI2 and RPMh RSC probe paths to correct cleanup
on failures.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge branch '20260702115835.167602-2-sumit.garg@kernel.org' into drivers-for-7.3

Chunkai Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel

David Heidelberg (1):
      soc: qcom: socinfo: Add SoC ID for SDM850

Dmitry Baryshkov (7):
      soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
      soc: qcom: ubwc: drop ubwc_dec_version
      soc: qcom: ubwc: drop ubwc_bank_spread
      soc: qcom: ubwc: drop macrotile_mode from the database
      soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
      soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
      soc: qcom: ubwc: deduplicate UBWC configuration data

Faiyaz Mohammed (1):
      soc: qcom: llcc: Skip ECC interrupt setup on Shikra, pre-configured by DSF

Fenglin Wu (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili compatible string

Jingyi Wang (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
      dt-bindings: sram: Document qcom,maili-imem compatible

Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      soc: qcom: llcc: Add configuration data for Shikra SoC
      dt-bindings: sram: Document qcom,shikra-imem compatible

Konstantin Shabanov (1):
      firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14

Krzysztof Kozlowski (5):
      soc: qcom: Unify user-visible "Qualcomm" name
      soc: qcom: Hide all drivers behind selectable menu
      soc: qcom: Restrict drivers per ARM/ARM64
      soc: qcom: Make important drivers default
      soc: qcom: Avoid SCM and SPM for cpuidle drivers

Luca Weiss (1):
      soc: qcom: ubwc: Add config for Milos

Manivannan Sadhasivam (1):
      soc: qcom: ice: Support IP version beyond v3

Mayur Kumar (1):
      soc: qcom: cmd-db: use C-style SPDX comment for source file

Mohammad Rafi Shaik (2):
      soc: qcom: pd-mapper: Add support for SA8775P
      soc: qcom: pd-mapper: Add support for QCS8300

Mukesh Ojha (4):
      dt-bindings: firmware: qcom,scm: Add minidump SRAM property
      firmware: qcom: scm: Fix missing smp_load_acquire()
      firmware: qcom: scm: use dev_err_probe() for dload address failure
      firmware: qcom: scm: Add minidump SRAM support

Nabige Aala (1):
      soc: qcom: ubwc: Add Shikra UBWC config

Pengpeng Hou (2):
      soc: qcom: rpmh-rsc: manage PM notifiers with devres
      bus: qcom-ebi2: use managed resources for clocks and children

Ruoyu Wang (1):
      bus: qcom-ebi2: Fix clock leak on probe failure

Sneh Mankad (1):
      soc: qcom: qcom_stats: Add SoCCP and DCP subsystems stats

Sumit Garg (6):
      firmware: qcom: Add a generic PAS service
      firmware: qcom_scm: Migrate to generic PAS service
      firmware: qcom: Add a PAS TEE service
      MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
      drm/msm: Switch to generic PAS TZ APIs
      net: ipa: Switch to generic PAS TZ APIs

Yuvaraj Ranganathan (2):
      firmware: qcom: scm: add trace events for the SMC call interface
      firmware: qcom: scm: instrument SMC call path with tracepoints

 .../devicetree/bindings/firmware/qcom,scm.yaml     |   9 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |   1 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |   1 +
 Documentation/devicetree/bindings/sram/sram.yaml   |   2 +
 MAINTAINERS                                        |   9 +
 drivers/bus/qcom-ebi2.c                            |  44 +-
 drivers/cpuidle/Kconfig.arm                        |   4 +-
 drivers/firmware/qcom/Kconfig                      |  22 +-
 drivers/firmware/qcom/Makefile                     |   3 +
 drivers/firmware/qcom/qcom_pas.c                   | 298 +++++++++++++
 drivers/firmware/qcom/qcom_pas.h                   |  50 +++
 drivers/firmware/qcom/qcom_pas_tee.c               | 479 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm-smc.c               |  10 +
 drivers/firmware/qcom/qcom_scm.c                   | 456 +++++++++++---------
 drivers/firmware/qcom/qcom_scm_trace.h             | 143 ++++++
 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  11 +-
 drivers/net/ipa/Kconfig                            |   2 +-
 drivers/net/ipa/ipa_main.c                         |  13 +-
 drivers/soc/qcom/Kconfig                           | 120 +++---
 drivers/soc/qcom/cmd-db.c                          |   2 +-
 drivers/soc/qcom/ice.c                             |   4 +-
 drivers/soc/qcom/llcc-qcom.c                       |  30 ++
 drivers/soc/qcom/qcom_pd_mapper.c                  |  38 ++
 drivers/soc/qcom/qcom_stats.c                      |   2 +
 drivers/soc/qcom/rpmh-rsc.c                        |  37 +-
 drivers/soc/qcom/socinfo.c                         |   1 +
 drivers/soc/qcom/ubwc_config.c                     | 302 ++++---------
 include/linux/firmware/qcom/qcom_pas.h             |  43 ++
 include/linux/soc/qcom/ubwc.h                      |  81 ++--
 32 files changed, 1662 insertions(+), 561 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_pas.c
 create mode 100644 drivers/firmware/qcom/qcom_pas.h
 create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
 create mode 100644 drivers/firmware/qcom/qcom_scm_trace.h
 create mode 100644 include/linux/firmware/qcom/qcom_pas.h
