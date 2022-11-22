Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A22C4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 20:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3724CC4347C; Tue, 22 Nov 2022 20:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A95EC433D6;
	Tue, 22 Nov 2022 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669148871;
	bh=HnL6D20Guct6F7wgkJsqE72js3NaiOgCCnv2hxPRg38=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=TSmwtgWVbqda0C2OPQsO752Pj2TZYZ2Bk1ooUBDDBZDd7Rzo5+SJ1omxGXLfGUo8V
	 DsycX4PRqfW77kVlazxO2GFa+9glQy7q9QrvIzt6EPu2g2fUvHYGbCrqv0jgaEaP29
	 H34w9uO8Bj1TxzEraZUhs/7qFv4fTvmg5Qw+VfLJDk7l9lSRnZ5xyxiq08CprRclS2
	 Pqf+TQmoy26E8Y07buHvEK/AescogJRvAOP4emuP+tUUFbUM/0FezRg5ob0wNAdqK3
	 a6qOKfVKk3q+XnGHHHj2WttMyxCpuvtsK/7H4iFBjGQXN8NkBhmfd8smY9l/9VnEv/
	 WdhdaQrFiRboQ==
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
	Maulik Shah <quic_mkshah@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Richard Acayan <mailingradian@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Lina Iyer <ilina@codeaurora.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [GIT PULL] Qualcomm driver updates for 6.2
Date: Tue, 22 Nov 2022 14:27:48 -0600
Message-Id: <20221122202748.1854487-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.2

for you to fetch changes up to aa9f474014b1e2665194a97dc4675aa187534bb9:

  dt-bindings: firmware: scm: add sdm670 compatible (2022-11-11 21:28:52 -0600)

----------------------------------------------------------------
Qualcomm driver updates for 6.2

The qcom,msm-id and qcom,board-id DeviceTree properties are documented,
to allow them to be used in configurations or devices requiring these
and the socinfo driver is updated to reuse the introduced identifiers.

The rpmh-rsc driver is extended to register for PM runtime notifications
from the CPU clusters, in order to submit sleep and wake votes the last
core in a cluster is being powered down.

A mechanism for keeping rpmhpd resources voted until sync_state is
introduced, this ensures that power-domains required during boot are
kept enabled. The rpmhpd power-domains for SDM670 are also added.

Support for the new QDU1000/QRU1000 platform is introduced in the rpmhpd
and socinfo drivers.

The APR driver gains missing error handling. QMI message descriptors in
the PDR driver are made const.

Support for the RPM found in SM6375 is added. The SPM driver gains
support for MSM8939 and MSM8976 platforms.

The stats and command-db drvers are marked as not having PM support.

----------------------------------------------------------------
AngeloGioacchino Del Regno (3):
      dt-bindings: soc: qcom: spm: Add compatibles for MSM8976 L2
      soc: qcom: spm: Implement support for SAWv2.3, MSM8976 L2 PM
      dt-bindings: soc: qcom: qcom,smd-rpm: Use qcom,smd-channels on MSM8976

Bjorn Andersson (1):
      soc: qcom: rpmhpd: Use highest corner until sync_state

Gustavo A. R. Silva (1):
      soc: qcom: smd-rpm: Replace zero-length array with DECLARE_FLEX_ARRAY() helper

Jeff Johnson (1):
      soc: qcom: pdr: Make QMI message rules const

Jiasheng Jiang (1):
      soc: qcom: apr: Add check for idr_alloc and of_property_read_string_index

Konrad Dybcio (3):
      dt-bindings: soc: qcom: qcom,smd-rpm: Add a compatible for SM6375
      soc: qcom: smd-rpm: Add SM6375 compatible
      dt-bindings: firmware: document Qualcomm SM6375 SCM

Krzysztof Kozlowski (4):
      dt-bindings: arm: qcom: document qcom,msm-id and qcom,board-id
      soc: qcom: socinfo: create soc_id table from bindings
      dt-bindings: soc: qcom: smd-rpm: add PMIC regulators nodes
      dt-bindings: soc: qcom: smd-rpm: add qcom,glink-channels

Lina Iyer (1):
      soc: qcom: rpmh-rsc: Attach RSC to cluster PM domain

Luca Weiss (4):
      soc: qcom: spmi-pmic: convert hex numbers to lowercase
      soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs
      dt-bindings: soc: qcom: aoss: Add sc8280xp compatible
      soc: qcom: llcc: make irq truly optional

Manikanta Pubbisetty (1):
      dt-bindings: qcom: smp2p: Add WPSS node names to pattern property

Maulik Shah (4):
      dt-bindings: soc: qcom: Update devicetree binding document for rpmh-rsc
      PM: domains: Store the next hrtimer wakeup in genpd
      soc: qcom: rpmh-rsc: Save base address of drv
      soc: qcom: rpmh-rsc: Write CONTROL_TCS with next timer wakeup

Melody Olvera (4):
      dt-bindings: power: rpmpd: Add QDU1000/QRU1000 to rpmpd binding
      soc: qcom: rpmhpd: Add QDU1000/QRU1000 power domains
      dt-bindings: arm: qcom,ids: Add SoC IDs for QDU1000/QRU1000
      soc: qcom: socinfo: Add QDU1000/QRU1000 SoC IDs to the soc_id table

Richard Acayan (3):
      dt-bindings: power: rpmpd: add sdm670 power domains
      soc: qcom: rpmhpd: add sdm670 power domains
      dt-bindings: firmware: scm: add sdm670 compatible

Stephen Boyd (2):
      soc: qcom: cmd-db: Mark device as having no PM support
      soc: qcom: stats: Mark device as having no PM support

Vincent Knecht (2):
      dt-bindings: soc: qcom: spm: Add MSM8939 CPU compatible
      soc: qcom: spm: Add MSM8939 SPM register data

Wolfram Sang (1):
      soc: qcom: move from strlcpy with unused retval to strscpy

 Documentation/devicetree/bindings/arm/qcom.yaml    | 120 +++++++++
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   3 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |   5 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  28 ++-
 .../devicetree/bindings/soc/qcom/qcom,smp2p.yaml   |   2 +-
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |   3 +
 drivers/base/power/domain.c                        |  26 ++
 drivers/base/power/domain_governor.c               |   3 +
 drivers/soc/qcom/apr.c                             |  15 +-
 drivers/soc/qcom/cmd-db.c                          |   2 +
 drivers/soc/qcom/llcc-qcom.c                       |   2 +-
 drivers/soc/qcom/pdr_internal.h                    |  20 +-
 drivers/soc/qcom/qcom_stats.c                      |   2 +
 drivers/soc/qcom/rpmh-internal.h                   |   9 +-
 drivers/soc/qcom/rpmh-rsc.c                        | 146 +++++++++--
 drivers/soc/qcom/rpmh.c                            |   4 +-
 drivers/soc/qcom/rpmhpd.c                          |  71 +++++-
 drivers/soc/qcom/smd-rpm.c                         |   3 +-
 drivers/soc/qcom/smp2p.c                           |   2 +-
 drivers/soc/qcom/socinfo.c                         | 271 +++++++++++----------
 drivers/soc/qcom/spm.c                             |  46 ++++
 include/dt-bindings/arm/qcom,ids.h                 | 161 ++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h             |  16 ++
 include/linux/pm_domain.h                          |   7 +
 include/soc/qcom/qcom-spmi-pmic.h                  |  17 +-
 27 files changed, 817 insertions(+), 170 deletions(-)
 create mode 100644 include/dt-bindings/arm/qcom,ids.h
