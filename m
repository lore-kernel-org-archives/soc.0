Return-Path: <SRS0=5nc+=FU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AABDC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Dec 2020 23:29:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E37235FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Dec 2020 23:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E37235FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Efw3VJySbcz2sb5LSuHZPWrciTpieSvCcoAVZOXUyhY=; b=MeLJDzQMrOL6z0wpXT7vGIhN8
	m9cGuh456nBGglgipog1UEj68vLcFuqCWpJkKBCTj6/Fo7kT+D6onCtsd6l0lWjNhz7xb/pHg3uWj
	LVKHRYNxBKTWN+SQYPUcVyk6fwiQV3lBY/AsAKNcoYYdq5rc45Uedv8wwbsKc9V58im3d0o4UnyG/
	fUopcMttFkEzytdSOYJQpIHJQnqF6qmW7iaqPDkVROfe8EmyQDAYqPFskDbyxiNLCE5wqGX16DlR2
	ahY+6lS2FlebkVzApAOtYm6qWy9JrNizjnkjcE4hKEz6h2dJ1yhdeHfZzEwqZUw5qoi3+64JZEV1R
	4ZSW8NuOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpgCn-00067p-Gn; Wed, 16 Dec 2020 23:27:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpgCj-00066z-19
 for linux-arm-kernel@lists.infradead.org; Wed, 16 Dec 2020 23:27:35 +0000
X-Gm-Message-State: AOAM5329ABSCZ1yvFBIfIZPOeq6onLfHGjbKdQZim1P3OgoRuX0H29+b
 jdWKrvzHwx2pZ56iqiAJj2nPQ98EEvAOvBFb6D8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608161252;
 bh=PcHuNFdI1/IkwSbUwV0Y+iqix2Tz37+10a8tkwryDHo=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=LJN5cj3PaRFKrzu75uB51BvtMPMqgoXcUwunhfSktZkqg7pLm11kSska06jWFoVAc
 NMO4NH5ZYSgdvBDT4oKRV7Jj2jy+a8traEiRJHd91arTg82ukAtKCiazkTBRtj4Flt
 jhulVn15zD/4F5yo0hoZRBpYueJNDI7U0cy/7BrNUPHDHvmaWYz0HCFQBPvt7gVJ0N
 dFOTXEOClV0kIDCRg5NzEaacWQJxerPFLYqEICnrSFmRbbRpnAiLXdxBT7Jo7ewUIn
 Wc2LkPPpFFcR50yHnGUKd3pPiVJMSbIVRNmlOOm8CTQVdYFnt2Ujfuz2F+gHvBmrre
 Dy6OCIZGvEjUQ==
X-Google-Smtp-Source: ABdhPJzegXx7TEfL9G2HldQ2PLBapjmtK/l90DdnG7xvhqM9eJ0LEyDqtx71JGSnwFdaO8gZnz2ISS5hUIDwx2k0k3A=
X-Received: by 2002:a4a:9c01:: with SMTP id y1mr21349304ooj.15.1608161251437; 
 Wed, 16 Dec 2020 15:27:31 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
In-Reply-To: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 17 Dec 2020 00:27:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1MeLg_awR9BkRB77XhEEFQU0JKrmESbEsST6E5ZW_Ctg@mail.gmail.com>
Message-ID: <CAK8P3a1MeLg_awR9BkRB77XhEEFQU0JKrmESbEsST6E5ZW_Ctg@mail.gmail.com>
Subject: [GIT PULL 4/5] ARM: SoC drivers for 5.11
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_182733_362353_53E09378 
X-CRM114-Status: GOOD (  16.22  )
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
Message-ID: <20201216232715.Swgoa_6aZ2cuv8o7Ot8PjuQH7Q7XhN-qkh3o_T2YPI4@z>

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-drivers-5.11

for you to fetch changes up to 1dcdee6ee8f8fdfef5932699129d442d2f1a064d:

  soc: mediatek: mmsys: Specify HAS_IOMEM dependency for MTK_MMSYS
(2020-12-10 15:33:56 +0100)

----------------------------------------------------------------
ARM: SoC drivers for v5.11

There are a couple of subsystems maintained by other people that
merge their drivers through the SoC tree, those changes include:

 - The SCMI firmware framework gains support for sensor notifications
   and for controlling voltage domains.

 - A large update for the Tegra memory controller driver, integrating
   it better with the interconnect framework

 - The memory controller subsystem gains support for Mediatek MT8192

 - The reset controller framework gains support for sharing pulsed
   resets

For Soc specific drivers in drivers/soc, the main changes are

 - The Allwinner/sunxi MBUS gets a rework for the way it handles
   dma_map_ops and offsets between physical and dma address spaces.

 - An errata fix plus some cleanups for Freescale Layerscape SoCs

 - A cleanup for renesas drivers regarding MMIO accesses.

 - New SoC specific drivers for Mediatek MT8192 and MT8183 power domains

 - New SoC specific drivers for Aspeed AST2600 LPC bus control
   and SoC identification.

 - Core Power Domain support for Qualcomm MSM8916, MSM8939, SDM660
   and SDX55.

 - A rework of the TI AM33xx 'genpd' power domain support to use
   information from DT instead of platform data

 - Support for TI AM64x SoCs

 - Allow building some Amlogic drivers as modules instead of built-in

