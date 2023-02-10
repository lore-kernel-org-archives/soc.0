Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54887C05027
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 18:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 159BEC4339C; Fri, 10 Feb 2023 18:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA32C433EF;
	Fri, 10 Feb 2023 18:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676053233;
	bh=lxc9elAPc7SGhRcjNmva5gpdrtxKzq0+q0MSXM7Fxe8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=CQ0QL17ByiCMeE2sTmRyiaosLlSZjqJXhD75hdzxOBu//2x5C5XPURsT7zGgSRbqq
	 D43Ji8IVyVbJPZXlxZjt2ASHdfPV3AiHDUX7MYVxpJJ8aAgjBge2vLOeKnnKBlQjL5
	 DQIKPztry3OXtImMwv8JAUdci9AZmve4VQ6NqFgR2Sk2MmJ8R76TL/IH8QDmUcIP/0
	 j0vm3x7B1H4f2+mBc4cHsgGjUHeqZhB0F3D49JcPFmPMjjqf/mIDqe6AHfI0OthkBp
	 u1K9ZRzb4WOPUw2fVrTdqqX2RPSRQFHUYSQtunU6iJHPYyNvInKPFYfGP7xorMHl1j
	 YFTdbYwstI98g==
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
	Christian Marangi <ansuelsmth@gmail.com>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Naman Jain <quic_namajain@quicinc.com>,
	Niklas Cassel <nks@flawful.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Tom Rix <trix@redhat.com>,
	devi priya <quic_devipriy@quicinc.com>
Subject: [GIT PULL] More Qualcomm driver updates for 6.3
Date: Fri, 10 Feb 2023 10:22:42 -0800
Message-Id: <20230210182242.2023901-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit c5d52d7bf241a4d06b651362446644948621c426:

  soc: qcom: dcc: Drop driver for now (2023-01-30 20:30:54 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.3-2

for you to fetch changes up to b0bc8c893ae07acd4829a158e83902897a31a490:

  soc: qcom: socinfo: Add IDs for IPQ5332 and its variant (2023-02-08 19:36:16 -0800)

----------------------------------------------------------------
More Qualcomm driver updates for 6.3

The qcom_scm.h file is moved into firmware/qcom, to avoid having any
Qualcomm-specific files directly in include/linux.

Support for PMIC GLINK is introduced, which on newer Qualcomm platforms
provides an interface to the firmware implementing battery management
and USB Type-C handling. Together with the base driver comes the custom
altmode support driver.

SMD RPM gains support for IPQ9574, and socinfo is extended with support
for revision 17 of the information format and soc_id for IPQ5332 and
IPQ8064 are added.

The qcom_stats  is changes not to fail when not all parts are
initialized.

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: firmware: document Qualcomm SM8550 SCM

Arnd Bergmann (1):
      soc: qcom: pmic_glink: add CONFIG_NET/CONFIG_OF dependencies

Bartosz Golaszewski (1):
      dt-bindings: firmware: qcom,scm: add qcom,scm-sa8775p compatible

Bjorn Andersson (4):
      dt-bindings: soc: qcom: Introduce PMIC GLINK binding
      soc: qcom: pmic_glink: Introduce base PMIC GLINK driver
      soc: qcom: pmic_glink: Introduce altmode support
      Merge branch '20230201041853.1934355-1-quic_bjorande@quicinc.com' into drivers-for-6.3

Christian Marangi (2):
      dt-bindings: arm: qcom,ids: Add Soc IDs for IPQ8064 and variants
      soc: qcom: socinfo: Add Soc IDs for IPQ8064 and variants

Dmitry Baryshkov (1):
      dt-bindings: power: qcom,rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1

Elliot Berman (1):
      firmware: qcom_scm: Move qcom_scm.h to include/linux/firmware/qcom/

Kathiravan T (2):
      dt-bindings: arm: qcom,ids: Add IDs for IPQ5332 and its variant
      soc: qcom: socinfo: Add IDs for IPQ5332 and its variant

Melody Olvera (1):
      dt-bindings: soc: qcom,rpmh-rsc: Update to allow for generic nodes

Naman Jain (1):
      soc: qcom: socinfo: Add support for new field in revision 17

Niklas Cassel (1):
      MAINTAINERS: Update qcom CPR maintainer entry

Stephen Boyd (1):
      soc: qcom: stats: Populate all subsystem debugfs files

Tom Rix (1):
      soc: qcom: pmic_glink: remove redundant calculation of svid

devi priya (1):
      soc: qcom: smd-rpm: Add IPQ9574 compatible

 .../devicetree/bindings/firmware/qcom,scm.yaml     |   4 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  95 ++++
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |   3 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/mach-qcom/platsmp.c                       |   2 +-
 drivers/cpuidle/cpuidle-qcom-spm.c                 |   2 +-
 drivers/firmware/qcom_scm-legacy.c                 |   2 +-
 drivers/firmware/qcom_scm-smc.c                    |   2 +-
 drivers/firmware/qcom_scm.c                        |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c               |   2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c   |   2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   2 +-
 drivers/iommu/arm/arm-smmu/qcom_iommu.c            |   2 +-
 drivers/media/platform/qcom/venus/firmware.c       |   2 +-
 drivers/misc/fastrpc.c                             |   2 +-
 drivers/mmc/host/sdhci-msm.c                       |   2 +-
 drivers/net/ipa/ipa_main.c                         |   2 +-
 drivers/net/wireless/ath/ath10k/qmi.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |   2 +-
 drivers/remoteproc/qcom_wcnss.c                    |   2 +-
 drivers/soc/qcom/Kconfig                           |  18 +
 drivers/soc/qcom/Makefile                          |   2 +
 drivers/soc/qcom/mdt_loader.c                      |   2 +-
 drivers/soc/qcom/ocmem.c                           |   2 +-
 drivers/soc/qcom/pmic_glink.c                      | 336 +++++++++++++++
 drivers/soc/qcom/pmic_glink_altmode.c              | 478 +++++++++++++++++++++
 drivers/soc/qcom/qcom_stats.c                      |  10 +-
 drivers/soc/qcom/rmtfs_mem.c                       |   2 +-
 drivers/soc/qcom/smd-rpm.c                         |   1 +
 drivers/soc/qcom/socinfo.c                         |  16 +
 drivers/thermal/qcom/lmh.c                         |   2 +-
 drivers/ufs/host/ufs-qcom-ice.c                    |   2 +-
 include/dt-bindings/arm/qcom,ids.h                 |   8 +
 include/dt-bindings/power/qcom-rpmpd.h             |   1 +
 include/linux/{ => firmware/qcom}/qcom_scm.h       |   0
 include/linux/soc/qcom/pmic_glink.h                |  32 ++
 40 files changed, 1022 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
 create mode 100644 drivers/soc/qcom/pmic_glink.c
 create mode 100644 drivers/soc/qcom/pmic_glink_altmode.c
 rename include/linux/{ => firmware/qcom}/qcom_scm.h (100%)
 create mode 100644 include/linux/soc/qcom/pmic_glink.h
