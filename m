Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868DCC433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 12:02:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4F8C064F53; Thu,  4 Feb 2021 12:02:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 691B164F67;
	Thu,  4 Feb 2021 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612440135;
	bh=alFmec2khP2pcPxznb6LXB9Sfq5jWl/sZ2JgCWLTFxw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zika4B+5G20lf13jJvRRp8LM0o/SHjVRJYLXXB/bIJNbzoSLFG0TCnwb2erY8da32
	 U7ZXFAhTqhIDN4n9J1nehLaJkSCkhtw8f+/vUbe2SkP2NZrshK+UCHOi0fnONi/uo4
	 vNKW2v38H1bZTBKtMOiE20rHzoiyXJVlOpiQyt2nog0DIFs4TnhWu6Qp3E7PFMW39z
	 k7z6kAm43Jdscrv/G1bw1NTOzflFMtyEXCeMegHAybI+kb3JRftIMKdpoo5t5zqzaU
	 xgLOohTUGTEiMMrF+3uZ+AwlTjxRrMWFXYTD7JILkJo4/cBu2Dm4zwCQDo/wMEsVpA
	 wNQfYSCp7OFcA==
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
Subject: [GIT PULL 6/6] i.MX defconfig update for 5.12
Date: Thu,  4 Feb 2021 20:01:50 +0800
Message-Id: <20210204120150.26186-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.12

for you to fetch changes up to d984d1a0abf87d890250dfa633c0ae3c625de9e9:

  arm64: defconfig: Enable PF8x00 as builtin (2021-01-30 22:31:24 +0800)

----------------------------------------------------------------
i.MX defconfig change for 5.12:

- Enable WM8962 support needed by imx8mn-beacon-kit.
- Enable PF8x00 support used by Boundary Nitrogen8M Mini SBC.
- Enable a few drivers for Librem 5 devkit support.
- Enable interconnect support for i.MX8MQ.
- Enable Broadcom BCM54140 PHY driver for Kontron K-Box A-230-LS.
- Enable RV3028 I2C RTC and PCA9532 driver support for phyBOARD-Pollux
  i.MX8MP.
- Enable RN5T618 PMIC driver support in imx_v6_v7_defconfig.

----------------------------------------------------------------
Adam Ford (1):
      arm64: defconfig: Enable WM8962

Adrien Grassein (1):
      arm64: defconfig: Enable PF8x00 as builtin

Andreas Kemnade (1):
      ARM: imx_v6_v7_defconfig: enable power driver of RN5T618 PMIC family

Guido Günther (2):
      arm64: defconfig: Enable Librem 5 devkit components
      arm64: defconfig: Enable vibra-pwm

Martin Kepplinger (1):
      arm64: defconfig: Enable interconnect for imx8mq

Michael Walle (1):
      arm64: defconfig: Enable Broadcom BCM54140 PHY

Teresa Remmet (2):
      arm64: defconfig: Enable rv3028 i2c rtc driver
      arm64: defconfig: Enable PCA9532 support

 arch/arm/configs/imx_v6_v7_defconfig |  1 +
 arch/arm64/configs/defconfig         | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