Finally, there are numerous cleanups and smaller bug fixes for
Mediatek, Tegra, Samsung, Qualcomm, TI OMAP, Amlogic, Rockchips,
Renesas, and Xilinx SoCs.

There is a trivial conflict in the cedrus driver, with two branches
adding the same CEDRUS_CAPABILITY_H265_DEC flag, and another trivial
remove/remove conflict in linux/dma-mapping.h.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Alexandre Belloni (2):
      pcmcia: at91_cf: move definitions locally
      pcmcia: at91_cf: remove platform data support

Amjad Ouled-Ameur (1):
      reset: make shared pulsed reset controls re-triggerable

Andrew Jeffery (1):
      soc: aspeed-lpc-ctrl: Fail probe of lpc-ctrl if reserved memory
is not aligned

Andy Shevchenko (1):
      tee: optee: Use UUID API for exporting the UUID

Arnd Bergmann (30):
      Merge tag 'optee-use-uuid-api-for-v5.10' of
git://git.linaro.org:/people/jens.wiklander/linux-tee into arm/drivers
      firmware: tegra: fix strncpy()/strncat() confusion
      Merge tag 'renesas-drivers-for-v5.11-tag1' of
git://git.kernel.org/.../geert/renesas-devel into arm/drivers
      Merge tag 'sunxi-rework-mbus' of
ssh://gitolite.kernel.org/.../mripard/linux into arm/drivers
      Merge tag 'samsung-drivers-5.11' of
git://git.kernel.org/.../krzk/linux into arm/drivers
      Merge tag 'soc-fsl-next-v5.11' of
git://git.kernel.org/.../leo/linux into arm/drivers
      Merge tag 'memory-controller-drv-5.11' of
git://git.kernel.org/.../krzk/linux-mem-ctrl into arm/drivers
      Merge tag 'memory-controller-drv-tegra-5.11-2' of
git://git.kernel.org/.../krzk/linux-mem-ctrl into arm/drivers
      Merge tag 'renesas-drivers-for-v5.11-tag2' of
git://git.kernel.org/.../geert/renesas-devel into arm/drivers
      Merge tag 'tegra-for-5.11-soc' of
git://git.kernel.org/.../tegra/linux into arm/drivers
      Merge tag 'tegra-for-5.11-firmware' of
git://git.kernel.org/.../tegra/linux into arm/drivers
      Backmerge tag 'v5.10-rc2' into arm/drivers
      Merge tag 'scmi-updates-5.11' of
git://git.kernel.org/.../sudeep.holla/linux into arm/drivers
      Merge tag 'at91-drivers-5.11' of
git://git.kernel.org/.../at91/linux into arm/drivers
      Merge tag 'arm-soc/for-5.11/drivers' of
https://github.com/Broadcom/stblinux into arm/drivers
      Merge tag 'v5.10-next-soc' of
git://git.kernel.org/.../matthias.bgg/linux into arm/drivers
      Merge tag 'aspeed-5.11-soc' of
git://git.kernel.org/.../joel/aspeed into arm/drivers
      memory: ti-emif-sram: only build for ARMv7
      clk: samsung: mark PM functions as __maybe_unused
      Merge tag 'qcom-drivers-for-5.11' of
git://git.kernel.org/.../qcom/linux into arm/drivers
      Merge tag 'omap-for-v5.11/genpd-drivers-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/drivers
      Merge tag 'drivers_soc_for_5.11' of
git://git.kernel.org/.../ssantosh/linux-keystone into arm/drivers
      Merge tag 'amlogic-drivers' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/drivers
      Merge tag 'imx-drivers-5.11' of
git://git.kernel.org/.../shawnguo/linux into arm/drivers
      Merge tag 'reset-for-v5.11' of
git://git.pengutronix.de/pza/linux into arm/drivers
      Merge tag 'v5.11-rockchip-drivers-1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/drivers
      Merge tag 'memory-controller-drv-5.11-2' of
git://git.kernel.org/.../krzk/linux-mem-ctrl into arm/drivers
      Merge tag 'memory-controller-drv-tegra-5.11-3' of
git://git.kernel.org/.../krzk/linux-mem-ctrl into arm/drivers
      Merge tag 'zynqmp-soc-for-v5.11-v2' of
https://github.com/Xilinx/linux-xlnx into arm/drivers
      Merge tag 'samsung-drivers-5.11-2' of
git://git.kernel.org/.../krzk/linux into arm/drivers

Biwen Li (1):
      soc: fsl: handle RCPM errata A-008646 on SoC LS1021A

Bjorn Andersson (1):
      Merge tag '20201013212531.428538-1-dianders@chromium.org' into
drivers-for-5.11

Brad Bishop (2):
      dt-bindings: aspeed-lpc: Add AST2600 compatible strings
      soc: aspeed: lpc: Add AST2600 compatible strings

Christoph Hellwig (1):
      dma-mapping: remove the dma_direct_set_offset export

Chun-Kuang Hu (1):
      soc / drm: mediatek: cmdq: Remove timeout handler in helper function

