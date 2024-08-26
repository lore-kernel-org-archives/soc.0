Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D76C5321D
	for <soc@archiver.kernel.org>; Mon, 26 Aug 2024 14:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E400CC52FC9; Mon, 26 Aug 2024 14:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A92C52FD6;
	Mon, 26 Aug 2024 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683931;
	bh=3qDAuzVhQbt9+Jfd9ZZ7QkhWRIPzbTN/j1RwVsmTv5A=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Bw2y0gQHTbM/OazPSRnoBxAjZCvKThAmieYxrSoEKKU47Vu0VVaLIQL7I7GKCrARY
	 7aeI44kMd5btWMF0CbYAC4CHAM2H8NBJQC2ozDGXAkYD9FiJTn215dAcNCdFDiLK8v
	 KSIOp3s3htHWJWSkOufXCYw6r7ZSdduCZ/lslrN8+W3T6ewiXCgcVyTr65uCU3AxDD
	 altJF0OfQyHxfNFFX0vE9hcJu6bPqlTlkEspn40aIikhK++q6o6Jb9IqO13BvYfHzA
	 xEtExyY0acYGQM5jxAOcwEB/AodAJTxALW4B7MzGdj7OkZq+AQzXBjYZfOWFrutGbl
	 saYKHCQeIYHEg==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Murali Nalajala <quic_mnalajal@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [GIT PULL] Qualcomm driver fixes for v6.11
Date: Mon, 26 Aug 2024 09:52:08 -0500
Message-ID: <20240826145209.1646159-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.11

for you to fetch changes up to c158ceb826068a8bbe3c9e78df420f47ba53c8a8:

  soc: qcom: pd-mapper: Fix singleton refcount (2024-08-21 09:50:48 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v6.11

This corrects the tzmem virt-to-phys conversion, which caused issues for
the uefisecapp implementation of EFI variable access. SDM670 is excluded
from tzmem usage due to reported issues.

The SCM get wait queue context call is corrected to be marked ATOMIC and
some dead code in qseecom, following the tzmem conversion, is removed.

The memory backing command DB is remapped writecombined, to avoid XPU
violations when Linux runs without the Qualcomm hypervisor.

Two compile fixes are added for pd-mapper, and the broken reference
count is corrected, to make pd-mapper deal with remoteprocs going away.

In pmic_glink a race condition where the client callbacks might be
called before we returned the client handle is corrected. The broken conditions
for when to signal that the firmware is going down is also corrected.

In the pmic_glink UCSI driver, the ucsi_unregister() is moved out of the
pdr callback, as this is being invoked in atomic context.

Konrad's email address is updated in MAINTAINERS, and related mailmap
entries are added.

----------------------------------------------------------------
Andrew Halaney (1):
      soc: qcom: pd-mapper: Depend on ARCH_QCOM || COMPILE_TEST

Arnd Bergmann (1):
      soc: qcom: pd-mapper: mark qcom_pdm_domains as __maybe_unused

Bartosz Golaszewski (2):
      firmware: qcom: tzmem: fix virtual-to-physical address conversion
      firmware: qcom: qseecom: remove unused functions

Bjorn Andersson (4):
      soc: qcom: pmic_glink: Fix race during initialization
      usb: typec: ucsi: Move unregister out of atomic section
      soc: qcom: pmic_glink: Actually communicate when remote goes down
      soc: qcom: pd-mapper: Fix singleton refcount

Konrad Dybcio (2):
      mailmap: Add an entry for Konrad Dybcio
      MAINTAINERS: Update Konrad Dybcio's email address

Murali Nalajala (1):
      firmware: qcom: scm: Mark get_wq_ctx() as atomic call

Richard Acayan (1):
      firmware: qcom: tzmem: disable sdm670 platform

Volodymyr Babchuk (1):
      soc: qcom: cmd-db: Map shared memory as WC, not WB

 .mailmap                                   |  2 ++
 MAINTAINERS                                |  6 ++--
 drivers/firmware/qcom/qcom_scm-smc.c       |  2 +-
 drivers/firmware/qcom/qcom_tzmem.c         | 33 ++++++++++++++--------
 drivers/power/supply/qcom_battmgr.c        | 16 +++++++----
 drivers/soc/qcom/Kconfig                   |  2 +-
 drivers/soc/qcom/cmd-db.c                  |  2 +-
 drivers/soc/qcom/pmic_glink.c              | 40 ++++++++++++++++++--------
 drivers/soc/qcom/pmic_glink_altmode.c      | 17 +++++++----
 drivers/soc/qcom/qcom_pd_mapper.c          |  4 ++-
 drivers/usb/typec/ucsi/ucsi_glink.c        | 43 ++++++++++++++++++++--------
 include/linux/firmware/qcom/qcom_qseecom.h | 45 ------------------------------
 include/linux/soc/qcom/pmic_glink.h        | 11 ++++----
 13 files changed, 120 insertions(+), 103 deletions(-)
