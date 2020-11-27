Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B34C3E8C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 20:53:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6016522240
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 20:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0vNgT02V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvePCIL6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6016522240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9cL0qYKYrznSq+i5uw0RJYTXBUU0/r5AOzPKGqBrEU8=; b=0vNgT02VAFFrl5sOmeTOAb5TB5
	EBhz04gZiGY7wuT1dFaUL9YVaapazf+pdoNleFLVv+51aJ8v5JHGGyrqYalUauPr1OK85lmIfEBDY
	cZUIdxVJShZt0ie/jt78m1k5ZndqMPJFbiAtmqyLVJwunPdpOAweCu+LV8Ewigtd0QQAD9gPEVG94
	MBWBXfB2ki4WJu/LM7Ns/8OVYyJOeZ02pSC737UIPurwP2AgH5LHcFIqM5D/1wwQ+2tCqkHWUvxSX
	CUXIS945h1rHor2zCdHgEDm6N8c/zq7pzQLIxFmBS4qCJNMVtv5VAszt0+dOrTxYRFwAJWuGAboiH
	fQvl5s2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kikiE-0002Od-1b; Fri, 27 Nov 2020 20:51:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kikiB-0002O9-8t
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 20:51:24 +0000
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5C512222C
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606510282;
 bh=IudMTC6pevjbtS7WalNa3tMSu6Sls01r53cy554mLdw=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=IvePCIL60EDwzSEctlejehkmZlQSzzA4rWhOqZQ2f9MjdWBI8big7eNWHyAFP2BZb
 hR/IHNXzavaFPqKLw4SuKEi+5k4llpo7yNO3uZ5jjwaYlAA87IhIb1dURfz6pmyYyb
 xGokxskFIaAI4ueGhCWy4INmGfULjijP2h0mO6Bg=
Received: by mail-oi1-f178.google.com with SMTP id k26so7181297oiw.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 12:51:21 -0800 (PST)
X-Gm-Message-State: AOAM530hN6Tdc98PM9KoYC35HhfMsEl82j6AyyrNnl0SR19LBKXFc7ge
 56YX5Q0d2zIcartJ/1B6+gXqRtJYaZR0Nkfpq1w=
X-Google-Smtp-Source: ABdhPJzrX0Y/Fi9hr1UJgS9uWuTYttO82P2Fw9GuyJMAYB6P07WvdpxhgC5k2w/fAXUFnQ1rl5O2hwn5TwwILHeja3U=
X-Received: by 2002:aca:3c54:: with SMTP id j81mr6596486oia.11.1606510281094; 
 Fri, 27 Nov 2020 12:51:21 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 27 Nov 2020 21:51:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