Cristian Marussi (10):
      firmware: arm_scmi: Rework scmi_sensors_protocol_init
      firmware: arm_scmi: Add SCMI v3.0 sensors descriptors extensions
      dt-bindings: arm: Add support for SCMI Regulators
      firmware: arm_scmi: Add voltage domain management protocol support
      firmware: arm_scmi: Add support to enumerated SCMI voltage domain device
      hwmon: (scmi) Update hwmon internal scale data type
      firmware: arm_scmi: Add SCMI v3.0 sensors timestamped reads
      firmware: arm_scmi: Add SCMI v3.0 sensor configuration support
      firmware: arm_scmi: Add SCMI v3.0 sensor notifications
      firmware: arm_scmi: Remove residual _le structs naming

Crystal Guo (1):
      reset-controller: ti: force the write operation when assert or deassert

Dan Carpenter (3):
      soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
      memory: jz4780_nemc: Fix an error pointer vs NULL check in probe()
      soc: aspeed: Fix a reference leak in aspeed_socinfo_init()

Daniel Baluta (3):
      firmware: imx: Introduce imx_dsp_setup_channels
      firmware: imx: Save channel name for further use
      firmware: imx-dsp: Export functions to request/free channels

Dinh Nguyen (1):
      reset: socfpga: add error handling and release mem-region

Dmitry Osipenko (35):
      dt-bindings: memory: tegra20: emc: Correct registers range in example
      clk: tegra: Export Tegra20 EMC kernel symbols
      soc/tegra: fuse: Export tegra_read_ram_code()
      soc/tegra: fuse: Add stub for tegra_sku_info
      dt-bindings: memory: tegra20: emc: Document nvidia,
memory-controller property
      dt-bindings: memory: tegra20: mc: Document new interconnect property
      dt-bindings: memory: tegra20: emc: Document new interconnect property
      dt-bindings: memory: tegra20: emc: Document OPP table and
voltage regulator
      dt-bindings: memory: tegra30: mc: Document new interconnect property
      dt-bindings: memory: tegra30: emc: Document new interconnect property
      dt-bindings: memory: tegra30: emc: Document OPP table and
voltage regulator
      dt-bindings: memory: tegra124: mc: Document new interconnect property
      dt-bindings: memory: tegra124: emc: Document new interconnect property
      dt-bindings: memory: tegra124: emc: Document OPP table and
voltage regulator
      dt-bindings: tegra30-actmon: Document OPP and interconnect properties
      dt-bindings: host1x: Document new interconnect properties
      memory: tegra: Add and use devm_tegra_memory_controller_get()
      memory: tegra: Use devm_platform_ioremap_resource()
      memory: tegra: Remove superfluous error messages around platform_get_irq()
      memory: tegra: Add missing latency allowness entry for Page Table Cache
      memory: tegra-mc: Add interconnect framework
      memory: tegra20-emc: Make driver modular
      memory: tegra20-emc: Continue probing if timings are missing in
device-tree
      memory: tegra20: Support interconnect framework
      memory: tegra: Correct stub of devm_tegra_memory_controller_get()
      memory: tegra20-emc: Use dev_pm_opp_set_clkname()
      memory: tegra20-emc: Factor out clk initialization
      memory: tegra20-emc: Remove IRQ number from error message
      memory: tegra20-emc: Add devfreq support
      memory: tegra30: Add FIFO sizes to memory clients
      memory: tegra30-emc: Make driver modular
      memory: tegra30-emc: Continue probing if timings are missing in
device-tree
      dt-bindings: memory: tegra20-emc: Document opp-supported-hw property
      memory: tegra20: Support hardware versioning and clean up OPP
table initialization
      memory: tegra30: Support interconnect framework

Douglas Anderson (3):
      soc: qcom: geni: More properly switch to DMA mode
      Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
      soc: qcom: geni: Optimize/comment select fifo/dma mode

Enric Balletbo i Serra (6):
      mfd: syscon: Add syscon_regmap_lookup_by_phandle_optional() function.
      dt-bindings: power: Add bindings for the Mediatek SCPSYS power
domains controller
      dt-bindings: power: Add MT8183 power domains
      soc: mediatek: Add MediaTek SCPSYS power domains
      soc: mediatek: mmsys: Use devm_platform_ioremap_resource()
      soc: mediatek: mmsys: Specify HAS_IOMEM dependency for MTK_MMSYS

Evan Green (1):
      soc: qcom: smp2p: Safely acquire spinlock without IRQs

Geert Uytterhoeven (1):
      soc: renesas: rmobile-sysc: Stop using __raw_*() I/O accessors

Grzegorz Jaszczyk (1):
      soc: ti: pruss: Remove wrong check against *get_match_data return value

Isaac J. Manjarres (1):
      soc: qcom: llcc: Support chipsets that can write to llcc

Joel Stanley (8):
      soc: aspeed: Improve kconfig
      dt-bindings: aspeed: Add silicon id node to SCU
      soc: aspeed: Add soc info driver
      ARM: dts: aspeed: Add silicon id node
      soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
      soc: aspeed-lpc-ctrl: Fix whitespace
      soc: aspeed-lpc-ctrl: Fix driver name
      soc: aspeed: Enable drivers with ARCH_ASPEED

John Stultz (1):
      soc: qcom: rpmh: Allow RPMH driver to be loaded as a module

