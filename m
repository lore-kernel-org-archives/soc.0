Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607FBC433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45089C34119; Thu, 26 May 2022 14:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B79C34118
	for <soc@kernel.org>; Thu, 26 May 2022 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576571;
	bh=Z2aw75uE16+sfv7zplheKW75QgZ0ww8niY4kwNRgHtk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=axQgMBDIRB9q5NrICHPoapRVV8oO+sx3yjaTguh7MviJZ8gCOzUTsmLrTQbiYoyTp
	 js6Ojqo6anepBok+uI7oXWuetCe8QaLCoMmQdU2AkxEBfXxF2gP0yP92mdkt6nadCh
	 tw9sqgj42PWH0owKwL8WV+OoVfkWaPuwibZ8UDAkwlDLCLdIiwCurNs3CaPvAj+TRQ
	 3L+Mc697jvEe7geRuFRRjzi23ZXfdld0rH/msaOygNn0UjeD0JdNt65D9bW1U5QKPA
	 KfpQplmoUpNWvGixz6/fxlDCGYAR6UxTUUAE/9ZVtE+J540uPDuCF5Qz22WWV4QE2w
	 EjRFbQVJVhkTQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-300beab2b76so17572767b3.13
        for <soc@kernel.org>; Thu, 26 May 2022 07:49:31 -0700 (PDT)
X-Gm-Message-State: AOAM532rud5+3Uh+y0LmztSicIqBedexiJvB7hm4bWcrofmFCQz63K5h
	rbG4lrDVO1U83+B0GpfAq8IwZxprd02EGnzABqI=
X-Google-Smtp-Source: ABdhPJwzZ2FagFGhP95gWnzcrv4B5jrhiGoj/WyHinElb/Ap2+9yulM2JbxxNKGkqCGHG9rNk8ze2N3QBe6+uj7znyY=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr2625486ywa.495.1653576570084; Thu, 26
 May 2022 07:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
In-Reply-To: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 May 2022 16:49:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1jTC_x1DKcyE80C7JmOtkVKkKOTE85SO_4_OU7NihPzg@mail.gmail.com>
Message-ID: <CAK8P3a1jTC_x1DKcyE80C7JmOtkVKkKOTE85SO_4_OU7NihPzg@mail.gmail.com>
Subject: [GIT PULL 3/5] ARM: driver changes for 5.19
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit b2d229d4ddb17db541098b83524d901257e93845=
:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-drivers-5.19

for you to fetch changes up to d4a3b442335b0a9476248c5d6dc07f6f8580a9ca:

  Merge tag 'v5.19-rockchip-drivers1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/drivers (2022-05-13 11:33:41 +0200)

----------------------------------------------------------------
ARM: driver changes for 5.19

There are minor updates to SoC specific drivers for chips by Rockchip,
Samsung, NVIDIA, TI, NXP, i.MX, Qualcomm, and Broadcom. Noteworthy
driver changes include:

- Several conversions of DT bindings to yaml format.

- Renesas adds driver support for R-Car V4H, RZ/V2M and RZ/G2UL SoCs.

- Qualcomm adds a bus driver for the SSC (Snapdragon Sensor Core),
  and support for more chips in the RPMh power domains and the soc-id.

- NXP has a new driver for the HDMI blk-ctrl on i.MX8MP.

- Apple M1 gains support for the on-chip NVMe controller, making it
  possible to finally use the internal disks. This also includes SoC
  drivers for their RTKit IPC and for the SART DMA address filter.

For other subsystems that merge their drivers through the SoC tree,
we have

- Firmware drivers for the ARM firmware stack including TEE, OP-TEE,
  SCMI and FF-A get a number of smaller updates and cleanups. OP-TEE
  now has a cache for firmware argument structures as an optimization,
  and SCMI now supports the 3.1 version of the specification.

- Reset controller updates to Amlogic, ASpeed, Renesas and ACPI drivers

- Memory controller updates for Tegra, and a few updates for other
  platforms.

----------------------------------------------------------------
Adam Skladowski (2):
      dt-bindings: firmware: qcom-scm: Document msm8976 bindings
      firmware: qcom_scm: Add compatible for MSM8976 SoC

