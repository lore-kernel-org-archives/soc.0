Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832ABC7EE23
	for <soc@archiver.kernel.org>; Thu,  1 Jun 2023 14:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B7D3C433A1; Thu,  1 Jun 2023 14:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F15C433D2;
	Thu,  1 Jun 2023 14:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685628438;
	bh=BszhT873sT85Q92RbxHDVmdKfb7i8JngCWneZRMssa8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Ux+IszQcXhahHvRmzle7DLlH7jCs5OJ95kVi6cfnwz1asAq6hvyVPH8+QDij/9PZ+
	 e4mvrVZV84Iy0V9tLRsn2JG1bcnsJ1ZRYdeT+CtQPyv4qen9hlO+s+TuRRqoKNPITr
	 Dnv5E5R4jLw2A34c8VS8hyGYie4NSBi0pMLcBry4tDWul+CbJLZbFVN7bsvWuWyw92
	 dNPBolOS9/p87FF8LcpNKT/o6anAEBPSQWInmo5/2HDuufI1UYXUqHm7ilor5/s0a4
	 39IO8m5+M7rqTNgkOXlDnoiOJPbGq1AZO3yJxU5gQBVQIOS+26WVgUDajZf9OZx/Wx
	 bfwwG7+S4mGqw==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [GIT PULL] Qualcomm driver fixes for 6.4
Date: Thu,  1 Jun 2023 07:10:58 -0700
Message-Id: <20230601141058.2246039-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-driver-fixes-for-6.4

for you to fetch changes up to cbd77119b6355872cd308a60e99f9ca678435d15:

  EDAC/qcom: Get rid of hardcoded register offsets (2023-05-26 20:56:55 -0700)

----------------------------------------------------------------
Qualcomm driver fixes for 6.4

Error paths is corrected across icc-bwmon, rpmh-rsc, ramp_controller and
rmtfs. The ice module is renamed qcom_ice, to avoid clashing with
existing "ice" driver.

SA8155P-specific RPMh power-domains are introduced to avoid the code
trying to access resources that exists on SM8150, but not on SA8155P.

Lastly, changes to the EDAC driver to fix an issue where the driver
performs mmio based on the wrong register map.

----------------------------------------------------------------
Abel Vesa (1):
      soc: qcom: Rename ice to qcom_ice to avoid module name conflict

Bjorn Andersson (1):
      Merge branch '20230411-topic-hanaau-v2-1-fd3d70844b31@linaro.org' into drivers-fixes-for-6.4

Christophe JAILLET (1):
      soc: qcom: ramp_controller: Fix an error handling path in qcom_ramp_controller_probe()

Dan Carpenter (1):
      soc: qcom: rmtfs: Fix error code in probe()

Konrad Dybcio (3):
      dt-bindings: power: qcom,rpmpd: Add SA8155P
      soc: qcom: rpmhpd: Add SA8155P power domains
      dt-bindings: cache: qcom,llcc: Fix SM8550 description

Krzysztof Kozlowski (2):
      soc: qcom: icc-bwmon: fix incorrect error code passed to dev_err_probe()
      soc: qcom: rpmh-rsc: drop redundant unsigned >=0 comparision

Manivannan Sadhasivam (2):
      EDAC/qcom: Remove superfluous return variable assignment in qcom_llcc_core_setup()
      EDAC/qcom: Get rid of hardcoded register offsets

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 drivers/edac/qcom_edac.c                           | 118 ++++++++++-----------
 drivers/soc/qcom/Makefile                          |   3 +-
 drivers/soc/qcom/icc-bwmon.c                       |   4 +-
 drivers/soc/qcom/ramp_controller.c                 |   2 +-
 drivers/soc/qcom/rmtfs_mem.c                       |   1 +
 drivers/soc/qcom/rpmh-rsc.c                        |   2 +-
 drivers/soc/qcom/rpmhpd.c                          |  16 +++
 include/dt-bindings/power/qcom-rpmpd.h             |   9 ++
 include/linux/soc/qcom/llcc-qcom.h                 |   6 --
 11 files changed, 93 insertions(+), 70 deletions(-)
