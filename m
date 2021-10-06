Return-Path: <SRS0=GOBS=O2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4822C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 12:59:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749F261039
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 12:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 749F261039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zN6ug9UdgsC+7d4eMbVK7rm8l5b66LXzumoHzECAQ2s=; b=h2T/FQ2GkeZG8g
	MOFyNDORJXCpLXdZUtIy4MaJzQuqX1Eb3yI65swyBiWKpcaTns7vfenT+DJnoQX49OpB7MlAK9O8k
	Nyj6GDQ7vS977PjdM9ehvYm3MJ0a3kI8P3cTqIJx2o1gSBvANbjDIwZtlpICqCxHrrgdQ7PlIZxxY
	MPCpRO07WYwBjqKN94EjIm/5BbOVAhZZ2VqrO9ufD56F/2j49X/VNpmjRv6YPKdAXVBJZq/LGv0qd
	XigIPe38ZN06npj9g4X9sxW1itmUyqxSZ+zt35FYGnPhFrmZOJNHzpfpjd1GI2P/+8H6W2DN3A7l1
	nL87QAQL6uLXjeY+0ZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY6US-00EITw-JZ; Wed, 06 Oct 2021 12:57:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY6UP-00EITX-AR
 for linux-arm-kernel@lists.infradead.org; Wed, 06 Oct 2021 12:57:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ABEA61056;
 Wed,  6 Oct 2021 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633525060;
 bh=QqIeRMJUQlvsvOrLinLlGC2/rHslcS9kTy4RmILZ5iw=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=GdlLUmZT4itRtIYFGGOFn4TNy+SRb604n0/r+fiIFgdBFZ3WCQMQZxZd3P0OpgnQg
 EYEWXqUrZPHHDR6/sO3MGgIKKFoh6fBAOwxcayyPPKnTxYgUSMGclnWjHnR7Be5Oh6
 ZeG50jquZR04FEv9taVYXfTuw+BfyHpHAgOq67zRXmPndmTA2UcKouiGCZFmdRhOOG
 3rrAPnLTTgjxtwfflR9KcmH/gqQX9s0HpdOi5jqbaMVYBSrxb6xSu9PkivI4dD+lpV
 +9iHzECkbUNRVotRCG5GleStt32DE61ID8Ozg4mvghf76+4GFPzDRg3WxNLqGOvdj6
 IrosiCWJ7oFcQ==
Date: Wed, 6 Oct 2021 20:57:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.15, round 2
Message-ID: <20211006125734.GA10197@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_055741_400566_ECD3FD3A 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211006125735.BUP2hz-lMllKV5stGzjcfSokzrJw0UaQd1kWs8qrUWM@z>

The following changes since commit c54467482ffd407a4404c990697f432bfcb6cdc4:

  ARM: imx_v6_v7_defconfig: enable fb (2021-09-22 16:47:34 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-2

for you to fetch changes up to 3518441dda666696707afe933586151c0fb29db0:

  arm64: dts: imx8m*-venice-gw7902: fix M2_RST# gpio (2021-10-05 14:26:21 +0800)

----------------------------------------------------------------
i.MX fixes for 5.15, round 2:

- A couple of fixes from Haibo Chen to update SPI NOR TX bus width for
  i.MX6 and i.MX8 boards.  This becomes necessary because spi-nor driver
  starts using the setting in DT.
- Mark buck2 always-on for i.MX8MM Kontron-n801x-som board to avoid the
  core supply being turned off unexpectedly.
- Fix eSDHC2 device tree settings for LS1028A SoC.
- Disable GIC CPU interface before calling stby-poweroff sequence to fix
  power-off failure on i.MX6.
- Fix M2_RST# GPIO pinmux on i.MX8M venice-gw7902 boards.

----------------------------------------------------------------
Haibo Chen (2):
      ARM: dts: imx: change the spi-nor tx
      arm64: dts: imx8: change the spi-nor tx

Heiko Thiery (1):
      arm64: dts: imx8mm-kontron-n801x-som: do not allow to switch off buck2

Michael Walle (1):
      arm64: dts: ls1028a: fix eSDHC2 node

Oleksij Rempel (1):
      ARM: imx6: disable the GIC CPU interface before calling stby-poweroff sequence

Tim Harvey (1):
      arm64: dts: imx8m*-venice-gw7902: fix M2_RST# gpio

 arch/arm/boot/dts/imx6sx-sdb.dts                            | 4 ++--
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi                     | 2 +-
 arch/arm/mach-imx/pm-imx6.c                                 | 2 ++
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi              | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-som.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi       | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                | 2 ++
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 2 +-
 13 files changed, 17 insertions(+), 12 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