Andrew Davis (2):
      tee: remove tee_shm_va2pa() and tee_shm_pa2va()
      tee: remove flags TEE_IOCTL_SHM_MAPPED and TEE_IOCTL_SHM_DMA_BUF

Arnd Bergmann (23):
      Merge tag 'memory-controller-drv-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'memory-controller-drv-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'renesas-drivers-for-v5.19-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'omap-for-v5.19/ti-sysc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/drivers
      Merge tag 'reset-for-v5.19' of
git://git.pengutronix.de/pza/linux into arm/drivers
      Merge tag 'tee-menu-for-v5.19' of
https://git.linaro.org/people/jens.wiklander/linux-tee into
arm/drivers
      Merge tag 'tee-shm-vmalloc-for-v5.19' of
https://git.linaro.org/people/jens.wiklander/linux-tee into
arm/drivers
      Merge tag 'ffa-updates-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/drivers
      Merge tag 'scmi-updates-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/drivers
      Merge tag 'optee-rpc-arg-for-v5.19' of
https://git.linaro.org/people/jens.wiklander/linux-tee into
arm/drivers
      Merge tag 'arm-soc/for-5.19/drivers' of
https://github.com/Broadcom/stblinux into arm/drivers
      Merge tag 'asahi-soc-rtkit-sart-nvme-for-5.19' of
https://github.com/AsahiLinux/linux into arm/drivers
      nvme-apple: fix sparse endianess warnings
      Merge tag 'tee-cleanup-for-v5.19' of
https://git.linaro.org/people/jens.wiklander/linux-tee into
arm/drivers
      Merge tag 'samsung-drivers-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
arm/drivers
      Merge tag 'samsung-soc-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
arm/drivers
      Merge tag 'renesas-drivers-for-v5.19-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/drivers
      Merge tag 'tegra-for-5.19-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/drivers
      Merge tag 'ti-driver-soc-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into
arm/drivers
      Merge tag 'imx-drivers-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/drivers
      Merge tag 'memory-controller-drv-tegra-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into
arm/drivers
      Merge tag 'qcom-drivers-for-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/drivers
      Merge tag 'v5.19-rockchip-drivers1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/drivers

Ashish Mhetre (2):
      memory: tegra: Add memory controller channels support
      memory: tegra: Add MC error logging on Tegra186 onward

Biju Das (1):
      soc: renesas: Identify RZ/G2UL SoC

Bjorn Andersson (7):
      dt-bindings: arm: qcom: Document sa8540p, sc8180x and sc8280xp
      soc: qcom: llcc: Add MODULE_DEVICE_TABLE()
      dt-bindings: power: rpmpd: Add sc8280xp RPMh power-domains
      soc: qcom: rpmhpd: Don't warn about sparse rpmhpd arrays
      soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains
      dt-bindings: arm: msm: Add sc8180x and sc8280xp LLCC compatibles
      soc: qcom: llcc: Add sc8180x and sc8280xp configurations

Brian Norris (3):
      soc: rockchip: Clean up Kconfig whitespace
      soc: rockchip: power-domain: Replace dsb() with smb()
      soc: rockchip: Fix compile-testing SoC drivers

Christophe JAILLET (1):
      memory: samsung: exynos5422-dmc: Avoid some over memory allocation

Cristian Marussi (22):
      firmware: arm_scmi: Make protocols initialisation fail on basic error=
s
      firmware: arm_scmi: Fix list protocols enumeration in the base protoc=
ol
      firmware: arm_scmi: Validate BASE_DISCOVER_LIST_PROTOCOLS response
      firmware: arm_scmi: Dynamically allocate implemented protocols array
      firmware: arm_scmi: Make name_get operations return a const
      firmware: arm_scmi: Check CLOCK_RATE_SET_COMPLETE async response
      firmware: arm_scmi: Remove unneeded NULL termination of clk name
      firmware: arm_scmi: Split protocol specific definitions in a
dedicated header
      firmware: arm_scmi: Introduce a common SCMI v3.1 .extended_name_get h=
