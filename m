Return-Path: <SRS0=2G0t=KC=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3904EC54798
	for <soc@archiver.kernel.org>; Sun, 25 Feb 2024 14:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7FF4C43390; Sun, 25 Feb 2024 14:31:13 +0000 (UTC)
Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.kernel.org (Postfix) with ESMTP id A1F08C433F1;
	Sun, 25 Feb 2024 14:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1F08C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qBsvSUE8z6h7bL7MwQUR3ATw23XoGoo7FCbLZT8h3m4=;
	b=NYqc/4K3TeZsHqW1GYTFKlgsJCe1ulDHPm5L4NlDOwV7JB4sWRi1U8bRmljkmC
	5bQmxB+gIgxV9ZsXRwtMBQxjnMbTaYBCHYoqASCJbFXM6tpOAcm6Ysf/Nj9a3nBx
	jpjUmcTXxScGnR0b3P+45hJ0zKe8dR0N2bX46J7c7RcyU=
Received: from dragon (unknown [183.213.196.200])
	by smtp2 (Coremail) with SMTP id C1UQrAD3ny8oT9tliyxXBA--.42120S3;
	Sun, 25 Feb 2024 22:31:05 +0800 (CST)
Date: Sun, 25 Feb 2024 22:31:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.8, round 2
Message-ID: <ZdtPJzdenRybI+Bq@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:C1UQrAD3ny8oT9tliyxXBA--.42120S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4kKF4kWrWfXF4xZF13urg_yoW8Ar1DpF
	4fGFnrJr48Gry8AryDJrnF934Utw15AF1UXr1UG348trn0kr1UXF15Cr1rW34UAryxWr4F
	y3WrJr4qqr1rXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jWApnUUUUU=
X-Originating-IP: [183.213.196.200]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFR6PZV6Nm6aC9gABs6

The following changes since commit 7bca405c986075c99b9f729d3587b5c45db39d01:

  bus: imx-weim: fix valid range check (2024-02-06 14:10:47 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.8-2

for you to fetch changes up to 65e32301e1a0a436bf542674c23030d0dcc1afde:

  arm64: dts: imx8mp: Fix LDB clocks property (2024-02-25 21:30:17 +0800)

----------------------------------------------------------------
i.MX fixes for 6.8, round 2:

- Update MAINTAINERS to use a public mailing list for NXP i.MX
  development.
- Re-enable CONFIG_BACKLIGHT_CLASS_DEVICE in imx_v6_v7_defconfig to fix
  a backlight regression.
- Remove DSI port endpoints from i.MX7 SoC DTSI to fix a display
  regression.
- Fix LDB clocks property for i.MX8MP device tree.
- Fix TC9595 reset GPIO on DH i.MX8M Plus DHCOM SoM.

----------------------------------------------------------------
Daniel Baluta (1):
      MAINTAINERS: Use a proper mailinglist for NXP i.MX development

Fabio Estevam (1):
      ARM: imx_v6_v7_defconfig: Restore CONFIG_BACKLIGHT_CLASS_DEVICE

Francesco Dolcini (1):
      ARM: dts: imx7: remove DSI port endpoints

Liu Ying (1):
      arm64: dts: imx8mp: Fix LDB clocks property

Marek Vasut (1):
      arm64: dts: imx8mp: Fix TC9595 reset GPIO on DH i.MX8M Plus DHCOM SoM

 MAINTAINERS                                        | 16 ++++++-------
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               | 26 ----------------------
 arch/arm/configs/imx_v6_v7_defconfig               |  1 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  2 +-
 5 files changed, 11 insertions(+), 36 deletions(-)

