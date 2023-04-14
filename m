Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED0FC77B6E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 02:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12650C433EF; Fri, 14 Apr 2023 02:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2488DC433D2;
	Fri, 14 Apr 2023 02:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681439963;
	bh=bdiVIisasE4JCbZBg4djOiVPEGiTmmgdoGN8uXayqrI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=u9DX36vHfcqefMccNWmld3kUrY5N1roU3oPOV+5juy2V0A6YqXx3tgcMNRyCJl5Y2
	 nf8vE/iCRotQlZVMTwP1Zta61OXl3Z43mAzL5c2cuse+CzOVQQhfcO7C+POX5gkGCU
	 nW52xiMqcs3ZCdxA7EmmKLwkOzbGMu26q1h9IvnuNOJqqA34C7MrOKCBJ3fQA3E3Nm
	 SH2Lq/La2JpN5U2I4GFKcRSjKFRNPyxLetg8FcxENaC6ei5siZYBaHtkZ8NVpN2tUK
	 hoOrClMW8i+asxRITjoNd+5DLt4ZKp8kc/PwSr5exnURgaoovSAcf2k/in4r5gTUvy
	 FuqWxhVh4jfxg==
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
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Tushar Nimkar <quic_tnimkar@quicinc.com>
Subject: [GIT PULL] A few more Qualcomm driver updates for v6.4
Date: Thu, 13 Apr 2023 19:43:02 -0700
Message-Id: <20230414024302.2411985-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit c78ad8597ed961e822bf86ce7f1916dbfba255ef:

  dt-bindings: firmware: document Qualcomm SC8180X SCM (2023-04-04 20:23:56 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.4-2

for you to fetch changes up to f6ff91a47ac57cb1118d94020302617b6b22c0d1:

  dt-bindings: crypto: Add Qualcomm Inline Crypto Engine (2023-04-07 12:21:27 -0700)

----------------------------------------------------------------
A few more Qualcomm driver updates for v6.4

This introduces a new binding and a dedicated driver for the Qualcomm
Inline-Crypto-Engine (ICE), in order to support a single shared instance
between SDHCI and UFS, found in recent platforms.

RSC version check is updated to support minor revisions of v3 of the ip
block, the SMD-RPM interface is transitioned to GFP_ATOMIC to avoid the
shrinker to kick in underneath the GPU and QCM2290 support is added to
the SCM binding.

----------------------------------------------------------------
Abel Vesa (2):
      soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver
      dt-bindings: crypto: Add Qualcomm Inline Crypto Engine

Bjorn Andersson (1):
      Merge tag '20230407105029.2274111-4-abel.vesa@linaro.org' into drivers-for-6.4

Konrad Dybcio (1):
      dt-bindings: firmware: document Qualcomm QCM2290 SCM

Rob Clark (1):
      soc: qcom: smd-rpm: Use GFP_ATOMIC in write path

Tushar Nimkar (1):
      soc: qcom: rpmh-rsc: Support RSC v3 minor versions

 .../bindings/crypto/qcom,inline-crypto-engine.yaml |  42 +++
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   3 +
 drivers/soc/qcom/Kconfig                           |   4 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/ice.c                             | 366 +++++++++++++++++++++
 drivers/soc/qcom/rpmh-rsc.c                        |   2 +-
 drivers/soc/qcom/smd-rpm.c                         |   2 +-
 include/soc/qcom/ice.h                             |  37 +++
 8 files changed, 455 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
 create mode 100644 drivers/soc/qcom/ice.c
 create mode 100644 include/soc/qcom/ice.h