elper
      firmware: arm_scmi: Add SCMI v3.1 protocol extended names support
      firmware: arm_scmi: Parse clock_enable_latency conditionally
      firmware: arm_scmi: Add iterators for multi-part commands
      firmware: arm_scmi: Use common iterators in the sensor protocol
      firmware: arm_scmi: Add SCMI v3.1 SENSOR_AXIS_NAME_GET support
      firmware: arm_scmi: Use common iterators in the clock protocol
      firmware: arm_scmi: Use common iterators in the voltage protocol
      firmware: arm_scmi: Use common iterators in the perf protocol
      firmware: arm_scmi: Add SCMI v3.1 perf power-cost in microwatts
      firmware: arm_scmi: Add checks for min/max limits in
PERFORMANCE_LIMITS_SET
      firmware: arm_scmi: Add SCMI v3.1 clock notifications
      firmware: arm_scmi: Add SCMI v3.1 VOLTAGE_LEVEL_SET_COMPLETE
      firmware: arm_scmi: Fix late checks on pointer dereference

Dave Gerlach (5):
      soc: ti: wkup_m3_ipc: Add support for toggling VTT regulator
      firmware: ti_sci: Switch transport to polled mode during system suspe=
nd
      soc: ti: wkup_m3_ipc: Add support for IO Isolation
      soc: ti: wkup_m3_ipc: Add support for i2c voltage scaling
      soc: ti: wkup_m3_ipc: Add debug option to halt m3 in suspend

Deepak Kumar Singh (2):
      soc: qcom: smem: map only partitions used by local HOST
      soc: qcom: smem: validate fields of shared structures

Dmitry Baryshkov (1):
      soc: qcom: socinfo: Add another ID for SM8450

Douglas Anderson (1):
      soc: qcom: socinfo: add SC7280 entry to soc_id array

Etienne Carriere (1):
      firmware: arm_scmi: Support optee shared memory in the optee transpor=
t

Geert Uytterhoeven (5):
      dt-bindings: memory: renesas,rpc-if: Document R-Car H3/M3/E3 support
      memory: renesas-rpc-if: Simplify single/double data register access
      bus: ti-sysc: Drop commas after SoC match table sentinels
      Merge tag 'renesas-r8a779g0-dt-binding-defs-tag' into
renesas-drivers-for-v5.19
      soc: renesas: R-Car V3U is R-Car Gen4

Haowen Bai (1):
      soc: ti: knav_qmss_queue: Use IS_ERR instead of IS_ERR_OR_NULL
when checking knav_queue_open() result

Herve Codina (1):
      soc: renesas: rzn1: Select PM and PM_GENERIC_DOMAINS configs

Jakob Koschel (2):
      soc: qcom: pdr: replace usage of found with dedicated list
iterator variable
      soc: ti: replace usage of found with dedicated list iterator variable

Jan Engelhardt (1):
      tee: combine "config" and "menu" for TEE's menuconfig

Jens Wiklander (4):
      optee: rename rpc_arg_count to rpc_param_count
      optee: add OPTEE_SMC_CALL_WITH_RPC_ARG and OPTEE_SMC_CALL_WITH_REGD_A=
RG
      optee: add FF-A capability OPTEE_FFA_SEC_CAP_ARG_OFFSET
      optee: cache argument shared memory structs

Joel Stanley (1):
      reset: simple: Add AST2600 compatible

Johan Jonker (1):
      dt-bindings: soc: rockchip: add naneng combo phy register compatible

Julia Lawall (1):
      ARM: s3c: fix typos in comments

Krishna Yarlagadda (1):
      reset: ACPI reset support

Krzysztof Kozlowski (19):
      dt-bindings: soc: samsung: usi: refer to dtschema for SPI
      memory: emif: remove unneeded ENOMEM error messages
      dt-bindings: soc: qcom,smsm: convert to dtschema
      dt-bindings: soc: qcom,wcnss: convert to dtschema
      dt-bindings: qcom: qcom,gsbi: convert to dtschema
      dt-bindings: qcom,smd-rpm: update maintainers (drop Kathiravan)
      dt-bindings: soc: qcom,smd: convert to dtschema
      dt-bindings: qcom: qcom,geni-se: refer to dtschema for SPI
      dt-bindings: soc: qcom,rpmh-rsc: convert to dtschema
      dt-bindings: soc: qcom,smp2p: convert to dtschema
      dt-bindings: timer: exynos4210-mct: describe known hardware and
