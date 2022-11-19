Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A00C433FE
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 12:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E431C433B5; Sat, 19 Nov 2022 12:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807B5C433D7;
	Sat, 19 Nov 2022 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668862710;
	bh=Sdo965FR8kskk++B73V+qjq3ge/eCgEKxBRu2ndLUsc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cNcCoRgAei7L+F2Cx/wPMFIMtAAHQcckURqLg57oXrdOTSsUnrgbc5eZ3ZK3vcB6L
	 sXKDjl9f410H4crAlUBUv4GPVECKLlQvWFPOumP4EavxmhJ3hs7amD4B0LfGuJlF2j
	 rZfW+1T8TklL+NHli9yU3ILXsFH+OBtstgAQsjVYpgW5/wZt1kJ4BnVo2U5l52tbRU
	 hyOm6LWhpY6pUvfNqhBL3Pj0o9A+825NRBNLrwu3u2DPNuQrQPtaqnEkvEpm3AhLmr
	 cSB66FlEApMvAwFaLU4xdFtMvJPq195qvl9VHEd7pgcY8Mh+KEL8GzcTdDyk8rp16h
	 RcZZpGFb2bRTA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig change for 6.2
Date: Sat, 19 Nov 2022 20:57:33 +0800
Message-Id: <20221119125733.32719-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221119125733.32719-1-shawnguo@kernel.org>
References: <20221119125733.32719-1-shawnguo@kernel.org>

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.2

for you to fetch changes up to 7353bdfaca60c1477c000e8fd5c62832e66d1858:

  arm64: defconfig: Add Renesas 9-series PCIe clock generator (2022-11-11 13:02:05 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.2:

- Enable Renesas 9-series PCIe clock generator, SNVS LPGRP and i.MX8MP
  interconnect driver support in arm64 defconfig.
- Enable Silergy SY7636A EPD PMIC, CYTTSP5 touchscreen and USB GPIO
  extcon support in imx_v6_v7_defconfig.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: defconfig: Add Renesas 9-series PCIe clock generator

Alistair Francis (2):
      ARM: imx_v6_v7_defconfig: Enable silergy,sy7636a
      ARM: imx_v6_v7_defconfig: Enable the cyttsp5 touchscreen

Marcel Ziswiler (3):
      arm64: defconfig: enable snvs lpgpr support
      arm64: defconfig: enable i.mx 8m plus specific interconnect support
      ARM: imx_v6_v7_defconfig: Enable USB GPIO extcon support

 arch/arm/configs/imx_v6_v7_defconfig | 5 +++++
 arch/arm64/configs/defconfig         | 3 +++
 2 files changed, 8 insertions(+)
