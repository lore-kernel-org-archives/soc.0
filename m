Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C89460
	for <soc@lists.linux.dev>; Tue, 18 Aug 2026 21:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787087834; cv=none; b=s3v5yrM818x3prSQKfEXVECPQMU1q1ZNyp6QDAHA8mt7e3zZGllYC2LppQc+D9YKOFol62h33yY1BPr4h8gu2m9p82M26UT6Fm9K4MXFLZejrNz74m0ir8HHRqPSbCwxkTRxCP0Z7QZHo0tDOtUGd5+xC4KaFThcsLQxWkl0Q3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787087834; c=relaxed/simple;
	bh=43UdZmufdrCmrNlGwuMJwB/HRFegiaHwN9tYAay3qcQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=bExk2ExULEDUDrEggkl6HIDGKyEgnB/2e+jyavn9rVe9ZMVQWRwQP2+YyE4klhbsgMc+5ZXsQ9/x7QBLiAqmACWzcXPOj2xKCE3Svqey7QP1g9vxJ/ucDAqfLTrC8V7zZtotPjVTkqrIytO9DuWid4JKoSlJgtoOncsCRHvkp4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XuwH91Bh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jzvDrGLi; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XuwH91Bh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jzvDrGLi"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 676511400144;
	Tue, 18 Aug 2026 17:17:04 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 18 Aug 2026 17:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1787087823; x=1787174223; bh=Xu
	7SclNhUNlfh94QSmFX3iFyFrlcEmpiTduiLCfjDng=; b=XuwH91Bh1Ms6ExO69u
	xEg0o7d80VksE2wqHB1HTjp8NHwHON/QqECBXNwEPHW4o4lTSVHBM5J35k3d5007
	NmnFFuLQhqrQOo/QxU5rPpeRGkCL+f6Cc+PJST6qTDE8W+i04hcU7C6RRGWJ1i9x
	GtCItv0vV2oZ4PjhWJAcTJSg/qe5ODLIRzJznsy3HKWAIdRDk22v+9x9kP+jNdG7
	qCLEY6Cr9yq/hQ1fyzty0TDsJnJkTQTlDcW0R0Bq0wPva7vCEzrkAYYWNUlkyiZ+
	oqJefXJbWfw3FIahxCz5JdDO7OZXAmFTODfuOIC0OvBVWWFHa6c06df++6DkiYEe
	io0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787087823; x=1787174223; bh=Xu7SclNhUNlfh94QSmFX3iFyFrlc
	EmpiTduiLCfjDng=; b=jzvDrGLiT/h3lc7YaBkRooN7k0jrbqlies/hdthkpD7X
	YOSh07G1oL9tQNdH9nK5o4yojDmu2atmxCaLzKU5575nNkseleDWymwd/Lsui3D0
	LmZg4Z9SexCqNARG9J8HjQPLbjxbYiG58wCQwamQWIMSg8AgD4mf77pSGn1UM4Ji
	UuHdyAfgAN3I9Ap592n1kXbcbzfEQfdVzvA3wsgCPD7O5POlOiByGJmDSV1RnnzX
	b0qoY+R/Jg6EzWdCU995iKGa5DkVev4e86vKe66hmJLODgbykhM4DYYj3KL5ps9m
	3gLIm0I8Fw9R2NsfGqQGxkTtzKwEKV7FrjsFticOdA==
X-ME-Sender: <xms:zsuEaq2wZsTsm1nm95lX-lPXwpJ2Os2OAn8aW_I-MkLIl5rogep78w>
    <xme:zsuEan57f6MUfUTI28OrMzdfFsUok31wsqME7RxCR2U7RbNvDJJExkxHLN7-uk5HK
    b8DFfWlVdfGHKA0SNgYetSMLmefvLd39ChDUiFmjvL_p_SoIXVdQQ>
X-ME-Proxy-Cause: dmFkZTEbz/J8k0FdBoDrYhDzq6dCnJZmKaA8Vs3wq0HnCt2fSqgjzReP5DO2t4Fp/Trl4B
    X9HiSULuR0t0+HbH1dmMjP7vstLjGb3CHqcCVTCyYLDtU4Wp2HhekLK/na90ctvznFW09p
    JggHKcbbGCgmgfCej7usBTwCCm92HWBKbjW6nNDFWzvmyqRJhCS+xoN7UigLYsuPucKkEz
    DNlrj8pUDg7CquKec/zkfuYAMNIAdGF3lvuxa809bS8yOwJR++/8fiNI0e/iLIsNSNqyvO
    eq7IGf4XEWZSQ+4HZ4cT4nZewMGDZooTtD/+FMViL/pjODIcZ+ho3ylCNa7T/lvBA7nEaG
    /+v82DMaS2wBFip4Q7xvODh8VW/2ZHHjqawgz+OSDnze168cNLPszovJQ3vRpqyYBY5jj1
    OmQJpd6UaMoTd0i951vWIF41DVAenM+C/VZmt9o+Tv5yA98AdD3B5jbVXG0C3Jj8fr2tvq
    eN7Y/UGu72WSwkIqphwQKXMZtmALQ8lPie+6D8Cxds96eUGyqGoyicl5WB/lp9ONQogKwZ
    lI+SLHPaFGM/amtTC/G9GzGKD97RYnaiRJEHuohc/hhw5JBSnR34+uteMLIqfKis4c/18E
    Gzf9TLNaq3c3Rf/mLQJsfbkR3hR0VNmqFS1CnRBLQWdcGGlX9+x9rw3w/dqg
X-ME-Proxy: <xmx:zsuEar4sfqR0pdlXvjGBCgadT3C34hqtivbkfy2lTeb9gEa3VX4MrA>
    <xmx:zsuEasZTJgz_e0i4pqt_0KapMeheF3dYbflBGj6KzYx6LSAMzzKT4A>
    <xmx:zsuEao65vg9PYC_GZSkcOoOtLho2Hses8eSgUzr1rqbh7LTAn95Z1A>
    <xmx:zsuEanBS6HZ5mZib23NcyG2pScsm3jq-AVKC4mGV7yZHFbVMYeoZ7A>
    <xmx:z8uEanoU2O98TUbQtD-fjLDVZrpBS06xgDFE7cOArQ-qo1JiZnmMi59x>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 037E132A0071; Tue, 18 Aug 2026 17:17:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AhjJ9KJfpBQc
