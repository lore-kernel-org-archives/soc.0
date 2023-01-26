Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF9CC05027
	for <soc@archiver.kernel.org>; Thu, 26 Jan 2023 16:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13966C433A0; Thu, 26 Jan 2023 16:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E015C433D2;
	Thu, 26 Jan 2023 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674750610;
	bh=Gk8Z3I41YYAz9qK0EFlezGRsSfYOHiIE/wYQfinG4tI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=JXXCTH7ymzvTJij3zV7BaDYbQqhHOCASVyETmH/2OgZtpWJoO5dtOgZhtT3DiSNGH
	 MRuIl35tKNLuczKZ67hhHM5Qg4gJeclnEzJbUU0CqQP4Vw26t+x8GUNIj5KkfmLjcQ
	 dis14aw+zVXok1phwtmSZp+YZJ9pbUlHuotvGDjQXMoiW2I9GRXL56t8nwS6QgldPc
	 dSGi0eZhZeXEYWbVLVaJf3owhSfMMYUV1JjpTH/zlUtyoJPQDZsc3PFs9iOrtgSEjj
	 hHgt6YiZRxMWpCn8tRWex3xv0urYWNm+Yn2U43QDfPHNrX/PgslJUwT31W17vjQPYR
	 iduVhMI6vDkvA==
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
	Stephan Gerhold <stephan@gerhold.net>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dawei Li <set_pte_at@outlook.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Naman Jain <quic_namajain@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.3
Date: Thu, 26 Jan 2023 10:30:08 -0600
Message-Id: <20230126163008.3676950-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6049aae52392539e505bfb8ccbcff3c26f1d2f0b:

  PM: AVS: qcom-cpr: Fix an error handling path in cpr_probe() (2023-01-10 09:48:13 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.3

for you to fetch changes up to 6bf32599223634294cdc6efb359ffaab1d68073c:

  firmware: qcom: scm: Add wait-queue handling logic (2023-01-18 21:14:40 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.3

This introduces a new driver for the Data Capture and Compare block,
which provides a mechanism for capturing hardware state (access MMIO
registers) either upon request of triggered automatically e.g. upon a
watchdog bite, for post mortem analysis.

The remote filesystem memory share driver gains support for having its
memory bound to more than a single VMID.

The SCM driver gains the minimal support needed to support a new
mechanism where secure world can put calls on hold and later request
them to be retried.

Support for the new SA8775P platform is added to rpmhpd, QDU1000 is
added to the SCM driver and a long list of platforms are added to the
socinfo driver. Support for socinfo data revision 16 is also introduced.

Lastly a driver to program the ramp controller in MSM8976 is introduced.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      dt-bindings: soc: qcom: Add bindings for Qualcomm Ramp Controller
      soc: qcom: Add Qualcomm Ramp Controller driver

Bagas Sanjaya (2):
      soc: qcom: dcc: Fix examples list on /sys/kernel/debug/dcc/.../[list-number]/config documentation
      soc: qcom: dcc: rewrite description of dcc sysfs files

Bartosz Golaszewski (2):
      dt-bindings: power: qcom,rpmpd: document sa8775p
      soc: qcom: rmphpd: add power domains for sa8775p

Bjorn Andersson (4):
      soc: qcom: ramp_controller: Include linux/bitfield.h
      soc: qcom: ramp_controller: Make things static
      Merge branch '20230109130523.298971-3-konrad.dybcio@linaro.org' into drivers-for-6.3
      Merge tag 'qcom-driver-fixes-for-6.2' into drivers-for-6.3

Bryan O'Donoghue (1):
      dt-bindings: soc: qcom: smd-rpm: Exclude MSM8936 from glink-channels

Dawei Li (1):
      soc: qcom: apr: make remove callback of apr driver void returned

Guru Das Srinagesh (2):
      dt-bindings: firmware: qcom,scm: Add optional interrupt
      firmware: qcom: scm: Add wait-queue handling logic

Konrad Dybcio (4):
      dt-bindings: reserved-memory: rmtfs: Make qcom,vmid an array
      dt-bindings: firmware: qcom: scm: Separate VMIDs from header to bindings
      Revert "soc: qcom: rpmpd: Add SM4250 support"
      Revert "dt-bindings: power: rpmpd: Add SM4250 support"

Krzysztof Kozlowski (2):
      dt-bindings: firmware: qcom,scm: document MSM8226 clocks
      dt-bindings: firmware: qcom,scm: narrow clocks and interconnects

Loic Poulain (1):
      soc: qcom: rmtfs: Optionally map RMTFS to more VMs

Melody Olvera (1):
      dt-bindings: firmware: scm: Add QDU1000/QRU1000 compatible

Naman Jain (1):
      soc: qcom: socinfo: Add support for new fields in revision 16

Neil Armstrong (1):
      dt-bindings: soc: qcom: convert non-smd RPM bindings to dt-schema

Souradeep Chowdhury (3):
      dt-bindings: soc: qcom,dcc: Add the dtschema
      soc: qcom: dcc: Add driver support for Data Capture and Compare unit(DCC)
      MAINTAINERS: Add the entry for DCC(Data Capture and Compare) driver support

Stephan Gerhold (4):
      soc: qcom: socinfo: Fix soc_id order
      dt-bindings: arm: qcom,ids: Add QRD board ID
      dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
      soc: qcom: socinfo: Add a bunch of older SoCs

Yang Li (1):
      soc: qcom: dcc: Fix unsigned comparison with less than zero

 Documentation/ABI/testing/debugfs-driver-dcc       |  127 ++
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   64 +-
 Documentation/devicetree/bindings/mfd/qcom-rpm.txt |  283 -----
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    2 +-
 .../bindings/reserved-memory/qcom,rmtfs-mem.yaml   |    6 +-
 .../devicetree/bindings/soc/qcom/qcom,dcc.yaml     |   44 +
 .../soc/qcom/qcom,msm8976-ramp-controller.yaml     |   36 +
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  101 ++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |    1 +
 MAINTAINERS                                        |    8 +
 drivers/firmware/qcom_scm-smc.c                    |   86 +-
 drivers/firmware/qcom_scm.c                        |   90 +-
 drivers/firmware/qcom_scm.h                        |    8 +
 drivers/soc/qcom/Kconfig                           |   17 +
 drivers/soc/qcom/Makefile                          |    2 +
 drivers/soc/qcom/dcc.c                             | 1300 ++++++++++++++++++++
 drivers/soc/qcom/ramp_controller.c                 |  343 ++++++
 drivers/soc/qcom/rmtfs_mem.c                       |   29 +-
 drivers/soc/qcom/rpmhpd.c                          |   34 +
 drivers/soc/qcom/rpmpd.c                           |   18 -
 drivers/soc/qcom/socinfo.c                         |   96 +-
 include/dt-bindings/arm/qcom,ids.h                 |   75 ++
 include/dt-bindings/firmware/qcom,scm.h            |   16 +
 include/dt-bindings/power/qcom-rpmpd.h             |   29 +-
 include/linux/qcom_scm.h                           |    6 +-
 include/linux/soc/qcom/apr.h                       |    2 +-
 sound/soc/qcom/qdsp6/q6core.c                      |    4 +-
 27 files changed, 2480 insertions(+), 347 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-driver-dcc
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-rpm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm8976-ramp-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
 create mode 100644 drivers/soc/qcom/dcc.c
 create mode 100644 drivers/soc/qcom/ramp_controller.c
 create mode 100644 include/dt-bindings/firmware/qcom,scm.h