its interrupts
      memory: da8xx-ddrctl: simplify platform_get_resource()
      memory: emif: simplify platform_get_resource()
      memory: ti-emif: simplify platform_get_resource()
      memory: ti-emif-pm: simplify platform_get_resource()
      memory: tegra: mc: simplify platform_get_resource()
      memory: brcmstb_dpfe: simplify platform_get_resource_byname()
      memory: renesas-rpc-if: simplify platform_get_resource_byname()
      spi: dt-bindings: qcom,spi-geni-qcom: convert to dtschema

Kuldeep Singh (2):
      dt-bindings: qcom: geni-se: Update I2C schema reference
      dt-bindings: qcom: geni-se: Update UART schema reference

Kunihiko Hayashi (1):
      dt-bindings: reset: uniphier-glue: Clean up clocks, resets, and
their names using compatible string

Lad Prabhakar (1):
      reset: Kconfig: Make RESET_RZG2L_USBPHY_CTRL depend on ARCH_RZG2L

Luca Weiss (1):
      soc: qcom: socinfo: Sort out 8974PRO names

Lucas Stach (6):
      soc: imx: gpcv2: add PGC control register indirection
      soc: imx: gpcv2: add support for i.MX8MP power domains
      soc: imx: imx8m-blk-ctrl: set power device name
      dt-bindings: power: imx8mp: add defines for HDMI blk-ctrl domains
      soc: imx: add i.MX8MP HSIO blk-ctrl
      soc: imx: add i.MX8MP HDMI blk-ctrl

Lv Ruyi (1):
      memory: fsl-corenet-cf: Use helper function
devm_platform_ioremap_resource()

Marc Bonnici (1):
      firmware: arm_ffa: Fix handling of fragmented memory descriptors

Miaoqian Lin (2):
      soc: qcom: smp2p: Fix missing of_node_put() in smp2p_parse_ipc
      soc: qcom: smsm: Fix missing of_node_put() in smsm_parse_ipc

Michael Srba (2):
      dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
      bus: add driver for initializing the SSC bus on (some) qcom SoCs

Minghao Chi (4):
      soc: ti: pruss: using pm_runtime_resume_and_get instead of
pm_runtime_get_sync
      soc: ti: knav_dma: Use pm_runtime_resume_and_get instead of
pm_runtime_get_sync
      soc: ti: knav_qmss_queue: Use pm_runtime_resume_and_get instead
of pm_runtime_get_sync
      soc: ti: pm33xx: using pm_runtime_resume_and_get instead of
pm_runtime_get_sync

Minghao Chi (CGEL ZTE) (1):
      soc: ti: omap_prm: Use of_device_get_match_data()

Paul Elder (2):
      dt-bindings: soc: Add i.MX8MP media block control DT bindings
      soc: imx: imx8m-blk-ctrl: Add i.MX8MP media blk-ctrl

Peter Geis (2):
      dt-bindings: soc: rockchip: add rk3566-pipe-grf compatible
      soc: rockchip: set dwc3 clock for rk3566

Phil Chang (1):
      tee: make tee_shm_register_kernel_buf vmalloc supported

Phil Edworthy (1):
      soc: renesas: Add RZ/V2M (R9A09G011) config option

Philipp Zabel (13):
      reset: ti-sci: Allow building under COMPILE_TEST
      reset: uniphier-glue: Use reset_control_bulk API
      reset: uniphier-glue: Use devm_add_action_or_reset()
      dt-bindings: reset: amlogic,meson-axg-audio-arb: Convert to yaml
      dt-bindings: reset: ath79: Convert to yaml
      dt-bindings: reset: berlin: Convert to yaml
      dt-bindings: reset: bitmain,bm1880-reset: Convert to yaml
      dt-bindings: reset: lantiq,reset: Convert to yaml
      dt-bindings: reset: nuvoton,npcm-reset: Convert to yaml
      dt-bindings: reset: snps,axs10x-reset: Convert to yaml
      dt-bindings: reset: socfpga: Convert to yaml
      dt-bindings: reset: st,sti-picophyreset: Convert to yaml
      dt-bindings: reset: st,sti-powerdown: Convert to yaml

QintaoShen (2):
      soc: ti: ti_sci_pm_domains: Check for null return of devm_kcalloc
      soc: bcm: Check for NULL return of devm_kzalloc()