Message-ID: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_155123_496424_4C26C552 
X-CRM114-Status: GOOD (  18.10  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127205105.HheDW21ECKXzGKUBA_CyBObSVK_XNEnGqtTj7ubll_k@z>

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-v5.10-3

for you to fetch changes up to ae597565d13febc73b9066c05935c1003a57a03e:

  Merge tag 'optee-valid-memory-type-for-v5.11' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
(2020-11-27 17:45:45 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.10, part 3

Another set of patches for devicetree files and Arm
SoC specific drivers:

 - A fix for OP-TEE shared memory on non-SMP systems

 - multiple code fixes for the OMAP platform, including
   one regression for the CPSW network driver and a few
   runtime warning fixes

 - Some DT patches for the Rockchip RK3399 platform,
   in particular fixing the MMC device ordering that
   recently became nondeterministic with async probe.

 - Multiple DT fixes for the Tegra platform, including
   a regression fix for suspend/resume on TX2

 - A regression fix for a user-triggered fault in the
   NXP dpio driver

 - A regression fix for a bug caused by an earlier bug
   fix in the xilinx firmware driver

 - Two more DTC warning fixes

 - Sylvain Lemieux steps down as maintainer for the
   NXP LPC32xx platform

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Amit Sunil Dhamne (1):
      firmware: xilinx: Use hash-table for api feature check

Arnd Bergmann (6):
      Merge tag 'v5.10-rockchip-dtsfixes1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/fixes
      Merge tag 'zynqmp-soc-fixes-for-v5.10-rc6' of
https://github.com/Xilinx/linux-xlnx into arm/fixes
      Merge tag 'soc-fsl-fix-v5.10' of
git://git.kernel.org/.../leo/linux into arm/fixes
      Merge tag 'tegra-for-5.10-arm64-dt-fixes' of
git://git.kernel.org/.../tegra/linux into arm/fixes
      Merge tag 'omap-for-v5.10/fixes-rc5-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/fixes
      Merge tag 'optee-valid-memory-type-for-v5.11' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes

David Bauer (1):
      arm64: dts: rockchip: fix NanoPi R2S GMAC clock name

Dipen Patel (1):
      arm64: tegra: Wrong AON HSP reg property size

Grygorii Strashko (2):
      ARM: dts: am437x-l4: fix compatible for cpsw switch dt node
      bus: ti-sysc: suppress err msg for timers used as clockevent/source

Hao Si (1):
      soc: fsl: dpio: Get the cpumask through cpumask_of(cpu)

JC Kuo (1):
      arm64: tegra: Fix USB_VBUS_EN0 regulator on Jetson TX1

Jon Hunter (3):
      arm64: tegra: Disable the ACONNECT for Jetson TX2
      arm64: tegra: Correct the UART for Jetson Xavier NX
      arm64: tegra: Fix Tegra234 VDK node names

Maciej Matuszczyk (1):
      arm64: dts: rockchip: Remove system-power-controller from pmic
on Odroid Go Advance

Manish Narani (1):
      firmware: xilinx: Fix SD DLL node reset issue

Marc Kleine-Budde (1):
      ARM: dts: dra76x: m_can: fix order of clocks

Markus Reichl (2):
      arm64: dts: rockchip: Assign a fixed index to mmc devices on
rk3399 boards.
      arm64: dts: rockchip: Reorder LED triggers from mmc devices on
rk3399-roc-pc.

Rui Miguel Silva (1):
      optee: add writeback to valid memory type

Sylvain Lemieux (1):
      MAINTAINERS: Remove myself as LPC32xx maintainers

Tony Lindgren (6):
      ARM: OMAP2+: Fix location for select PM_GENERIC_DOMAINS
      ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF
      bus: ti-sysc: Fix reset status check for modules with quirks
      bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw
      ARM: OMAP2+: Manage MPU state properly for omap_enter_idle_coupled()
      Merge tag 'ti-sysc-fixes' into fixes

Zhen Lei (2):
      arm64: dts: broadcom: clear the warnings caused by empty dma-ranges
      arm64: dts: qcom: clear the warnings caused by empty dma-ranges

 MAINTAINERS                                        |  1 -
 arch/arm/boot/dts/am437x-l4.dtsi                   |  2 +-
 arch/arm/boot/dts/dra76x.dtsi                      |  4 +-
 arch/arm/mach-omap2/Kconfig                        |  3 +-
 arch/arm/mach-omap2/cpuidle44xx.c                  |  8 ++-
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   | 20 +++---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ----
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 20 +++---
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |  6 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              | 72 +++++++++++-----------
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |  1 -
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |  4 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  3 +
 drivers/bus/ti-sysc.c                              | 29 ++++++---
 drivers/firmware/xilinx/zynqmp.c                   | 65 ++++++++++++++-----
 drivers/soc/fsl/dpio/dpio-driver.c                 |  5 +-
 drivers/tee/optee/call.c                           |  3 +-
 include/linux/firmware/xlnx-zynqmp.h               |  4 --
 include/linux/platform_data/ti-sysc.h              |  1 +
 22 files changed, 150 insertions(+), 119 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
