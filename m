Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F65C77B61
	for <soc@archiver.kernel.org>; Sat,  8 Apr 2023 10:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD802C433D2; Sat,  8 Apr 2023 10:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145C7C433EF;
	Sat,  8 Apr 2023 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680949223;
	bh=ZqdH9ZJ/34B/DIUa1MEu/87wBsdLSsRD7M0o0KPDdq8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G42hQqXN1SHw1XGTJIImYwntV70WdMU5Uakbw56lufp7Ki5jo8V5sVtDyA0tdGw8Q
	 /31WKgDm8q/PMHzOkE6MsTB+yQb4OwrSQzRisULoFTBRZBU8z+Vp0gmKwTlYSUHnPK
	 imteE/HVAijIecXyh+mXuMvG690Yx652meBPMdUWmg5i6qfWJLq0jad1Vu6TcQ+DiS
	 EL24fpn/Ttn5u0I9yEItFYb4JIZWlKP3jkiBetuozLSPf6ESTo6wm7vQ12lr3GJfEQ
	 GouuHDP2SZPiGs+ex0B6w299lOn1/ExWAMBcUdWyMDoINzOO8nX7on82zLIapui3xS
	 AGHEgBVGIfp1Q==
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
Subject: [GIT PULL 6/6] i.MX defconfig updates for 6.4
Date: Sat,  8 Apr 2023 18:19:28 +0800
Message-Id: <20230408101928.280271-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230408101928.280271-1-shawnguo@kernel.org>
References: <20230408101928.280271-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.4

for you to fetch changes up to b4b992e2332fe566481939573f56675d451aae63:

  ARM: imx_v4_v5_defconfig: Build CONFIG_IMX_SDMA as module (2023-04-08 15:30:09 +0800)

----------------------------------------------------------------
i.MX defconfig updates for 6.4:

- Enable i.MX93 ADC driver in arm64 defconfig.
- Enable BD71815 PMIC and TDA998X HDMI bridge driver in
  imx_v6_v7_defconfig.
- Enable a few drivers support needed by Tarragon boards in
  imx_v6_v7_defconfig.
- Build IMX_SDMA driver as module in imx_v4_v5_defconfig.

----------------------------------------------------------------
Alistair Francis (1):
      ARM: imx_v6_v7_defconfig: Enable rohm,bd71815

Fabio Estevam (3):
      arm64: defconfig: Enable i.MX93 ADC support
      ARM: imx_v6_v7_defconfig: Select CONFIG_DRM_I2C_NXP_TDA998X
      ARM: imx_v4_v5_defconfig: Build CONFIG_IMX_SDMA as module

Stefan Wahren (1):
      ARM: imx_v6_v7_defconfig: Enable Tarragon peripheral drivers

 arch/arm/configs/imx_v4_v5_defconfig |  2 +-
 arch/arm/configs/imx_v6_v7_defconfig | 12 ++++++++++++
 arch/arm64/configs/defconfig         |  1 +
 3 files changed, 14 insertions(+), 1 deletion(-)