Jun Nie (2):
      dt-bindings: power: rpmpd: Add MSM8939 RPM power domains
      soc: qcom: rpmpd: Add MSM8939 power-domains

Kai Stuhlemmer (1):
      ARM: at91: sam9x60 SiP types added to soc description

Kevin Hilman (3):
      soc: amlogic: socinfo: build for specific arch
      soc: meson: enable building drivers as modules
      firmware: meson-sm: enable build as module

Konrad Dybcio (2):
      dt-bindings: power: rpmpd: Add SDM660 power-domains bindings
      soc: qcom: rpmpd: Add SDM660 power-domains

Krzysztof Kozlowski (10):
      MAINTAINERS: add dt binding headers to memory controller drivers entry
      soc: samsung: exynos-pmu: instantiate clkout driver as MFD
      clk: samsung: exynos-clkout: convert to module driver
      Documentation: Update paths of Samsung S3C machine files
      serial: s3c: Update path of Samsung S3C machine file
      clk: samsung: allow building the clkout driver as module
      memory: pl353-smc: fix compile test on !ARM_AMBA
      Merge tag 'tegra-soc-clk-drivers-5.11' into for-v5.11/tegra-mc
      soc: samsung: exynos-chipid: order list of SoCs by name
      soc: samsung: exynos-chipid: initialize later - with arch_initcall

Lad Prabhakar (4):
      memory: renesas-rpc-if: Return correct value to the caller of
rpcif_manual_xfer()
      memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in
rpcif_{enable,disable}_rpm
      memory: renesas-rpc-if: Fix a node reference leak in rpcif_probe()
      memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static inline

Lee Jones (25):
      soc: samsung: s3c-pm-check: Fix incorrectly named variable 'val'
      soc: bcm: brcmstb: pm: pm-arm: Provide prototype for
brcmstb_pm_s3_finish()
      soc: tegra: fuse: speedo-tegra124: Remove some set but unused variables
      soc: tegra: fuse: speedo-tegra210: Remove a group of set but
unused variables
      soc: qcom: qcom_aoss: Remove set but unused variable 'tlen'
      soc: qcom: qcom_aoss: Add missing description for 'cooling_devs'
      soc: qcom: qcom-geni-se: Fix misnamed function parameter 'rx_rfr'
      soc: qcom: smem: Fix formatting and missing documentation issues
      soc: qcom: smsm: Fix some kernel-doc formatting and naming problems
      soc: qcom: wcnss_ctrl: Demote non-conformant struct header and
fix function headers
      soc: qcom: smp2p: Remove unused struct attribute provide another
      soc: qcom: llcc-qcom: Fix expected kernel-doc formatting
      soc: qcom: rpmhpd: Provide some missing struct member descriptions
      soc: qcom: kryo-l2-accessors: Fix misnaming of 'val'
      soc: qcom: rpmh: Fix possible doc-rot in rpmh_write()'s header
      soc: rockchip: io-domain: Remove incorrect and incomplete comment header
      soc: ti: knav_qmss_queue: Remove set but unchecked variable 'ret'
      soc: ti: knav_qmss_queue: Fix a whole host of function
documentation issues
      soc: ti: knav_dma: Fix a kernel function doc formatting issue
      soc: ti: pm33xx: Remove set but unused variable 'ret'
      soc: ti: wkup_m3_ipc: Document 'm3_ipc' parameter throughout
      soc: ti: k3-ringacc: Provide documentation for 'k3_ring's 'state'
      soc: fsl: dpio: qbman-portal: Fix a bunch of kernel-doc misdemeanours
      soc: fsl: qe: qe_common: Fix misnamed function attribute 'addr'
      soc: fsl: qbman: qman: Remove unused variable 'dequeue_wq'

Lina Iyer (2):
      soc: qcom: cmd-db: allow loading as a module
      soc: qcom: Kconfig: make RPMH match Command DB setting

Liu Ying (3):
      firmware: imx: scu-pd: Add video0/1 power domains support for
i.MX8qxp DC0 subsystem
      firmware: imx: scu-pd: Add main power domain support for
i.MX8qxp LVDS1 subsystem
      firmware: imx: scu-pd: Add some power domains support for
i.MX8qxp MIPI1 subsystem

Marek Szyprowski (1):
      cpuidle: big.LITTLE: enable driver only on Peach-Pit/Pi Chromebooks

Matthias Brugger (10):
      MAINTAINERS: change mediatek wiki page
      Merge tag 'ib-mfd-mediatek-v5.11' into HEAD
      Merge tag 'v5.10-next-pm-domains-stable' into HEAD
      soc: mediatek: pm-domains: Add bus protection protocol
      soc: mediatek: pm_domains: Make bus protection generic
      soc: mediatek: pm-domains: Add SMI block as bus protection block
      soc: mediatek: pm-domains: Add extra sram control
      soc: mediatek: pm-domains: Add subsystem clocks
      soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
      soc: mediatek: pm-domains: Add support for mt8183

Maulik Shah (2):
      Revert "drivers: qcom: rpmh-rsc: Use rcuidle tracepoints for rpmh"
      soc: qcom: rpmh: Use __fill_rpmh_msg API during rpmh_write()

