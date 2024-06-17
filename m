Return-Path: <SRS0=I9gV=NT=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B855DC27C77
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 03:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EA8DC4AF1C; Mon, 17 Jun 2024 03:45:32 +0000 (UTC)
Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.kernel.org (Postfix) with ESMTP id 8D3C3C3277B;
	Mon, 17 Jun 2024 03:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D3C3C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=m/voODt9TY9R77IeA7WVY1A3Xd9OvptuZQxSo0kZs+M=;
	b=P5B2pNw8XuOnAe5tN1wARWhYS00dQAybsm3HhIDGMeUj1x3AU4JuR9EIH4jSca
	uFcxOYE0i7akYvX9NnBz22N3/S4Y9AXgGFL3+p2fcQrAUN5FWVhkVXk3HXuA8PWb
	lSsXu90Qs9Ta4Sb0vlG7b0Y4omsYWu8VD/zkSWnXQnFfc=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADHLxlVsW9mtC7PCA--.5394S3;
	Mon, 17 Jun 2024 11:45:26 +0800 (CST)
Date: Mon, 17 Jun 2024 11:45:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.10
Message-ID: <Zm+xVUmFtaOnYBb4@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:C1UQrADHLxlVsW9mtC7PCA--.5394S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryktw13Cr1xWFyfWF4fAFb_yoW8tw4kpF
	yfCrW3Jr4fGr18CFn0qF4kX398ta15AF4Yqr1Yy348Kr1rZw1DXFnxKw1fWryjvryxXw4Y
	yF1xGryUWw1rXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jazuAUUUUU=
X-Originating-IP: [114.216.76.201]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDRcBZVszXmQLqQAAsO

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.10

for you to fetch changes up to dfd239a039b3581ca25f932e66b6e2c2bf77c798:

  arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc (2024-06-17 11:07:06 +0800)

----------------------------------------------------------------
i.MX fixes for 6.10:

- Fix GPIO number for reg_usdhc2_vmmc on imx8qm-mek board.
- Enable hysteresis for SODIMM_17 pin on imx8mm-verdin board to increase
  immunity against noise.
- Remove 'no-sdio' property for uSDHC2 on imx93-11x11-evk board, so that
  SDIO cards could also work.
- Fix BT shutdown GPIO for imx8mp-venice-gw73xx-2x board.
- Fix panel node deleting on imx53-qsb-hdmi, as /delete-node/ directive
  doesn't really delete a node in a DT overlay.
- Fix TC9595 input clock on DH i.MX8M Plus DHCOM SoM.
- Fix GPU speed for imx8mm-verdin board by enabling overdrive mode in
  the SOM dtsi.

----------------------------------------------------------------
Fabio Estevam (1):
      arm64: dts: imx93-11x11-evk: Remove the 'no-sdio' property

Frank Li (1):
      arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc

Joao Paulo Goncalves (1):
      arm64: dts: freescale: imx8mm-verdin: Fix GPU speed

Liu Ying (1):
      arm: dts: imx53-qsb-hdmi: Disable panel instead of deleting node

Marek Vasut (1):
      arm64: dts: imx8mp: Fix TC9595 input clock on DH i.MX8M Plus DHCOM SoM

Max Krummenacher (1):
      arm64: dts: freescale: imx8mm-verdin: enable hysteresis on slow input pin

Tim Harvey (1):
      arm64: dts: freescale: imx8mp-venice-gw73xx-2x: fix BT shutdown GPIO

 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso           | 6 ++++--
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi        | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts            | 2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts       | 1 -
 7 files changed, 10 insertions(+), 8 deletions(-)

