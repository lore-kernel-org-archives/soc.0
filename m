Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD567ECAAD8
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 15:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FDC4C433B5; Wed, 21 Sep 2022 15:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8714C433C1;
	Wed, 21 Sep 2022 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663772596;
	bh=gsj10Gf/JCcPisgimCeMhx+FmE+FtxozdRG3SZznHbs=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=KmS/ndu/qlLBW5iHY2nunkUiocG/7/Tbd7DsL0bJanYZ5gNT6Z1SIM714ABHGB0+a
	 MdJ6m+wDn+e9HIzY289D76lKFzNNumHyaDxbb7mzHXZL+gPRq8F1z3CfdNhGarmoQQ
	 keI2MiV54f4echuykIfn5M9iCH69Ozwyk8BPas7NHKYp0bfuUh015O0Mc1oQXCdXFN
	 5RzooCpqsojkgBET+jBSYsUtMcd/sZStlWQvwNDcth97zT9iEY3Yar7YsDcb3R4RMV
	 RREtzzUwc/1qHw3g/nxlWer9anW5OZWTjrSTeJnonTmwxnxG6YwD7zv94dkwNx/IH4
	 WQ7Amx7yJUTNA==
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
	Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for 6.1
Date: Wed, 21 Sep 2022 10:03:14 -0500
Message-Id: <20220921150314.1312358-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.1

for you to fetch changes up to 25c7d38579503c72d283d229f92b30b237c67370:

  arm64: defconfig: Enabled SC8180x configs (2022-09-16 14:12:11 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for 6.1

This enables core providers needed to boot SC8180X, sound drivers for
SC7180 and SC7280, the Qualcomm EDP PHY, last-level cache controller
driver, on-chip memory driver and the SPM driver.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: defconfig: enable more Qualcomm drivers
      arm64: defconfig: enable newer Qualcomm SoC sound drivers

Vinod Koul (1):
      arm64: defconfig: Enabled SC8180x configs

 arch/arm64/configs/defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)