Roger Quadros (2):
      memory: omap-gpmc: Make OMAP_GPMC config visible and selectable
      memory: omap-gpmc: Allow building as a module

Rohit Agarwal (2):
      dt-bindings: power: Add rpm power domain bindings for SDX65
      soc: qcom: rpmhpd: Add SDX65 power domains

Sagar Kamble (1):
      soc/tegra: fuse: Add nvmem cell lookup entries for Tegra194

Sameer Pujar (1):
      memory: tegra: Add APE memory clients for Tegra234

Sandipan Patra (1):
      soc/tegra: pmc: Update Tegra234 reset sources

Sebastian Fricke (1):
      soc: rockchip: pm_domains: Fix typo in comment

Shawn Guo (1):
      Merge commit 'f11cf9e35e7f' into imx/drivers

Sudeep Holla (5):
      firmware: arm_scmi: Set clock latency to U32_MAX if it is not support=
ed
      firmware: arm_ffa: Fix uuid parameter to ffa_partition_probe
      firmware: arm_ffa: Remove incorrect assignment of driver_data
      firmware: arm_ffa: Add ffa_dev_get_drvdata helper function
      tee: optee: Use ffa_dev_get_drvdata to fetch driver_data

Sven Peter (6):
      soc: apple: Always include Makefile
      soc: apple: Add RTKit IPC library
      dt-bindings: iommu: Add Apple SART DMA address filter
      soc: apple: Add SART driver
      dt-bindings: nvme: Add Apple ANS NVMe
      nvme-apple: Add initial Apple SoC NVMe driver

Thierry Reding (3):
      soc/tegra: pmc: Select REGMAP
      soc/tegra: pmc: Document core domain fields
      memory: tegra: Add Tegra234 support

Tom Rix (1):
      soc: qcom: pdr: use static for servreg_* variables

Uwe Kleine-K=C3=B6nig (1):
      ARM: s3c: Drop config symbol S3C24XX_PWM

Yihao Han (1):
      soc: ti: wkup_m3_ipc: fix platform_get_irq.cocci warning

Yoshihiro Shimoda (5):
      dt-bindings: power: Add r8a779g0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
      soc: renesas: r8a779g0-sysc: Add r8a779g0 support
      soc: renesas: Identify R-Car V4H
      soc: renesas: rcar-rst: Add support for R-Car V4H

Zelong Dong (3):
      dt-bindings: reset: Add compatible for Meson-S4 Reset Controller
      dt-bindings: reset: add bindings for the Meson-S4 SoC Reset Controlle=
r
      reset: reset-meson: add support for the Meson-S4 SoC Reset Controller

kernel test robot (1):
      soc: imx: fix semicolon.cocci warnings

lizhe (1):
      bus: brcmstb_gisb: Remove the suppress_bind_attrs attribute of the dr=