Maxime Ripard (8):
      drm/sun4i: backend: Fix probe failure with multiple backends
      soc: sunxi: Deal with the MBUS DMA offsets in a central place
      drm/sun4i: backend: Remove the MBUS quirks
      media: sun4i: Remove the MBUS quirks
      media: sun6i: Remove the MBUS quirks
      media: cedrus: Remove the MBUS quirks
      media: sun8i-di: Remove the call to of_dma_configure
      soc: sunxi: Fix compilation of sunxi_mbus

Michael Tretter (4):
      soc: xilinx: vcu: drop useless success message
      dt-bindings: soc: xlnx: extract xlnx, vcu-settings to separate binding
      soc: xilinx: vcu: use vcu-settings syscon registers
      soc: xilinx: vcu: add missing register NUM_CORE

Michal Simek (4):
      firmware: xilinx: Fix kernel-doc warnings
      firmware: xilinx: Remove additional newline
      firmware: xilinx: Add a blank line after function declaration
      firmware: xilinx: Properly align function parameter

Mirela Rabulea (1):
      firmware: imx: scu-pd: Add power domains for imx-jpeg

Nathan Chancellor (1):
      memory: tegra30-emc: Remove unnecessary of_node_put in tegra_emc_probe

Neal Liu (2):
      dt-bindings: devapc: add bindings for mtk-devapc
      soc: mediatek: add mt6779 devapc driver

Neil Armstrong (1):
      reset: meson: make it possible to build as a module

Nicolas Boichat (1):
      soc: mediatek: Check if power domains can be powered on at boot time

Nicolin Chen (6):
      memory: tegra: Correct la.reg address of seswr
      memory: tegra: Correct tegra210_mc_clients def values
      memory: tegra: Sort tegra210_swgroups by reg address
      dt-bindings: memory: tegra: Add missing swgroups
      soc/tegra: fuse: Fix index bug in get_process_id
      memory: tegra: Complete tegra210_swgroups

Nishanth Menon (1):
      soc: ti: Kconfig: Drop ARM64 SoC specific configs

Peng Fan (1):
      firmware: imx: add dummy functions

Peter Ujfalusi (11):
      firmware: ti_sci: rm: Add support for tx_tdtype parameter for tx channel
      firmware: ti_sci: Use struct ti_sci_resource_desc in get_range ops
      firmware: ti_sci: rm: Add support for second resource range
      soc: ti: ti_sci_inta_msi: Add support for second range in resource ranges
      firmware: ti_sci: rm: Add support for extended_ch_type for tx channel
      firmware: ti_sci: rm: Remove ring_get_config support
      firmware: ti_sci: rm: Add new ops for ring configuration
      soc: ti: k3-ringacc: Use the ti_sci set_cfg callback for ring
configuration
      firmware: ti_sci: rm: Remove unused config() from ti_sci_rm_ringacc_ops
      soc: ti: k3-ringacc: Use correct device for allocation in RING mode
      soc: ti: k3-socinfo: Add entry for AM64X SoC family

Qinglang Miao (1):
      firmware: arm_scmi: Fix missing destroy_workqueue()

Rikard Falkeborn (2):
      soc: qcom: pdr: Constify static qmi structs
      samples: qmi: Constify static qmi ops

Roja Rani Yarubandi (1):
      soc: qcom: geni: Remove "iova" check

Sai Prakash Ranjan (1):
      soc: qcom: llcc: Move llcc configuration to its own function

Souradeep Chowdhury (2):
      dt-bindings: msm: Add LLCC for SM8150
      soc: qcom: llcc: Add configuration data for SM8150

Stephan Gerhold (3):
      soc: qcom: rpmpd: Rename MAX_8996_RPMPD_STATE to MAX_CORNER_RPMPD_STATE
      dt-bindings: power: rpmpd: Add MSM8916 RPM power domains
      soc: qcom: rpmpd: Add MSM8916 power domains

Sudeep Holla (2):
      firmware: arm_scmi: Add full list of sensor type enumeration
      Merge tag 'scmi-voltage-5.11' of
git://git.kernel.org/.../sudeep.holla/linux into for-next/scmi

Tero Kristo (1):
      soc: ti: omap-prm: am3: add genpd support for remaining PRM instances

Tom Rix (3):
      soc: samsung: exynos5422-asv: remove unneeded semicolon
      soc: aspeed: remove unneeded semicolon
      soc: qcom: initialize local variable

Tony Lindgren (15):
      ARM: OMAP2+: Fix location for select PM_GENERIC_DOMAINS
      ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF
      bus: ti-sysc: Fix reset status check for modules with quirks
      bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw
      soc: ti: omap-prm: Do not check rstst bit on deassert if already
deasserted
      bus: ti-sysc: Assert reset only after disabling clocks
      ARM: OMAP2+: Check for inited flag
      ARM: OMAP2+: Probe PRCM first to probe l4_wkup with simple-pm-bus
      bus: ti-sysc: Support modules without control registers
      bus: ti-sysc: Implement GPMC debug quirk to drop platform data
      clk: ti: am33xx: Keep am3 l3 main clock always on for genpd
      soc: ti: omap-prm: Add pm_clk for genpd
      soc: ti: pm33xx: Enable basic PM runtime support for genpd
      remoteproc/wkup_m3: Use reset control driver if available
      soc: ti: omap-prm: Do not check rstst bit on deassert if already