Date: Tue, 18 Aug 2026 23:16:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
Subject: [GIT PULL 2/4] soc: drivers for 7.3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 980a8bfe7baec9b9ee0d5443b0b204552e41c=
407:

  Merge branches 'for-next/scmi/fixes' and 'for-next/ffa/fixes' (2026-07=
-13 11:38:34 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
rivers-7.3

for you to fetch changes up to aed89a05a736d2570a514f00c2ab83388662b271:

  soc: qcom: make QCOM_PDR_MSG selectable (2026-08-18 11:41:56 +0200)

----------------------------------------------------------------
soc: drivers for 7.3

The SoC driver changes once more consist of many small fixes and
cleanups, that are to a large part the result of automated testing. On
platform specific drivers, this includes SoC specific code for xilinx,
freescale/nxp, qualcomm, TI, aspeed, omap, tegra, samsung, rockchip,
renesas, ixp4xx. In firmware drivers, we see a similar picture for
SCMI and qcomtee.

Aside from these, we see actual new hardware support in a few
areas:

 - The Apple platform gets a new driver for low power states

 - Updates to Qualcomm platform drivers add several new
   hardware specific features and additional SoCs.

 - Amlogic SoC support for A1 and T7 is added

 - The Mediatek MMSYS driver is refactored as a cleanup.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      soc: mediatek: mtk-mmsys: Rework routes to specify component ID
      soc: mediatek: mtk-mmsys: Use MMSYS_ROUTE() in default routing tab=
le

Arnd Bergmann (19):
      Merge tag 'ixp4xx-soc-v7.3' of https://git.kernel.org/pub/scm/linu=
x/kernel/git/linusw/linux-integrator into soc/drivers
      Merge tag 'scmi-updates-7.3' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'v7.3-rockchip-drivers1' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/drivers
      Merge tag 'renesas-drivers-for-v7.3-tag1' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'memory-controller-drv-7.3' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'samsung-drivers-7.3' of https://git.kernel.org/pub/scm/=
linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'mtk-soc-for-v7.3' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/mediatek/linux into soc/drivers
      Merge tag 'amlogic-drivers-for-v7.3' of https://git.kernel.org/pub=
/scm/linux/kernel/git/amlogic/linux into soc/drivers
      Merge tag 'tegra-for-7.3-soc' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/tegra/linux into soc/drivers
      Merge tag 'omap-for-v7.3/drivers-signed' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers
      Merge tag 'aspeed-7.3-drivers-0' of https://git.kernel.org/pub/scm=
/linux/kernel/git/bmc/linux into soc/drivers
      Merge tag 'qcom-drivers-for-7.3' of https://git.kernel.org/pub/scm=
/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'ti-driver-soc-for-v7.3' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/ti/linux into soc/drivers
      Merge tag 'qcomtee-for-v7.3' of git://git.kernel.org/pub/scm/linux=
/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'qcom-drivers-for-7.3-2' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'apple-soc-drivers-7.3' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/sven/linux into soc/drivers
      Merge tag 'soc_fsl-7.3-1' of https://git.kernel.org/pub/scm/linux/=
kernel/git/chleroy/linux into soc/drivers
      Merge tag 'zynqmp-soc-for-7.3' of https://github.com/Xilinx/linux-=
xlnx into soc/drivers
      soc: qcom: make QCOM_PDR_MSG selectable

Ashish Mhetre (1):
      memory: tegra: Guard against NULL mc_regs in IRQ handler

Bjorn Andersson (1):
      Merge branch '20260702115835.167602-2-sumit.garg@kernel.org' into =
drivers-for-7.3

Christophe Leroy (1):
      dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema

Christophe Leroy (CS GROUP) (4):
      soc: fsl: qe_ports_ic: Use generic I/O helper instead of specific =
powerPC ones
      powerpc: Move CONFIG_QE_GPIO to SoC
      soc: fsl: qe: properly scan GPIO nodes at startup
      soc: fsl: qe: implement get_direction()

Chunkai Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side chan=
nel

Daniel Baluta (4):
      drm/msm: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
      media: iris: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
      soc: qcom: ubwc: Fix link error when QCOM_SMEM=3Dn
      soc: qcom: ubwc: Fix missing include

David Heidelberg (2):
      soc: qcom: socinfo: Add SoC ID for SDM850
      dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDM 850

David Laight (1):
      drivers/bus/fsl-mc: Use strscpy() to copy strings into arrays

Dmitry Baryshkov (7):
      soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
      soc: qcom: ubwc: drop ubwc_dec_version
      soc: qcom: ubwc: drop ubwc_bank_spread
      soc: qcom: ubwc: drop macrotile_mode from the database
      soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
      soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
      soc: qcom: ubwc: deduplicate UBWC configuration data

Faiyaz Mohammed (1):
      soc: qcom: llcc: Skip ECC interrupt setup on Shikra, pre-configure=
d by DSF

Fenglin Wu (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili compatible stri=
ng

Geert Uytterhoeven (1):
      soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"

Griffin Kroah-Hartman (1):
      soc: mediatek: mtk-socinfo Add error handling in devm_kasprintf()

Hector Martin (1):
      soc: apple: Add driver for Apple PMGR misc controls

Ioana Ciornei (4):
      soc: fsl: guts: use a macro to encode the DCFG CCSR space
      soc: fsl: guts: add a global structure to hold state
      soc: fsl: guts: add a central fsl_guts_read() function
      soc: fsl: guts: make it easier to determine on which SoC we are ru=
nning

Jay Buddhabhatti (5):
      firmware: xilinx: Use TF-A feature check for TF-A-specific APIs
      firmware: xilinx: Propagate actual error from feature check
      firmware: xilinx: Add support to clear EL3 PM state
      firmware: xilinx: Release all peripheral devices from firmware
      firmware: xilinx: Clear firmware notifiers across kexec transitions

Jian Hu (2):
      dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
      soc: amlogic: clk-measure: Add A1 and T7 support

Jingyi Wang (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
      dt-bindings: sram: Document qcom,maili-imem compatible

Jon Hunter (1):
      soc/tegra: pmc: Don't register sys-off handler for multi-socket de=
vices

Kartik Rajput (2):
      soc/tegra: fuse: Do not use fuse data as entropy source
      soc/tegra: fuse: Use device-specific instance in suspend/resume

Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      soc: qcom: llcc: Add configuration data for Shikra SoC
      dt-bindings: sram: Document qcom,shikra-imem compatible

Konrad Dybcio (5):
      soc: qcom: pmic_glink_altmode: Define the TBT extradata properly
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A16 (UX3607OA)
      soc: qcom: smem: Use 'unsigned int' instead of 'unsigned'
      soc: qcom: smem: Expose DDR data from SMEM
      soc: qcom: ubwc: Get HBB from SMEM

Konstantin Shabanov (1):
      firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14

Krzysztof Kozlowski (10):
      soc: qcom: Unify user-visible "Qualcomm" name
      dt-bindings: rockchip: pmu: Narrow definition of reboot-mode
      dt-bindings: rockchip: grf: Narrow allowed reboot modes
      dt-bindings: samsung: exynos-pmu: Restrict children with unevaluat=
edProperties
      dt-bindings: samsung: exynos-pmu: Narrow allowed reboot modes
      soc: qcom: Hide all drivers behind selectable menu
      soc: qcom: Restrict drivers per ARM/ARM64
      soc: qcom: Make important drivers default
      soc: qcom: Avoid SCM and SPM for cpuidle drivers
      dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name=
 property

Linkai Gong (1):
      soc: fsl: qe: check platform_driver_register() in qe_ic_of_init()

Luca Weiss (1):
      soc: qcom: ubwc: Add config for Milos

Manivannan Sadhasivam (1):
      soc: qcom: ice: Support IP version beyond v3

Maulik Shah (2):
      soc: qcom: qcom_stats: Remove unused macro definitions
      soc: qcom: qcom_stats: Replace CLIENT_VOTES_OFFSET macro with size=
of()

Mayur Kumar (1):
      soc: qcom: cmd-db: use C-style SPDX comment for source file

Miles Krause (1):
      memory: jz4780-nemc: Use dev_err_probe() for clock error

Mohammad Rafi Shaik (2):
      soc: qcom: pd-mapper: Add support for SA8775P
      soc: qcom: pd-mapper: Add support for QCS8300

Mukesh Ojha (8):
      dt-bindings: firmware: qcom,scm: Add minidump SRAM property
      firmware: qcom: scm: Fix missing smp_load_acquire()
      firmware: qcom: scm: use dev_err_probe() for dload address failure
      firmware: qcom: scm: Add minidump SRAM support
      firmware: qcom: scm: Fix NULL dereference in IRQ handler before __=
scm is published
      firmware: qcom: scm: Fix reserved memory cleanup on probe failure
      firmware: qcom: scm: Fix tzmem state on probe retry
      dt-bindings: sram: qcom,imem: Add minidump-sram pattern property

Nabige Aala (1):
      soc: qcom: ubwc: Add Shikra UBWC config

Pan Chuang (6):
      soc: xilinx: Remove redundant dev_err()
      soc: ixp4xx: Remove redundant dev_err()
      soc: ti: wkup_m3_ipc: Remove redundant dev_err()
      soc/tegra: cbb: Remove redundant dev_err()
      soc: fsl: dpio: Remove redundant dev_err()
      bus: fsl-mc: Remove redundant dev_err()

Paul Louvel (9):
      soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade hand=
ler
      dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support in=
terrupt type encoding
      dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
      soc: fsl: qe: Use generic_handle_domain_irq()
      soc: fsl: qe: Iterate over all pending interrupts in cascade handl=
er
      soc: fsl: qe: Handle spurious interrupts
      soc: fsl: qe: Convert to generic IRQ chip
      soc: fsl: qe: Rename irq variable to parent_irq
      soc: fsl: qe: Add support of IRQs in QE GPIO

Pawel Zalewski (The Capable Hub) (1):
      bus: fsl-mc: drop unused assignment of acpi_device_id::driver_data

Pengpeng Hou (10):
      firmware: ti_sci: Undo list publication on populate failure
      soc: amlogic: meson-clk-measure: remove debugfs tree
      soc: apple: sart: require device link for consumers
      soc: qcom: rpmh-rsc: manage PM notifiers with devres
      bus: qcom-ebi2: use managed resources for clocks and children
      soc: ti: knav_qmss: Remove debugfs file on teardown
      soc: ixp4xx: qmgr: add missing MODULE_DEVICE_TABLE()
      soc: ixp4xx: npe: add missing MODULE_DEVICE_TABLE()
      soc: mediatek: add missing MODULE_DEVICE_TABLE()
      soc: aspeed: add missing MODULE_DEVICE_TABLE()

Randy Dunlap (2):
      soc: fsl: fix kernel-doc warnings and typos
      soc: fsl: dpio: fix kernel-doc typos

Rosen Penev (1):
      firmware: arm_scmi: Simplify notification allocations

Roy Pledge (1):
      MAINTAINERS: Update drivers/soc/fsl/dpio maintainer

Ruoyu Wang (2):
      memory: stm32_omm: initialize ret in stm32_omm_set_amcr
      bus: qcom-ebi2: Fix clock leak on probe failure

Sanghoon Bae (1):
      dt-bindings: soc: samsung: exynos-sysreg: Add hsi0 for ExynosAutov=
920

Sasha Finkelstein (1):
      dt-bindings: soc: apple: Add Apple PMGR misc controls

Sasha Levin (1):
      soc/tegra: Add PM dependency to SOC_TEGRA_PMC Kconfig

Shawn Guo (1):
      dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel

Sneh Mankad (1):
      soc: qcom: qcom_stats: Add SoCCP and DCP subsystems stats

Sudeep Holla (19):
      firmware: arm_scmi: Publish channel state before callbacks
      firmware: arm_scmi: Unregister device notifier before IDR teardown
      firmware: arm_scmi: Quiesce notifications before teardown
      firmware: arm_scmi: Clean up channels on setup failure
      firmware: arm_scmi: Free transport channel on IDR failure
      firmware: arm_scmi: Avoid IDR updates while cleaning channels
      firmware: arm_scmi: Reject out of range DT protocol IDs
      firmware: arm_scmi: Use channel ID for transport teardown
      firmware: arm_scmi: Protect device request lookup with RCU
      firmware: arm_scmi: Drop handle on protocol bind failures
      firmware: arm_scmi: Clear SystemPower flag on create failure
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Unwind TX receiver mailbox setup failure
      firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
      firmware: arm_scmi: Fix SCMI device destroy lifetimes
      firmware: arm_scmi: Fix transport device teardown lookup
      firmware: arm_scmi: Fix requested device removal race
      firmware: arm_scmi: Roll back partial protocol table registration
      firmware: arm_scmi: Unrequest devices if driver registration fails

Sumit Garg (7):
      firmware: qcom: Add a generic PAS service
      firmware: qcom_scm: Migrate to generic PAS service
      firmware: qcom: Add a PAS TEE service
      MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
      drm/msm: Switch to generic PAS TZ APIs
      net: ipa: Switch to generic PAS TZ APIs
      media: qcom: Switch to generic PAS TZ APIs

Sumit Gupta (1):
      memory: tegra: add multi-socket support to the memory interconnect

Uwe Kleine-K=C3=B6nig (The Capable Hub) (1):
      tee: qcomtee: Drop unused assignment of platform_device_id driver =
data

Viken Dadhaniya (1):
      soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size

Vladimir Oltean (5):
      soc: fsl: guts: perform fsl_guts_init() error teardown in reverse =
order of setup
      soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
      dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region
      soc: fsl: guts: implement the RCW override procedure
      phy: lynx-10g: use RCW override procedure for dynamic protocol cha=
nge

Weigang He (1):
      soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_=
pmu_regmap()

Yuho Choi (1):
      bus: ti-sysc: Fix /chosen node reference leak

Yuvaraj Ranganathan (2):
      firmware: qcom: scm: add trace events for the SMC call interface
      firmware: qcom: scm: instrument SMC call path with tracepoints

 .mailmap                                           |    6 +-
 Documentation/ABI/testing/debugfs-vfio             |   26 +
 .../ABI/testing/sysfs-bus-pci-drivers-xhci_hcd     |    2 +-
 Documentation/arch/arm64/cpu-hotplug.rst           |   28 +-
 Documentation/arch/riscv/hwprobe.rst               |  204 ++--
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |    8 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    9 +
 .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   |   84 ++
 .../interrupt-controller/fsl,qe-ports-ic.yaml      |    4 +-
 .../devicetree/bindings/riscv/extensions.yaml      |  184 ++--
 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |    2 +
 .../bindings/soc/apple/apple,t6000-pmgr-misc.yaml  |   45 +
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          |   26 +-
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml      |   15 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    2 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |    1 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |    1 +
 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   |    4 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    7 +-
 .../bindings/soc/samsung/exynos-pmu.yaml           |   27 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    1 +
 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   |    4 +-
 .../devicetree/bindings/sram/qcom,imem.yaml        |   16 +
 Documentation/devicetree/bindings/sram/sram.yaml   |    2 +
 Documentation/filesystems/smb/ksmbd.rst            |    4 +-
 Documentation/hwmon/ltc4283.rst                    |    4 +-
 .../process/embargoed-hardware-issues.rst          |    2 +-
 Documentation/sound/codecs/tas675x.rst             |   11 +-
 .../sp_SP/process/embargoed-hardware-issues.rst    |    2 +-
 MAINTAINERS                                        |   41 +-
 Makefile                                           |    2 +-
 arch/arm/mach-omap2/board-generic.c                |    1 -
 arch/arm64/include/asm/tlbbatch.h                  |   10 +-
 arch/arm64/include/asm/tlbflush.h                  |   49 +-
 arch/arm64/kernel/acpi.c                           |    2 +
 arch/arm64/kernel/fpsimd.c                         |   10 +-
 arch/arm64/kernel/process.c                        |   35 -
 arch/arm64/kernel/smp.c                            |   28 +-
 arch/arm64/mm/mmu.c                                |   11 +-
 arch/arm64/net/bpf_jit_comp.c                      |    4 +-
 arch/arm64/tools/sysreg                            |    2 +-
 arch/loongarch/kvm/main.c                          |    1 +
 arch/loongarch/net/bpf_jit.c                       |    5 +-
 arch/m68k/coldfire/m523x.c                         |    2 +-
 arch/m68k/coldfire/m528x.c                         |    6 +-
 arch/mips/configs/cu1000-neo_defconfig             |    2 +-
 arch/mips/configs/cu1830-neo_defconfig             |    2 +-
 arch/mips/configs/gcw0_defconfig                   |    2 +-
 arch/mips/dec/platform.c                           |    6 +-
 arch/mips/include/asm/cdmm.h                       |    2 +-
 arch/mips/include/asm/irq_work.h                   |    9 +
 arch/mips/include/asm/smp.h                        |    2 +
 arch/mips/lantiq/xway/dcdc.c                       |    1 -
 arch/mips/lantiq/xway/gptu.c                       |    1 -
 arch/mips/lantiq/xway/vmmc.c                       |    1 -
 arch/mips/loongson64/smp.c                         |   10 +
 arch/mips/mm/init.c                                |    5 +-
 arch/mips/pci/pci-rt2880.c                         |    1 -
 arch/mips/ralink/timer.c                           |    1 -
 arch/mips/vdso/elf.S                               |    3 +
 arch/parisc/include/asm/hardware.h                 |    4 +-
 arch/parisc/include/asm/parisc-device.h            |    1 +
 arch/parisc/include/asm/ptrace.h                   |    1 +
 arch/powerpc/net/bpf_jit_comp.c                    |    4 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c     |    1 -
 arch/powerpc/platforms/86xx/common.c               |    1 -
 arch/powerpc/platforms/Kconfig                     |    8 -
 arch/powerpc/sysdev/fsl_lbc.c                      |    1 -
 arch/powerpc/sysdev/fsl_pmc.c                      |    1 -
 arch/riscv/Kconfig                                 |    3 +-
 arch/riscv/Kconfig.socs                            |    6 +
 arch/riscv/configs/defconfig                       |    1 +
 arch/riscv/kernel/asm-offsets.c                    |    4 +-
 arch/riscv/kernel/entry.S                          |    8 +-
 arch/riscv/kernel/machine_kexec.c                  |    3 +
 arch/riscv/kernel/probes/rethook_trampoline.S      |    3 +
 arch/riscv/kernel/smpboot.c                        |    5 +-
 arch/riscv/kernel/vdso/note.S                      |    3 +
 arch/riscv/net/bpf_jit_comp64.c                    |    2 +-
 arch/riscv/net/bpf_jit_core.c                      |    3 +-
 arch/s390/include/asm/ccwdev.h                     |    2 +-
 arch/s390/kernel/diag/diag310.c                    |    7 +-
 arch/s390/kernel/vdso/note.S                       |    3 +
 arch/s390/mm/mmap.c                                |    2 +-
 arch/sh/drivers/platform_early.c                   |    2 +-
 arch/sparc/crypto/crop_devid.c                     |    2 +-
 arch/sparc/kernel/of_device_32.c                   |    1 -
 arch/sparc/kernel/of_device_64.c                   |    1 -
 arch/sparc/kernel/of_device_common.c               |    1 -
 arch/x86/events/amd/brs.c                          |   10 +-
 arch/x86/events/amd/core.c                         |   12 +-
 arch/x86/events/amd/lbr.c                          |    3 +-
 arch/x86/include/asm/cpu_device_id.h               |    5 +-
 arch/x86/include/asm/nospec-branch.h               |    4 +
 arch/x86/kernel/cpu/bugs.c                         |   50 +-
 arch/x86/kernel/cpu/resctrl/monitor.c              |    5 +
 arch/x86/kernel/uprobes.c                          |   26 +-
 arch/x86/kvm/svm/svm.c                             |    1 -
 arch/x86/kvm/vmx/vmx.c                             |    1 -
 arch/x86/net/bpf_jit_comp.c                        |    5 +-
 arch/x86/video/video-common.c                      |   23 +-
 arch/x86/virt/svm/sev.c                            |    2 +
 arch/x86/xen/mmu_pv.c                              |   15 +-
 block/blk-mq.c                                     |    3 +-
 block/blk-wbt.c                                    |   21 +-
 block/blk-zoned.c                                  |   42 +-
 block/blk.h                                        |    4 +-
 block/genhd.c                                      |    6 +-
 drivers/accel/amdxdna/aie2_ctx.c                   |   87 +-
 drivers/accel/amdxdna/aie2_message.c               |    4 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |   56 +-
 drivers/accel/amdxdna/amdxdna_ctx.h                |    1 +
 drivers/accel/amdxdna/amdxdna_gem.c                |   50 +-
 drivers/accel/amdxdna/amdxdna_gem.h                |   12 +-
 drivers/accel/amdxdna/amdxdna_iommu.c              |   43 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   59 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |    1 +
 drivers/accel/ethosu/ethosu_drv.c                  |    1 -
 drivers/accel/qaic/qaic_timesync.c                 |    1 -
 drivers/accel/qaic/sahara.c                        |    1 -
 drivers/acpi/acpi_tad.c                            |    2 +-
 drivers/acpi/acpica/acutils.h                      |    2 -
 drivers/acpi/acpica/utnonansi.c                    |   16 -
 drivers/acpi/riscv/rimt.c                          |    7 +-
 drivers/android/binder.c                           |   31 +-
 drivers/android/binder/allocation.rs               |    5 +-
 drivers/android/binder/error.rs                    |   13 +-
 drivers/android/binder/freeze.rs                   |   11 +-
 drivers/android/binder/node.rs                     |   10 +-
 drivers/android/binder/process.rs                  |   18 +-
 drivers/android/binder/rust_binder_events.c        |    7 +-
 drivers/android/binder/stats.rs                    |    4 +-
 drivers/android/binder/thread.rs                   |   65 +-
 drivers/android/binder/transaction.rs              |   15 +-
 drivers/ata/ahci_platform.c                        |    1 -
 drivers/ata/ahci_sunxi.c                           |    1 -
 drivers/ata/libata-core.c                          |   25 +-
 drivers/ata/libata-scsi.c                          |    9 +-
 drivers/ata/libata.h                               |    9 +
 drivers/ata/pata_buddha.c                          |    1 -
 drivers/ata/pata_ep93xx.c                          |    1 -
 drivers/ata/pata_imx.c                             |    1 -
 drivers/ata/pata_pxa.c                             |    1 +
 drivers/ata/sata_gemini.c                          |    2 +-
 drivers/auxdisplay/arm-charlcd.c                   |    1 -
 drivers/auxdisplay/hd44780.c                       |    1 -
 drivers/auxdisplay/lcd2s.c                         |    1 -
 drivers/auxdisplay/max6959.c                       |    1 -
 drivers/auxdisplay/seg-led-gpio.c                  |    1 -
 drivers/block/drbd/drbd_receiver.c                 |    5 +
 drivers/block/floppy.c                             |    2 +-
 drivers/block/ublk_drv.c                           |   13 +-
 drivers/block/xen-blkfront.c                       |    9 +
 drivers/bluetooth/bpa10x.c                         |    8 +-
 drivers/bluetooth/btintel_pcie.c                   |  102 +-
 drivers/bluetooth/btnxpuart.c                      |    6 +
 drivers/bluetooth/hci_h5.c                         |    1 -
 drivers/bluetooth/hci_ldisc.c                      |   14 +-
 drivers/bluetooth/hci_qca.c                        |    1 -
 drivers/bus/fsl-mc/dprc-driver.c                   |    6 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c                    |    6 +-
 drivers/bus/mhi/ep/main.c                          |    1 -
 drivers/bus/mhi/host/init.c                        |    1 -
 drivers/bus/qcom-ebi2.c                            |   44 +-
 drivers/bus/ti-sysc.c                              |   12 +-
 drivers/cache/hisi_soc_hha.c                       |    1 -
 drivers/cdx/controller/cdx_controller.c            |    1 -
 drivers/char/hw_random/airoha-trng.c               |    1 -
 drivers/char/hw_random/atmel-rng.c                 |    1 -
 drivers/char/hw_random/ba431-rng.c                 |    1 -
 drivers/char/hw_random/bcm74110-rng.c              |    1 -
 drivers/char/hw_random/exynos-trng.c               |    1 -
 drivers/char/hw_random/histb-rng.c                 |    1 -
 drivers/char/hw_random/imx-rngc.c                  |    1 -
 drivers/char/hw_random/ingenic-trng.c              |    1 -
 drivers/char/hw_random/iproc-rng200.c              |    1 -
 drivers/char/hw_random/pasemi-rng.c                |    1 -
 drivers/char/hw_random/pic32-rng.c                 |    1 -
 drivers/char/hw_random/powernv-rng.c               |    1 -
 drivers/char/hw_random/xgene-rng.c                 |    1 -
 drivers/char/hw_random/xilinx-trng.c               |    1 -
 drivers/char/hw_random/xiphera-trng.c              |    1 -
 drivers/char/tpm/tpm-dev.c                         |    2 +-
 drivers/char/tpm/tpmrm-dev.c                       |    2 +-
 drivers/clk/aspeed/clk-ast2600.c                   |    1 -
 drivers/clk/aspeed/clk-ast2700.c                   |    1 -
 drivers/clk/clk-axi-clkgen.c                       |    1 -
 drivers/clk/clk-bm1880.c                           |    1 -
 drivers/clk/clk-cdce706.c                          |    1 -
 drivers/clk/clk-eyeq.c                             |    1 -
 drivers/clk/clk-renesas-pcie.c                     |    1 -
 drivers/clk/clk-si521xx.c                          |    1 -
 drivers/clk/clk-versaclock5.c                      |    1 -
 drivers/clk/imx/clk-imx8mp-audiomix.c              |    1 -
 drivers/clk/mediatek/clk-mt2701-g3d.c              |    1 -
 drivers/clk/mediatek/clk-mt2701.c                  |    1 -
 drivers/clk/mediatek/clk-mt2712.c                  |    1 -
 drivers/clk/mediatek/clk-mt6765.c                  |    1 -
 drivers/clk/mediatek/clk-mt6779-aud.c              |    1 -
 drivers/clk/mediatek/clk-mt7622-eth.c              |    1 -
 drivers/clk/mediatek/clk-mt7622-hif.c              |    1 -
 drivers/clk/mediatek/clk-mt7622.c                  |    1 -
 drivers/clk/mediatek/clk-mt7629-hif.c              |    1 -
 drivers/clk/mediatek/clk-mt7981-apmixed.c          |    1 -
 drivers/clk/mediatek/clk-mt7981-eth.c              |    1 -
 drivers/clk/mediatek/clk-mt7981-infracfg.c         |    1 -
 drivers/clk/mediatek/clk-mt7981-topckgen.c         |    1 -
 drivers/clk/mediatek/clk-mt7986-apmixed.c          |    1 -
 drivers/clk/mediatek/clk-mt7986-eth.c              |    1 -
 drivers/clk/mediatek/clk-mt7986-infracfg.c         |    1 -
 drivers/clk/mediatek/clk-mt7986-topckgen.c         |    1 -
 drivers/clk/mediatek/clk-mt8167-aud.c              |    1 -
 drivers/clk/mediatek/clk-mt8167-img.c              |    1 -
 drivers/clk/mediatek/clk-mt8167-mfgcfg.c           |    1 -
 drivers/clk/mediatek/clk-mt8167-mm.c               |    1 -
 drivers/clk/mediatek/clk-mt8167-vdec.c             |    1 -
 drivers/clk/mediatek/clk-mt8173-mm.c               |    1 -
 drivers/clk/mediatek/clk-mt8183.c                  |    1 -
 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c    |    1 -
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c       |    1 -
 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c     |    1 -
 drivers/clk/mediatek/clk-mt8188-topckgen.c         |    1 -
 drivers/clk/mediatek/clk-mt8188-vdo0.c             |    1 -
 drivers/clk/mediatek/clk-mt8188-vdo1.c             |    1 -
 drivers/clk/mediatek/clk-mt8188-venc.c             |    1 -
 drivers/clk/mediatek/clk-mt8188-wpe.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-cam.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-img.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c     |    1 -
 drivers/clk/mediatek/clk-mt8192-ipe.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-mdp.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-mfg.c              |    1 -
 drivers/clk/mediatek/clk-mt8192-msdc.c             |    1 -
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c         |    1 -
 drivers/clk/mediatek/clk-mt8192-vdec.c             |    1 -
 drivers/clk/mediatek/clk-mt8192-venc.c             |    1 -
 drivers/clk/mediatek/clk-mt8192.c                  |    1 -
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c       |    1 -
 drivers/clk/mediatek/clk-mt8195-topckgen.c         |    1 -
 drivers/clk/mediatek/clk-mt8365.c                  |    1 -
 drivers/clk/mediatek/clk-mt8516-aud.c              |    1 -
 drivers/clk/meson/a1-peripherals.c                 |    1 -
 drivers/clk/meson/a1-pll.c                         |    1 -
 drivers/clk/meson/axg.c                            |    1 -
 drivers/clk/meson/gxbb.c                           |    1 -
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |    1 -
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |    1 -
 drivers/clk/qcom/camcc-kaanapali.c                 |    1 -
 drivers/clk/qcom/camcc-milos.c                     |    1 -
 drivers/clk/qcom/camcc-qcs615.c                    |    1 -
 drivers/clk/qcom/camcc-sa8775p.c                   |    1 -
 drivers/clk/qcom/camcc-sc7180.c                    |    1 -
 drivers/clk/qcom/camcc-sc7280.c                    |    1 -
 drivers/clk/qcom/camcc-sc8180x.c                   |    1 -
 drivers/clk/qcom/camcc-sc8280xp.c                  |    1 -
 drivers/clk/qcom/camcc-sdm845.c                    |    1 -
 drivers/clk/qcom/camcc-sm4450.c                    |    1 -
 drivers/clk/qcom/camcc-sm6350.c                    |    1 -
 drivers/clk/qcom/camcc-sm7150.c                    |    1 -
 drivers/clk/qcom/camcc-sm8150.c                    |    1 -
 drivers/clk/qcom/camcc-sm8250.c                    |    1 -
 drivers/clk/qcom/camcc-sm8450.c                    |    1 -
 drivers/clk/qcom/camcc-sm8550.c                    |    1 -
 drivers/clk/qcom/camcc-sm8650.c                    |    1 -
 drivers/clk/qcom/camcc-sm8750.c                    |    1 -
 drivers/clk/qcom/camcc-x1e80100.c                  |    1 -
 drivers/clk/qcom/camcc-x1p42100.c                  |    1 -
 drivers/clk/qcom/dispcc-eliza.c                    |    1 -
 drivers/clk/qcom/dispcc-glymur.c                   |    1 -
 drivers/clk/qcom/dispcc-kaanapali.c                |    1 -
 drivers/clk/qcom/dispcc-milos.c                    |    1 -
 drivers/clk/qcom/dispcc-qcm2290.c                  |    1 -
 drivers/clk/qcom/dispcc-qcs615.c                   |    1 -
 drivers/clk/qcom/dispcc-sc7180.c                   |    1 -
 drivers/clk/qcom/dispcc-sc7280.c                   |    1 -
 drivers/clk/qcom/dispcc-sc8280xp.c                 |    1 -
 drivers/clk/qcom/dispcc-sdm845.c                   |    1 -
 drivers/clk/qcom/dispcc-sm4450.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6115.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6125.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6350.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6375.c                   |    1 -
 drivers/clk/qcom/dispcc-sm7150.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8250.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8450.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8550.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8750.c                   |    1 -
 drivers/clk/qcom/dispcc-x1e80100.c                 |    1 -
 drivers/clk/qcom/dispcc0-sa8775p.c                 |    1 -
 drivers/clk/qcom/dispcc1-sa8775p.c                 |    1 -
 drivers/clk/qcom/ecpricc-qdu1000.c                 |    1 -
 drivers/clk/qcom/gcc-eliza.c                       |    1 -
 drivers/clk/qcom/gcc-glymur.c                      |    1 -
 drivers/clk/qcom/gcc-hawi.c                        |    1 -
 drivers/clk/qcom/gcc-ipq5018.c                     |    1 -
 drivers/clk/qcom/gcc-ipq5332.c                     |    1 -
 drivers/clk/qcom/gcc-kaanapali.c                   |    1 -
 drivers/clk/qcom/gcc-milos.c                       |    1 -
 drivers/clk/qcom/gcc-nord.c                        |    1 -
 drivers/clk/qcom/gcc-qcs615.c                      |    1 -
 drivers/clk/qcom/gcc-qcs8300.c                     |    1 -
 drivers/clk/qcom/gcc-sa8775p.c                     |    1 -
 drivers/clk/qcom/gcc-sdx75.c                       |    1 -
 drivers/clk/qcom/gcc-sm4450.c                      |    1 -
 drivers/clk/qcom/gcc-sm7150.c                      |    1 -
 drivers/clk/qcom/gcc-sm8650.c                      |    1 -
 drivers/clk/qcom/gcc-sm8750.c                      |    1 -
 drivers/clk/qcom/gcc-x1e80100.c                    |    1 -
 drivers/clk/qcom/gpucc-glymur.c                    |    1 -
 drivers/clk/qcom/gpucc-kaanapali.c                 |    1 -
 drivers/clk/qcom/gpucc-milos.c                     |    1 -
 drivers/clk/qcom/gpucc-msm8998.c                   |    1 -
 drivers/clk/qcom/gpucc-qcm2290.c                   |    1 -
 drivers/clk/qcom/gpucc-qcs615.c                    |    1 -
 drivers/clk/qcom/gpucc-sa8775p.c                   |    1 -
 drivers/clk/qcom/gpucc-sar2130p.c                  |    1 -
 drivers/clk/qcom/gpucc-sc7180.c                    |    1 -
 drivers/clk/qcom/gpucc-sc7280.c                    |    1 -
 drivers/clk/qcom/gpucc-sc8280xp.c                  |    1 -
 drivers/clk/qcom/gpucc-sdm660.c                    |    1 -
 drivers/clk/qcom/gpucc-sdm845.c                    |    1 -
 drivers/clk/qcom/gpucc-sm4450.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6115.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6125.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6350.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6375.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8150.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8250.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8350.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8450.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8550.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8650.c                    |    1 -
 drivers/clk/qcom/gpucc-sm8750.c                    |    1 -
 drivers/clk/qcom/gpucc-x1e80100.c                  |    1 -
 drivers/clk/qcom/gpucc-x1p42100.c                  |    1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c              |    1 -
 drivers/clk/qcom/ipq-cmn-pll.c                     |    1 -
 drivers/clk/qcom/lpasscc-sc8280xp.c                |    1 -
 drivers/clk/qcom/lpasscc-sm6115.c                  |    1 -
 drivers/clk/qcom/mmcc-apq8084.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8960.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8974.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8994.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8996.c                    |    1 -
 drivers/clk/qcom/mmcc-msm8998.c                    |    1 -
 drivers/clk/qcom/mmcc-sdm660.c                     |    1 -
 drivers/clk/qcom/negcc-nord.c                      |    1 -
 drivers/clk/qcom/nwgcc-nord.c                      |    1 -
 drivers/clk/qcom/segcc-nord.c                      |    1 -
 drivers/clk/qcom/tcsrcc-eliza.c                    |    1 -
 drivers/clk/qcom/tcsrcc-glymur.c                   |    1 -
 drivers/clk/qcom/tcsrcc-hawi.c                     |    1 -
 drivers/clk/qcom/tcsrcc-nord.c                     |    1 -
 drivers/clk/qcom/tcsrcc-sm8650.c                   |    1 -
 drivers/clk/qcom/tcsrcc-sm8750.c                   |    1 -
 drivers/clk/qcom/tcsrcc-x1e80100.c                 |    1 -
 drivers/clk/qcom/videocc-glymur.c                  |    1 -
 drivers/clk/qcom/videocc-kaanapali.c               |    1 -
 drivers/clk/qcom/videocc-milos.c                   |    1 -
 drivers/clk/qcom/videocc-qcs615.c                  |    1 -
 drivers/clk/qcom/videocc-sa8775p.c                 |    1 -
 drivers/clk/qcom/videocc-sm7150.c                  |    1 -
 drivers/clk/qcom/videocc-sm8450.c                  |    1 -
 drivers/clk/qcom/videocc-sm8550.c                  |    1 -
 drivers/clk/qcom/videocc-sm8750.c                  |    1 -
 drivers/clk/qcom/videocc-x1p42100.c                |    1 -
 drivers/clk/renesas/clk-vbattb.c                   |    1 -
 drivers/clk/renesas/renesas-cpg-mssr.c             |    1 -
 drivers/clk/renesas/rzg2l-cpg.c                    |    1 -
 drivers/clk/renesas/rzv2h-cpg.c                    |    1 -
 drivers/clk/samsung/clk-exynos-audss.c             |    1 -
 drivers/clk/samsung/clk-exynos-clkout.c            |    1 -
 drivers/clk/samsung/clk-exynos2200.c               |    1 -
 drivers/clk/samsung/clk-exynos3250.c               |    1 -
 drivers/clk/samsung/clk-exynos4.c                  |    1 -
 drivers/clk/samsung/clk-exynos4412-isp.c           |    1 -
 drivers/clk/samsung/clk-exynos5-subcmu.c           |    1 -
 drivers/clk/samsung/clk-exynos5250.c               |    1 -
 drivers/clk/samsung/clk-exynos5420.c               |    1 -
 drivers/clk/samsung/clk-exynos5433.c               |    1 -
 drivers/clk/samsung/clk-exynos7870.c               |    1 -
 drivers/clk/samsung/clk-exynos7885.c               |    1 -
 drivers/clk/samsung/clk-exynos850.c                |    1 -
 drivers/clk/samsung/clk-exynos8895.c               |    1 -
 drivers/clk/samsung/clk-exynos990.c                |    1 -
 drivers/clk/samsung/clk-exynosautov9.c             |    1 -
 drivers/clk/samsung/clk-exynosautov920.c           |    1 -
 drivers/clk/samsung/clk-fsd.c                      |    1 -
 drivers/clk/samsung/clk-gs101.c                    |    1 -
 drivers/clk/samsung/clk-s5pv210-audss.c            |    1 -
 drivers/clk/samsung/clk.c                          |    1 -
 drivers/clk/sprd/ums512-clk.c                      |    1 -
 drivers/clk/starfive/clk-starfive-jh7100-audio.c   |    1 -
 drivers/clk/starfive/clk-starfive-jh7100.c         |    1 -
 drivers/clk/tegra/clk-device.c                     |    1 -
 drivers/clk/xilinx/xlnx_vcu.c                      |    1 -
 drivers/counter/interrupt-cnt.c                    |    1 -
 drivers/counter/stm32-lptimer-cnt.c                |    1 -
 drivers/counter/stm32-timer-cnt.c                  |    1 -
 drivers/counter/ti-ecap-capture.c                  |    1 -
 drivers/counter/ti-eqep.c                          |    1 -
 drivers/cpufreq/amd_freq_sensitivity.c             |    1 -
 drivers/cpufreq/armada-37xx-cpufreq.c              |    1 -
 drivers/cpuidle/Kconfig.arm                        |    4 +-
 drivers/crypto/atmel-aes.c                         |    1 -
 drivers/crypto/atmel-sha.c                         |    1 -
 drivers/crypto/atmel-tdes.c                        |    1 -
 drivers/crypto/hifn_795x.c                         |    1 -
 drivers/crypto/img-hash.c                          |    1 -
 .../crypto/intel/keembay/keembay-ocs-hcu-core.c    |    1 -
 drivers/crypto/qce/core.c                          |    1 -
 drivers/crypto/starfive/jh7110-cryp.c              |    1 -
 drivers/crypto/talitos.c                           |    1 -
 drivers/crypto/tegra/tegra-se-main.c               |    1 -
 drivers/crypto/ti/dthev2-common.c                  |    1 -
 drivers/crypto/xilinx/zynqmp-aes-gcm.c             |    1 -
 drivers/devfreq/hisi_uncore_freq.c                 |    1 -
 drivers/devfreq/imx8m-ddrc.c                       |    1 -
 drivers/dibs/dibs_loopback.c                       |    5 +
 drivers/dma-buf/dma-fence-unwrap.c                 |    3 +
 drivers/dma-buf/dma-fence.c                        |    6 +-
 drivers/dma/amd/qdma/qdma.c                        |    1 -
 drivers/dma/ep93xx_dma.c                           |    1 -
 drivers/dma/qcom/hidma.c                           |    1 -
 drivers/dma/sf-pdma/sf-pdma.c                      |    1 -
 drivers/dma/xgene-dma.c                            |    1 -
 drivers/dma/xilinx/xdma.c                          |    1 -
 drivers/dpll/zl3073x/dpll.c                        |    1 -
 drivers/edac/fsl_ddr_edac.c                        |    1 -
 drivers/edac/mpc85xx_edac.c                        |    1 -
 drivers/edac/pnd2_edac.c                           |    1 -
 drivers/edac/sb_edac.c                             |    1 -
 drivers/extcon/extcon-intel-cht-wc.c               |    1 -
 drivers/extcon/extcon-intel-mrfld.c                |    1 -
 drivers/extcon/extcon-max14526.c                   |    1 -
 drivers/extcon/extcon-max3355.c                    |    1 -
 drivers/extcon/extcon-qcom-spmi-misc.c             |    1 -
 drivers/extcon/extcon-usb-gpio.c                   |    1 -
 drivers/firewire/core-device.c                     |    1 -
 drivers/firewire/net.c                             |    1 -
 drivers/firewire/sbp2.c                            |    1 -
 drivers/firmware/arm_scmi/bus.c                    |  182 ++--
 drivers/firmware/arm_scmi/common.h                 |    2 +
 drivers/firmware/arm_scmi/driver.c                 |   81 +-
 drivers/firmware/arm_scmi/notify.c                 |   64 +-
 drivers/firmware/arm_scmi/notify.h                 |    1 +
 drivers/firmware/arm_scmi/transports/mailbox.c     |   26 +-
 drivers/firmware/arm_scmi/transports/smc.c         |   15 +-
 drivers/firmware/google/cbmem.c                    |    2 +-
 drivers/firmware/google/coreboot_table.c           |    2 +-
 drivers/firmware/google/framebuffer-coreboot.c     |    2 +-
 drivers/firmware/google/memconsole-coreboot.c      |    2 +-
 drivers/firmware/google/vpd.c                      |    2 +-
 drivers/firmware/qcom/Kconfig                      |   22 +-
 drivers/firmware/qcom/Makefile                     |    3 +
 drivers/firmware/qcom/qcom_pas.c                   |  298 ++++++
 drivers/firmware/qcom/qcom_pas.h                   |   50 +
 drivers/firmware/qcom/qcom_pas_tee.c               |  479 +++++++++
 drivers/firmware/qcom/qcom_scm-smc.c               |   12 +-
 drivers/firmware/qcom/qcom_scm.c                   |  499 ++++++----
 drivers/firmware/qcom/qcom_scm.h                   |    2 +-
 drivers/firmware/qcom/qcom_scm_trace.h             |  143 +++
 drivers/firmware/qcom/qcom_tzmem.c                 |   13 +-
 drivers/firmware/qemu_fw_cfg.c                     |    1 -
 drivers/firmware/ti_sci.c                          |    4 +
 drivers/firmware/xilinx/zynqmp.c                   |  108 ++-
 drivers/fpga/altera-freeze-bridge.c                |    1 -
 drivers/fpga/altera-pr-ip-core-plat.c              |    1 -
 drivers/fpga/ice40-spi.c                           |    1 -
 drivers/fpga/intel-m10-bmc-sec-update.c            |    1 -
 drivers/fpga/lattice-sysconfig-spi.c               |    1 -
 drivers/fpga/xilinx-selectmap.c                    |    1 -
 drivers/fpga/xilinx-spi.c                          |    1 -
 drivers/fsi/fsi-master-i2cr.c                      |    1 -
 drivers/fsi/fsi-scom.c                             |    1 -
 drivers/fsi/i2cr-scom.c                            |    1 -
 drivers/gpib/eastwood/fluke_gpib.c                 |    1 -
 drivers/gpio/gpio-74xx-mmio.c                      |    1 -
 drivers/gpio/gpio-adnp.c                           |    1 -
 drivers/gpio/gpio-aggregator.c                     |    1 -
 drivers/gpio/gpio-altera-a10sr.c                   |    1 -
 drivers/gpio/gpio-altera.c                         |    1 -
 drivers/gpio/gpio-ath79.c                          |    1 -
 drivers/gpio/gpio-bcm-kona.c                       |    1 -
 drivers/gpio/gpio-by-pinctrl.c                     |    1 -
 drivers/gpio/gpio-cros-ec.c                        |    1 -
 drivers/gpio/gpio-dwapb.c                          |   97 +-
 drivers/gpio/gpio-en7523.c                         |    1 -
 drivers/gpio/gpio-f7188x.c                         |    6 +-
 drivers/gpio/gpio-ge.c                             |    1 -
 drivers/gpio/gpio-graniterapids.c                  |    1 -
 drivers/gpio/gpio-hisi.c                           |    1 -
 drivers/gpio/gpio-htc-egpio.c                      |    6 +-
 drivers/gpio/gpio-idt3243x.c                       |    1 -
 drivers/gpio/gpio-latch.c                          |    1 -
 drivers/gpio/gpio-line-mux.c                       |    1 -
 drivers/gpio/gpio-ltc4283.c                        |    1 -
 drivers/gpio/gpio-max7360.c                        |    1 -
 drivers/gpio/gpio-max77759.c                       |    1 -
 drivers/gpio/gpio-mb86s7x.c                        |    1 -
 drivers/gpio/gpio-mlxbf2.c                         |    1 -
 drivers/gpio/gpio-mmio.c                           |    1 -
 drivers/gpio/gpio-mockup.c                         |    1 -
 drivers/gpio/gpio-mpc8xxx.c                        |    1 -
 drivers/gpio/gpio-mpfs.c                           |    1 -
 drivers/gpio/gpio-mt7621.c                         |   25 +-
 drivers/gpio/gpio-mvebu.c                          |    6 +-
 drivers/gpio/gpio-nomadik.c                        |    1 -
 drivers/gpio/gpio-palmas.c                         |   19 +
 drivers/gpio/gpio-pca953x.c                        |    1 -
 drivers/gpio/gpio-pcf857x.c                        |    1 -
 drivers/gpio/gpio-qixis-fpga.c                     |    1 -
 drivers/gpio/gpio-realtek-otto.c                   |    1 -
 drivers/gpio/gpio-shared-proxy.c                   |  137 ++-
 drivers/gpio/gpio-sim.c                            |    1 -
 drivers/gpio/gpio-sl28cpld.c                       |    1 -
 drivers/gpio/gpio-sloppy-logic-analyzer.c          |    1 -
 drivers/gpio/gpio-sprd.c                           |    1 -
 drivers/gpio/gpio-timberdale.c                     |    2 +-
 drivers/gpio/gpio-tn48m.c                          |    1 -
 drivers/gpio/gpio-virtuser.c                       |    1 -
 drivers/gpio/gpio-wcd934x.c                        |    1 -
 drivers/gpio/gpio-xgene-sb.c                       |    1 -
 drivers/gpio/gpio-xra1403.c                        |    1 -
 drivers/gpio/gpio-zevio.c                          |    1 -
 drivers/gpio/gpiolib-shared.c                      |    9 +-
 drivers/gpio/gpiolib-shared.h                      |   31 +-
 drivers/gpu/buddy.c                                |   63 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   85 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    9 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   22 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   78 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   69 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c             |   24 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    3 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    6 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   55 ++
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   28 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   15 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   10 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    6 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   25 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    2 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   37 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   10 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   16 +-
 .../gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.h |   62 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |   15 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.h    |    3 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    5 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    |   30 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    2 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   26 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   11 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   15 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   28 +-
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |    1 +
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c   |    3 +-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |    6 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |   14 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   22 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    1 -
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    4 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |    1 -
 drivers/gpu/drm/bridge/inno-hdmi.c                 |    1 -
 drivers/gpu/drm/bridge/ssd2825.c                   |    1 -
 drivers/gpu/drm/bridge/tc358762.c                  |    1 -
 drivers/gpu/drm/bridge/tc358764.c                  |    1 -
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c            |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |    4 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   92 +-
 drivers/gpu/drm/drm_ioctl.c                        |   14 +-
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    1 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |    1 -
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    1 -
 drivers/gpu/drm/i915/display/intel_bios.c          |   36 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |    8 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   12 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |    3 -
 drivers/gpu/drm/i915/display/intel_vrr.c           |    4 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   24 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   19 +-
 drivers/gpu/drm/i915/i915_active.c                 |    7 +-
 drivers/gpu/drm/imagination/pvr_context.c          |   22 +-
 drivers/gpu/drm/imagination/pvr_drv.c              |   20 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |    2 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |    6 +-
 drivers/gpu/drm/imagination/pvr_queue.h            |    2 +-
 drivers/gpu/drm/imagination/pvr_vm.c               |    6 +-
 drivers/gpu/drm/imx/dc/dc-cf.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-de.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-drv.c                    |    1 -
 drivers/gpu/drm/imx/dc/dc-ed.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-fg.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-fl.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-fw.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-lb.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-pe.c                     |    1 -
 drivers/gpu/drm/imx/dc/dc-tc.c                     |    1 -
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    1 -
 drivers/gpu/drm/mediatek/mtk_cec.c                 |    1 -
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |    1 -
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    1 -
 drivers/gpu/drm/msm/Kconfig                        |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |    4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   11 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |   31 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c        |    1 -
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |    1 -
 drivers/gpu/drm/panel/panel-boe-td4320.c           |    1 -
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |    1 -
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |    1 -
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       |    1 -
 drivers/gpu/drm/panel/panel-himax-hx83121a.c       |    1 -
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |    1 -
 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c       |    1 -
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    1 -
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c  |    1 -
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c          |    1 -
 drivers/gpu/drm/panel/panel-motorola-mot.c         |    1 -
 drivers/gpu/drm/panel/panel-novatek-nt35532.c      |    1 -
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      |    1 -
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |    1 -
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      |    1 -
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |    1 -
 drivers/gpu/drm/panel/panel-renesas-r61307.c       |    1 -
 drivers/gpu/drm/panel/panel-renesas-r69328.c       |    1 -
 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c   |    1 -
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |    1 -
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    1 -
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |    1 -
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   |    1 -
 .../gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c  |    1 -
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    1 -
 drivers/gpu/drm/panel/panel-summit.c               |    1 -
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    1 -
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c     |    1 -
 drivers/gpu/drm/panthor/panthor_device.c           |    4 +
 drivers/gpu/drm/panthor/panthor_device.h           |   17 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |    6 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |    3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |    9 +-
 drivers/gpu/drm/panthor/panthor_pwr.c              |   10 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |  106 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c     |    1 -
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c   |    1 -
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c      |    1 -
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    1 -
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    1 -
 drivers/gpu/drm/sprd/sprd_drm.c                    |    1 -
 drivers/gpu/drm/sti/sti_hda.c                      |    1 -
 drivers/gpu/drm/stm/drv.c                          |    1 -
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |    1 -
 drivers/gpu/drm/sun4i/sun6i_drc.c                  |    1 -
 drivers/gpu/drm/tests/drm_exec_test.c              |   24 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    1 -
 drivers/gpu/drm/tiny/sharp-memory.c                |    1 -
 drivers/gpu/drm/v3d/v3d_submit.c                   |    2 +
 drivers/gpu/drm/vc4/vc4_dpi.c                      |    1 -
 drivers/gpu/drm/vc4/vc4_txp.c                      |    1 -
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    3 +-
 drivers/gpu/drm/xe/display/xe_display_bo.c         |    3 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |    3 +-
 drivers/gpu/drm/xe/tests/xe_pci.c                  |    1 -
 drivers/gpu/drm/xe/tests/xe_rtp_test.c             |  103 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |   12 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   22 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |    4 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                  |   13 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |    9 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |   20 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h            |    8 +
 drivers/gpu/drm/xe/xe_oa.c                         |    7 +
 drivers/gpu/drm/xe/xe_oa_types.h                   |    3 +
 drivers/gpu/drm/xe/xe_pt.c                         |   86 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |  102 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.h              |    4 +
 drivers/gpu/drm/xe/xe_rtp.c                        |   31 +-
 drivers/gpu/drm/xe/xe_rtp.h                        |   24 +-
 drivers/gpu/drm/xe/xe_rtp_types.h                  |   10 +
 drivers/gpu/drm/xe/xe_svm.c                        |    6 +-
 drivers/gpu/drm/xe/xe_svm.h                        |   15 +-
 drivers/gpu/drm/xe/xe_tuning.c                     |   45 +-
 drivers/gpu/drm/xe/xe_userptr.c                    |    2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c                 |    2 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   89 +-
 drivers/hid/bpf/hid_bpf_dispatch.c                 |    5 +-
 drivers/hid/hid-appleir.c                          |   45 +-
 drivers/hid/hid-core.c                             |    7 +
 drivers/hid/hid-letsketch.c                        |   36 +-
 drivers/hid/hid-lg-g15.c                           |   16 +
 drivers/hid/hid-logitech-dj.c                      |    9 +-
 drivers/hid/hid-multitouch.c                       |   32 +-
 drivers/hid/hid-picolcd_core.c                     |    3 +-
 drivers/hid/hid-sensor-hub.c                       |   77 +-
 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c           |    1 -
 drivers/hid/intel-ish-hid/ishtp/bus.h              |    2 +-
 drivers/hsi/controllers/omap_ssi_port.c            |    1 -
 drivers/hte/hte-tegra194-test.c                    |    1 -
 drivers/hwmon/Kconfig                              |    3 +
 drivers/hwmon/adcxx.c                              |    1 -
 drivers/hwmon/adt7410.c                            |    1 -
 drivers/hwmon/adt7462.c                            |    1 -
 drivers/hwmon/adt7475.c                            |    1 -
 drivers/hwmon/as370-hwmon.c                        |    1 -
 drivers/hwmon/aspeed-g6-pwm-tach.c                 |    5 +-
 drivers/hwmon/asus_atk0110.c                       |    3 +
 drivers/hwmon/axi-fan-control.c                    |    1 -
 drivers/hwmon/cros_ec_hwmon.c                      |    1 -
 drivers/hwmon/gxp-fan-ctrl.c                       |    1 -
 drivers/hwmon/iio_hwmon.c                          |    1 -
 drivers/hwmon/intel-m10-bmc-hwmon.c                |    1 -
 drivers/hwmon/jc42.c                               |    1 -
 drivers/hwmon/lan966x-hwmon.c                      |    1 -
 drivers/hwmon/lm70.c                               |    1 -
 drivers/hwmon/lm75.c                               |    1 -
 drivers/hwmon/ltc2947-core.c                       |    1 -
 drivers/hwmon/ltc4282.c                            |    1 -
 drivers/hwmon/ltc4283.c                            |    1 -
 drivers/hwmon/ltq-cputemp.c                        |    1 -
 drivers/hwmon/max197.c                             |    1 -
 drivers/hwmon/mc13783-adc.c                        |    1 -
 drivers/hwmon/mr75203.c                            |    1 -
 drivers/hwmon/ntc_thermistor.c                     |    1 -
 drivers/hwmon/occ/common.c                         |   34 +-
 drivers/hwmon/occ/common.h                         |    1 +
 drivers/hwmon/occ/p9_sbe.c                         |    1 -
 drivers/hwmon/pmbus/adm1275.c                      |   20 +-
 drivers/hwmon/pmbus/adp1050.c                      |    1 -
 drivers/hwmon/pmbus/e50sn12051.c                   |    1 -
 drivers/hwmon/pmbus/lt3074.c                       |    1 -
 drivers/hwmon/pmbus/max17616.c                     |    1 -
 drivers/hwmon/pmbus/max20830.c                     |    1 -
 drivers/hwmon/pmbus/mp2975.c                       |    1 -
 drivers/hwmon/pmbus/pmbus_core.c                   |   37 +-
 drivers/hwmon/pmbus/stef48h28.c                    |    1 -
 drivers/hwmon/pwm-fan.c                            |    1 -
 drivers/hwmon/sch5627.c                            |    1 -
 drivers/hwmon/sch5636.c                            |    1 -
 drivers/hwmon/sl28cpld-hwmon.c                     |    1 -
 drivers/hwmon/smpro-hwmon.c                        |    1 -
 drivers/hwmon/sparx5-temp.c                        |    1 -
 drivers/hwmon/tmp102.c                             |    1 -
 drivers/hwmon/tmp108.c                             |    1 -
 drivers/hwmon/w83627hf.c                           |    4 +
 drivers/hwmon/w83793.c                             |    1 +
 drivers/hwtracing/coresight/ultrasoc-smb.c         |    1 -
 drivers/i2c/busses/i2c-amd-asf-plat.c              |    1 -
 drivers/i2c/busses/i2c-gxp.c                       |    1 -
 drivers/i2c/busses/i2c-hisi.c                      |    1 -
 drivers/i2c/busses/i2c-rtl9300.c                   |    1 -
 drivers/i2c/busses/i2c-rzv2m.c                     |    1 -
 drivers/i2c/i2c-core.h                             |    1 +
 drivers/iio/accel/adxl313_i2c.c                    |    1 -
 drivers/iio/accel/adxl313_spi.c                    |    1 -
 drivers/iio/accel/adxl355_core.c                   |    1 -
 drivers/iio/accel/adxl355_i2c.c                    |    1 -
 drivers/iio/accel/adxl355_spi.c                    |    1 -
 drivers/iio/accel/adxl367.c                        |    1 -
 drivers/iio/accel/adxl367_i2c.c                    |    1 -
 drivers/iio/accel/adxl367_spi.c                    |    1 -
 drivers/iio/accel/adxl372_i2c.c                    |    1 -
 drivers/iio/accel/adxl372_spi.c                    |    1 -
 drivers/iio/accel/adxl380_i2c.c                    |    1 -
 drivers/iio/accel/adxl380_spi.c                    |    1 -
 drivers/iio/accel/bma180.c                         |    1 -
 drivers/iio/accel/bma220_core.c                    |    1 -
 drivers/iio/accel/bma220_i2c.c                     |    1 -
 drivers/iio/accel/bma220_spi.c                     |    1 -
 drivers/iio/accel/bma400_i2c.c                     |    1 -
 drivers/iio/accel/bma400_spi.c                     |    1 -
 drivers/iio/accel/bmc150-accel-core.c              |    2 +
 drivers/iio/accel/bmc150-accel-i2c.c               |    1 -
 drivers/iio/accel/bmc150-accel-spi.c               |    1 -
 drivers/iio/accel/bmi088-accel-i2c.c               |    1 -
 drivers/iio/accel/dmard06.c                        |    1 -
 drivers/iio/accel/fxls8962af-core.c                |    1 -
 drivers/iio/accel/fxls8962af-i2c.c                 |    1 -
 drivers/iio/accel/fxls8962af-spi.c                 |    1 -
 drivers/iio/accel/hid-sensor-accel-3d.c            |    1 -
 drivers/iio/accel/kxcjk-1013.c                     |    1 -
 drivers/iio/accel/kxsd9-i2c.c                      |    1 -
 drivers/iio/accel/kxsd9-spi.c                      |    1 -
 drivers/iio/accel/kxsd9.c                          |    5 +-
 drivers/iio/accel/mma7660.c                        |    1 -
 drivers/iio/accel/mma8452.c                        |    1 -
 drivers/iio/accel/mma9551.c                        |    1 -
 drivers/iio/accel/mma9553.c                        |    1 -
 drivers/iio/accel/msa311.c                         |    1 -
 drivers/iio/accel/mxc4005.c                        |    1 -
 drivers/iio/accel/mxc6255.c                        |    1 -
 drivers/iio/accel/st_accel_i2c.c                   |    1 -
 drivers/iio/accel/st_accel_spi.c                   |    1 -
 drivers/iio/accel/stk8ba50.c                       |    1 -
 drivers/iio/adc/88pm886-gpadc.c                    |    1 -
 drivers/iio/adc/Kconfig                            |    3 +
 drivers/iio/adc/ad4000.c                           |    1 -
 drivers/iio/adc/ad4080.c                           |    1 -
 drivers/iio/adc/ad4134.c                           |    1 -
 drivers/iio/adc/ad4691.c                           |    1 -
 drivers/iio/adc/ad4851.c                           |    1 -
 drivers/iio/adc/ad7124.c                           |    1 -
 drivers/iio/adc/ad7173.c                           |    1 -
 drivers/iio/adc/ad7191.c                           |    1 -
 drivers/iio/adc/ad7192.c                           |    1 -
 drivers/iio/adc/ad7280a.c                          |    1 -
 drivers/iio/adc/ad7292.c                           |    1 -
 drivers/iio/adc/ad7298.c                           |    1 -
 drivers/iio/adc/ad7405.c                           |    1 -
 drivers/iio/adc/ad7606_par.c                       |    1 -
 drivers/iio/adc/ad7625.c                           |    1 -
 drivers/iio/adc/ad7779.c                           |    1 -
 drivers/iio/adc/adi-axi-adc.c                      |    1 -
 drivers/iio/adc/at91-sama5d2_adc.c                 |    1 -
 drivers/iio/adc/axp20x_adc.c                       |    1 -
 drivers/iio/adc/bcm_iproc_adc.c                    |    1 -
 drivers/iio/adc/berlin2-adc.c                      |    1 -
 drivers/iio/adc/cpcap-adc.c                        |    1 -
 drivers/iio/adc/envelope-detector.c                |    1 -
 drivers/iio/adc/fsl-imx25-gcq.c                    |    1 -
 drivers/iio/adc/hi8435.c                           |    1 -
 drivers/iio/adc/hx711.c                            |    1 -
 drivers/iio/adc/imx7d_adc.c                        |    1 -
 drivers/iio/adc/imx8qxp-adc.c                      |    1 -
 drivers/iio/adc/imx93_adc.c                        |    1 -
 drivers/iio/adc/ingenic-adc.c                      |    1 -
 drivers/iio/adc/intel_dc_ti_adc.c                  |    1 -
 drivers/iio/adc/intel_mrfld_adc.c                  |    1 -
 drivers/iio/adc/lpc18xx_adc.c                      |    1 -
 drivers/iio/adc/lpc32xx_adc.c                      |    5 +-
 drivers/iio/adc/ltc2496.c                          |    1 -
 drivers/iio/adc/ltc2497.c                          |    1 -
 drivers/iio/adc/max1027.c                          |    1 -
 drivers/iio/adc/max11100.c                         |    1 -
 drivers/iio/adc/max1118.c                          |    1 -
 drivers/iio/adc/max1363.c                          |    1 -
 drivers/iio/adc/max14001.c                         |    1 -
 drivers/iio/adc/max34408.c                         |    1 -
 drivers/iio/adc/max77541-adc.c                     |    1 -
 drivers/iio/adc/max9611.c                          |    1 -
 drivers/iio/adc/mcp320x.c                          |    1 -
 drivers/iio/adc/mcp3422.c                          |    1 -
 drivers/iio/adc/mcp3911.c                          |    1 -
 drivers/iio/adc/mp2629_adc.c                       |    1 -
 drivers/iio/adc/mt6359-auxadc.c                    |    1 -
 drivers/iio/adc/mt6360-adc.c                       |    1 -
 drivers/iio/adc/mt6370-adc.c                       |    1 -
 drivers/iio/adc/mt6577_auxadc.c                    |    1 -
 drivers/iio/adc/nau7802.c                          |    1 -
 drivers/iio/adc/nct7201.c                          |    1 -
 drivers/iio/adc/npcm_adc.c                         |    1 -
 drivers/iio/adc/nxp-sar-adc.c                      |    5 +-
 drivers/iio/adc/qcom-pm8xxx-xoadc.c                |    1 -
 drivers/iio/adc/qcom-spmi-adc5-gen3.c              |    1 -
 drivers/iio/adc/qcom-spmi-adc5.c                   |    1 -
 drivers/iio/adc/qcom-spmi-rradc.c                  |    1 -
 drivers/iio/adc/qcom-spmi-vadc.c                   |    1 -
 drivers/iio/adc/rohm-bd79112.c                     |    1 -
 drivers/iio/adc/rohm-bd79124.c                     |    1 -
 drivers/iio/adc/rtq6056.c                          |    1 -
 drivers/iio/adc/rzg2l_adc.c                        |    1 -
 drivers/iio/adc/rzn1-adc.c                         |    1 -
 drivers/iio/adc/rzt2h_adc.c                        |    1 -
 drivers/iio/adc/sd_adc_modulator.c                 |    1 -
 drivers/iio/adc/sophgo-cv1800b-adc.c               |    1 -
 drivers/iio/adc/spear_adc.c                        |    4 +-
 drivers/iio/adc/stm32-adc.c                        |    1 -
 drivers/iio/adc/sun20i-gpadc-iio.c                 |    1 -
 drivers/iio/adc/ti-adc081c.c                       |    1 -
 drivers/iio/adc/ti-adc0832.c                       |    1 -
 drivers/iio/adc/ti-adc084s021.c                    |    1 -
 drivers/iio/adc/ti-adc108s102.c                    |    1 -
 drivers/iio/adc/ti-adc128s052.c                    |    1 -
 drivers/iio/adc/ti-adc161s626.c                    |    1 -
 drivers/iio/adc/ti-ads1018.c                       |    1 -
 drivers/iio/adc/ti-ads1119.c                       |    6 +-
 drivers/iio/adc/ti-ads124s08.c                     |    4 +-
 drivers/iio/adc/ti-ads131m02.c                     |    1 -
 drivers/iio/adc/ti-ads8688.c                       |    1 -
 drivers/iio/adc/ti-tlc4541.c                       |    1 -
 drivers/iio/adc/twl4030-madc.c                     |    1 -
 drivers/iio/adc/twl6030-gpadc.c                    |    1 -
 drivers/iio/adc/vf610_adc.c                        |    1 -
 drivers/iio/adc/xilinx-ams.c                       |    1 -
 drivers/iio/adc/xilinx-xadc-core.c                 |    1 -
 drivers/iio/addac/ad74413r.c                       |    1 -
 drivers/iio/afe/iio-rescale.c                      |    1 -
 drivers/iio/amplifiers/ad8366.c                    |    1 -
 drivers/iio/amplifiers/adl8113.c                   |    1 -
 drivers/iio/amplifiers/hmc425a.c                   |    1 -
 drivers/iio/cdc/ad7150.c                           |    1 -
 drivers/iio/chemical/ams-iaq-core.c                |    1 -
 drivers/iio/chemical/atlas-ezo-sensor.c            |    1 -
 drivers/iio/chemical/atlas-sensor.c                |    1 -
 drivers/iio/chemical/bme680_spi.c                  |    1 -
 drivers/iio/chemical/mhz19b.c                      |    1 -
 drivers/iio/chemical/pms7003.c                     |    1 -
 drivers/iio/chemical/scd30_i2c.c                   |    1 -
 drivers/iio/chemical/scd30_serial.c                |    1 -
 drivers/iio/chemical/sgp30.c                       |    1 -
 drivers/iio/chemical/sps30_i2c.c                   |    1 -
 drivers/iio/chemical/sps30_serial.c                |    1 -
 drivers/iio/chemical/sunrise_co2.c                 |    1 -
 drivers/iio/chemical/vz89x.c                       |    1 -
 .../iio/common/cros_ec_sensors/cros_ec_lid_angle.c |    1 -
 .../iio/common/cros_ec_sensors/cros_ec_sensors.c   |    1 -
 drivers/iio/common/ssp_sensors/ssp_dev.c           |    1 -
 drivers/iio/common/st_sensors/st_sensors_core.c    |   23 +-
 drivers/iio/dac/ad3530r.c                          |    1 -
 drivers/iio/dac/ad3552r-hs.c                       |    1 -
 drivers/iio/dac/ad5446-i2c.c                       |    1 -
 drivers/iio/dac/ad5446-spi.c                       |    1 -
 drivers/iio/dac/ad5592r.c                          |    1 -
 drivers/iio/dac/ad5593r.c                          |    1 -
 drivers/iio/dac/ad5686-spi.c                       |    1 -
 drivers/iio/dac/ad5696-i2c.c                       |    1 -
 drivers/iio/dac/ad5706r.c                          |    1 -
 drivers/iio/dac/ad5758.c                           |    1 -
 drivers/iio/dac/ad7293.c                           |    1 -
 drivers/iio/dac/ad7303.c                           |    1 -
 drivers/iio/dac/ad8460.c                           |    1 -
 drivers/iio/dac/ad9739a.c                          |    1 -
 drivers/iio/dac/adi-axi-dac.c                      |    1 -
 drivers/iio/dac/dpot-dac.c                         |    1 -
 drivers/iio/dac/lpc18xx_dac.c                      |    1 -
 drivers/iio/dac/ltc2664.c                          |    1 -
 drivers/iio/dac/ltc2688.c                          |    1 -
 drivers/iio/dac/max22007.c                         |    1 -
 drivers/iio/dac/max5522.c                          |    1 -
 drivers/iio/dac/mcp4725.c                          |    1 -
 drivers/iio/dac/mcp4728.c                          |    1 -
 drivers/iio/dac/mcp47feb02.c                       |   38 +-
 drivers/iio/dac/mcp4821.c                          |    1 -
 drivers/iio/dac/stm32-dac-core.c                   |    1 -
 drivers/iio/dac/stm32-dac.c                        |    1 -
 drivers/iio/dac/ti-dac082s085.c                    |    1 -
 drivers/iio/dac/ti-dac5571.c                       |    1 -
 drivers/iio/dac/vf610_dac.c                        |    1 -
 drivers/iio/filter/admv8818.c                      |    1 -
 drivers/iio/frequency/adf4350.c                    |    1 -
 drivers/iio/frequency/admfm2000.c                  |    1 -
 drivers/iio/frequency/admv1013.c                   |    1 -
 drivers/iio/frequency/admv1014.c                   |    1 -
 drivers/iio/frequency/adrf6780.c                   |    1 -
 drivers/iio/gyro/bmg160_i2c.c                      |    1 -
 drivers/iio/gyro/fxas21002c_i2c.c                  |    1 -
 drivers/iio/gyro/fxas21002c_spi.c                  |    1 -
 drivers/iio/gyro/hid-sensor-gyro-3d.c              |    1 -
 drivers/iio/gyro/st_gyro_i2c.c                     |    1 -
 drivers/iio/gyro/st_gyro_spi.c                     |    1 -
 drivers/iio/health/max30102.c                      |    1 -
 drivers/iio/humidity/dht11.c                       |    1 -
 drivers/iio/humidity/ens210.c                      |    1 -
 drivers/iio/humidity/hdc100x.c                     |    1 -
 drivers/iio/humidity/hid-sensor-humidity.c         |    1 -
 drivers/iio/humidity/hts221_i2c.c                  |    1 -
 drivers/iio/humidity/htu21.c                       |    1 -
 drivers/iio/humidity/si7020.c                      |    1 -
 drivers/iio/imu/adis16475.c                        |    1 -
 drivers/iio/imu/adis16480.c                        |    1 -
 drivers/iio/imu/adis16550.c                        |    1 -
 drivers/iio/imu/adis_trigger.c                     |    2 +-
 drivers/iio/imu/bmi160/bmi160_core.c               |    3 +-
 drivers/iio/imu/bmi160/bmi160_i2c.c                |    1 -
 drivers/iio/imu/bmi160/bmi160_spi.c                |    1 -
 drivers/iio/imu/bmi270/bmi270_i2c.c                |    1 -
 drivers/iio/imu/bmi270/bmi270_spi.c                |    1 -
 drivers/iio/imu/bmi323/bmi323_i2c.c                |    1 -
 drivers/iio/imu/bmi323/bmi323_spi.c                |    1 -
 drivers/iio/imu/bno055/bno055_i2c.c                |    1 -
 drivers/iio/imu/bno055/bno055_ser_core.c           |    1 -
 drivers/iio/imu/fxos8700_i2c.c                     |    1 -
 drivers/iio/imu/fxos8700_spi.c                     |    1 -
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c  |    4 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c |    9 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.h |    1 +
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c   |    4 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c    |    1 -
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c    |    1 -
 drivers/iio/imu/inv_icm45600/inv_icm45600_i2c.c    |    1 -
 drivers/iio/imu/inv_icm45600/inv_icm45600_i3c.c    |    1 -
 drivers/iio/imu/inv_icm45600/inv_icm45600_spi.c    |    1 -
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c          |    1 -
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c          |    1 -
 drivers/iio/imu/kmx61.c                            |    1 -
 drivers/iio/imu/smi330/smi330_i2c.c                |    1 -
 drivers/iio/imu/smi330/smi330_spi.c                |    1 -
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c       |   21 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c        |    1 -
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c        |    1 -
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c        |    1 -
 drivers/iio/industrialio-event.c                   |    5 +-
 drivers/iio/light/Kconfig                          |    3 +
 drivers/iio/light/al3000a.c                        |    1 -
 drivers/iio/light/al3010.c                         |    3 +-
 drivers/iio/light/al3320a.c                        |    1 -
 drivers/iio/light/apds9999.c                       |    1 -
 drivers/iio/light/bh1780.c                         |    1 -
 drivers/iio/light/cm32181.c                        |    1 -
 drivers/iio/light/cm3232.c                         |    1 -
 drivers/iio/light/cm3605.c                         |    1 -
 drivers/iio/light/cros_ec_light_prox.c             |    1 -
 drivers/iio/light/gp2ap002.c                       |    2 +-
 drivers/iio/light/gp2ap020a00f.c                   |    1 -
 drivers/iio/light/hid-sensor-als.c                 |    1 -
 drivers/iio/light/hid-sensor-prox.c                |    1 -
 drivers/iio/light/isl29018.c                       |    1 -
 drivers/iio/light/jsa1212.c                        |    1 -
 drivers/iio/light/ltr501.c                         |    1 -
 drivers/iio/light/ltrf216a.c                       |    1 -
 drivers/iio/light/max44000.c                       |    1 -
 drivers/iio/light/opt3001.c                        |    1 -
 drivers/iio/light/rpr0521.c                        |    1 -
 drivers/iio/light/si1133.c                         |    1 -
 drivers/iio/light/st_uvis25_i2c.c                  |    1 -
 drivers/iio/light/st_uvis25_spi.c                  |    1 -
 drivers/iio/light/stk3310.c                        |    1 -
 drivers/iio/light/tsl2563.c                        |    1 -
 drivers/iio/light/tsl2591.c                        |    6 +-
 drivers/iio/light/us5182d.c                        |    1 -
 drivers/iio/light/veml3328.c                       |    1 -
 drivers/iio/light/veml6046x00.c                    |    1 -
 drivers/iio/light/vl6180.c                         |    1 -
 drivers/iio/magnetometer/ak8974.c                  |    1 -
 drivers/iio/magnetometer/ak8975.c                  |    1 -
 drivers/iio/magnetometer/bmc150_magn_i2c.c         |    1 -
 drivers/iio/magnetometer/bmc150_magn_spi.c         |    1 -
 drivers/iio/magnetometer/hid-sensor-magn-3d.c      |    1 -
 drivers/iio/magnetometer/mmc35240.c                |    1 -
 drivers/iio/magnetometer/mmc5633.c                 |    1 -
 drivers/iio/magnetometer/mmc5983.c                 |    1 -
 drivers/iio/magnetometer/si7210.c                  |    1 -
 drivers/iio/magnetometer/st_magn_i2c.c             |    1 -
 drivers/iio/magnetometer/st_magn_spi.c             |    1 -
 drivers/iio/magnetometer/tlv493d.c                 |    1 -
 drivers/iio/magnetometer/yamaha-yas530.c           |    1 -
 drivers/iio/multiplexer/iio-mux.c                  |    1 -
 drivers/iio/orientation/hid-sensor-incl-3d.c       |    1 -
 drivers/iio/orientation/hid-sensor-rotation.c      |   41 +-
 .../iio/position/hid-sensor-custom-intel-hinge.c   |    1 -
 drivers/iio/potentiometer/ad5272.c                 |    1 -
 drivers/iio/potentiometer/ds1803.c                 |    1 -
 drivers/iio/potentiometer/max5432.c                |    1 -
 drivers/iio/potentiometer/max5481.c                |    1 -
 drivers/iio/potentiometer/max5487.c                |    1 -
 drivers/iio/potentiometer/mcp4018.c                |    1 -
 drivers/iio/potentiometer/mcp41010.c               |    1 -
 drivers/iio/potentiometer/mcp4131.c                |    1 -
 drivers/iio/potentiometer/mcp4531.c                |    1 -
 drivers/iio/potentiostat/lmp91000.c                |    1 -
 drivers/iio/pressure/abp2030pa_i2c.c               |    1 -
 drivers/iio/pressure/abp2030pa_spi.c               |    1 -
 drivers/iio/pressure/adp810.c                      |    1 -
 drivers/iio/pressure/cros_ec_baro.c                |    1 -
 drivers/iio/pressure/hid-sensor-press.c            |    1 -
 drivers/iio/pressure/hp206c.c                      |    1 -
 drivers/iio/pressure/hsc030pa.c                    |    1 -
 drivers/iio/pressure/hsc030pa_i2c.c                |    1 -
 drivers/iio/pressure/hsc030pa_spi.c                |    1 -
 drivers/iio/pressure/icp10100.c                    |    1 -
 drivers/iio/pressure/mpl115.c                      |    4 +-
 drivers/iio/pressure/mprls0025pa.c                 |    1 -
 drivers/iio/pressure/mprls0025pa_i2c.c             |    1 -
 drivers/iio/pressure/mprls0025pa_spi.c             |    1 -
 drivers/iio/pressure/ms5611_i2c.c                  |    1 -
 drivers/iio/pressure/ms5611_spi.c                  |    1 -
 drivers/iio/pressure/ms5637.c                      |    1 -
 drivers/iio/pressure/sdp500.c                      |    1 -
 drivers/iio/pressure/st_pressure_i2c.c             |    1 -
 drivers/iio/pressure/st_pressure_spi.c             |    1 -
 drivers/iio/pressure/zpa2326_i2c.c                 |    1 -
 drivers/iio/pressure/zpa2326_spi.c                 |    1 -
 drivers/iio/proximity/as3935.c                     |    1 -
 drivers/iio/proximity/cros_ec_mkbp_proximity.c     |    1 -
 drivers/iio/proximity/d3323aa.c                    |    1 -
 drivers/iio/proximity/hx9023s.c                    |    1 -
 drivers/iio/proximity/isl29501.c                   |    1 -
 drivers/iio/proximity/mb1232.c                     |    1 -
 drivers/iio/proximity/ping.c                       |    1 -
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c  |    1 -
 drivers/iio/proximity/srf04.c                      |    1 -
 drivers/iio/proximity/sx9310.c                     |    1 -
 drivers/iio/proximity/sx9324.c                     |    1 -
 drivers/iio/proximity/sx9360.c                     |    1 -
 drivers/iio/proximity/vl53l1x-i2c.c                |    1 -
 drivers/iio/resolver/ad2s1200.c                    |    1 -
 drivers/iio/temperature/Makefile                   |    2 +-
 drivers/iio/temperature/hid-sensor-temperature.c   |    1 -
 drivers/iio/temperature/ltc2983.c                  |    1 -
 drivers/iio/temperature/max31856.c                 |    1 -
 drivers/iio/temperature/max31865.c                 |    1 -
 drivers/iio/temperature/maxim_thermocouple.c       |    1 -
 drivers/iio/temperature/mcp9600.c                  |    1 -
 drivers/iio/temperature/mlx90614.c                 |    1 -
 drivers/iio/temperature/mlx90632.c                 |    1 -
 drivers/iio/temperature/mlx90635.c                 |    1 -
 drivers/iio/temperature/tmp006.c                   |    1 -
 drivers/iio/temperature/tmp007.c                   |    1 -
 drivers/iio/temperature/tsys01.c                   |    1 -
 drivers/iio/trigger/stm32-lptimer-trigger.c        |    1 -
 drivers/iio/trigger/stm32-timer-trigger.c          |    1 -
 drivers/input/joystick/maplecontrol.c              |    3 +-
 drivers/input/keyboard/adp5585-keys.c              |    1 -
 drivers/input/keyboard/adp5588-keys.c              |    1 -
 drivers/input/keyboard/charlieplex_keypad.c        |    1 -
 drivers/input/keyboard/clps711x-keypad.c           |    1 -
 drivers/input/keyboard/ep93xx_keypad.c             |    1 -
 drivers/input/keyboard/maple_keyb.c                |    4 +-
 drivers/input/keyboard/max7360-keypad.c            |    1 -
 drivers/input/keyboard/pinephone-keyboard.c        |    1 -
 drivers/input/misc/ariel-pwrbutton.c               |    1 -
 drivers/input/misc/da9063_onkey.c                  |    1 -
 drivers/input/misc/gpio_decoder.c                  |    1 -
 drivers/input/misc/iqs269a.c                       |    1 -
 drivers/input/misc/iqs626a.c                       |    1 -
 drivers/input/misc/iqs7222.c                       |    1 -
 drivers/input/misc/mma8450.c                       |    1 -
 drivers/input/misc/rt5120-pwrkey.c                 |    1 -
 drivers/input/misc/sc27xx-vibra.c                  |    1 -
 drivers/input/misc/twl4030-pwrbutton.c             |    1 -
 drivers/input/mouse/maplemouse.c                   |    9 +-
 drivers/input/serio/sun4i-ps2.c                    |    1 -
 drivers/input/touchscreen/cyttsp5.c                |    1 -
 drivers/input/touchscreen/himax_hx852x.c           |    1 -
 drivers/input/touchscreen/hynitron_cstxxx.c        |    1 -
 drivers/input/touchscreen/ili210x.c                |    1 -
 drivers/input/touchscreen/iqs5xx.c                 |    1 -
 drivers/input/touchscreen/mms114.c                 |    2 +-
 drivers/input/touchscreen/msg2638.c                |    1 -
 drivers/input/touchscreen/resistive-adc-touch.c    |    1 -
 drivers/input/touchscreen/tsc2007_core.c           |    1 -
 drivers/interconnect/mediatek/mt8183.c             |    1 -
 drivers/interconnect/mediatek/mt8195.c             |    1 -
 drivers/interconnect/mediatek/mt8196.c             |    1 -
 drivers/interconnect/qcom/msm8909.c                |    1 -
 drivers/interconnect/qcom/msm8937.c                |    1 -
 drivers/interconnect/qcom/msm8939.c                |    1 -
 drivers/interconnect/qcom/msm8953.c                |    1 -
 drivers/interconnect/qcom/msm8976.c                |    1 -
 drivers/interconnect/qcom/msm8996.c                |    1 -
 drivers/interconnect/qcom/qcm2290.c                |    1 -
 drivers/interconnect/qcom/qcs404.c                 |    1 -
 drivers/interconnect/qcom/qdu1000.c                |    1 -
 drivers/interconnect/qcom/sa8775p.c                |    1 -
 drivers/interconnect/qcom/sc7180.c                 |    1 -
 drivers/interconnect/qcom/sc7280.c                 |    1 -
 drivers/interconnect/qcom/sc8180x.c                |    1 -
 drivers/interconnect/qcom/sc8280xp.c               |    1 -
 drivers/interconnect/qcom/sdm660.c                 |    1 -
 drivers/interconnect/qcom/sdm670.c                 |    1 -
 drivers/interconnect/qcom/sdm845.c                 |    1 -
 drivers/interconnect/qcom/sdx55.c                  |    1 -
 drivers/interconnect/qcom/sdx65.c                  |    1 -
 drivers/interconnect/qcom/shikra.c                 |    1 -
 drivers/interconnect/qcom/sm6115.c                 |    1 -
 drivers/interconnect/qcom/sm6350.c                 |    1 -
 drivers/interconnect/qcom/sm7150.c                 |    1 -
 drivers/interconnect/qcom/sm8150.c                 |    1 -
 drivers/interconnect/qcom/sm8250.c                 |    1 -
 drivers/interconnect/qcom/sm8350.c                 |    1 -
 drivers/interconnect/qcom/sm8450.c                 |    1 -
 drivers/interconnect/qcom/sm8550.c                 |    1 -
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c   |    1 -
 drivers/irqchip/irq-gic-v3-its.c                   |    6 +-
 drivers/irqchip/irq-imx-intmux.c                   |    1 -
 drivers/irqchip/irq-lan966x-oic.c                  |    1 -
 drivers/irqchip/irq-riscv-imsic-early.c            |   15 +-
 drivers/irqchip/irq-sl28cpld.c                     |    1 -
 drivers/irqchip/irq-stm32mp-exti.c                 |    1 -
 drivers/irqchip/irq-ts4800.c                       |   10 +
 drivers/leds/flash/leds-rt8515.c                   |    1 -
 drivers/leds/leds-aw200xx.c                        |    1 -
 drivers/leds/leds-bd2606mvv.c                      |    1 -
 drivers/leds/leds-cht-wcove.c                      |    1 -
 drivers/leds/leds-cr0014114.c                      |    1 -
 drivers/leds/leds-cros_ec.c                        |    1 -
 drivers/leds/leds-el15203000.c                     |    1 -
 drivers/leds/leds-gpio.c                           |    1 -
 drivers/leds/leds-is31fl319x.c                     |    1 -
 drivers/leds/leds-lm36274.c                        |    1 -
 drivers/leds/leds-lm3692x.c                        |    1 -
 drivers/leds/leds-lm3697.c                         |    1 -
 drivers/leds/leds-lp50xx.c                         |    1 -
 drivers/leds/leds-lt3593.c                         |    1 -
 drivers/leds/leds-max5970.c                        |    1 -
 drivers/leds/leds-mlxcpld.c                        |    1 -
 drivers/leds/leds-nic78bx.c                        |    1 -
 drivers/leds/leds-pca995x.c                        |    1 -
 drivers/leds/leds-regulator.c                      |    1 -
 drivers/leds/leds-spi-byte.c                       |    1 -
 drivers/leds/leds-sun50i-a100.c                    |    1 -
 drivers/leds/rgb/leds-group-multicolor.c           |    1 -
 drivers/leds/rgb/leds-mt6370-rgb.c                 |    1 -
 drivers/leds/rgb/leds-pwm-multicolor.c             |    1 -
 drivers/mailbox/mailbox-mpfs.c                     |    1 -
 drivers/mailbox/platform_mhu.c                     |    1 -
 drivers/md/dm-bufio.c                              |    4 +-
 drivers/md/dm-era-target.c                         |   16 +-
 drivers/md/dm-inlinecrypt.c                        |    4 +-
 drivers/md/dm-integrity.c                          |   26 +-
 drivers/md/dm-ioctl.c                              |    4 +-
 drivers/md/dm-log.c                                |    3 +
 drivers/md/dm-pcache/dm_pcache.c                   |    8 +
 drivers/md/dm-stats.c                              |   10 +-
 drivers/md/dm-thin-metadata.c                      |   67 +-
 drivers/md/dm-verity-fec.c                         |    4 +-
 drivers/md/dm-verity-fec.h                         |    2 +-
 drivers/md/dm-verity-loadpin.c                     |    2 +-
 drivers/md/dm-verity-target.c                      |   16 +-
 drivers/md/dm-verity.h                             |    2 +-
 drivers/md/dm.c                                    |   11 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c   |    1 -
 drivers/media/firewire/firedtv-fw.c                |    1 -
 drivers/media/i2c/adv7180.c                        |    1 -
 drivers/media/i2c/cvs/core.c                       |    1 -
 drivers/media/i2c/gc0308.c                         |    1 -
 drivers/media/i2c/gc05a2.c                         |    1 -
 drivers/media/i2c/gc08a3.c                         |    1 -
 drivers/media/i2c/lm3560.c                         |    1 -
 drivers/media/i2c/mt9m114.c                        |    1 -
 drivers/media/i2c/mt9p031.c                        |    1 -
 drivers/media/i2c/mt9v032.c                        |    1 -
 drivers/media/i2c/ov2680.c                         |    1 -
 drivers/media/i2c/ov5640.c                         |    1 -
 drivers/media/i2c/ov5670.c                         |    1 -
 drivers/media/i2c/ov5675.c                         |    1 -
 drivers/media/i2c/ov64a40.c                        |    1 -
 drivers/media/i2c/ov7251.c                         |    1 -
 drivers/media/i2c/ov7670.c                         |    1 -
 drivers/media/i2c/ov8865.c                         |    1 -
 drivers/media/i2c/t4ka3.c                          |    1 -
 drivers/media/i2c/tvp514x.c                        |    1 -
 drivers/media/i2c/video-i2c.c                      |    1 -
 .../media/platform/arm/mali-c55/mali-c55-core.c    |    1 -
 drivers/media/platform/chips-media/coda/imx-vdoa.c |    1 -
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c |    1 -
 .../media/platform/microchip/microchip-csi2dc.c    |    1 -
 drivers/media/platform/qcom/iris/Kconfig           |   28 +-
 drivers/media/platform/qcom/iris/iris_firmware.c   |    9 +-
 drivers/media/platform/qcom/venus/Kconfig          |    1 +
 drivers/media/platform/qcom/venus/firmware.c       |   11 +-
 drivers/media/platform/qcom/venus/vdec.c           |    1 -
 drivers/media/platform/qcom/venus/venc.c           |    1 -
 drivers/media/platform/renesas/rcar-fcp.c          |    1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |    1 -
 drivers/media/platform/st/sti/hva/hva-v4l2.c       |    1 -
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    1 -
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |    1 -
 drivers/media/platform/ti/vpe/vip.c                |    1 +
 drivers/media/rc/ir-spi.c                          |    1 -
 drivers/media/usb/em28xx/em28xx.h                  |    1 +
 drivers/memory/jz4780-nemc.c                       |    7 +-
 drivers/memory/stm32_omm.c                         |    3 +-
 drivers/memory/tegra/mc.c                          |   48 +-
 drivers/memory/tegra/mc.h                          |   37 +
 drivers/memory/tegra/tegra186-emc.c                |   56 +-
 drivers/memory/tegra/tegra186.c                    |    1 -
 drivers/memory/tegra/tegra210-emc-core.c           |    1 -
 drivers/mfd/adp5585.c                              |    1 -
 drivers/mfd/atmel-hlcdc.c                          |    1 -
 drivers/mfd/atmel-smc.c                            |    1 -
 drivers/mfd/cros_ec_dev.c                          |    1 -
 drivers/mfd/cs42l43-i2c.c                          |    1 -
 drivers/mfd/cs42l43-sdw.c                          |    1 -
 drivers/mfd/hi655x-pmic.c                          |    1 -
 drivers/mfd/intel-lpss-acpi.c                      |    1 -
 drivers/mfd/intel-lpss-pci.c                       |    1 -
 drivers/mfd/intel_soc_pmic_bxtwc.c                 |    1 -
 drivers/mfd/intel_soc_pmic_crc.c                   |    1 -
 drivers/mfd/kempld-core.c                          |    1 -
 drivers/mfd/lochnagar-i2c.c                        |    1 -
 drivers/mfd/lp873x.c                               |    1 -
 drivers/mfd/lp87565.c                              |    1 -
 drivers/mfd/max14577.c                             |    1 -
 drivers/mfd/max7360.c                              |    1 -
 drivers/mfd/max77759.c                             |    1 -
 drivers/mfd/max77843.c                             |    1 -
 drivers/mfd/mc13xxx-spi.c                          |    1 -
 drivers/mfd/motorola-cpcap.c                       |    1 -
 drivers/mfd/ocelot-spi.c                           |    1 -
 drivers/mfd/rt5033.c                               |    1 -
 drivers/mfd/rt5120.c                               |    1 -
 drivers/mfd/rz-mtu3.c                              |    1 -
 drivers/mfd/sec-acpm.c                             |    1 -
 drivers/mfd/sec-i2c.c                              |    1 -
 drivers/mfd/simple-mfd-i2c.c                       |    1 -
 drivers/mfd/tps6594-i2c.c                          |    1 -
 drivers/mfd/tps6594-spi.c                          |    1 -
 drivers/mfd/upboard-fpga.c                         |    1 -
 drivers/mfd/wm831x-core.c                          |    1 -
 drivers/misc/eeprom/at24.c                         |    1 -
 drivers/misc/eeprom/ee1004.c                       |    1 -
 drivers/misc/eeprom/eeprom_93xx46.c                |    1 -
 drivers/misc/eeprom/idt_89hpesx.c                  |    1 -
 drivers/misc/hisi_hikey_usb.c                      |    1 -
 drivers/misc/pvpanic/pvpanic-mmio.c                |    1 -
 drivers/misc/pvpanic/pvpanic.c                     |    1 -
 drivers/misc/smpro-errmon.c                        |    1 -
 drivers/misc/smpro-misc.c                          |    1 -
 drivers/mmc/host/litex_mmc.c                       |    1 -
 drivers/mmc/host/owl-mmc.c                         |    1 -
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      |    1 -
 drivers/mmc/host/renesas_sdhi_sys_dmac.c           |    1 -
 drivers/mmc/host/sdhci-npcm.c                      |    1 -
 drivers/mmc/host/sdhci-of-ma35d1.c                 |    1 -
 drivers/mmc/host/sh_mmcif.c                        |    1 -
 drivers/mmc/host/sunxi-mmc.c                       |    1 -
 drivers/mtd/nand/raw/brcmnand/brcmstb_nand.c       |    1 -
 drivers/mux/adgs1408.c                             |    1 -
 drivers/mux/gpio.c                                 |    1 -
 drivers/net/amt.c                                  |    6 +-
 drivers/net/can/spi/hi311x.c                       |    1 -
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c     |    1 -
 drivers/net/dsa/microchip/ksz8863_smi.c            |    1 -
 drivers/net/dsa/mt7530-mmio.c                      |    1 -
 drivers/net/dsa/ocelot/seville_vsc9953.c           |    1 -
 drivers/net/ethernet/airoha/airoha_eth.c           |  129 ++-
 drivers/net/ethernet/airoha/airoha_eth.h           |    9 +
 drivers/net/ethernet/airoha/airoha_ppe.c           |   39 +-
 drivers/net/ethernet/airoha/airoha_regs.h          |    9 +-
 drivers/net/ethernet/cadence/macb_main.c           |   21 +-
 drivers/net/ethernet/calxeda/xgmac.c               |    1 -
 .../ethernet/cavium/liquidio/cn23xx_pf_device.c    |   18 +-
 drivers/net/ethernet/cavium/liquidio/lio_main.c    |   27 -
 .../net/ethernet/cavium/liquidio/octeon_device.h   |    3 -
 .../net/ethernet/cavium/liquidio/octeon_mailbox.c  |   33 +-
 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c         |    8 -
 drivers/net/ethernet/ezchip/nps_enet.c             |    1 -
 drivers/net/ethernet/faraday/ftmac100.c            |    1 -
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c     |    1 -
 drivers/net/ethernet/freescale/enetc/enetc.c       |    7 +
 drivers/net/ethernet/freescale/enetc/enetc_ierb.c  |    1 -
 drivers/net/ethernet/freescale/fman/fman.c         |    4 +-
 drivers/net/ethernet/freescale/gianfar.c           |   16 +-
 drivers/net/ethernet/ibm/emac/tah.c                |    1 -
 drivers/net/ethernet/ibm/emac/zmii.c               |    1 -
 drivers/net/ethernet/marvell/mvmdio.c              |    1 -
 .../net/ethernet/marvell/octeontx2/af/rvu_nix.c    |    4 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |   64 +-
 drivers/net/ethernet/mellanox/mlx5/core/en.h       |   12 +
 .../ethernet/mellanox/mlx5/core/en/hv_vhca_stats.c |   37 +-
 .../ethernet/mellanox/mlx5/core/en_accel/macsec.c  |   47 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c  |   14 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.c |    9 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |    3 +
 .../net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c  |    3 +-
 .../net/ethernet/mellanox/mlx5/core/lag/mpesw.c    |    7 +-
 .../ethernet/mellanox/mlx5/core/lag/shared_fdb.c   |    2 +-
 .../net/ethernet/mellanox/mlx5/core/lib/hv_vhca.c  |    8 +-
 .../net/ethernet/mellanox/mlx5/core/lib/hv_vhca.h  |    6 +-
 .../net/ethernet/mellanox/mlx5/core/lib/port_tun.c |    3 +-
 .../ethernet/mellanox/mlx5/core/steering/hws/bwc.c |    1 +
 .../ethernet/mellanox/mlxbf_gige/mlxbf_gige_mdio.c |    1 -
 drivers/net/ethernet/mellanox/mlxsw/i2c.c          |    1 -
 drivers/net/ethernet/mellanox/mlxsw/minimal.c      |    1 -
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c       |   11 +-
 drivers/net/ethernet/microchip/lan743x_main.c      |    2 +-
 .../ethernet/microchip/lan966x/lan966x_vcap_impl.c |    5 +-
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   |    5 +-
 drivers/net/ethernet/microchip/vcap/vcap_api.c     |   72 +-
 drivers/net/ethernet/microchip/vcap/vcap_api.h     |    3 +-
 .../net/ethernet/microchip/vcap/vcap_api_debugfs.c |    8 +-
 .../microchip/vcap/vcap_api_debugfs_kunit.c        |    3 +-
 .../net/ethernet/microchip/vcap/vcap_api_kunit.c   |    3 +-
 .../net/ethernet/microchip/vcap/vcap_api_private.h |    3 +
 drivers/net/ethernet/microsoft/mana/mana_en.c      |   61 +-
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c     |   26 +-
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h     |    5 +-
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c  |   82 +-
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h  |   14 +
 drivers/net/ethernet/qlogic/qede/qede_fp.c         |    9 +-
 .../net/ethernet/qualcomm/rmnet/rmnet_handlers.c   |    5 +-
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h    |    1 +
 .../net/ethernet/qualcomm/rmnet/rmnet_map_data.c   |   72 +-
 .../net/ethernet/stmicro/stmmac/dwmac-nuvoton.c    |    1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c |    1 -
 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c   |    1 -
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |    1 -
 drivers/net/ethernet/wangxun/libwx/wx_lib.c        |    1 +
 drivers/net/ethernet/wangxun/libwx/wx_type.h       |    1 +
 drivers/net/ethernet/xscale/ptp_ixp46x.c           |    1 -
 drivers/net/ieee802154/mrf24j40.c                  |    1 -
 drivers/net/ipa/Kconfig                            |    2 +-
 drivers/net/ipa/ipa_main.c                         |   13 +-
 drivers/net/ipa/ipa_smp2p.c                        |   30 +-
 drivers/net/macsec.c                               |    2 +-
 drivers/net/mdio/Kconfig                           |    3 +-
 drivers/net/mdio/mdio-i2c.c                        |   59 +-
 drivers/net/mdio/mdio-realtek-rtl9300.c            |    1 -
 drivers/net/mhi_net.c                              |    1 -
 drivers/net/netdevsim/ethtool.c                    |    6 +
 drivers/net/netdevsim/netdev.c                     |    2 +
 drivers/net/netdevsim/netdevsim.h                  |    2 +
 drivers/net/phy/sfp.c                              |   15 +-
 drivers/net/pse-pd/pse_core.c                      |    6 +-
 drivers/net/usb/gl620a.c                           |    6 +-
 drivers/net/usb/lan78xx.c                          |   18 +-
 drivers/net/usb/net1080.c                          |    2 +-
 drivers/net/virtio_net.c                           |    3 +
 drivers/net/wan/fsl_qmc_hdlc.c                     |    1 -
 drivers/net/wireless/ath/ath9k/ahb.c               |    1 -
 .../net/wireless/broadcom/brcm80211/brcmfmac/dmi.c |    1 -
 drivers/net/wireless/intersil/p54/p54spi.c         |    1 -
 drivers/net/wireless/ti/wl1251/sdio.c              |    1 -
 drivers/net/wireless/ti/wl12xx/main.c              |    1 -
 drivers/net/wireless/ti/wl18xx/main.c              |    1 -
 drivers/net/wwan/iosm/iosm_ipc_mux_codec.c         |   40 +-
 drivers/net/wwan/mhi_wwan_ctrl.c                   |    1 -
 drivers/net/wwan/mhi_wwan_mbim.c                   |    1 -
 drivers/net/wwan/qcom_bam_dmux.c                   |    1 -
 drivers/net/wwan/rpmsg_wwan_ctrl.c                 |    1 -
 drivers/nfc/microread/mei.c                        |    1 -
 drivers/nfc/pn544/mei.c                            |    1 -
 drivers/nfc/s3fwrn5/uart.c                         |    1 -
 drivers/nvmem/an8855-efuse.c                       |    1 -
 drivers/nvmem/apple-efuses.c                       |    1 -
 drivers/nvmem/brcm_nvram.c                         |    1 -
 drivers/nvmem/layerscape-sfp.c                     |    1 -
 drivers/nvmem/lpc18xx_eeprom.c                     |    1 -
 drivers/nvmem/max77759-nvmem.c                     |    1 -
 drivers/nvmem/mtk-efuse.c                          |    1 -
 drivers/nvmem/nintendo-otp.c                       |    1 -
 drivers/nvmem/qfprom.c                             |    1 -
 drivers/nvmem/qoriq-efuse.c                        |    1 -
 drivers/nvmem/rcar-efuse.c                         |    1 -
 drivers/nvmem/sec-qfprom.c                         |    1 -
 drivers/nvmem/sunplus-ocotp.c                      |    1 -
 drivers/nvmem/u-boot-env.c                         |    1 -
 drivers/nvmem/uniphier-efuse.c                     |    1 -
 drivers/of/device.c                                |    1 -
 drivers/pci/controller/cadence/pcie-sg2042.c       |    1 -
 drivers/pci/controller/dwc/pci-exynos.c            |    1 -
 drivers/pci/controller/dwc/pci-meson.c             |    1 -
 drivers/pci/controller/dwc/pcie-intel-gw.c         |    1 -
 drivers/pci/controller/dwc/pcie-keembay.c          |    1 -
 drivers/pci/controller/dwc/pcie-spacemit-k1.c      |    1 -
 drivers/pci/controller/dwc/pcie-stm32.c            |    1 -
 drivers/pci/pwrctrl/generic.c                      |    1 -
 drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c           |    1 -
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           |    1 -
 drivers/perf/arm-ccn.c                             |    1 -
 drivers/perf/fujitsu_uncore_pmu.c                  |    1 -
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c        |    1 -
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c       |    1 -
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c        |    1 -
 drivers/perf/riscv_pmu_legacy.c                    |    1 -
 drivers/perf/riscv_pmu_sbi.c                       |    1 -
 drivers/perf/starfive_starlink_pmu.c               |    1 -
 drivers/phy/allwinner/phy-sun50i-usb3.c            |    1 -
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c      |    1 -
 drivers/phy/amlogic/phy-meson-axg-pcie.c           |    1 -
 drivers/phy/amlogic/phy-meson-gxl-usb2.c           |    1 -
 drivers/phy/amlogic/phy-meson8b-usb2.c             |    1 -
 drivers/phy/cadence/cdns-dphy-rx.c                 |    1 -
 drivers/phy/freescale/Kconfig                      |    1 +
 drivers/phy/freescale/phy-fsl-lynx-10g.c           |   23 +-
 drivers/phy/hisilicon/phy-hi3670-pcie.c            |    1 -
 drivers/phy/hisilicon/phy-hi6220-usb.c             |    1 -
 drivers/phy/intel/phy-intel-keembay-usb.c          |    1 -
 drivers/phy/marvell/phy-mmp3-hsic.c                |    1 -
 drivers/phy/marvell/phy-mmp3-usb.c                 |    1 -
 drivers/phy/marvell/phy-mvebu-sata.c               |    1 -
 drivers/phy/mediatek/phy-mtk-ufs.c                 |    1 -
 drivers/phy/phy-eyeq5-eth.c                        |    1 -
 drivers/phy/phy-snps-eusb2.c                       |    1 -
 drivers/phy/qualcomm/phy-ath79-usb.c               |    1 -
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  |    1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c          |    1 -
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |    1 -
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |    1 -
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |    1 -
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |    1 -
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c              |    1 -
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |    1 -
 drivers/pinctrl/freescale/pinctrl-imx23.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx25.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx27.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx28.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx35.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx50.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx51.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx53.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6dl.c         |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6q.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6sl.c         |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6sll.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx6sx.c         |    1 -
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx8mq.c         |    1 -
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c        |    1 -
 drivers/pinctrl/freescale/pinctrl-imx91.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-imx93.c          |    1 -
 drivers/pinctrl/freescale/pinctrl-vf610.c          |    1 -
 drivers/pinctrl/intel/pinctrl-alderlake.c          |    1 -
 drivers/pinctrl/intel/pinctrl-broxton.c            |    1 -
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |    1 -
 drivers/pinctrl/intel/pinctrl-cedarfork.c          |    1 -
 drivers/pinctrl/intel/pinctrl-denverton.c          |    1 -
 drivers/pinctrl/intel/pinctrl-elkhartlake.c        |    1 -
 drivers/pinctrl/intel/pinctrl-emmitsburg.c         |    1 -
 drivers/pinctrl/intel/pinctrl-geminilake.c         |    1 -
 drivers/pinctrl/intel/pinctrl-intel-platform.c     |    1 -
 drivers/pinctrl/intel/pinctrl-jasperlake.c         |    1 -
 drivers/pinctrl/intel/pinctrl-lakefield.c          |    1 -
 drivers/pinctrl/intel/pinctrl-lewisburg.c          |    1 -
 drivers/pinctrl/intel/pinctrl-merrifield.c         |    1 -
 drivers/pinctrl/intel/pinctrl-meteorlake.c         |    1 -
 drivers/pinctrl/intel/pinctrl-meteorpoint.c        |    1 -
 drivers/pinctrl/intel/pinctrl-moorefield.c         |    1 -
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |    1 -
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |    1 -
 drivers/pinctrl/meson/pinctrl-meson.c              |    2 +-
 drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c    |    1 -
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c     |    1 -
 drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c  |    1 -
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c           |    1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |    1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |    1 -
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |    1 -
 drivers/pinctrl/pinctrl-as3722.c                   |    1 -
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |    1 -
 drivers/pinctrl/pinctrl-da850-pupd.c               |    1 -
 drivers/pinctrl/pinctrl-digicolor.c                |    1 -
 drivers/pinctrl/pinctrl-eic7700.c                  |    1 -
 drivers/pinctrl/pinctrl-eyeq5.c                    |    1 -
 drivers/pinctrl/pinctrl-ingenic.c                  |    1 -
 drivers/pinctrl/pinctrl-loongson2.c                |    1 -
 drivers/pinctrl/pinctrl-lpc18xx.c                  |    1 -
 drivers/pinctrl/pinctrl-max77620.c                 |    1 -
 drivers/pinctrl/pinctrl-mcp23s08.c                 |    1 -
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c             |    1 -
 drivers/pinctrl/pinctrl-mcp23s08_spi.c             |    1 -
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |    1 -
 drivers/pinctrl/pinctrl-mlxbf3.c                   |    1 -
 drivers/pinctrl/pinctrl-pistachio.c                |    1 -
 drivers/pinctrl/pinctrl-scmi.c                     |    1 -
 drivers/pinctrl/pinctrl-th1520.c                   |    1 -
 drivers/pinctrl/pinctrl-tps6594.c                  |    1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c             |    1 -
 drivers/pinctrl/spear/pinctrl-spear1310.c          |    1 -
 drivers/pinctrl/spear/pinctrl-spear1340.c          |    1 -
 drivers/pinctrl/spear/pinctrl-spear300.c           |    1 -
 drivers/pinctrl/spear/pinctrl-spear310.c           |    1 -
 drivers/pinctrl/spear/pinctrl-spear320.c           |    1 -
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c         |    1 -
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |    1 -
 .../pinctrl/starfive/pinctrl-starfive-jh7110-aon.c |    1 -
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |    1 -
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c |    1 -
 drivers/pinctrl/tegra/pinctrl-tegra234.c           |    1 -
 drivers/pinctrl/tegra/pinctrl-tegra238.c           |    1 -
 drivers/pinctrl/tegra/pinctrl-tegra264.c           |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c    |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-nx1.c    |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c   |    1 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c   |    1 -
 drivers/platform/chrome/cros_ec_chardev.c          |    1 -
 drivers/platform/chrome/cros_ec_debugfs.c          |    1 -
 drivers/platform/chrome/cros_ec_lightbar.c         |    1 -
 drivers/platform/chrome/cros_ec_sensorhub.c        |    1 -
 drivers/platform/chrome/cros_ec_sysfs.c            |    1 -
 drivers/platform/chrome/cros_ec_vbc.c              |    1 -
 drivers/platform/chrome/cros_kbd_led_backlight.c   |    1 -
 drivers/platform/chrome/cros_usbpd_logger.c        |    1 -
 drivers/platform/chrome/cros_usbpd_notify.c        |    1 -
 drivers/platform/chrome/wilco_ec/core.c            |    1 -
 drivers/platform/chrome/wilco_ec/debugfs.c         |    1 -
 drivers/platform/chrome/wilco_ec/telemetry.c       |    1 -
 drivers/platform/goldfish/goldfish_pipe.c          |    1 -
 drivers/platform/x86/amd/pmc/pmc.c                 |   36 +-
 drivers/platform/x86/asus-armoury.h                |   10 +-
 drivers/platform/x86/asus-tf103c-dock.c            |    1 -
 drivers/platform/x86/bitland-mifs-wmi.c            |    8 +
 drivers/platform/x86/intel/atomisp2/led.c          |    1 -
 drivers/platform/x86/intel/atomisp2/pm.c           |    1 -
 drivers/platform/x86/intel/bxtwc_tmu.c             |    1 -
 drivers/platform/x86/intel/ehl_pse_io.c            |    1 -
 drivers/platform/x86/intel/plr_tpmi.c              |    1 -
 drivers/platform/x86/intel/pmc/pwrm_telemetry.c    |    1 -
 drivers/platform/x86/intel/punit_ipc.c             |    1 -
 drivers/platform/x86/intel_scu_pltdrv.c            |    1 -
 drivers/platform/x86/msi-ec.c                      |    1 +
 drivers/platform/x86/nvidia-wmi-ec-backlight.c     |    1 -
 drivers/platform/x86/quickstart.c                  |    1 -
 drivers/platform/x86/uniwill/uniwill-wmi.c         |    1 -
 drivers/platform/x86/x86-android-tablets/dmi.c     |    1 -
 .../x86/x86-android-tablets/x86-android-tablets.h  |    1 +
 drivers/pmdomain/actions/owl-sps.c                 |    1 -
 drivers/pmdomain/imx/imx93-pd.c                    |    1 -
 .../pmdomain/marvell/pxa1908-power-controller.c    |    1 -
 drivers/pnp/pnpacpi/core.c                         |    1 -
 drivers/power/reset/brcm-kona-reset.c              |    1 -
 drivers/power/reset/ep93xx-restart.c               |    1 -
 drivers/power/reset/gpio-poweroff.c                |    1 -
 drivers/power/reset/ltc2952-poweroff.c             |    1 -
 drivers/power/reset/macsmc-reboot.c                |    1 -
 drivers/power/reset/ocelot-reset.c                 |    1 -
 drivers/power/reset/pwr-mlxbf.c                    |    1 -
 drivers/power/reset/qemu-virt-ctrl.c               |    1 -
 drivers/power/reset/sc27xx-poweroff.c              |    1 -
 drivers/power/reset/spacemit-p1-reboot.c           |    1 -
 drivers/power/reset/tdx-ec-poweroff.c              |    1 -
 drivers/power/reset/tps65086-restart.c             |    1 -
 drivers/power/sequencing/pwrseq-pcie-m2.c          |    1 -
 drivers/power/sequencing/pwrseq-qcom-wcn.c         |    1 -
 drivers/power/supply/adp5061.c                     |    1 -
 drivers/power/supply/bd71828-power.c               |    1 -
 drivers/power/supply/bd99954-charger.c             |    1 -
 drivers/power/supply/bq24190_charger.c             |    1 -
 drivers/power/supply/chagall-battery.c             |    1 -
 drivers/power/supply/cpcap-charger.c               |    1 -
 drivers/power/supply/cros_charge-control.c         |    1 -
 drivers/power/supply/cros_peripheral_charger.c     |    1 -
 drivers/power/supply/cros_usbpd-charger.c          |    1 -
 drivers/power/supply/lego_ev3_battery.c            |    1 -
 drivers/power/supply/max14656_charger_detector.c   |    1 -
 drivers/power/supply/max17042_battery.c            |    1 -
 drivers/power/supply/max77759_charger.c            |    1 -
 drivers/power/supply/max8971_charger.c             |    1 -
 drivers/power/supply/max8998_charger.c             |    1 -
 drivers/power/supply/mp2629_charger.c              |    1 -
 drivers/power/supply/olpc_battery.c                |    1 -
 drivers/power/supply/pm8916_bms_vm.c               |    1 -
 drivers/power/supply/pm8916_lbc.c                  |    1 -
 drivers/power/supply/rt5033_charger.c              |    1 -
 drivers/power/supply/rt9467-charger.c              |    1 -
 drivers/power/supply/rt9471.c                      |    1 -
 drivers/power/supply/rt9756.c                      |    1 -
 drivers/power/supply/s2mu005-battery.c             |    1 -
 drivers/power/supply/ug3105_battery.c              |    1 -
 drivers/pps/clients/pps-gpio.c                     |    1 -
 drivers/pps/generators/pps_gen_tio.c               |    1 -
 drivers/ptp/ptp_dte.c                              |    1 -
 drivers/pwm/pwm-adp5585.c                          |    1 -
 drivers/pwm/pwm-airoha.c                           |    1 -
 drivers/pwm/pwm-apple.c                            |    1 -
 drivers/pwm/pwm-berlin.c                           |    1 -
 drivers/pwm/pwm-ep93xx.c                           |    1 -
 drivers/pwm/pwm-gpio.c                             |    1 -
 drivers/pwm/pwm-intel-lgm.c                        |    1 -
 drivers/pwm/pwm-keembay.c                          |    1 -
 drivers/pwm/pwm-lpc18xx-sct.c                      |    1 -
 drivers/pwm/pwm-lpss-platform.c                    |    1 -
 drivers/pwm/pwm-max7360.c                          |    1 -
 drivers/pwm/pwm-pxa.c                              |    1 -
 drivers/pwm/pwm-sifive.c                           |    1 -
 drivers/pwm/pwm-sl28cpld.c                         |    1 -
 drivers/pwm/pwm-sprd.c                             |    1 -
 drivers/pwm/pwm-sunplus.c                          |    1 -
 drivers/pwm/pwm-vt8500.c                           |    1 -
 drivers/regulator/adp5055-regulator.c              |    1 -
 drivers/regulator/bd71828-regulator.c              |    1 -
 drivers/regulator/core.c                           |    4 +-
 drivers/regulator/max77541-regulator.c             |    1 -
 drivers/regulator/max77675-regulator.c             |    1 -
 drivers/regulator/mt6316-regulator.c               |    1 +
 drivers/regulator/mt6363-regulator.c               |    1 +
 drivers/regulator/mt6370-regulator.c               |    1 -
 drivers/regulator/pv88080-regulator.c              |    1 -
 drivers/regulator/rt4803.c                         |    1 -
 drivers/regulator/rt5739.c                         |    1 -
 drivers/regulator/rt6190-regulator.c               |    1 -
 drivers/regulator/rt8092.c                         |    1 -
 drivers/regulator/rtq2208-regulator.c              |    1 -
 drivers/regulator/tps6287x-regulator.c             |    1 -
 drivers/regulator/tps65218-regulator.c             |    1 -
 drivers/regulator/tps65912-regulator.c             |    1 -
 drivers/regulator/vexpress-regulator.c             |    1 -
 drivers/reset/reset-ath79.c                        |    1 -
 drivers/reset/reset-axs10x.c                       |    1 -
 drivers/reset/reset-bcm6345.c                      |    1 -
 drivers/reset/reset-eyeq.c                         |    1 -
 drivers/reset/reset-gpio.c                         |    1 -
 drivers/reset/reset-sunplus.c                      |    1 -
 drivers/reset/reset-tn48m.c                        |    1 -
 drivers/reset/starfive/reset-starfive-jh7100.c     |    1 -
 drivers/rtc/rtc-88pm886.c                          |    1 -
 drivers/rtc/rtc-cpcap.c                            |    1 -
 drivers/rtc/rtc-cros-ec.c                          |    1 -
 drivers/rtc/rtc-ds1307.c                           |    1 -
 drivers/rtc/rtc-ep93xx.c                           |    1 -
 drivers/rtc/rtc-fsl-ftm-alarm.c                    |    1 -
 drivers/rtc/rtc-ftrtc010.c                         |    1 -
 drivers/rtc/rtc-lpc24xx.c                          |    1 -
 drivers/rtc/rtc-m48t86.c                           |    1 -
 drivers/rtc/rtc-mc13xxx.c                          |    1 -
 drivers/rtc/rtc-moxart.c                           |    1 -
 drivers/rtc/rtc-msc313.c                           |    1 -
 drivers/rtc/rtc-mt6397.c                           |    1 -
 drivers/rtc/rtc-mt7622.c                           |    1 -
 drivers/rtc/rtc-mxc_v2.c                           |    1 -
 drivers/rtc/rtc-r7301.c                            |    1 -
 drivers/rtc/rtc-rzn1.c                             |    1 -
 drivers/rtc/rtc-sh.c                               |    1 -
 drivers/rtc/rtc-ssd202d.c                          |    1 -
 drivers/rtc/rtc-tegra.c                            |    1 -
 drivers/rtc/rtc-ti-k3.c                            |    1 -
 drivers/rtc/rtc-tps6594.c                          |    1 -
 drivers/s390/char/monwriter.c                      |    3 +
 drivers/s390/crypto/ap_bus.c                       |    2 +-
 drivers/s390/crypto/pkey_api.c                     |   11 +-
 drivers/s390/crypto/vfio_ap_drv.c                  |    2 +-
 drivers/s390/crypto/zcrypt_cex2a.c                 |    0
 drivers/s390/crypto/zcrypt_cex2a.h                 |    0
 drivers/s390/crypto/zcrypt_cex2c.c                 |    0
 drivers/s390/crypto/zcrypt_cex2c.h                 |    0
 drivers/s390/crypto/zcrypt_cex4.c                  |    2 +-
 drivers/siox/siox-bus-gpio.c                       |    1 -
 drivers/soc/amlogic/meson-clk-measure.c            |  286 ++++++
 drivers/soc/apple/Kconfig                          |   10 +
 drivers/soc/apple/Makefile                         |    2 +
 drivers/soc/apple/apple-pmgr-misc.c                |  181 ++++
 drivers/soc/apple/sart.c                           |    9 +-
 drivers/soc/aspeed/aspeed-uart-routing.c           |    1 +
 drivers/soc/fsl/dpio/dpio-driver.c                 |    6 +-
 drivers/soc/fsl/guts.c                             |  528 +++++++++-
 drivers/soc/fsl/qe/Kconfig                         |   10 +
 drivers/soc/fsl/qe/gpio.c                          |   53 +-
 drivers/soc/fsl/qe/qe.c                            |    1 -
 drivers/soc/fsl/qe/qe_ic.c                         |    3 +-
 drivers/soc/fsl/qe/qe_io.c                         |   15 +
 drivers/soc/fsl/qe/qe_ports_ic.c                   |  142 ++-
 drivers/soc/ixp4xx/ixp4xx-npe.c                    |    1 +
 drivers/soc/ixp4xx/ixp4xx-qmgr.c                   |   11 +-
 drivers/soc/mediatek/mt8167-mmsys.h                |   10 +-
 drivers/soc/mediatek/mt8173-mmsys.h                |   28 +-
 drivers/soc/mediatek/mt8183-mmsys.h                |   14 +-
 drivers/soc/mediatek/mt8186-mmsys.h                |   22 +-
 drivers/soc/mediatek/mt8188-mmsys.h                |   78 +-
 drivers/soc/mediatek/mt8192-mmsys.h                |   20 +-
 drivers/soc/mediatek/mt8195-mmsys.h                |  181 ++--
 drivers/soc/mediatek/mt8365-mmsys.h                |   20 +-
 drivers/soc/mediatek/mtk-dvfsrc.c                  |    1 +
 drivers/soc/mediatek/mtk-mmsys.h                   |  300 +++---
 drivers/soc/mediatek/mtk-socinfo.c                 |    7 +-
 drivers/soc/qcom/Kconfig                           |  127 ++-
 drivers/soc/qcom/Makefile                          |    3 +-
 drivers/soc/qcom/cmd-db.c                          |    2 +-
 drivers/soc/qcom/ice.c                             |    4 +-
 drivers/soc/qcom/llcc-qcom.c                       |   30 +
 drivers/soc/qcom/pmic_glink_altmode.c              |    3 +-
 drivers/soc/qcom/qcom-geni-se.c                    |   24 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |   39 +-
 drivers/soc/qcom/qcom_stats.c                      |   11 +-
 drivers/soc/qcom/rpmh-rsc.c                        |   37 +-
 drivers/soc/qcom/smem.c                            |   81 +-
 drivers/soc/qcom/smem.h                            |   12 +
 drivers/soc/qcom/smem_dramc.c                      |  430 +++++++++
 drivers/soc/qcom/socinfo.c                         |    1 +
 drivers/soc/qcom/ubwc_config.c                     |  342 +++----
 drivers/soc/renesas/Kconfig                        |    1 -
 drivers/soc/renesas/rzn1_irqmux.c                  |    1 -
 drivers/soc/samsung/exynos-pmu.c                   |    4 +-
 drivers/soc/sophgo/sg2044-topsys.c                 |    1 -
 drivers/soc/tegra/Kconfig                          |    1 +
 drivers/soc/tegra/cbb/tegra194-cbb.c               |    9 +-
 drivers/soc/tegra/fuse/fuse-tegra.c                |    6 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c              |   24 -
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |    1 -
 drivers/soc/tegra/pmc.c                            |   21 +-
 drivers/soc/ti/knav_qmss.h                         |    1 +
 drivers/soc/ti/knav_qmss_queue.c                   |    7 +-
 drivers/soc/ti/smartreflex.c                       |    1 -
 drivers/soc/ti/wkup_m3_ipc.c                       |    4 +-
 drivers/soc/xilinx/zynqmp_power.c                  |    5 +-
 drivers/soundwire/bus.c                            |    1 -
 drivers/soundwire/bus_type.c                       |    1 -
 drivers/soundwire/cadence_master.c                 |    1 -
 drivers/soundwire/debugfs.c                        |    1 -
 drivers/soundwire/generic_bandwidth_allocation.c   |    1 -
 drivers/soundwire/mipi_disco.c                     |    1 -
 drivers/soundwire/stream.c                         |    1 -
 drivers/soundwire/sysfs_slave.c                    |    1 -
 drivers/soundwire/sysfs_slave_dpn.c                |    1 -
 drivers/spi/spi-atcspi200.c                        |    1 -
 drivers/spi/spi-cs42l43.c                          |    1 -
 drivers/spi/spi-dw-core.c                          |    2 +-
 drivers/spi/spi-dw-dma.c                           |    3 +-
 drivers/spi/spi-gpio.c                             |    1 -
 drivers/spi/spi-hisi-sfc-v3xx.c                    |    1 -
 drivers/spi/spi-loongson-pci.c                     |    1 -
 drivers/spi/spi-loongson-plat.c                    |    1 -
 drivers/spi/spi-loopback-test.c                    |    1 -
 .../spi/spi-offload-trigger-adi-util-sigma-delta.c |    1 -
 drivers/spi/spi-offload-trigger-pwm.c              |    1 -
 drivers/spi/spi-pxa2xx-platform.c                  |    1 -
 drivers/spi/spi-realtek-rtl-snand.c                |    1 -
 drivers/spi/spi-realtek-rtl.c                      |    1 -
 drivers/spi/spi-rzv2h-rspi.c                       |    4 +-
 drivers/spi/spi-sc18is602.c                        |    1 -
 drivers/spi/spi-sh-msiof.c                         |   10 +-
 drivers/spi/spi-wpcm-fiu.c                         |    1 -
 drivers/spi/spi.c                                  |    4 +-
 drivers/spi/spidev.c                               |    1 -
 drivers/spmi/spmi-apple-controller.c               |    1 -
 drivers/staging/greybus/arche-apb-ctrl.c           |    1 -
 drivers/staging/iio/frequency/ad9832.c             |    1 -
 drivers/staging/iio/frequency/ad9834.c             |    1 -
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c     |   15 +
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      |   20 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c     |   23 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  |    8 +
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c      |    6 +-
 drivers/staging/vme_user/vme_fake.c                |    8 +
 drivers/staging/vme_user/vme_tsi148.c              |    8 +
 drivers/staging/vme_user/vme_user.c                |   22 +
 drivers/tee/qcomtee/call.c                         |    7 +-
 drivers/thermal/loongson2_thermal.c                |    1 -
 drivers/thermal/renesas/rzg2l_thermal.c            |    1 -
 drivers/tty/goldfish.c                             |    1 -
 drivers/tty/serial/8250/8250_dfl.c                 |    1 -
 drivers/tty/serial/8250/8250_dw.c                  |    1 -
 drivers/tty/serial/8250/8250_em.c                  |    1 -
 drivers/tty/serial/8250/8250_keba.c                |    1 -
 drivers/tty/serial/8250/8250_loongson.c            |    1 -
 drivers/tty/serial/8250/8250_mid.c                 |   13 +-
 drivers/tty/serial/8250/8250_ni.c                  |    1 -
 drivers/tty/serial/8250/8250_omap.c                |    3 +-
 drivers/tty/serial/8250/8250_port.c                |   10 +-
 drivers/tty/serial/max3100.c                       |    1 -
 drivers/tty/serial/max310x.c                       |   13 +-
 drivers/tty/serial/msm_serial.c                    |    3 +-
 drivers/tty/serial/sc16is7xx.c                     |    1 -
 drivers/tty/serial/sc16is7xx_i2c.c                 |    1 -
 drivers/tty/serial/sc16is7xx_spi.c                 |    1 -
 drivers/tty/serial/sccnxp.c                        |    1 -
 drivers/tty/serial/tegra-utc.c                     |    1 -
 drivers/tty/vt/keyboard.c                          |   12 +-
 drivers/ufs/core/ufs_trace.h                       |   36 +-
 drivers/uio/uio_pdrv_genirq.c                      |    1 -
 drivers/usb/atm/ueagle-atm.c                       |   36 +-
 drivers/usb/cdns3/cdnsp-mem.c                      |    2 +
 drivers/usb/class/cdc-acm.c                        |    3 +
 drivers/usb/common/ulpi.c                          |   23 +-
 drivers/usb/core/hub.c                             |    2 +-
 drivers/usb/core/quirks.c                          |    6 +
 drivers/usb/dwc2/core.h                            |    1 +
 drivers/usb/dwc3/core.c                            |    4 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c                 |   14 +-
 drivers/usb/dwc3/gadget.c                          |   43 +-
 drivers/usb/fotg210/fotg210-hcd.c                  |    6 +-
 drivers/usb/gadget/composite.c                     |    5 +-
 drivers/usb/gadget/function/f_fs.c                 |    9 +-
 drivers/usb/gadget/function/f_printer.c            |    3 +-
 drivers/usb/gadget/function/rndis.c                |   20 +-
 drivers/usb/gadget/udc/core.c                      |   29 +-
 drivers/usb/gadget/udc/renesas_usbf.c              |    1 -
 drivers/usb/host/Kconfig                           |    1 +
 drivers/usb/host/ehci-sched.c                      |   11 +-
 drivers/usb/host/sl811-hcd.c                       |    1 +
 drivers/usb/host/xhci-dbgcap.c                     |   60 +-
 drivers/usb/host/xhci-dbgcap.h                     |    3 +
 drivers/usb/host/xhci-sideband.c                   |    2 +
 drivers/usb/host/xhci.c                            |   11 +-
 drivers/usb/misc/chaoskey.c                        |    1 -
 drivers/usb/misc/idmouse.c                         |   45 +-
 drivers/usb/misc/iowarrior.c                       |   61 +-
 drivers/usb/misc/ldusb.c                           |   38 +-
 drivers/usb/misc/legousbtower.c                    |   37 +-
 drivers/usb/misc/usb-ljca.c                        |    1 -
 drivers/usb/misc/usbio.c                           |    8 +-
 drivers/usb/misc/uss720.c                          |    5 +-
 drivers/usb/mtu3/mtu3_gadget.c                     |    1 +
 drivers/usb/serial/digi_acceleport.c               |   43 +-
 drivers/usb/serial/keyspan_pda.c                   |    2 +-
 drivers/usb/serial/option.c                        |   16 +
 drivers/usb/storage/ene_ub6250.c                   |    3 +-
 drivers/usb/storage/usb.c                          |    2 +-
 drivers/usb/typec/anx7411.c                        |    4 +-
 drivers/usb/typec/class.c                          |    1 +
 drivers/usb/typec/mux.c                            |   13 +-
 drivers/usb/typec/mux/ps883x.c                     |    6 +-
 drivers/usb/typec/mux/tusb1046.c                   |    1 -
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |    1 -
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |    1 -
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |    1 -
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |    1 -
 drivers/usb/typec/tcpm/tcpci_mt6370.c              |    1 -
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             |   14 +-
 drivers/usb/typec/tcpm/tcpm.c                      |    9 +-
 drivers/usb/typec/ucsi/cros_ec_ucsi.c              |    1 -
 drivers/usb/typec/ucsi/displayport.c               |    7 +-
 drivers/usb/typec/ucsi/ucsi.c                      |   20 +
 drivers/usb/typec/ucsi/ucsi.h                      |    1 +
 drivers/usb/typec/ucsi/ucsi_acpi.c                 |   10 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |    2 +-
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c        |   12 +-
 drivers/usb/usbip/vudc.h                           |    1 -
 drivers/usb/usbip/vudc_dev.c                       |    4 +-
 drivers/vdpa/vdpa.c                                |    1 -
 drivers/vdpa/vdpa_user/vduse_dev.c                 |    1 -
 drivers/vfio/debugfs.c                             |    1 +
 drivers/vfio/pci/mlx5/cmd.h                        |   15 +-
 drivers/vfio/pci/vfio_pci.c                        |   30 +-
 drivers/vfio/pci/vfio_pci_core.c                   |  101 +-
 drivers/vfio/vfio_main.c                           |    8 +-
 drivers/video/backlight/apple_dwi_bl.c             |    1 -
 drivers/video/backlight/da9052_bl.c                |    1 -
 drivers/video/backlight/hx8357.c                   |    1 -
 drivers/video/backlight/ktd2801-backlight.c        |    1 -
 drivers/video/backlight/mp3309c.c                  |    1 -
 drivers/video/backlight/mt6370-backlight.c         |    1 -
 drivers/video/backlight/rave-sp-backlight.c        |    1 -
 drivers/video/backlight/rt4831-backlight.c         |    1 -
 .../fbdev/omap2/omapfb/displays/encoder-opa362.c   |    1 -
 .../fbdev/omap2/omapfb/displays/encoder-tfp410.c   |    1 -
 .../omap2/omapfb/displays/encoder-tpd12s015.c      |    1 -
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |    1 -
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c    |    2 +-
 drivers/virt/coco/tdx-guest/tdx-guest.c            |    1 -
 drivers/virt/coco/tdx-host/tdx-host.c              |    1 -
 drivers/w1/masters/amd_axi_w1.c                    |    1 -
 drivers/w1/masters/ds2490.c                        |    1 -
 drivers/w1/masters/mxc_w1.c                        |    1 -
 drivers/w1/masters/sgi_w1.c                        |    1 -
 drivers/w1/masters/w1-gpio.c                       |    1 -
 drivers/watchdog/at91rm9200_wdt.c                  |    1 -
 drivers/watchdog/cros_ec_wdt.c                     |    1 -
 drivers/watchdog/davinci_wdt.c                     |    1 -
 drivers/watchdog/ftwdt010_wdt.c                    |    1 -
 drivers/watchdog/gpio_wdt.c                        |    1 -
 drivers/watchdog/gunyah_wdt.c                      |    1 -
 drivers/watchdog/imgpdc_wdt.c                      |    1 -
 drivers/watchdog/keembay_wdt.c                     |    1 -
 drivers/watchdog/max63xx_wdt.c                     |    1 -
 drivers/watchdog/max77620_wdt.c                    |    1 -
 drivers/watchdog/meson_wdt.c                       |    1 -
 drivers/watchdog/moxart_wdt.c                      |    1 -
 drivers/watchdog/msc313e_wdt.c                     |    1 -
 drivers/watchdog/mt7621_wdt.c                      |    1 -
 drivers/watchdog/nic7018_wdt.c                     |    1 -
 drivers/watchdog/omap_wdt.c                        |    1 -
 drivers/watchdog/pseries-wdt.c                     |    1 -
 drivers/watchdog/realtek_otto_wdt.c                |    1 -
 drivers/watchdog/rt2880_wdt.c                      |    1 -
 drivers/watchdog/rti_wdt.c                         |    1 -
 drivers/watchdog/sbsa_gwdt.c                       |    1 -
 drivers/watchdog/sl28cpld_wdt.c                    |    1 -
 drivers/watchdog/sunplus_wdt.c                     |    1 -
 drivers/watchdog/ts72xx_wdt.c                      |    1 -
 drivers/watchdog/twl4030_wdt.c                     |    1 -
 drivers/watchdog/xilinx_wwdt.c                     |    1 -
 drivers/xen/gntalloc.c                             |   19 +-
 drivers/xen/gntdev.c                               |    8 +-
 drivers/xen/pvcalls-front.c                        |   88 +-
 drivers/xen/xen-front-pgdir-shbuf.c                |   12 +-
 drivers/xen/xenbus/xenbus_xs.c                     |    6 +
 fs/afs/callback.c                                  |   17 +-
 fs/afs/cell.c                                      |   27 +-
 fs/afs/cmservice.c                                 |    7 +-
 fs/afs/dir.c                                       |   40 +-
 fs/afs/dynroot.c                                   |    2 +-
 fs/afs/fs_operation.c                              |    2 +-
 fs/afs/inode.c                                     |   15 +-
 fs/afs/internal.h                                  |    3 +-
 fs/afs/super.c                                     |    5 +-
 fs/afs/symlink.c                                   |    4 +-
 fs/afs/vl_list.c                                   |   24 +-
 fs/afs/volume.c                                    |    2 +-
 fs/bpf_fs_kfuncs.c                                 |   23 +-
 fs/cachefiles/namei.c                              |    4 +-
 fs/exec.c                                          |    2 +-
 fs/exfat/iomap.c                                   |    5 +-
 fs/fat/dir.c                                       |   44 +-
 fs/fhandle.c                                       |    2 +-
 fs/freevxfs/vxfs_bmap.c                            |    3 +-
 fs/fuse/file.c                                     |   14 +-
 fs/iomap/bio.c                                     |   15 +-
 fs/iomap/buffered-io.c                             |   16 +-
 fs/iomap/direct-io.c                               |    7 +-
 fs/iomap/ioend.c                                   |    8 +-
 fs/minix/minix.h                                   |    2 +-
 fs/namei.c                                         |    4 +
 fs/netfs/buffered_read.c                           |    2 +-
 fs/netfs/buffered_write.c                          |    2 +-
 fs/netfs/direct_write.c                            |   18 +-
 fs/netfs/internal.h                                |   12 +
 fs/netfs/locking.c                                 |   95 ++
 fs/netfs/read_retry.c                              |    7 +-
 fs/netfs/write_collect.c                           |   10 +
 fs/netfs/write_issue.c                             |   55 +-
 fs/netfs/write_retry.c                             |    7 +-
 fs/nfs/dir.c                                       |    2 +
 fs/nfs/internal.h                                  |   12 +-
 fs/nfs/pnfs_nfs.c                                  |    2 +-
 fs/nfs/write.c                                     |   14 +-
 fs/ntfs/aops.c                                     |   23 +-
 fs/ntfs/attrib.c                                   |   36 +-
 fs/ntfs/attrlist.c                                 |    9 +
 fs/ntfs/dir.c                                      |   15 +-
 fs/ntfs/index.c                                    |    5 +-
 fs/ntfs/inode.c                                    |    9 +
 fs/ntfs/mft.c                                      |    8 +-
 fs/ntfs/namei.c                                    |   62 +-
 fs/ntfs3/inode.c                                   |    5 +-
 fs/orangefs/dir.c                                  |    7 +-
 fs/overlayfs/copy_up.c                             |   12 +-
 fs/overlayfs/inode.c                               |    4 +-
 fs/proc/generic.c                                  |    9 +-
 fs/proc/page.c                                     |    2 +-
 fs/resctrl/monitor.c                               |   39 +-
 fs/resctrl/rdtgroup.c                              |   33 +-
 fs/smb/client/cifs_fs_sb.h                         |    1 +
 fs/smb/client/cifsacl.c                            |    2 +-
 fs/smb/client/cifsfs.c                             |   12 +
 fs/smb/client/cifsfs.h                             |    4 +-
 fs/smb/client/cifsglob.h                           |    1 +
 fs/smb/client/cifsproto.h                          |    2 +-
 fs/smb/client/cifssmb.c                            |   36 -
 fs/smb/client/connect.c                            |    3 +-
 fs/smb/client/dfs_cache.c                          |   12 +-
 fs/smb/client/file.c                               |    8 +-
 fs/smb/client/inode.c                              |   13 +-
 fs/smb/client/link.c                               |   17 +-
 fs/smb/client/misc.c                               |   14 +-
 fs/smb/client/readdir.c                            |    4 +-
 fs/smb/client/reparse.c                            |   17 +-
 fs/smb/client/smb1ops.c                            |   28 +-
 fs/smb/client/smb2file.c                           |   19 +-
 fs/smb/client/smb2misc.c                           |   32 +-
 fs/smb/client/smb2ops.c                            |   19 +-
 fs/smb/client/smb2pdu.c                            |   34 +-
 fs/smb/client/smb2proto.h                          |    2 +-
 fs/smb/server/auth.c                               |   49 +-
 fs/smb/server/auth.h                               |    7 +-
 fs/smb/server/ksmbd_work.h                         |    7 +
 fs/smb/server/mgmt/user_session.c                  |    4 +-
 fs/smb/server/mgmt/user_session.h                  |    1 +
 fs/smb/server/oplock.c                             |  109 ++-
 fs/smb/server/server.c                             |   30 +-
 fs/smb/server/smb2misc.c                           |   18 +-
 fs/smb/server/smb2pdu.c                            |  222 +++--
 fs/smb/server/smbacl.c                             |   36 +-
 fs/smb/server/vfs.c                                |   14 +-
 fs/smb/server/vfs_cache.c                          |   79 +-
 fs/smb/server/vfs_cache.h                          |    1 +
 fs/xfs/libxfs/xfs_dquot_buf.c                      |   14 +-
 fs/xfs/scrub/agheader_repair.c                     |    2 +-
 fs/xfs/xfs_aops.c                                  |    3 +-
 fs/xfs/xfs_buf.c                                   |  192 ++--
 fs/xfs/xfs_buf.h                                   |    2 +-
 fs/xfs/xfs_buf_item.c                              |    3 +-
 fs/xfs/xfs_inode.c                                 |    3 +-
 fs/xfs/xfs_log_recover.c                           |    6 +-
 fs/xfs/xfs_qm.c                                    |    5 +-
 fs/xfs/xfs_super.c                                 |    3 +
 include/acpi/platform/aclinuxex.h                  |    1 +
 include/drm/display/drm_dp_helper.h                |    1 +
 include/drm/drm_exec.h                             |   34 +-
 include/drm/drm_fixed.h                            |    3 +-
 include/drm/drm_ras.h                              |    2 +
 include/dt-bindings/arm/qcom,ids.h                 |    1 +
 include/linux/acpi.h                               |    2 +-
 include/linux/amba/bus.h                           |    2 +-
 include/linux/auxiliary_bus.h                      |    2 +-
 include/linux/bcma/bcma.h                          |    2 +-
 include/linux/bpf_lsm.h                            |    4 +
 include/linux/cdx/cdx_bus.h                        |    2 +-
 include/linux/damon.h                              |   11 +-
 include/linux/device-id/acpi.h                     |   32 +
 include/linux/device-id/amba.h                     |   19 +
 include/linux/device-id/ap.h                       |   20 +
 include/linux/device-id/apr.h                      |   21 +
 include/linux/device-id/auxiliary.h                |   17 +
 include/linux/device-id/bcma.h                     |   25 +
 include/linux/device-id/ccw.h                      |   27 +
 include/linux/device-id/cdx.h                      |   40 +
 include/linux/device-id/coreboot.h                 |   20 +
 include/linux/device-id/css.h                      |   17 +
 include/linux/device-id/dfl.h                      |   34 +
 include/linux/device-id/dmi.h                      |   58 ++
 include/linux/device-id/eisa.h                     |   21 +
 include/linux/device-id/fsl_mc.h                   |   22 +
 include/linux/device-id/hda.h                      |   17 +
 include/linux/device-id/hid.h                      |   22 +
 include/linux/device-id/hv_vmbus.h                 |   18 +
 include/linux/device-id/i2c.h                      |   19 +
 include/linux/device-id/i3c.h                      |   26 +
 include/linux/device-id/ieee1394.h                 |   27 +
 include/linux/device-id/input.h                    |   62 ++
 include/linux/device-id/ipack.h                    |   17 +
 include/linux/device-id/isapnp.h                   |   16 +
 include/linux/device-id/ishtp.h                    |   24 +
 include/linux/device-id/mcb.h                      |   15 +
 include/linux/device-id/mdio.h                     |   35 +
 include/linux/device-id/mei_cl.h                   |   31 +
 include/linux/device-id/mhi.h                      |   24 +
 include/linux/device-id/mips_cdmm.h                |   17 +
 include/linux/device-id/of.h                       |   15 +
 include/linux/device-id/parisc.h                   |   21 +
 include/linux/device-id/pci.h                      |   54 ++
 include/linux/device-id/pcmcia.h                   |   48 +
 include/linux/device-id/platform.h                 |   17 +
 include/linux/device-id/pnp.h                      |   26 +
 include/linux/device-id/rio.h                      |   28 +
 include/linux/device-id/rpmsg.h                    |   19 +
 include/linux/device-id/sdio.h                     |   21 +
 include/linux/device-id/sdw.h                      |   18 +
 include/linux/device-id/serio.h                    |   18 +
 include/linux/device-id/slim.h                     |   23 +
 include/linux/device-id/spi.h                      |   19 +
 include/linux/device-id/spmi.h                     |   17 +
 include/linux/device-id/ssam.h                     |   28 +
 include/linux/device-id/ssb.h                      |   24 +
 include/linux/device-id/tb.h                       |   37 +
 include/linux/device-id/tee_client.h               |   18 +
 include/linux/device-id/typec.h                    |   26 +
 include/linux/device-id/ulpi.h                     |   16 +
 include/linux/device-id/usb.h                      |  111 +++
 include/linux/device-id/vchiq.h                    |    9 +
 include/linux/device-id/vio.h                      |   11 +
 include/linux/device-id/virtio.h                   |   16 +
 include/linux/device-id/wmi.h                      |   19 +
 include/linux/device-id/x86_cpu.h                  |   44 +
 include/linux/device-id/zorro.h                    |   19 +
 include/linux/device/driver.h                      |    2 +
 include/linux/dfl.h                                |    2 +-
 include/linux/dmi.h                                |    2 +-
 include/linux/eisa.h                               |    2 +-
 include/linux/filter.h                             |   15 +-
 include/linux/firewire.h                           |    3 +-
 include/linux/firmware/qcom/qcom_pas.h             |   43 +
 include/linux/firmware/xlnx-zynqmp.h               |   10 +-
 include/linux/fs.h                                 |    5 +
 include/linux/fsl/guts.h                           |   18 +-
 include/linux/fsl/mc.h                             |    2 +-
 include/linux/glob.h                               |    1 +
 include/linux/hid-sensor-hub.h                     |   25 +
 include/linux/hid.h                                |    2 +-
 include/linux/hyperv.h                             |    2 +-
 include/linux/i2c.h                                |    2 +-
 include/linux/i3c/device.h                         |    2 +-
 include/linux/inetdevice.h                         |    5 +
 include/linux/input.h                              |    2 +-
 include/linux/intel-ish-client-if.h                |    2 +-
 include/linux/iomap.h                              |    2 +
 include/linux/ipack.h                              |    2 +-
 include/linux/isapnp.h                             |    2 +-
 include/linux/mcb.h                                |    2 +-
 include/linux/mei_cl_bus.h                         |    2 +-
 include/linux/mhi.h                                |    1 +
 include/linux/mmc/sdio_func.h                      |    2 +-
 include/linux/mod_devicetable.h                    | 1014 ++-----------=
-------
 include/linux/netfs.h                              |   13 +-
 include/linux/of.h                                 |    2 +-
 include/linux/of_platform.h                        |    4 +-
 include/linux/page_ext.h                           |   19 +-
 include/linux/pci-epf.h                            |    2 +-
 include/linux/pci.h                                |    2 +-
 include/linux/phy.h                                |    2 +-
 include/linux/platform_data/x86/int3472.h          |    2 +-
 include/linux/platform_data/x86/soc.h              |    2 +-
 include/linux/platform_device.h                    |    2 +-
 include/linux/pnp.h                                |    2 +-
 include/linux/raspberrypi/vchiq_bus.h              |    2 +-
 include/linux/rio.h                                |    2 +-
 include/linux/rpmsg.h                              |    2 +-
 include/linux/serio.h                              |    2 +-
 include/linux/slimbus.h                            |    2 +-
 include/linux/soc/qcom/apr.h                       |    2 +-
 include/linux/soc/qcom/geni-se.h                   |    4 +
 include/linux/soc/qcom/smem.h                      |    2 +
 include/linux/soc/qcom/ubwc.h                      |   82 +-
 include/linux/soundwire/sdw.h                      |    2 +-
 include/linux/spi/spi.h                            |    4 +-
 include/linux/ssb/ssb.h                            |    2 +-
 include/linux/sunrpc/clnt.h                        |    1 +
 include/linux/surface_aggregator/device.h          |    2 +-
 include/linux/tee_drv.h                            |    2 +-
 include/linux/thunderbolt.h                        |    2 +-
 include/linux/tracepoint.h                         |   12 +-
 include/linux/ulpi/driver.h                        |    2 +-
 include/linux/usb.h                                |    2 +-
 include/linux/usb/serial.h                         |    1 +
 include/linux/usb/typec_altmode.h                  |    2 +-
 include/linux/vfio_pci_core.h                      |   18 +-
 include/linux/virtio.h                             |    2 +-
 include/linux/wmi.h                                |    2 +-
 include/linux/zorro.h                              |    2 +-
 include/net/addrconf.h                             |    5 +
 include/net/bluetooth/hci.h                        |    5 +-
 include/net/bluetooth/hci_core.h                   |    1 +
 include/net/bluetooth/l2cap.h                      |   10 +-
 include/net/gue.h                                  |    2 +-
 include/net/ip_vs.h                                |    3 +-
 include/net/mana/mana.h                            |    8 +
 include/net/netfilter/nf_flow_table.h              |    7 +-
 include/net/tc_act/tc_pedit.h                      |   18 +-
 include/net/tcp_ao.h                               |    1 +
 include/pcmcia/ds.h                                |    2 +-
 include/soc/fsl/dpaa2-fd.h                         |   19 +-
 include/soc/fsl/dpaa2-io.h                         |    4 +-
 include/sound/hda_codec.h                          |    2 +-
 include/sound/hdaudio.h                            |    1 +
 include/xen/interface/xen-mca.h                    |    4 +-
 include/xen/interface/xen.h                        |    8 +-
 io_uring/kbuf.c                                    |    5 +-
 io_uring/memmap.c                                  |    2 +-
 io_uring/msg_ring.c                                |   34 +-
 io_uring/tw.c                                      |    9 +-
 io_uring/uring_cmd.c                               |    4 +-
 kernel/audit.c                                     |   21 +-
 kernel/bpf/bpf_inode_storage.c                     |    9 +
 kernel/bpf/core.c                                  |   68 +-
 kernel/bpf/disasm.c                                |    5 +-
 kernel/bpf/dispatcher.c                            |    2 +-
 kernel/bpf/verifier.c                              |   34 +-
 kernel/events/core.c                               |   19 +-
 kernel/exit.c                                      |    7 +-
 kernel/fork.c                                      |    9 +-
 kernel/futex/requeue.c                             |    6 -
 kernel/signal.c                                    |   10 +-
 kernel/time/posix-cpu-timers.c                     |  173 ++--
 kernel/trace/fprobe.c                              |   10 +
 kernel/trace/ring_buffer.c                         |   10 +-
 kernel/trace/trace.c                               |    3 +-
 kernel/trace/trace_eprobe.c                        |    2 +-
 kernel/trace/trace_events_filter.c                 |    6 +-
 kernel/trace/trace_events_synth.c                  |   10 +-
 kernel/trace/trace_events_user.c                   |   39 +-
 kernel/trace/trace_functions.c                     |    8 +-
 kernel/trace/trace_osnoise.c                       |    4 +-
 kernel/trace/trace_preemptirq.c                    |    2 +-
 kernel/trace/trace_probe.c                         |   15 +-
 kernel/trace/trace_probe.h                         |    2 +-
 kernel/trace/trace_remote.c                        |   18 +-
 lib/bootconfig.c                                   |   23 +-
 lib/glob.c                                         |   31 +-
 lib/iov_iter.c                                     |   20 +-
 lib/raid/raid6/riscv/recov_rvv.c                   |    1 +
 lib/raid/raid6/riscv/rvv.c                         |    1 +
 lib/scatterlist.c                                  |    1 +
 lib/tests/kunit_iov_iter.c                         |    5 +-
 mm/compaction.c                                    |    7 +-
 mm/damon/ops-common.c                              |    1 +
 mm/damon/sysfs-schemes.c                           |   17 +-
 mm/filemap.c                                       |    2 +-
 mm/madvise.c                                       |    3 +-
 mm/mincore.c                                       |    3 +-
 mm/shrinker.c                                      |   13 +-
 mm/shrinker_debug.c                                |   10 +-
 net/batman-adv/distributed-arp-table.c             |   30 +-
 net/batman-adv/fragmentation.c                     |    8 +-
 net/batman-adv/gateway_client.c                    |    3 +-
 net/batman-adv/main.c                              |   13 +-
 net/batman-adv/mesh-interface.c                    |   17 +-
 net/batman-adv/mesh-interface.h                    |    2 +
 net/batman-adv/multicast_forw.c                    |    7 +-
 net/batman-adv/routing.c                           |    3 +-
 net/batman-adv/translation-table.c                 |    5 +-
 net/bluetooth/6lowpan.c                            |   84 +-
 net/bluetooth/af_bluetooth.c                       |   17 +-
 net/bluetooth/bnep/core.c                          |   27 +-
 net/bluetooth/hci_conn.c                           |   21 +-
 net/bluetooth/hci_sync.c                           |  133 ++-
 net/bluetooth/iso.c                                |   44 +-
 net/bluetooth/l2cap_core.c                         |  140 ++-
 net/bluetooth/l2cap_sock.c                         |  107 +--
 net/bluetooth/mgmt.c                               |    5 +
 net/bluetooth/msft.c                               |    2 +-
 net/bluetooth/sco.c                                |   15 +-
 net/bluetooth/smp.c                                |   27 +-
 net/bridge/br_if.c                                 |    3 +
 net/bridge/br_stp.c                                |    3 +-
 net/bridge/netfilter/ebtables.c                    |   12 +-
 net/core/netpoll.c                                 |    9 +-
 net/core/sock_map.c                                |   20 +
 net/dsa/tag.c                                      |   12 +-
 net/dsa/tag_ar9331.c                               |   10 +-
 net/dsa/tag_brcm.c                                 |   39 +-
 net/dsa/tag_dsa.c                                  |   15 +-
 net/dsa/tag_gswip.c                                |    8 +-
 net/dsa/tag_hellcreek.c                            |    9 +-
 net/dsa/tag_ksz.c                                  |   44 +-
 net/dsa/tag_lan9303.c                              |    2 +
 net/dsa/tag_mtk.c                                  |    8 +-
 net/dsa/tag_mxl-gsw1xx.c                           |    3 +
 net/dsa/tag_mxl862xx.c                             |    3 +
 net/dsa/tag_netc.c                                 |   18 +-
 net/dsa/tag_ocelot.c                               |    4 +-
 net/dsa/tag_ocelot_8021q.c                         |   20 +-
 net/dsa/tag_qca.c                                  |   14 +-
 net/dsa/tag_rtl4_a.c                               |    8 +-
 net/dsa/tag_rtl8_4.c                               |   24 +-
 net/dsa/tag_rzn1_a5psw.c                           |    8 +-
 net/dsa/tag_sja1105.c                              |   42 +-
 net/dsa/tag_trailer.c                              |   16 +-
 net/dsa/tag_vsc73xx_8021q.c                        |    1 +
 net/dsa/tag_xrs700x.c                              |   12 +-
 net/dsa/tag_yt921x.c                               |    7 +-
 net/dsa/user.c                                     |    7 +-
 net/ethtool/netlink.h                              |   28 +
 net/ethtool/rss.c                                  |   14 +-
 net/ipv4/igmp.c                                    |   29 +-
 net/ipv4/tcp_ao.c                                  |    5 +-
 net/ipv4/tcp_ipv4.c                                |    4 +-
 net/ipv4/tcp_output.c                              |    8 +-
 net/ipv6/ip6_fib.c                                 |   17 +-
 net/ipv6/mcast.c                                   |   40 +-
 net/ipv6/netfilter/ip6t_ah.c                       |    5 +
 net/ipv6/netfilter/ip6t_hbh.c                      |    1 +
 net/ipv6/netfilter/ip6t_rt.c                       |    3 +-
 net/ipv6/netfilter/nf_conntrack_reasm.c            |    5 +-
 net/ipv6/seg6.c                                    |    3 +
 net/llc/af_llc.c                                   |    1 +
 net/mac802154/iface.c                              |    2 +-
 net/netfilter/ipset/ip_set_core.c                  |    8 +-
 net/netfilter/ipset/ip_set_hash_gen.h              |   85 +-
 net/netfilter/ipvs/ip_vs_conn.c                    |    4 +-
 net/netfilter/ipvs/ip_vs_core.c                    |   33 +-
 net/netfilter/ipvs/ip_vs_proto_sctp.c              |   18 +-
 net/netfilter/ipvs/ip_vs_proto_tcp.c               |   11 +-
 net/netfilter/ipvs/ip_vs_proto_udp.c               |    3 +-
 net/netfilter/nf_conntrack_expect.c                |    3 +-
 net/netfilter/nf_conntrack_netlink.c               |   11 +-
 net/netfilter/nf_conntrack_sip.c                   |    7 +-
 net/netfilter/nf_flow_table_core.c                 |   19 +-
 net/netfilter/nf_flow_table_ip.c                   |   21 +-
 net/netfilter/nf_flow_table_offload.c              |   22 +-
 net/netfilter/nf_nat_sip.c                         |   11 +
 net/netfilter/nf_tables_api.c                      |    3 +
 net/netfilter/nfnetlink_cthelper.c                 |    4 +
 net/netfilter/nfnetlink_log.c                      |   26 +-
 net/netfilter/nfnetlink_queue.c                    |  186 +++-
 net/netfilter/nft_fib.c                            |    9 +
 net/netfilter/nft_fib_netdev.c                     |   29 +-
 net/netfilter/nft_lookup.c                         |   10 +-
 net/netfilter/nft_payload.c                        |  270 ++++++
 net/netfilter/nft_set_pipapo.c                     |   34 +-
 net/netfilter/nft_set_pipapo.h                     |    8 +
 net/netfilter/nft_set_rbtree.c                     |    8 +-
 net/netfilter/xt_connmark.c                        |   14 +-
 net/netfilter/xt_rateest.c                         |    2 +-
 net/netfilter/xt_u32.c                             |   28 +-
 net/qrtr/mhi.c                                     |    1 -
 net/rfkill/rfkill-gpio.c                           |    1 -
 net/sched/act_api.c                                |   13 +-
 net/sched/act_bpf.c                                |    2 +-
 net/sched/act_pedit.c                              |   13 +-
 net/sched/cls_api.c                                |   22 +-
 net/sched/sch_cake.c                               |    5 +-
 net/sched/sch_dualpi2.c                            |    6 +-
 net/sched/sch_hhf.c                                |   27 +
 net/sched/sch_multiq.c                             |    2 +-
 net/sched/sch_taprio.c                             |    2 +-
 net/sched/sch_teql.c                               |  128 ++-
 net/sctp/protocol.c                                |    3 +-
 net/sctp/sm_make_chunk.c                           |    5 +-
 net/sctp/sm_statefuns.c                            |   36 +-
 net/sctp/socket.c                                  |    9 +-
 net/smc/smc_cdc.c                                  |   15 +-
 net/sunrpc/clnt.c                                  |   19 +-
 net/sunrpc/xprtsock.c                              |   16 +-
 net/tipc/bcast.c                                   |   22 +-
 net/tipc/bcast.h                                   |    2 +-
 net/tipc/node.c                                    |   15 +-
 net/tls/tls_sw.c                                   |   11 +
 samples/damon/mtier.c                              |    3 +
 samples/ftrace/ftrace-ops.c                        |    4 +-
 samples/trace_events/trace-events-sample.c         |    4 +
 scripts/sorttable.c                                |   11 +-
 security/bpf/hooks.c                               |    3 +
 security/selinux/hooks.c                           |   38 +-
 sound/atmel/ac97c.c                                |    1 -
 sound/firewire/isight.c                            |    1 -
 sound/hda/codecs/realtek/alc269.c                  |    1 +
 sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c     |    1 -
 sound/hda/codecs/side-codecs/cs35l41_hda_spi.c     |    1 -
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c     |    1 -
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c     |    1 -
 sound/hda/core/hda_bus_type.c                      |    1 -
 sound/soc/amd/yc/acp6x-mach.c                      |    7 +
 sound/soc/atmel/sam9x5_wm8731.c                    |    1 -
 sound/soc/codecs/adau1372-i2c.c                    |    1 -
 sound/soc/codecs/adau1372-spi.c                    |    1 -
 sound/soc/codecs/adau1372.c                        |    1 -
 sound/soc/codecs/adau1761-i2c.c                    |    1 -
 sound/soc/codecs/adau1761-spi.c                    |    1 -
 sound/soc/codecs/adau1781-i2c.c                    |    1 -
 sound/soc/codecs/adau1781-spi.c                    |    1 -
 sound/soc/codecs/adau1977-i2c.c                    |    1 -
 sound/soc/codecs/adau1977-spi.c                    |    1 -
 sound/soc/codecs/adau7118-hw.c                     |    1 -
 sound/soc/codecs/ak4104.c                          |    1 -
 sound/soc/codecs/audio-iio-aux.c                   |    1 -
 sound/soc/codecs/cs4234.c                          |    1 -
 sound/soc/codecs/cs4270.c                          |    1 -
 sound/soc/codecs/cs42l42-sdw.c                     |    1 -
 sound/soc/codecs/cs42l43.c                         |    1 -
 sound/soc/codecs/cs42xx8-i2c.c                     |    1 -
 sound/soc/codecs/cs42xx8-spi.c                     |    1 -
 sound/soc/codecs/cs4349.c                          |    1 -
 sound/soc/codecs/es8316.c                          |    1 -
 sound/soc/codecs/es8323.c                          |    1 -
 sound/soc/codecs/es9356.c                          |    1 -
 sound/soc/codecs/lpass-va-macro.c                  |    7 +-
 sound/soc/codecs/max98357a.c                       |    1 -
 sound/soc/codecs/max98373-i2c.c                    |    1 -
 sound/soc/codecs/max98373-sdw.c                    |    1 -
 sound/soc/codecs/max98388.c                        |    1 -
 sound/soc/codecs/mt6351.c                          |    1 -
 sound/soc/codecs/mt6358.c                          |    1 -
 sound/soc/codecs/pcm3168a-i2c.c                    |    1 -
 sound/soc/codecs/rt1017-sdca-sdw.c                 |    1 -
 sound/soc/codecs/rt1308-sdw.c                      |    1 -
 sound/soc/codecs/rt1316-sdw.c                      |    1 -
 sound/soc/codecs/rt1318-sdw.c                      |    1 -
 sound/soc/codecs/rt1320-sdw.c                      |    1 -
 sound/soc/codecs/rt700-sdw.c                       |    1 -
 sound/soc/codecs/rt711-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt711-sdw.c                       |    1 -
 sound/soc/codecs/rt712-sdca-dmic.c                 |    1 -
 sound/soc/codecs/rt712-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt715-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt715-sdw.c                       |    1 -
 sound/soc/codecs/rt721-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt722-sdca-sdw.c                  |    1 -
 sound/soc/codecs/rt9123.c                          |    1 -
 sound/soc/codecs/rt9123p.c                         |    1 -
 sound/soc/codecs/rtq9124.c                         |    1 -
 sound/soc/codecs/rtq9128.c                         |    1 -
 sound/soc/codecs/sdw-mockup.c                      |    1 -
 sound/soc/codecs/simple-amplifier.c                |    1 -
 sound/soc/codecs/sma1303.c                         |    1 -
 sound/soc/codecs/src4xxx-i2c.c                     |    1 -
 sound/soc/codecs/tas675x.c                         |   14 +-
 sound/soc/codecs/uda1334.c                         |    1 -
 sound/soc/codecs/wm8510.c                          |    1 -
 sound/soc/codecs/wm8523.c                          |    1 -
 sound/soc/codecs/wm8524.c                          |    1 -
 sound/soc/codecs/wm8580.c                          |    1 -
 sound/soc/codecs/wm8711.c                          |    1 -
 sound/soc/codecs/wm8728.c                          |    1 -
 sound/soc/codecs/wm8731-i2c.c                      |    1 -
 sound/soc/codecs/wm8731-spi.c                      |    1 -
 sound/soc/codecs/wm8737.c                          |    1 -
 sound/soc/codecs/wm8753.c                          |    1 -
 sound/soc/codecs/wm8770.c                          |    1 -
 sound/soc/codecs/wm8776.c                          |    1 -
 sound/soc/fsl/fsl_aud2htx.c                        |    1 -
 sound/soc/fsl/mpc5200_psc_ac97.c                   |    1 -
 .../soc/generic/audio-graph-card2-custom-sample.c  |    1 -
 sound/soc/jz4740/jz4740-i2s.c                      |    1 -
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |    1 -
 sound/soc/qcom/apq8096.c                           |    1 -
 sound/soc/qcom/sc7280.c                            |    1 -
 sound/soc/qcom/storm.c                             |    1 -
 sound/soc/renesas/rcar/adg.c                       |   29 +-
 sound/soc/renesas/rcar/src.c                       |    2 +
 sound/soc/sdca/sdca_class.c                        |    1 -
 sound/soc/sof/sof-client-ipc-flood-test.c          |    1 -
 sound/soc/sof/sof-client-ipc-kernel-injector.c     |    1 -
 sound/soc/sof/sof-client-ipc-msg-injector.c        |    1 -
 sound/soc/sof/sof-client-probes-ipc3.c             |   23 +-
 sound/soc/sof/sof-client-probes-ipc4.c             |   11 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |    1 -
 sound/soc/sunxi/sun50i-dmic.c                      |    1 -
 sound/soc/tegra/tegra186_asrc.c                    |    1 -
 sound/soc/tegra/tegra186_dspk.c                    |    1 -
 sound/soc/tegra/tegra20_spdif.c                    |    1 -
 sound/soc/tegra/tegra210_adx.c                     |    1 -
 sound/soc/tegra/tegra210_amx.c                     |    1 -
 sound/soc/tegra/tegra210_dmic.c                    |    1 -
 sound/soc/tegra/tegra210_i2s.c                     |    1 -
 sound/soc/tegra/tegra210_mixer.c                   |    1 -
 sound/soc/tegra/tegra210_mvc.c                     |    1 -
 sound/soc/tegra/tegra210_ope.c                     |    1 -
 sound/soc/ti/omap-dmic.c                           |    1 -
 sound/soc/ti/omap-mcpdm.c                          |    1 -
 sound/usb/usx2y/us144mkii.c                        |   17 +-
 sound/usb/usx2y/us144mkii_capture.c                |    2 +-
 tools/include/linux/overflow.h                     |    1 +
 tools/testing/cxl/test/mem.c                       |    1 -
 tools/testing/selftests/arm64/gcs/libc-gcs.c       |    2 +-
 tools/testing/selftests/arm64/pauth/pac.c          |    2 +-
 .../selftests/bpf/prog_tests/sockmap_strp.c        |   31 +
 .../selftests/bpf/progs/refcounted_kptr_fail.c     |   34 +
 .../selftests/bpf/progs/sockmap_parse_prog.c       |   22 -
 .../selftests/bpf/progs/test_sockmap_strp.c        |    7 +
 .../testing/selftests/bpf/progs/verifier_unpriv.c  |   19 +
 tools/testing/selftests/drivers/net/hw/tso.py      |   16 +-
 tools/testing/selftests/filesystems/.gitignore     |    1 +
 tools/testing/selftests/filesystems/Makefile       |    4 +
 .../selftests/filesystems/idmapped_tmpfile.c       |  168 ++++
 tools/testing/selftests/gpio/.gitignore            |    1 +
 tools/testing/selftests/hid/Makefile               |    2 +-
 tools/testing/selftests/hid/hid_bpf.c              |   36 +-
 tools/testing/selftests/hid/progs/hid.c            |   15 +
 .../testing/selftests/hid/tests/test_multitouch.py |  114 +++
 tools/testing/selftests/mm/hmm-tests.c             |    1 +
 tools/testing/selftests/mm/ksft_process_madv.sh    |    2 +-
 tools/testing/selftests/mm/pagemap_ioctl.c         |   12 +-
 tools/testing/selftests/net/lib.sh                 |   25 +-
 tools/testing/selftests/net/lib/py/utils.py        |    4 +-
 tools/testing/selftests/net/tcp_mmap.c             |    4 +
 .../selftests/riscv/vector/validate_v_ptrace.c     |   15 +-
 tools/testing/selftests/rseq/Makefile              |    6 +-
 tools/testing/selftests/user_events/abi_test.c     |   29 +-
 tools/testing/selftests/user_events/perf_test.c    |   26 +-
 tools/testing/selftests/vfio/Makefile              |    2 -
 tools/testing/selftests/vfio/lib/libvfio.mk        |    2 +
 tools/testing/selftests/x86/test_shadow_stack.c    |   86 ++
 tools/usb/usbip/libsrc/usbip_common.c              |    2 +
 tools/usb/usbip/libsrc/usbip_device_driver.c       |    4 +
 tools/usb/usbip/libsrc/vhci_driver.c               |    1 +
 tools/virtio/asm/percpu_types.h                    |    7 +
 tools/virtio/linux/completion.h                    |    9 +
 tools/virtio/linux/device.h                        |    1 +
 tools/virtio/linux/dma-mapping.h                   |    1 +
 tools/virtio/linux/mod_devicetable.h               |   14 +
 tools/virtio/linux/virtio_features.h               |   79 ++
 2565 files changed, 15693 insertions(+), 8154 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-q=
e-pario-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/apple/apple,t6=
000-pmgr-misc.yaml
 create mode 100644 arch/mips/include/asm/irq_work.h
 create mode 100644 drivers/firmware/qcom/qcom_pas.c
 create mode 100644 drivers/firmware/qcom/qcom_pas.h
 create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
 create mode 100644 drivers/firmware/qcom/qcom_scm_trace.h
 delete mode 100644 drivers/s390/crypto/zcrypt_cex2a.c
 delete mode 100644 drivers/s390/crypto/zcrypt_cex2a.h
 delete mode 100644 drivers/s390/crypto/zcrypt_cex2c.c
 delete mode 100644 drivers/s390/crypto/zcrypt_cex2c.h
 create mode 100644 drivers/soc/apple/apple-pmgr-misc.c
 create mode 100644 drivers/soc/qcom/smem.h
 create mode 100644 drivers/soc/qcom/smem_dramc.c
 create mode 100644 include/linux/device-id/acpi.h
 create mode 100644 include/linux/device-id/amba.h
 create mode 100644 include/linux/device-id/ap.h
 create mode 100644 include/linux/device-id/apr.h
 create mode 100644 include/linux/device-id/auxiliary.h
 create mode 100644 include/linux/device-id/bcma.h
 create mode 100644 include/linux/device-id/ccw.h
 create mode 100644 include/linux/device-id/cdx.h
 create mode 100644 include/linux/device-id/coreboot.h
 create mode 100644 include/linux/device-id/css.h
 create mode 100644 include/linux/device-id/dfl.h
 create mode 100644 include/linux/device-id/dmi.h
 create mode 100644 include/linux/device-id/eisa.h
 create mode 100644 include/linux/device-id/fsl_mc.h
 create mode 100644 include/linux/device-id/hda.h
 create mode 100644 include/linux/device-id/hid.h
 create mode 100644 include/linux/device-id/hv_vmbus.h
 create mode 100644 include/linux/device-id/i2c.h
 create mode 100644 include/linux/device-id/i3c.h
 create mode 100644 include/linux/device-id/ieee1394.h
 create mode 100644 include/linux/device-id/input.h
 create mode 100644 include/linux/device-id/ipack.h
 create mode 100644 include/linux/device-id/isapnp.h
 create mode 100644 include/linux/device-id/ishtp.h
 create mode 100644 include/linux/device-id/mcb.h
 create mode 100644 include/linux/device-id/mdio.h
 create mode 100644 include/linux/device-id/mei_cl.h
 create mode 100644 include/linux/device-id/mhi.h
 create mode 100644 include/linux/device-id/mips_cdmm.h
 create mode 100644 include/linux/device-id/of.h
 create mode 100644 include/linux/device-id/parisc.h
 create mode 100644 include/linux/device-id/pci.h
 create mode 100644 include/linux/device-id/pcmcia.h
 create mode 100644 include/linux/device-id/platform.h
 create mode 100644 include/linux/device-id/pnp.h
 create mode 100644 include/linux/device-id/rio.h
 create mode 100644 include/linux/device-id/rpmsg.h
 create mode 100644 include/linux/device-id/sdio.h
 create mode 100644 include/linux/device-id/sdw.h
 create mode 100644 include/linux/device-id/serio.h
 create mode 100644 include/linux/device-id/slim.h
 create mode 100644 include/linux/device-id/spi.h
 create mode 100644 include/linux/device-id/spmi.h
 create mode 100644 include/linux/device-id/ssam.h
 create mode 100644 include/linux/device-id/ssb.h
 create mode 100644 include/linux/device-id/tb.h
 create mode 100644 include/linux/device-id/tee_client.h
 create mode 100644 include/linux/device-id/typec.h
 create mode 100644 include/linux/device-id/ulpi.h
 create mode 100644 include/linux/device-id/usb.h
 create mode 100644 include/linux/device-id/vchiq.h
 create mode 100644 include/linux/device-id/vio.h
 create mode 100644 include/linux/device-id/virtio.h
 create mode 100644 include/linux/device-id/wmi.h
 create mode 100644 include/linux/device-id/x86_cpu.h
 create mode 100644 include/linux/device-id/zorro.h
 create mode 100644 include/linux/firmware/qcom/qcom_pas.h
 create mode 100644 tools/testing/selftests/filesystems/idmapped_tmpfile=
.c
 create mode 100644 tools/virtio/asm/percpu_types.h
 create mode 100644 tools/virtio/linux/completion.h
 create mode 100644 tools/virtio/linux/mod_devicetable.h
 create mode 100644 tools/virtio/linux/virtio_features.h
