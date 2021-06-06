Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFF8C4743E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 19:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CA561287
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 19:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20CA561287
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EmR503CR8vFWSCH7eZRNGwiy2l2rdf3bONT8DogjJP0=; b=wKh
	Bne9nfk9hCw3wLKL26XRmfChjOW2nM7McivUc++z8dXCv/7IrTxnEjtVVHaqKg5efOJWa48FR06+r
	CeTLn+oXlzyF2TM9di4VJ4zCdw9Wta25OmQxWmh+t8R4vCr1jN1NGppAOBtWSpMlHDqetJKIn82O8
	h0oPgUocZHB62FWfnsGcngTB2PG7L24pOQGJAHUD1szvvXDoLa57NZTPK/zV+4IVwPllpD0p3lhbB
	2U9J0OHfsmTO7KtsO7FagTNONwTlHCp/NIOTxpuF1IG+h5aBfXu4r7wD1aVYvzxyPr7QgcjXrDuvx
	LRrpzVOcg0ojAppJ4/zwQ48vQ0hWiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpyVa-000jO7-FO; Sun, 06 Jun 2021 19:32:30 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpyVU-000jNj-Bu
 for linux-arm-kernel@lists.infradead.org; Sun, 06 Jun 2021 19:32:28 +0000
Received: by mail-lj1-x22f.google.com with SMTP id o8so19063838ljp.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 06 Jun 2021 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=8JdwPdDkBAfx1uxQ/ZLsRWHbC7DwzWEqGOioFe5rmp0=;
 b=sTzLImWOGiD4GKUUiLP+qgvPEBjaXCtFrb32wxZ0RoxMDM0dORnLrKuld75Mz6U/Yg
 tF/Bc96mxe696lZdlveQhgdydLetHHqL3MOaTnGZYWbvG0+XNaVlhc4aE1pw1DNvNwE6
 +zqmXjHi71/TFtViDRNUMxaYj2DMKQbs4rqJGVHFAhtOssPOwBSpX1Gx02m+5AvpeUmd
 nGPL3ImZDWMbUOweRk8JpNTWriQgdm/F063UDZUxLTKGLuasgoQCNJAR6Rej07vdyl2+
 zhSoo656ZHGfKYW1tHp7x0iTZ4EyMrXh4ay5JbkBJ3DMSm1yVGHynY47ArLwzXmeQB/5
 oAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=8JdwPdDkBAfx1uxQ/ZLsRWHbC7DwzWEqGOioFe5rmp0=;
 b=nxE3QaRfPc44eibjg0dAK1jzx2ehsH67tFItk6tyvFBbCosnQVGVndp21usXQxIIj5
 SxFh7UDW+LdzNxY/6JPbZL+JJ8Xf7Si64Isi6NtN7J+ZT5jGxTczn/E2KvA+2l/IwjdE
 yLfq6YCrQefCtuS72sM5sSd+9CnRSvf8ijNI0lJZ/giX9VB9dbfl9qm8CYT3udGhWPxm
 KTA8chNYCmbrvE1yiUL/7zzS4n1no7fZwY4/4aQw/iW/rr09SDPGQQaBSLUb3iE9OrpZ
 LRYfzX0K8yMYuaHE7ngrbMkk+cFsYOotIMS8FZ+/OfnKUHi659iIv6FjG4aucJSD6wZG
 0QOw==
X-Gm-Message-State: AOAM530axnYtr+EfMh4MoDEvAUiLgi206Kemg2v10XNITzqAk9LXiQ5s
 zu0Ry9VuvqKZlc+WHH27U266sQ==
X-Google-Smtp-Source: ABdhPJxvgs6qpALrnn8AXQnZPqTsfSZDFjA/LpSBqJhUXOo688aWIGZ6OGryclkwSv73X3JFAodGlg==
X-Received: by 2002:a2e:95cb:: with SMTP id y11mr12232165ljh.461.1623007937454; 
 Sun, 06 Jun 2021 12:32:17 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id k19sm1229662lfe.25.2021.06.06.12.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 12:32:16 -0700 (PDT)
Date: Sun, 6 Jun 2021 12:27:24 -0700
From: Olof Johansson <olof@lixom.net>
To: torvalds@linux-foundation.org
List-Id: <soc.lore.kernel.org>
Cc: olof@lixom.net, soc@kernel.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: SoC fixes for v5.13
Message-ID: <20210606192724.GA7363@lx2k>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_123225_791514_66B58A69 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Type: multipart/mixed; boundary="===============7269829735877575059=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210606192724.1oX-8YAkd18_8j3X4xaLWUvyXQ6E2v7rn572zH2DelY@z>

--===============7269829735877575059==
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.13-2

for you to fetch changes up to b9c112f2c223ce50ef6579c9825a62813b205de4:

  Merge tag 'ti-k3-dt-fixes-for-v5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux into arm/fixes (2021-06-05 15:43:48 -0700)

----------------------------------------------------------------
ARM: SoC fixes for 5.13

A set of fixes that have been coming in over the last few weeks, the
usual mix of fixes:

 - DT fixups for TI K3
 - SATA drive detection fix for TI DRA7
 - Power management fixes and a few build warning removals for OMAP
 - OP-TEE fix to use standard API for UUID exporting
 - DT fixes for a handful of i.MX boards
 ... plus a few other smaller items