deasserted

Vinod Koul (2):
      dt-bindings: power: Add rpm power domain bindings for sdx55
      soc: qcom: rpmhpd: Add SDX55 power domains

Viresh Kumar (1):
      qcom-geni-se: remove has_opp_table

Vladimir Lypak (1):
      soc: qcom: socinfo: add soc ids for msm8953 variants

Weiyi Lu (3):
      dt-bindings: power: Add MT8192 power domains
      soc: mediatek: pm-domains: Add default power off flag
      soc: mediatek: pm-domains: Add support for mt8192

Wendy Liang (1):
      firmware: xlnx-zynqmp: fix compilation warning

Yejune Deng (1):
      soc: amlogic: replace devm_reset_control_array_get()

Yong Wu (3):
      dt-bindings: memory: mediatek: Convert SMI to DT schema
      dt-bindings: memory: mediatek: Add mt8192 support
      memory: mtk-smi: Add mt8192 support

Yongqiang Niu (1):
      soc / drm: mediatek: Move DDP component defines into mtk-mmsys.h

Yu Kuai (1):
      soc: amlogic: canvas: add missing put_device() call in meson_canvas_get()

Zhang Changzhong (2):
      soc: rockchip: io-domain: Fix error return code in
rockchip_iodomain_probe()
      memory: jz4780_nemc: Fix potential NULL dereference in jz4780_nemc_probe()

Zhang Qilong (2):
      soc: ti: knav_qmss: fix reference leak in knav_queue_probe
      soc: ti: Fix reference imbalance in knav_dma_probe

Zhihao Cheng (1):
      drivers: soc: ti: knav_qmss_queue: Fix error return code in
