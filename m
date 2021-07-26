Return-Path: <SRS0=oDMb=MS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BE7C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jul 2021 02:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7E160F11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jul 2021 02:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A7E160F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sVnJ2uStbxViPH3sFWdZWn5hvvAUe12rm6stgqI4oWA=; b=fFbd9JlNkVUcYP
	jYBDwprqMchs6qeAhqyP4K4II/22rvbfKRNcl7bgOfIacXnbZxceC2aTB1OcdoO1AgiUn1eJL07Q5
	6LGLiHn8hf/caQ8KhU/+XA3+FeSjhd7KITfMFl88jOqvG+Aek5RY3pMEUs+b9qaY/D9Nq9kWX2/Rp
	74KXu+92u8K+3GkBeTMMqD8rPzwTZtjQLhkiK2mwVZhkeYUyTjwSAg/GsF+nH3q1+R1R6MwfMkspg
	IAf7PsBAjJb7UQR/9ZMKgJXoSFZYzYi4Ugcl1ynAvllKIGyKJdH16mJZL9bmhpzPg4PTGdr+Tj8VQ
	AfmUjFUs7up8f6P9YsRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7qPv-009R42-9A; Mon, 26 Jul 2021 02:32:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7qPs-009R3i-4Q
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Jul 2021 02:32:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 345176052B;
 Mon, 26 Jul 2021 02:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627266747;
 bh=f9+bxKqv/Sbfs02pnB0L78IU7T9ttqigp+msLHtScBs=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=Zk+KQkClTxsxyaeayzoVYG+zkvbvhNUcfyw4YRy4FS4/uxcOhurAEkUiMIegbeaeB
 f0HHoy2q5C2aG7Vot4ofJ+aVN90C+40E8vq5K3Zj+dhNxKLHXtJDx0R1LJ5kt0eA/A
 RtWSQGqPIHJuMbQqns1x5boRP1tcUelAcS8w4F1KDVfAc/FlqiaZevJMzVVvynTu/F
 XgQOGOwpBaBu9b5qkOiKhaL3vmwyXvOlGF0q/RHk3Tf9kPkMdh7SVTLY/XT8wiJj5W
 NdRqFLAdtiMalfPx+d5IhkIV1bilKB/diHhDVnrT7N1lIrfsiApRDk6J41FvNk2BQ3
 6HwkYfEMpoHwg==
Date: Mon, 26 Jul 2021 10:32:22 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.14
Message-ID: <20210726023221.GF5901@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_193228_239721_270A4CD5 
X-CRM114-Status: GOOD (  10.63  )
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
Message-ID: <20210726023222.wMpNFn1r-WU8SyY7VBgw2XN1eWl6RshpC_7ZZW9j3Es@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.14

for you to fetch changes up to 3d9e30a52047f2d464efdfd1d561ae1f707a0286:

  ARM: dts: imx: Swap M53Menlo pinctrl_power_button/pinctrl_power_out pins (2021-07-23 16:14:07 +0800)

----------------------------------------------------------------
i.MX fixes for 5.14:

- A couple of fixes on MMDC driver to add missing iounmap() and
  clk_disable_unprepare(), and a follow-up fix.
- Fix missing-prototypes warning in SRC driver.
- Revert commit 7d981405d0fd ("soc: imx8m: change to use platform
  driver"), which breaks i.MX8M system that has CAAM driver enabled.
- One fix on imx53-m53menlo pinctrl configuration.
- Increase the PHY reset duration for imx6qdl-sr-som to fix intermittent
  issues where the PHY would be unresponsive every once in a while.
- Add missing flag for in-band signalling between PHY and MAC on
  kontron-sl28-var2 board to fix network support.
- Limit the SDIO Clock on Colibri iMX6ULL to 25MHz for fixing wireless
  noise issue.
- Fix sysclk node name for LS1028A so that U-Boot is able to update the
  "clock-frequency" property.

----------------------------------------------------------------
Colin Ian King (1):
      ARM: imx: fix missing 3rd argument in macro imx_mmdc_perf_init

Fabio Estevam (1):
      ARM: imx: common: Move prototype outside the SMP block

Lucas Stach (1):
      Revert "soc: imx8m: change to use platform driver"

Marek Vasut (1):
      ARM: dts: imx: Swap M53Menlo pinctrl_power_button/pinctrl_power_out pins

Maxime Chevallier (1):
      ARM: dts: imx6qdl-sr-som: Increase the PHY reset duration to 10ms

Michael Walle (1):
      arm64: dts: ls1028: sl28: fix networking for variant 2

Oleksandr Suvorov (1):
      ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz

Vladimir Oltean (1):
      arm64: dts: ls1028a: fix node name for the sysclk

Yang Yingliang (2):
      ARM: imx: add missing iounmap()
      ARM: imx: add missing clk_disable_unprepare()

 arch/arm/boot/dts/imx53-m53menlo.dts               |  4 +-
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi              |  8 ++-
 arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi        |  1 +
 arch/arm/mach-imx/common.h                         |  2 +-
 arch/arm/mach-imx/mmdc.c                           | 17 ++++-
 .../freescale/fsl-ls1028a-kontron-sl28-var2.dts    |  2 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  2 +-
 drivers/soc/imx/soc-imx8m.c                        | 84 ++++------------------
 8 files changed, 40 insertions(+), 80 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