iver

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |    2 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   20 +
 .../bindings/bus/qcom,ssc-block-bus.yaml           |  147 ++
 .../devicetree/bindings/firmware/qcom,scm.txt      |    3 +-
 .../bindings/interconnect/qcom,bcm-voter.yaml      |    8 +-
 .../devicetree/bindings/iommu/apple,sart.yaml      |   52 +
 .../memory-controllers/renesas,rpc-if.yaml         |    5 +
 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   |  111 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    3 +
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml |    5 +-
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |    2 +-
 .../bindings/remoteproc/qcom,wcnss-pil.txt         |    2 +-
 .../devicetree/bindings/reset/altr,rst-mgr.yaml    |   47 +
 .../bindings/reset/amlogic,meson-axg-audio-arb.txt |   22 -
 .../reset/amlogic,meson-axg-audio-arb.yaml         |   56 +
 .../bindings/reset/amlogic,meson-reset.yaml        |    1 +
 .../devicetree/bindings/reset/ath79-reset.txt      |   20 -
 .../devicetree/bindings/reset/berlin,reset.txt     |   23 -
 .../bindings/reset/bitmain,bm1880-reset.txt        |   18 -
 .../bindings/reset/bitmain,bm1880-reset.yaml       |   36 +
 .../devicetree/bindings/reset/lantiq,reset.txt     |   30 -
 .../devicetree/bindings/reset/lantiq,reset.yaml    |   49 +
 .../bindings/reset/marvell,berlin2-reset.yaml      |   38 +
 .../bindings/reset/nuvoton,npcm-reset.txt          |   32 -
 .../bindings/reset/nuvoton,npcm750-reset.yaml      |   50 +
 .../bindings/reset/qca,ar7100-reset.yaml           |   40 +
 .../bindings/reset/snps,axs10x-reset.txt           |   33 -
 .../bindings/reset/snps,axs10x-reset.yaml          |   48 +
 .../devicetree/bindings/reset/socfpga-reset.txt    |   16 -
 .../reset/socionext,uniphier-glue-reset.yaml       |   52 +-
 .../bindings/reset/st,sti-picophyreset.txt         |   42 -
 .../devicetree/bindings/reset/st,sti-powerdown.txt |   45 -
 .../bindings/reset/st,stih407-picophyreset.yaml    |   47 +
 .../bindings/reset/st,stih407-powerdown.yaml       |   49 +
 .../soc/imx/fsl,imx8mp-media-blk-ctrl.yaml         |  104 ++
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   99 +-
 .../devicetree/bindings/soc/qcom/qcom,gsbi.txt     |   87 --
 .../devicetree/bindings/soc/qcom/qcom,gsbi.yaml    |  132 ++
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |  272 ++++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |    7 +-
 .../devicetree/bindings/soc/qcom/qcom,smd.txt      |   98 --
 .../devicetree/bindings/soc/qcom/qcom,smd.yaml     |  137 ++
 .../devicetree/bindings/soc/qcom/qcom,smp2p.txt    |  110 --
 .../devicetree/bindings/soc/qcom/qcom,smp2p.yaml   |  145 ++
 .../devicetree/bindings/soc/qcom/qcom,smsm.txt     |  104 --
 .../devicetree/bindings/soc/qcom/qcom,smsm.yaml    |  138 ++
 .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    |  131 --
 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   |  137 ++
 .../devicetree/bindings/soc/qcom/rpmh-rsc.txt      |  137 --
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    3 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    2 +-
 .../devicetree/bindings/spi/qcom,spi-geni-qcom.txt |   39 -
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |  116 ++
 .../bindings/timer/samsung,exynos4210-mct.yaml     |   67 +-
 MAINTAINERS                                        |    4 +
 arch/arm/configs/mini2440_defconfig                |    3 +-
 arch/arm/configs/s3c2410_defconfig                 |    2 +
 arch/arm/mach-s3c/Kconfig                          |    8 -
 arch/arm/mach-s3c/Kconfig.s3c24xx                  |    2 -
 arch/arm/mach-s3c/iotiming-s3c2410.c               |    2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                     |    2 +-
 arch/arm/mach-s3c/s3c24xx.c                        |    2 +-
 drivers/bus/Kconfig                                |   11 +
 drivers/bus/Makefile                               |    1 +
 drivers/bus/brcmstb_gisb.c                         |    1 -
 drivers/bus/qcom-ssc-block-bus.c                   |  389 +++++
 drivers/bus/ti-sysc.c                              |    4 +-
 drivers/firmware/arm_ffa/driver.c                  |   24 +-
 drivers/firmware/arm_scmi/Kconfig                  |    1 +
 drivers/firmware/arm_scmi/base.c                   |   46 +-
 drivers/firmware/arm_scmi/clock.c                  |  343 ++++-
 drivers/firmware/arm_scmi/common.h                 |  225 +--
 drivers/firmware/arm_scmi/driver.c                 |  168 ++-
 drivers/firmware/arm_scmi/optee.c                  |  144 +-
 drivers/firmware/arm_scmi/perf.c                   |  162 +-
 drivers/firmware/arm_scmi/power.c                  |   44 +-
 drivers/firmware/arm_scmi/protocols.h              |  318 ++++
 drivers/firmware/arm_scmi/reset.c                  |   40 +-
 drivers/firmware/arm_scmi/sensors.c                |  645 ++++----
 drivers/firmware/arm_scmi/system.c                 |    9 +-
 drivers/firmware/arm_scmi/voltage.c                |  218 ++-
 drivers/firmware/qcom_scm.c                        |    4 +
 drivers/firmware/ti_sci.c                          |   61 +-
 drivers/memory/Kconfig                             |    2 +-
 drivers/memory/brcmstb_dpfe.c                      |   10 +-
 drivers/memory/da8xx-ddrctl.c                      |    3 +-
 drivers/memory/emif.c                              |   15 +-
 drivers/memory/fsl-corenet-cf.c                    |    9 +-
 drivers/memory/omap-gpmc.c                         |   43 +-
 drivers/memory/renesas-rpc-if.c                    |   31 +-
 drivers/memory/samsung/exynos5422-dmc.c            |    5 +-
 drivers/memory/tegra/Makefile                      |    2 +
 drivers/memory/tegra/mc.c                          |  141 +-
 drivers/memory/tegra/mc.h                          |   50 +-
 drivers/memory/tegra/tegra186-emc.c                |    3 +
 drivers/memory/tegra/tegra186.c                    |   39 +
 drivers/memory/tegra/tegra194.c                    |    9 +
 drivers/memory/tegra/tegra234.c                    |  110 ++
 drivers/memory/ti-aemif.c                          |    4 +-
 drivers/memory/ti-emif-pm.c                        |    6 +-
 drivers/nvme/host/Kconfig                          |   13 +
 drivers/nvme/host/Makefile                         |    3 +
 drivers/nvme/host/apple.c                          | 1593 ++++++++++++++++=