knav_queue_probe

 Documentation/admin-guide/kernel-parameters.txt    |   2 +-
 Documentation/arm/samsung-s3c24xx/gpio.rst         |   4 +-
 Documentation/arm/samsung-s3c24xx/overview.rst     |  22 +-
 Documentation/arm/samsung-s3c24xx/usb-host.rst     |   6 +-
 Documentation/arm/samsung/gpio.rst                 |   3 +-
 Documentation/devicetree/bindings/arm/arm,scmi.txt |  43 ++
 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   1 +
 .../bindings/arm/tegra/nvidia,tegra30-actmon.txt   |  25 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |  68 ++
 .../memory-controllers/mediatek,smi-common.txt     |  50 --
 .../memory-controllers/mediatek,smi-common.yaml    | 142 ++++
 .../memory-controllers/mediatek,smi-larb.txt       |  50 --
 .../memory-controllers/mediatek,smi-larb.yaml      | 132 ++++
 .../memory-controllers/nvidia,tegra124-emc.yaml    |  19 +
 .../memory-controllers/nvidia,tegra124-mc.yaml     |   5 +
 .../memory-controllers/nvidia,tegra20-emc.txt      |  28 +-
 .../memory-controllers/nvidia,tegra20-mc.txt       |   3 +
 .../memory-controllers/nvidia,tegra30-emc.yaml     |  18 +
 .../memory-controllers/nvidia,tegra30-mc.yaml      |   5 +
 .../devicetree/bindings/mfd/aspeed-lpc.txt         |   8 +-
 .../devicetree/bindings/mfd/aspeed-scu.txt         |  26 +
 .../bindings/power/mediatek,power-controller.yaml  | 293 +++++++++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   4 +
 .../devicetree/bindings/soc/mediatek/devapc.yaml   |  58 ++
 .../bindings/soc/xilinx/xlnx,vcu-settings.yaml     |  34 +
 .../devicetree/bindings/soc/xilinx/xlnx,vcu.txt    |   9 +-
 .../device_drivers/ethernet/davicom/dm9000.rst     |   2 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   5 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   5 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   5 +
 arch/arm/mach-keystone/keystone.c                  |   2 +-
 arch/arm/mach-omap1/usb.c                          |   2 +-
 arch/arm/mach-omap2/Kconfig                        |   3 +-
 arch/arm/mach-omap2/omap_hwmod.c                   |   6 +
 arch/arm/mach-omap2/pdata-quirks.c                 |  11 +
 arch/sh/drivers/pci/pcie-sh7786.c                  |   2 +-
 arch/x86/pci/sta2x11-fixup.c                       |   3 +-
 drivers/bus/ti-sysc.c                              |  68 +-
 drivers/clk/samsung/Kconfig                        |  10 +
 drivers/clk/samsung/Makefile                       |   2 +-
 drivers/clk/samsung/clk-exynos-clkout.c            | 199 ++++--
 drivers/clk/tegra/clk-tegra20-emc.c                |   3 +
 drivers/clk/ti/clk-33xx.c                          |   2 +
 drivers/cpuidle/cpuidle-big_little.c               |   3 +-
 drivers/firmware/arm_scmi/Makefile                 |   2 +-
 drivers/firmware/arm_scmi/common.h                 |   1 +
 drivers/firmware/arm_scmi/driver.c                 |   3 +
 drivers/firmware/arm_scmi/notify.c                 |  10 +-
 drivers/firmware/arm_scmi/sensors.c                | 720 +++++++++++++++++++--
 drivers/firmware/arm_scmi/voltage.c                | 380 +++++++++++
 drivers/firmware/imx/imx-dsp.c                     |  72 ++-
 drivers/firmware/imx/scu-pd.c                      |  12 +
 drivers/firmware/meson/Kconfig                     |   5 +-
 drivers/firmware/meson/meson_sm.c                  |   1 +
 drivers/firmware/tegra/bpmp-debugfs.c              |   6 +-
 drivers/firmware/ti_sci.c                          | 213 ++----
 drivers/firmware/ti_sci.h                          |  72 +--
 drivers/firmware/xilinx/zynqmp.c                   |  46 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  34 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |  13 -
 drivers/hwmon/scmi-hwmon.c                         |   2 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   6 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |  27 -
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |  17 -
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |   4 -
 drivers/memory/Kconfig                             |   6 +-
 drivers/memory/jz4780-nemc.c                       |   6 +-
 drivers/memory/mtk-smi.c                           |  19 +
 drivers/memory/renesas-rpc-if.c                    |  18 +-
 drivers/memory/tegra/Kconfig                       |  10 +-
 drivers/memory/tegra/mc.c                          | 155 ++++-
 drivers/memory/tegra/mc.h                          |  22 +
 drivers/memory/tegra/tegra114.c                    |   6 +
 drivers/memory/tegra/tegra124-emc.c                |  22 +-
 drivers/memory/tegra/tegra124.c                    |   6 +
 drivers/memory/tegra/tegra20-emc.c                 | 520 +++++++++++++--
 drivers/memory/tegra/tegra20.c                     |  77 +++
 drivers/memory/tegra/tegra210-emc-core.c           |  39 +-
 drivers/memory/tegra/tegra210.c                    |  60 +-
 drivers/memory/tegra/tegra30-emc.c                 | 411 ++++++++++--
 drivers/memory/tegra/tegra30.c                     | 245 ++++++-
 drivers/mfd/syscon.c                               |  18 +
 drivers/pcmcia/Kconfig                             |   1 +
 drivers/pcmcia/at91_cf.c                           |  50 +-
 drivers/remoteproc/wkup_m3_rproc.c                 |  41 +-
 drivers/reset/Kconfig                              |   3 +-
 drivers/reset/core.c                               |  73 +++
 drivers/reset/reset-meson.c                        |   8 +-
 drivers/reset/reset-socfpga.c                      |  11 +-
 drivers/reset/reset-ti-syscon.c                    |   4 +-
 drivers/soc/Makefile                               |   2 +-
 drivers/soc/amlogic/Kconfig                        |  12 +-
 drivers/soc/amlogic/meson-canvas.c                 |   4 +-
 drivers/soc/amlogic/meson-clk-measure.c            |   5 +-
 drivers/soc/amlogic/meson-ee-pwrc.c                |   8 +-
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c            |   7 +-
 drivers/soc/amlogic/meson-secure-pwrc.c            |   5 +-
 drivers/soc/aspeed/Kconfig                         |  47 +-
 drivers/soc/aspeed/Makefile                        |   1 +
 drivers/soc/aspeed/aspeed-lpc-ctrl.c               |  37 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c              |   2 +
 drivers/soc/aspeed/aspeed-socinfo.c                | 135 ++++
 drivers/soc/atmel/soc.c                            |   6 +
 drivers/soc/atmel/soc.h                            |   3 +
 drivers/soc/bcm/brcmstb/pm/pm-arm.c                |   2 +
 drivers/soc/fsl/dpio/qbman-portal.c                |  18 +-
 drivers/soc/fsl/qbman/qman.c                       |   8 +-
 drivers/soc/fsl/qe/qe_common.c                     |   2 +-
 drivers/soc/fsl/rcpm.c                             |  35 +-
 drivers/soc/mediatek/Kconfig                       |  22 +
 drivers/soc/mediatek/Makefile                      |   2 +
 drivers/soc/mediatek/mt8173-pm-domains.h           |  94 +++
 drivers/soc/mediatek/mt8183-pm-domains.h           | 221 +++++++
 drivers/soc/mediatek/mt8192-pm-domains.h           | 292 +++++++++
 drivers/soc/mediatek/mtk-cmdq-helper.c             |  41 +-
 drivers/soc/mediatek/mtk-devapc.c                  | 308 +++++++++
 drivers/soc/mediatek/mtk-infracfg.c                |   5 -
 drivers/soc/mediatek/mtk-mmsys.c                   |  11 +-
 drivers/soc/mediatek/mtk-pm-domains.c              | 614 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.h              | 102 +++
 drivers/soc/mediatek/mtk-scpsys.c                  |   5 +-
 drivers/soc/qcom/Kconfig                           |   5 +-
 drivers/soc/qcom/cmd-db.c                          |   8 +-
 drivers/soc/qcom/kryo-l2-accessors.c               |   2 +-
 drivers/soc/qcom/llcc-qcom.c                       | 147 +++--
 drivers/soc/qcom/pdr_interface.c                   |   8 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  64 +-
 drivers/soc/qcom/qcom_aoss.c                       |   4 +-
 drivers/soc/qcom/rpmh-rsc.c                        |   7 +-
 drivers/soc/qcom/rpmh.c                            |  14 +-
 drivers/soc/qcom/rpmhpd.c                          |  16 +
 drivers/soc/qcom/rpmpd.c                           |  85 ++-
 drivers/soc/qcom/smem.c                            |   3 +-
 drivers/soc/qcom/smp2p.c                           |   6 +-
 drivers/soc/qcom/smsm.c                            |   4 +-
 drivers/soc/qcom/socinfo.c                         |   6 +
 drivers/soc/qcom/wcnss_ctrl.c                      |   8 +-
 drivers/soc/renesas/rmobile-sysc.c                 |  17 +-
 drivers/soc/rockchip/io-domain.c                   |   4 +-
 drivers/soc/samsung/exynos-chipid.c                |  11 +-
 drivers/soc/samsung/exynos-pmu.c                   |  11 +
 drivers/soc/samsung/exynos5422-asv.c               |   2 +-
 drivers/soc/samsung/s3c-pm-check.c                 |   2 +-
 drivers/soc/sunxi/Kconfig                          |   8 +
 drivers/soc/sunxi/Makefile                         |   1 +
 drivers/soc/sunxi/sunxi_mbus.c                     | 132 ++++
 drivers/soc/tegra/fuse/speedo-tegra124.c           |  21 +-
 drivers/soc/tegra/fuse/speedo-tegra210.c           |   8 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |   2 +
 drivers/soc/ti/Kconfig                             |  18 -
 drivers/soc/ti/k3-ringacc.c                        |  98 ++-
 drivers/soc/ti/k3-socinfo.c                        |   1 +
 drivers/soc/ti/knav_dma.c                          |  15 +-
 drivers/soc/ti/knav_qmss_queue.c                   |  66 +-
 drivers/soc/ti/omap_prm.c                          |  84 ++-
 drivers/soc/ti/pm33xx.c                            |  21 +-
 drivers/soc/ti/pruss.c                             |   6 -
 drivers/soc/ti/ti_sci_inta_msi.c                   |  12 +
 drivers/soc/ti/wkup_m3_ipc.c                       |   8 +-
 drivers/soc/xilinx/Kconfig                         |   1 +
 drivers/soc/xilinx/xlnx_vcu.c                      |  96 ++-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   1 -
 drivers/staging/media/sunxi/cedrus/cedrus.h        |   3 -
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |  18 -
 drivers/tee/optee/device.c                         |   2 +-
 include/dt-bindings/memory/tegra210-mc.h           |  10 +
 include/dt-bindings/power/mt8183-power.h           |  26 +
 include/dt-bindings/power/mt8192-power.h           |  32 +
 include/dt-bindings/power/qcom-rpmpd.h             |  34 +
 include/linux/dma-map-ops.h                        |   3 +
 include/linux/dma-mapping.h                        |   7 -
 include/linux/firmware/imx/dsp.h                   |  10 +
 include/linux/firmware/imx/ipc.h                   |  13 +
 include/linux/firmware/imx/sci.h                   |  27 +
 include/linux/firmware/imx/svc/misc.h              |  19 +
 include/linux/firmware/xlnx-zynqmp.h               |  45 +-
 include/linux/mfd/syscon.h                         |  11 +
 include/linux/mfd/syscon/xlnx-vcu.h                |  39 ++
 include/linux/platform_data/atmel.h                |  12 -
 include/linux/platform_data/ti-sysc.h              |   2 +
 include/linux/qcom-geni-se.h                       |   2 -
 include/linux/reset.h                              |   1 +
 include/linux/scmi_protocol.h                      | 352 +++++++++-
 include/linux/serial_s3c.h                         |   2 +-
 include/linux/soc/mediatek/infracfg.h              | 107 +++
 include/linux/soc/mediatek/mtk-cmdq.h              |  10 +-
 include/linux/soc/mediatek/mtk-mmsys.h             |  33 +
 include/linux/soc/qcom/llcc-qcom.h                 |   6 +
 include/linux/soc/ti/k3-ringacc.h                  |   5 +
 include/linux/soc/ti/ti_sci_protocol.h             |  85 ++-
 include/memory/renesas-rpc-if.h                    |  13 +-
 include/soc/tegra/fuse.h                           |   4 +
 include/soc/tegra/mc.h                             |  27 +
 kernel/dma/direct.c                                |   1 -
 samples/qmi/qmi_sample_client.c                    |   4 +-
 197 files changed, 7557 insertions(+), 1371 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
 delete mode 100644
Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 create mode 100644
Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 create mode 100644
Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
 create mode 100644 drivers/firmware/arm_scmi/voltage.c
 create mode 100644 drivers/soc/aspeed/aspeed-socinfo.c
 create mode 100644 drivers/soc/mediatek/mt8173-pm-domains.h
 create mode 100644 drivers/soc/mediatek/mt8183-pm-domains.h
 create mode 100644 drivers/soc/mediatek/mt8192-pm-domains.h
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c
 create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
 create mode 100644 drivers/soc/mediatek/mtk-pm-domains.h
 create mode 100644 drivers/soc/sunxi/sunxi_mbus.c
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 create mode 100644 include/dt-bindings/power/mt8192-power.h
 create mode 100644 include/linux/mfd/syscon/xlnx-vcu.h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