----------------------------------------------------------------
Fabio Estevam (3):
      ARM: imx: pm-imx27: Include "common.h"
      ARM: dts: imx7d-meerkat96: Fix the 'tuning-step' property
      ARM: dts: imx7d-pico: Fix the 'tuning-step' property

Geert Uytterhoeven (1):
      ARM: dts: imx: emcon-avari: Fix nxp,pca8574 #gpio-cells

Jens Wiklander (1):
      optee: use export_uuid() to copy client UUID

Jerome Brunet (1):
      arm64: meson: select COMMON_CLK

Lucas Stach (2):
      arm64: dts: zii-ultra: remove second GEN_3V3 regulator instance
      arm64: dts: zii-ultra: fix 12V_MAIN voltage

Maciej Falkowski (3):
      ARM: OMAP1: Fix use of possibly uninitialized irq variable
      ARM: OMAP1: isp1301-omap: Add missing gpiod_add_lookup_table function
      ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power

Marek Vasut (1):
      ARM: dts: imx6q-dhcom: Add PU,VDD1P1,VDD2P5 regulators

Michael Walle (3):
      arm64: dts: ls1028a: fix memory node
      arm64: dts: freescale: sl28: var4: fix RGMII clock and voltage
      arm64: dts: freescale: sl28: var1: fix RGMII clock and voltage

Michal Vokáč (1):
      ARM: dts: imx6dl-yapp4: Fix RGMII connection to QCA8334 switch

Nishanth Menon (6):
      arm64: dts: ti: k3-*: Rename the TI-SCI clocks node name
      arm64: dts: ti: k3-am65-wakeup: Add debug region to TI-SCI node
      arm64: dts: ti: k3-am65-wakeup: Drop un-necessary properties from dmsc node
      arm64: dts: ti: k3-*: Rename the TI-SCI node
      arm64: dts: ti: k3-am65|j721e|am64: Map the dma / navigator subsystem via explicit ranges
      arm64: dts: ti: k3*: Introduce reg definition for interrupt routers

Olof Johansson (6):
      Merge tag 'imx-fixes-5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'amlogic-fixes-v5.13-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into arm/fixes
      Merge tag 'omap-for-v5.13/fixes-sata' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/fixes
      Merge tag 'omap-for-v5.13/fixes-pm' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/fixes
      Merge tag 'optee-fix-for-v5.13' of git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'ti-k3-dt-fixes-for-v5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux into arm/fixes

Qiheng Lin (1):
      soc: amlogic: meson-clk-measure: remove redundant dev_err call in meson_msr_probe()

Tomi Valkeinen (1):
      arm64: dts: ti: k3-am654-base-board: remove ov5640

Tony Lindgren (5):
      bus: ti-sysc: Fix missing quirk flags for sata
      Merge branch 'omap-for-v5.13/ti-sysc' into fixes
      Merge branch 'fixes-rc1' into fixes
      bus: ti-sysc: Fix am335x resume hang for usb otg module
      bus: ti-sysc: Fix flakey idling of uarts and stop using swsup_sidle_act

Vignesh Raghavendra (1):
      arm64: dts: ti: j7200-main: Mark Main NAVSS as dma-coherent

Yongqiang Liu (1):
      ARM: OMAP2+: Fix build warning when mmc_omap is not built

 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         |  6 ++-
 arch/arm/boot/dts/imx6q-dhcom-som.dtsi             | 12 +++++
 arch/arm/boot/dts/imx6qdl-emcon-avari.dtsi         |  2 +-
 arch/arm/boot/dts/imx7d-meerkat96.dts              |  2 +-
 arch/arm/boot/dts/imx7d-pico.dtsi                  |  2 +-
 arch/arm/mach-imx/pm-imx27.c                       |  1 +
 arch/arm/mach-omap1/board-ams-delta.c              | 14 -----
 arch/arm/mach-omap1/board-h2.c                     |  4 +-
 arch/arm/mach-omap1/pm.c                           | 10 ++--
 arch/arm/mach-omap2/board-n8x0.c                   |  2 +-
 arch/arm64/Kconfig.platforms                       |  1 +
 .../freescale/fsl-ls1028a-kontron-sl28-var1.dts    |  3 +-
 .../freescale/fsl-ls1028a-kontron-sl28-var4.dts    |  5 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  4 +-
 .../boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts   | 10 ++--
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi | 23 +++------
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           | 11 ++--
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi            |  3 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           | 10 ++--
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            |  4 +-
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi         | 13 ++---
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     | 31 -----------
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |  8 ++-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |  7 +--
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++--
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    | 11 ++--
 drivers/bus/ti-sysc.c                              | 60 +++++++++++++++++++---
 drivers/soc/amlogic/meson-clk-measure.c            |  4 +-
 drivers/tee/optee/call.c                           |  6 ++-
 drivers/tee/optee/optee_msg.h                      |  6 ++-
 include/linux/platform_data/ti-sysc.h              |  1 +
 31 files changed, 160 insertions(+), 126 deletions(-)


--===============7269829735877575059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7269829735877575059==--