++++
 drivers/reset/Kconfig                              |    4 +-
 drivers/reset/core.c                               |   15 +-
 drivers/reset/reset-meson.c                        |    6 +
 drivers/reset/reset-simple.c                       |    1 +
 drivers/reset/reset-uniphier-glue.c                |   75 +-
 drivers/soc/Makefile                               |    4 +-
 drivers/soc/apple/Kconfig                          |   24 +
 drivers/soc/apple/Makefile                         |    6 +
 drivers/soc/apple/rtkit-crashlog.c                 |  154 ++
 drivers/soc/apple/rtkit-internal.h                 |   62 +
 drivers/soc/apple/rtkit.c                          |  958 ++++++++++++
 drivers/soc/apple/sart.c                           |  328 ++++
 drivers/soc/bcm/bcm63xx/bcm-pmb.c                  |    3 +
 drivers/soc/imx/Makefile                           |    1 +
 drivers/soc/imx/gpcv2.c                            |  430 +++++-
 drivers/soc/imx/imx8m-blk-ctrl.c                   |  124 +-
 drivers/soc/imx/imx8mp-blk-ctrl.c                  |  696 +++++++++
 drivers/soc/qcom/llcc-qcom.c                       |   61 +
 drivers/soc/qcom/pdr_interface.c                   |   11 +-
 drivers/soc/qcom/pdr_internal.h                    |   20 +-
 drivers/soc/qcom/rpmhpd.c                          |   73 +-
 drivers/soc/qcom/smem.c                            |  305 +++-
 drivers/soc/qcom/smp2p.c                           |    1 +
 drivers/soc/qcom/smsm.c                            |    1 +
 drivers/soc/qcom/socinfo.c                         |   26 +-
 drivers/soc/renesas/Kconfig                        |   26 +
 drivers/soc/renesas/Makefile                       |    1 +
 drivers/soc/renesas/r8a779g0-sysc.c                |   62 +
 drivers/soc/renesas/rcar-gen4-sysc.c               |    3 +
 drivers/soc/renesas/rcar-gen4-sysc.h               |    1 +
 drivers/soc/renesas/rcar-rst.c                     |    1 +
 drivers/soc/renesas/renesas-soc.c                  |   23 +-
 drivers/soc/rockchip/Kconfig                       |   24 +-
 drivers/soc/rockchip/grf.c                         |   17 +
 drivers/soc/rockchip/pm_domains.c                  |   10 +-
 drivers/soc/tegra/Kconfig                          |    1 +
 drivers/soc/tegra/fuse/fuse-tegra.c                |    8 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c              |   17 +-
 drivers/soc/tegra/pmc.c                            |   35 +-
 drivers/soc/ti/knav_dma.c                          |   29 +-
 drivers/soc/ti/knav_qmss_queue.c                   |   21 +-
 drivers/soc/ti/omap_prm.c                          |    7 +-
 drivers/soc/ti/pm33xx.c                            |    6 +-
 drivers/soc/ti/pruss.c                             |    3 +-
 drivers/soc/ti/ti_sci_pm_domains.c                 |    2 +
 drivers/soc/ti/wkup_m3_ipc.c                       |  210 ++-
 drivers/tee/Kconfig                                |    5 +-
 drivers/tee/optee/call.c                           |  240 ++-
 drivers/tee/optee/core.c                           |    1 +
 drivers/tee/optee/ffa_abi.c                        |   38 +-
 drivers/tee/optee/optee_ffa.h                      |   12 +-
 drivers/tee/optee/optee_private.h                  |   31 +-
 drivers/tee/optee/optee_smc.h                      |   48 +-
 drivers/tee/optee/smc_abi.c                        |  197 ++-
 drivers/tee/tee_core.c                             |    2 -
 drivers/tee/tee_shm.c                              |   85 +-
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h      |   90 ++
 include/dt-bindings/power/imx8mp-power.h           |   18 +
 include/dt-bindings/power/qcom-rpmpd.h             |   26 +
 include/dt-bindings/power/r8a779g0-sysc.h          |   45 +
 include/dt-bindings/reset/amlogic,meson-s4-reset.h |  125 ++
 include/linux/arm_ffa.h                            |    7 +-
 include/linux/scmi_protocol.h                      |   31 +-
 include/linux/soc/apple/rtkit.h                    |  155 ++
 include/linux/soc/apple/sart.h                     |   53 +
 include/linux/soc/qcom/llcc-qcom.h                 |    2 +
 include/linux/tee_drv.h                            |   18 -
 include/linux/wkup_m3_ipc.h                        |   13 +
 include/soc/tegra/mc.h                             |    8 +-
 include/uapi/linux/tee.h                           |    4 -
 173 files changed, 10880 insertions(+), 2463 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/iommu/apple,sart.yaml
 create mode 100644 Documentation/devicetree/bindings/nvme/apple,nvme-ans.y=
