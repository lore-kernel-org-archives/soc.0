Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBD9C4345F
	for <soc@archiver.kernel.org>; Sat, 27 Apr 2024 16:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01D6AC4AF07; Sat, 27 Apr 2024 16:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883C3C113CE;
	Sat, 27 Apr 2024 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714234159;
	bh=U8gGey/u8q+mu3+f2tJY1NubOgz4FjTo8MKR01F6wPg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=U5mNBZjZkju1vyCda80W4a4wmmMQzIs0+zIiIIyAdUpzqLCWYLDi9PeRHYSB+FP3Z
	 PDsUK1qfBfzWoKHwFNfg8rgZhX8PAOwsbAJlb0fZmZN9Aq46boluMuMf4MpxGPmr7t
	 3KOGDCFehh0RMmpKl/jkfOgOZYZ5Zcy3K9z/vx/uPtCy57lhHDcmHfaeJ8RHM8ZUXJ
	 KigAuvjUV3/vrDO8iqsju5unevuN8SVJHz5IOc3iRzegiCBqrwWdgwdoOmtvf9ZHn9
	 O4968/XyhNddbHj4nj7480Cyt4A0//egyIavgjPUm1A/NrW2Du3VfHdvSFc5as1VKn
	 24MO948aJkbhQ==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Justin Stitt <justinstitt@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangkaiyuan <wangkaiyuan@inspur.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.10
Date: Sat, 27 Apr 2024 11:09:16 -0500
Message-ID: <20240427160917.1431354-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.10

for you to fetch changes up to 166db01007ea802ff9933ac73ec8f140ca0cf5d5:

  soc: qcom: cmd-db: replace deprecated strncpy with strtomem (2024-04-21 12:26:47 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.10

The Qualcomm SCM driver initialization order is improved, to avoid any
potential for a client to find a half-initialized SCM instance.
The handling of download mode bits is updated to not attempt
QCOM_SCM_BOOT_SET_DLOAD_MODE if a io-address for the update is
specified, and that path is changed to perform a read-modify-write to
avoid updating unrelated bits.  Error handling is corrected in the
peripheral authentication service (PAS) functions, to release
interconnect bandwidth votes in the case of an error. An unwanted error
print on allocation error is also removed from this code path.

The QSEECOM allow list is marked __maybe_unused to avoid build warnings
when built with !OF. The error handling related to the interconnect API
is cleaned up to avoid handling the impossible IS_ERR() condition.

initcall level is bumped to "core" for cmd-db and rpmh-rsc, as dependent
drivers like regulators, interconnects and clocks are registered at this
level.

Another attempt is made to remove the strncpy() usage in cmd-db, this
time with strtomem_pad() which has the correct characteristics.

The bwmon regmap cache is changed to maple tree.

After an attempt to add missing MODULE_DEVICE_TABLEs to debug drivers,
the intention of not having them automatically load is documented.

Operations on the pmic_glink client list is put under mutual exclusion,
to avoid races when clients are being registered. pmic_glink client
registered after the firmware notification arrived was not informed that
the firmware was up, this is resolved.

More DSPs and the apss subsystem is added to the Qualcomm sleep stats driver.

Checks for in-flight regulator requests in the RPMh RSC driver is
improved to deal with the fact that these occupy multiple registers, so
it's insufficient to just to direct address comparison.

The socinfo drivers learns about X1 Elite and SMB2360 PMIC.

The maintainers entry is split between the linux-arm-msm list and
subset that is maintained in the qcom-soc tree, to avoid some confusion
about maintainership.

----------------------------------------------------------------
Abel Vesa (3):
      dt-bindings: arm: qcom,ids: Add SoC ID for X1E80100
      soc: qcom: socinfo: Add X1E80100 SoC ID table entry
      soc: qcom: socinfo: Add SMB2360 PMIC

Bjorn Andersson (2):
      Merge branch 'drivers-for-6.10' onto 'v6.9-rc1'
      MAINTAINERS: Split Qualcomm SoC and linux-arm-msm entries

Dmitry Baryshkov (2):
      soc: qcom: pmic_glink: don't traverse clients list without a lock
      soc: qcom: pmic_glink: notify clients about the current state

Gabor Juhos (2):
      firmware: qcom_scm: disable clocks if qcom_scm_bw_enable() fails
      firmware: qcom_scm: remove IS_ERR() checks from qcom_scm_bw_{en,dis}able()

Justin Stitt (1):
      soc: qcom: cmd-db: replace deprecated strncpy with strtomem

Krzysztof Kozlowski (2):
      firmware: qcom: qcm: fix unused qcom_scm_qseecom_allowlist
      soc: qcom: mention intentionally broken module autoloading

Luca Weiss (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: document QCM6490 compatible

Maulik Shah (3):
      soc: qcom: Update init level to core_initcall() for cmd-db and rpmh-rsc
      soc: qcom: qcom_stats: Add DSPs and apss subsystem stats
      soc: qcom: rpmh-rsc: Enhance check for VRM in-flight request

Mukesh Ojha (5):
      firmware: qcom: scm: Remove log reporting memory allocation failure
      firmware: qcom: scm: Remove redundant scm argument from qcom_scm_waitq_wakeup()
      firmware: qcom: scm: Rework dload mode availability check
      firmware: qcom: scm: Fix __scm and waitq completion variable initialization
      firmware: qcom: scm: Modify only the download bits in TCSR register

wangkaiyuan (1):
      soc: qcom: icc-bwmon: Convert to use maple tree register cache

 MAINTAINERS                            | 33 +++++++++++---
 drivers/firmware/qcom/qcom_scm.c       | 79 +++++++++++++++++++++-------------
 drivers/soc/qcom/cmd-db.c              | 41 ++++++++++++++----
 drivers/soc/qcom/icc-bwmon.c           |  8 ++--
 drivers/soc/qcom/pmic_glink.c          |  9 ++++
 drivers/soc/qcom/pmic_pdcharger_ulog.c |  4 ++
 drivers/soc/qcom/qcom_stats.c          |  4 ++
 drivers/soc/qcom/rpm_master_stats.c    |  4 ++
 drivers/soc/qcom/rpmh-rsc.c            |  5 ++-
 drivers/soc/qcom/socinfo.c             |  2 +
 include/dt-bindings/arm/qcom,ids.h     |  1 +
 include/soc/qcom/cmd-db.h              | 10 ++++-
 12 files changed, 151 insertions(+), 49 deletions(-)
