Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD33CCD4F23
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 19:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8FE1C4CEC9; Wed,  4 Sep 2024 19:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ADAC4CEC2;
	Wed,  4 Sep 2024 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725478245;
	bh=MnTE7dYcB3YNloI5YMo3Uwu1ng14K5sDucLu8VPvsms=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=UADXoAeZ5XfiA7emYVzCUwZr54VDUoerC8OorI9NW0I9t1SwcC5WGFhJL2zFG8kFq
	 hb8noRhB+YBq8XYCJ+c5+Lt6b5tG9JIGRLplbVseIKD2lCic7S7MT5BVEdue+Eiu1A
	 jShYFNUJYelPIVxkUI7dLNeD9d0xXMgn4qOnOUiu2fveqDfvIRXwPHqzKhv1pxbsFA
	 Fgo6Oefjihkhuz+3imQ/a+eMDkJxOf4J7oj1YIpT8NFMcKyYXc8XY6cG+fH9C+qF16
	 czEGltXoem9YYv2SNFUQh2B4DDzcp2x8mZ/+nGvW9QrSsJAmMnMCBHKVAQ+EPlyvOF
	 95l14IxRp8a/w==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Murali Nalajala <quic_mnalajal@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Shivnandan Kumar <quic_kshivnan@quicinc.com>,
	Sudeepgoud Patil <quic_sudeepgo@quicinc.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.12
Date: Wed,  4 Sep 2024 14:30:41 -0500
Message-ID: <20240904193042.15118-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.12

for you to fetch changes up to 6614be05358869f1642964b650977018ac528a14:

  firmware: qcom: scm: Allow QSEECOM on Surface Laptop 7 models (2024-08-26 11:28:32 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.12

Support is added for making SCM driver configure the system either for a
full or minimal ramdump following a system crash. The ramdump mode is
changed from being enable-only to enable/disable as requested.

The QSEECOM uefisecapp interface is allow-listed on Surface Laptop 7 and
Lenovo Thinkpad T14s, providing EFI variable access.

The change to match the SMD RPM driver based on the SMD channel name is
reverted, in favor of stepping back to OF-based matching, as a means to
get module autoloading to work properly.

AOSS, APR, ICE, OCMEM, PBS and SMP2P drivers has error handling cleaned
up using scoped resources.

Trace events are added to the BWMON and SMP2P drivers, for better
insights into their operations.

The X1E LLCC configuration data is updated based on recommended values.

A number of platforms are added to the in-kernel PD-mapper.

SocInfo driver is extended with IDs from SM7325, QCS8275 and QCS8300
families.

----------------------------------------------------------------
Andrew Halaney (1):
      soc: qcom: pd-mapper: Depend on ARCH_QCOM || COMPILE_TEST

Arnd Bergmann (1):
      soc: qcom: pd-mapper: mark qcom_pdm_domains as __maybe_unused

Bartosz Golaszewski (2):
      firmware: qcom: tzmem: fix virtual-to-physical address conversion
      firmware: qcom: qseecom: remove unused functions

Bjorn Andersson (1):
      Merge branch 'drivers-fixes-for-6.11' into HEAD

Danila Tikhonov (4):
      dt-bindings: arm: qcom,ids: Add IDs for SM7325 family
      soc: qcom: socinfo: Add Soc IDs for SM7325 family
      soc: qcom: pd_mapper: Add SM7325 compatible
      dt-bindings: soc: qcom: qcom,pmic-glink: Document SM7325 compatible

Dmitry Baryshkov (3):
      Revert "soc: qcom: smd-rpm: Match rpmsg channel instead of compatible"
      dt-bindings: soc: qcom: smd-rpm: add generic compatibles
      soc: qcom: smd-rpm: add qcom,smd-rpm compatible

Jingyi Wang (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS8275/QCS8300
      soc: qcom: socinfo: add QCS8275/QCS8300 SoC ID

Konrad Dybcio (4):
      firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s
      mailmap: Add an entry for Konrad Dybcio
      MAINTAINERS: Update Konrad Dybcio's email address
      firmware: qcom: scm: Allow QSEECOM on Surface Laptop 7 models

Krzysztof Kozlowski (6):
      soc: qcom: apr: simplify with scoped for each OF child loop
      soc: qcom: aoss: simplify with scoped for each OF child loop
      soc: qcom: ice: use scoped device node handling to simplify error paths
      soc: qcom: ocmem: use scoped device node handling to simplify error paths
      soc: qcom: pbs: use scoped device node handling to simplify error paths
      soc: qcom: smp2p: use scoped device node handling to simplify error paths

Mukesh Ojha (3):
      firmware: qcom: scm: Disable SDI and write no dump to dump mode
      firmware: qcom: scm: Refactor code to support multiple dload mode
      firmware: qcom: scm: Add multiple download mode support

Murali Nalajala (1):
      firmware: qcom: scm: Mark get_wq_ctx() as atomic call

Rajendra Nayak (1):
      soc: qcom: llcc: Update configuration data for x1e80100

Shivnandan Kumar (1):
      soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread

Stephan Gerhold (2):
      soc: qcom: pd_mapper: Add X1E80100
      soc: qcom: pd_mapper: Add more older platforms without domains

Sudeepgoud Patil (1):
      soc: qcom: smp2p: Introduce tracepoint support

Volodymyr Babchuk (1):
      soc: qcom: cmd-db: Map shared memory as WC, not WB

 .mailmap                                           |  2 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |  2 +-
 .../bindings/remoteproc/qcom,glink-rpm-edge.yaml   |  2 +-
 .../bindings/remoteproc/qcom,rpm-proc.yaml         |  4 +-
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  5 ++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 74 ++++++++--------
 .../devicetree/bindings/soc/qcom/qcom,smd.yaml     |  2 +-
 MAINTAINERS                                        |  7 +-
 drivers/firmware/qcom/Kconfig                      | 11 ---
 drivers/firmware/qcom/qcom_scm-smc.c               |  2 +-
 drivers/firmware/qcom/qcom_scm.c                   | 72 +++++++++++++---
 drivers/firmware/qcom/qcom_tzmem.c                 | 32 ++++---
 drivers/soc/qcom/Kconfig                           |  2 +-
 drivers/soc/qcom/Makefile                          |  1 +
 drivers/soc/qcom/apr.c                             |  5 +-
 drivers/soc/qcom/cmd-db.c                          |  2 +-
 drivers/soc/qcom/icc-bwmon.c                       |  6 +-
 drivers/soc/qcom/ice.c                             | 14 ++--
 drivers/soc/qcom/llcc-qcom.c                       | 32 ++++---
 drivers/soc/qcom/ocmem.c                           |  7 +-
 drivers/soc/qcom/qcom-pbs.c                        | 16 ++--
 drivers/soc/qcom/qcom_aoss.c                       |  8 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  | 17 +++-
 drivers/soc/qcom/smd-rpm.c                         | 41 +++++++--
 drivers/soc/qcom/smp2p.c                           | 25 +++---
 drivers/soc/qcom/socinfo.c                         |  4 +
 drivers/soc/qcom/trace-smp2p.h                     | 98 ++++++++++++++++++++++
 drivers/soc/qcom/trace_icc-bwmon.h                 | 48 +++++++++++
 include/dt-bindings/arm/qcom,ids.h                 |  4 +
 include/linux/firmware/qcom/qcom_qseecom.h         | 45 ----------
 30 files changed, 386 insertions(+), 204 deletions(-)
 create mode 100644 drivers/soc/qcom/trace-smp2p.h
 create mode 100644 drivers/soc/qcom/trace_icc-bwmon.h