aml
 create mode 100644 Documentation/devicetree/bindings/reset/altr,rst-mgr.ya=
ml
 delete mode 100644
Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
 create mode 100644
Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/ath79-reset.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/berlin,reset.tx=
t
 delete mode 100644
Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
 create mode 100644
Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/lantiq,reset.tx=
t
 create mode 100644 Documentation/devicetree/bindings/reset/lantiq,reset.ya=
ml
 create mode 100644
Documentation/devicetree/bindings/reset/marvell,berlin2-reset.yaml
 delete mode 100644
Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
 create mode 100644
Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
 create mode 100644
Documentation/devicetree/bindings/reset/qca,ar7100-reset.yaml
 delete mode 100644
Documentation/devicetree/bindings/reset/snps,axs10x-reset.txt
 create mode 100644
Documentation/devicetree/bindings/reset/snps,axs10x-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/socfpga-reset.t=
xt
 delete mode 100644
Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/st,sti-powerdow=
n.txt
 create mode 100644
Documentation/devicetree/bindings/reset/st,stih407-picophyreset.yaml
 create mode 100644
Documentation/devicetree/bindings/reset/st,stih407-powerdown.yaml
 create mode 100644
Documentation/devicetree/bindings/soc/imx/fsl,imx8mp-media-blk-ctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.tx=
t
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.ya=
ml
 create mode 100644
Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd.yam=
l
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.t=
xt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smsm.tx=
t
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smsm.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.t=
xt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
 delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-geni-qco=
m.txt
 create mode 100644
Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
 create mode 100644 drivers/bus/qcom-ssc-block-bus.c
 create mode 100644 drivers/firmware/arm_scmi/protocols.h
 create mode 100644 drivers/memory/tegra/tegra234.c
 create mode 100644 drivers/nvme/host/apple.c
 create mode 100644 drivers/soc/apple/rtkit-crashlog.c
 create mode 100644 drivers/soc/apple/rtkit-internal.h
 create mode 100644 drivers/soc/apple/rtkit.c
 create mode 100644 drivers/soc/apple/sart.c
 create mode 100644 drivers/soc/imx/imx8mp-blk-ctrl.c
 create mode 100644 drivers/soc/renesas/r8a779g0-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779g0-sysc.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-s4-reset.h
 create mode 100644 include/linux/soc/apple/rtkit.h
 create mode 100644 include/linux/soc/apple/sart.h
