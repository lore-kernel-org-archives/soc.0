Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC447C3DA66
	for <soc@archiver.kernel.org>; Fri, 18 Aug 2023 02:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7364EC433CA; Fri, 18 Aug 2023 02:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623CBC433C8;
	Fri, 18 Aug 2023 02:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692325857;
	bh=PcC6HlBwffoLIRCx5CJsgvUSC7LDJ9uc1FjpooN65/c=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=kYolIws5GPwEEoWVpOJugORPh1zgaV6e2CODVvF027giW4ts9wQlswm19mYwJTOOI
	 lZ5Oh6Ex5mz7Zc1jC9ty9YU70ZVJbl/uIJM6xNjhJOmt2GRBbw27VVCoqJXTdSSs9e
	 aTmVE/CmVDMtVx0EwVZa9BzYLwxd4Gn5EOdxc3lNo1LU1yI+uAzV6TPznqMIUsMz+k
	 RwX+WRcvEL+6se0L4odcZTx6dwK9orROwW4n4vn8aau74nfjq+Nw0yB0q6/sMQPR53
	 jApCl4BMFuHdJyXfFckjzulOA8YxIFpzwDcmTXyS1uyXsC9wSy7o1Pe041Y2Vk2c8n
	 tMa/hxZFhb3iw==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Wronek <davidwronek@gmail.com>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Chris Lew <quic_clew@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Yangtao Li <frank.li@vivo.com>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.6
Date: Thu, 17 Aug 2023 19:33:36 -0700
Message-ID: <20230818023338.2484467-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.6

for you to fetch changes up to b4f63bbff96e4510676b1e78b00d14baaee9ad29:

  soc: qcom: aoss: Tidy up qmp_send() callers (2023-08-13 19:27:32 -0700)

----------------------------------------------------------------
Qualcomm driver updates for v6.6

Compatible and clock handling in the Qualcomm SCM driver is cleaned up,
together with a couple stylistic cleanups and transition to mark
exported symbols GPL only.

An abstraction for the RPM subsystem is introduced, to make align the
structure of the SMD and GLINK nodes thereof with the structure when a
remoteproc is involved. This is done to facilitate associating
additional entities with the RPM subsystem.

The qmp_send() API is modified to not expose hardware requirements onto
the client drivers, and then further extended to allow command
formatting directly in the API, to facilitate this typical use case.

In the Qualcomm Command DB driver, NUL characters previously included in
identifiers are dropped from the debugfs, to facilitate scripting.

The thresholds of the BWMON driver are simplified to avoid hard coded
starting values.

The OCMEM driver is updated with some cleanups and fixes, and addition
of MSM8226 support.

PMIC_GLINK gains support for retimer switches, safe mode is selected
when the cable is disconnected from altmode and the same is enabled for
SM8550.

An off-by-one string length check is corrected in the QMI encoder
decoder library.

The RPMh tracepoints are extended to include the state of the request,
to provide needed context in the traced events.

The series from Ulf creating a genpd framework is integrated, to
facilitate the other changes to the cpr, rpmpd and rpmhpd driver.
SDX75 support is added to the rpmhpd driver, and the rpmpd driver is
extended with the same sync_state logic found in the rpmhpd driver.

The socinfo driver gains knowledge about SM4450 and SM7125, the IPQ5019
platform is dropped.

Clock handling in the GSBI driver is cleaned up with the use of
devm_clk_get_enabled().

The list of VMIDs defined for the SCM assign memory interface is
extended.

----------------------------------------------------------------
Arnd Bergmann (2):
      soc: starfive: remove stale Makefile entry
      genpd: move owl-sps-helper.c from drivers/soc

Bjorn Andersson (7):
      soc: qcom: cmd-db: Drop NUL bytes from debugfs output
      soc: qcom: rpmh-rsc: Include state in trace event
      Merge branch '1689744162-9421-2-git-send-email-quic_rohiagar@quicinc.com' into drivers-for-6.6
      Merge branch 'genpd_create_dir' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm into drivers-for-6.6
      soc: qcom: aoss: Move length requirements from caller
      soc: qcom: aoss: Format string in qmp_send()
      soc: qcom: aoss: Tidy up qmp_send() callers

Chen Jiahao (1):
      soc: qcom: smem: Fix incompatible types in comparison

Chris Lew (1):
      soc: qcom: qmi_encdec: Restrict string length in decode

Christophe JAILLET (1):
      soc: qcom: smem: Use struct_size()

David Wronek (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7125
      soc: qcom: socinfo: Add SoC ID for SM7125

Gokul krishna Krishnakumar (1):
      dt-bindings: firmware: qcom: scm: Updating VMID list

Guru Das Srinagesh (2):
      firmware: qcom_scm: Convert all symbols to EXPORT_SYMBOL_GPL
      firmware: qcom_scm: Add missing extern specifier

Kathiravan T (2):
      soc: qcom: socinfo: drop the IPQ5019 SoC ID
      dt-bindings: arm: qcom,ids: drop the IPQ5019 SoC ID

Konrad Dybcio (7):
      soc: qcom: icc-bwmon: Set default thresholds dynamically
      soc: qcom: rpmpd: Add sync_state
      dt-bindings: firmware: qcom,scm: Allow interconnect on SC8280XP
      dt-bindings: arm: msm: kpss-acc: Make the optional reg truly optional
      firmware: qcom_scm: Always try to consume all three clocks
      firmware: qcom_scm: Always return devm_clk_get_optional errors
      firmware: qcom_scm: Drop useless compatibles

Krzysztof Kozlowski (1):
      dt-bindings: arm: msm: kpss-acc: Revert "dt-bindings: arm: msm: kpss-acc: Make the optional reg truly optional"

Luca Weiss (5):
      soc: qcom: ocmem: Fix NUM_PORTS & NUM_MACROS macros
      soc: qcom: ocmem: Use dev_err_probe where appropriate
      soc: qcom: ocmem: make iface clock optional
      dt-bindings: sram: qcom,ocmem: Add msm8226 support
      soc: qcom: ocmem: Add support for msm8226

Neil Armstrong (3):
      soc: qcom: pmic_glink_altmode: handle safe mode when disconnect
      soc: qcom: pmic_glink_altmode: add retimer-switch support
      soc: qcom: pmic_glink: enable altmode for SM8550

Peng Fan (1):
      genpd: Makefile: build imx

Rob Herring (1):
      soc: qcom: Explicitly include correct DT includes

Rohit Agarwal (5):
      dt-bindings: power: qcom,rpmhpd: Add Generic RPMh PD indexes
      soc: qcom: rpmhpd: Use the newly created generic RPMHPD bindings
      dt-bindings: power: qcom,rpmpd: Add compatible for sdx75
      soc: qcom: rpmhpd: Add SDX75 power domains
      dt-bindings: qcom: Update RPMHPD entries for some SoCs

Stephan Gerhold (9):
      dt-bindings soc: qcom: smd-rpm: Fix sort order
      dt-bindings: soc: qcom: smd-rpm: Add MSM8909 to qcom,smd-channels
      dt-bindings: soc: qcom: smd-rpm: Add some more compatibles
      soc: qcom: smd-rpm: Match rpmsg channel instead of compatible
      dt-bindings: remoteproc: glink-rpm-edge: Use "glink-edge" as node name
      dt-bindings: remoteproc: Add Qualcomm RPM processor/subsystem
      soc: qcom: smem: Add qcom_smem_is_available()
      rpmsg: qcom_smd: Use qcom_smem_is_available()
      soc: qcom: Add RPM processor/subsystem driver

Tengfei Fan (2):
      dt-bindings: arm: qcom,ids: add SoC ID for SM4450
      soc: qcom: socinfo: add SM4450 ID

Ulf Hansson (18):
      genpd: Create a new subsystem directory to host genpd providers
      soc: actions: Move power-domain driver to the genpd dir
      soc: amlogic: Move power-domain drivers to the genpd dir
      soc: apple: Move power-domain driver to the genpd dir
      soc: bcm: Move power-domain drivers to the genpd dir
      soc: imx: Move power-domain drivers to the genpd dir
      soc: mediatek: Move power-domain drivers to the genpd dir
      soc: qcom: Move power-domain drivers to the genpd dir
      soc: renesas: Move power-domain drivers to the genpd dir
      soc: rockchip: Mover power-domain driver to the genpd dir
      soc: samsung: Move power-domain driver to the genpd dir
      soc: starfive: Move the power-domain driver to the genpd dir
      soc: sunxi: Move power-domain driver to the genpd dir
      soc: tegra: Move powergate-bpmp driver to the genpd dir
      soc: ti: Mover power-domain drivers to the genpd dir
      soc: xilinx: Move power-domain driver to the genpd dir
      ARM: ux500: Convert power-domain code into a regular platform driver
      ARM: ux500: Move power-domain driver to the genpd dir

Yang Yingliang (1):
      soc: qcom: ocmem: add missing clk_disable_unprepare() in ocmem_dev_probe()

Yangtao Li (1):
      soc: qcom: spm: Convert to devm_platform_ioremap_resource()

Yuanjun Gong (1):
      soc: qcom: use devm_clk_get_enabled() in gsbi_probe()

 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |   4 +-
 .../bindings/clock/qcom,sm8350-videocc.yaml        |   4 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   4 +-
 .../bindings/clock/qcom,sm8450-dispcc.yaml         |   4 +-
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   4 +-
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   4 +-
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   4 +-
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |   8 +-
 .../bindings/display/msm/qcom,sm8350-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |   6 +-
 .../bindings/display/msm/qcom,sm8450-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |   8 +-
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |   8 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   1 +
 .../bindings/media/qcom,sm8250-venus.yaml          |   4 +-
 .../devicetree/bindings/mmc/sdhci-msm.yaml         |   4 +-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../bindings/remoteproc/qcom,glink-edge.yaml       |   3 -
 .../bindings/remoteproc/qcom,glink-rpm-edge.yaml   |   2 +-
 .../bindings/remoteproc/qcom,rpm-proc.yaml         | 171 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   6 +-
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  23 ++-
 .../devicetree/bindings/soc/qcom/qcom,smd.yaml     |   7 +
 .../devicetree/bindings/sram/qcom,ocmem.yaml       |  26 +++-
 MAINTAINERS                                        |  22 ++-
 arch/arm/mach-ux500/Makefile                       |   1 -
 arch/arm/mach-ux500/cpu-db8500.c                   |   5 -
 arch/arm/mach-ux500/pm_domains.h                   |  17 --
 drivers/Makefile                                   |   1 +
 drivers/firmware/qcom_scm.c                        | 156 ++++++-------------
 drivers/genpd/Makefile                             |  17 ++
 drivers/genpd/actions/Makefile                     |   3 +
 drivers/{soc => genpd}/actions/owl-sps-helper.c    |   0
 drivers/{soc => genpd}/actions/owl-sps.c           |   0
 drivers/genpd/amlogic/Makefile                     |   4 +
 drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     |   0
 drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c |   0
 drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c |   0
 drivers/genpd/apple/Makefile                       |   2 +
 .../apple/pmgr-pwrstate.c}                         |   0
 drivers/genpd/bcm/Makefile                         |   5 +
 drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm-pmb.c   |   0
 drivers/{soc => genpd}/bcm/bcm2835-power.c         |   0
 .../{soc/bcm/bcm63xx => genpd/bcm}/bcm63xx-power.c |   0
 drivers/{soc => genpd}/bcm/raspberrypi-power.c     |   0
 drivers/genpd/imx/Makefile                         |   7 +
 drivers/{soc => genpd}/imx/gpc.c                   |   0
 drivers/{soc => genpd}/imx/gpcv2.c                 |   0
 drivers/{soc => genpd}/imx/imx8m-blk-ctrl.c        |   0
 drivers/{soc => genpd}/imx/imx8mp-blk-ctrl.c       |   0
 drivers/{soc => genpd}/imx/imx93-blk-ctrl.c        |   0
 drivers/{soc => genpd}/imx/imx93-pd.c              |   0
 drivers/genpd/mediatek/Makefile                    |   3 +
 .../{soc => genpd}/mediatek/mt6795-pm-domains.h    |   0
 .../{soc => genpd}/mediatek/mt8167-pm-domains.h    |   0
 .../{soc => genpd}/mediatek/mt8173-pm-domains.h    |   0
 .../{soc => genpd}/mediatek/mt8183-pm-domains.h    |   0
 .../{soc => genpd}/mediatek/mt8186-pm-domains.h    |   0
 .../{soc => genpd}/mediatek/mt8188-pm-domains.h    |   0
 .../{soc => genpd}/mediatek/mt8192-pm-domains.h    |   0
 .../{soc => genpd}/mediatek/mt8195-pm-domains.h    |   0
 drivers/{soc => genpd}/mediatek/mtk-pm-domains.c   |   0
 drivers/{soc => genpd}/mediatek/mtk-pm-domains.h   |   0
 drivers/{soc => genpd}/mediatek/mtk-scpsys.c       |   0
 drivers/genpd/qcom/Makefile                        |   4 +
 drivers/{soc => genpd}/qcom/cpr.c                  |   1 -
 drivers/{soc => genpd}/qcom/rpmhpd.c               | 118 ++++++++------
 drivers/{soc => genpd}/qcom/rpmpd.c                |  35 ++++-
 drivers/genpd/renesas/Makefile                     |  30 ++++
 drivers/{soc => genpd}/renesas/r8a7742-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a7743-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a7745-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a77470-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a774a1-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a774b1-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a774c0-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a774e1-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a7779-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a7790-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a7791-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a7792-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a7794-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a7795-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a7796-sysc.c      |   0
 drivers/{soc => genpd}/renesas/r8a77965-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a77970-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a77980-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a77990-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a77995-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a779a0-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a779f0-sysc.c     |   0
 drivers/{soc => genpd}/renesas/r8a779g0-sysc.c     |   0
 drivers/{soc => genpd}/renesas/rcar-gen4-sysc.c    |   0
 drivers/{soc => genpd}/renesas/rcar-gen4-sysc.h    |   0
 drivers/{soc => genpd}/renesas/rcar-sysc.c         |   0
 drivers/{soc => genpd}/renesas/rcar-sysc.h         |   0
 drivers/{soc => genpd}/renesas/rmobile-sysc.c      |   0
 drivers/genpd/rockchip/Makefile                    |   2 +
 .../pm_domains.c => genpd/rockchip/pm-domains.c}   |   0
 drivers/genpd/samsung/Makefile                     |   2 +
 .../samsung/exynos-pm-domains.c}                   |   0
 drivers/genpd/st/Makefile                          |   2 +
 .../genpd/st/ste-ux500-pm-domain.c                 |  25 ++-
 drivers/genpd/starfive/Makefile                    |   2 +
 .../jh71xx_pmu.c => genpd/starfive/jh71xx-pmu.c}   |   0
 drivers/genpd/sunxi/Makefile                       |   2 +
 drivers/{soc => genpd}/sunxi/sun20i-ppu.c          |   0
 drivers/genpd/tegra/Makefile                       |   2 +
 drivers/{soc => genpd}/tegra/powergate-bpmp.c      |   0
 drivers/genpd/ti/Makefile                          |   3 +
 drivers/{soc => genpd}/ti/omap_prm.c               |   0
 drivers/{soc => genpd}/ti/ti_sci_pm_domains.c      |   0
 drivers/genpd/xilinx/Makefile                      |   2 +
 .../xilinx/zynqmp-pm-domains.c}                    |   0
 drivers/net/ipa/ipa_power.c                        |   5 +-
 drivers/remoteproc/qcom_q6v5.c                     |   8 +-
 drivers/rpmsg/qcom_smd.c                           |  10 +-
 drivers/soc/Makefile                               |   2 -
 drivers/soc/actions/Makefile                       |   4 -
 drivers/soc/amlogic/Makefile                       |   3 -
 drivers/soc/apple/Makefile                         |   2 -
 drivers/soc/bcm/Kconfig                            |  22 ++-
 drivers/soc/bcm/Makefile                           |   3 -
 drivers/soc/bcm/bcm63xx/Kconfig                    |  21 ---
 drivers/soc/bcm/bcm63xx/Makefile                   |   3 -
 drivers/soc/imx/Makefile                           |   7 +-
 drivers/soc/mediatek/Makefile                      |   2 -
 drivers/soc/qcom/Kconfig                           |   1 +
 drivers/soc/qcom/Makefile                          |   5 +-
 drivers/soc/qcom/cmd-db.c                          |   2 +-
 drivers/soc/qcom/icc-bwmon.c                       |  30 +---
 drivers/soc/qcom/ice.c                             |   2 +
 drivers/soc/qcom/llcc-qcom.c                       |   1 -
 drivers/soc/qcom/ocmem.c                           |  68 ++++----
 drivers/soc/qcom/pmic_glink.c                      |   8 +-
 drivers/soc/qcom/pmic_glink_altmode.c              |  62 +++++++-
 drivers/soc/qcom/qcom_aoss.c                       |  49 +++---
 drivers/soc/qcom/qcom_gsbi.c                       |  11 +-
 drivers/soc/qcom/qmi_encdec.c                      |   4 +-
 drivers/soc/qcom/rpm-proc.c                        |  77 ++++++++++
 drivers/soc/qcom/rpmh-rsc.c                        |   2 +-
 drivers/soc/qcom/smd-rpm.c                         |  35 ++---
 drivers/soc/qcom/smem.c                            |  18 ++-
 drivers/soc/qcom/socinfo.c                         |   3 +-
 drivers/soc/qcom/spm.c                             |   6 +-
 drivers/soc/qcom/trace-rpmh.h                      |  16 +-
 drivers/soc/qcom/wcnss_ctrl.c                      |   1 +
 drivers/soc/renesas/Makefile                       |  27 ----
 drivers/soc/rockchip/Makefile                      |   1 -
 drivers/soc/samsung/Makefile                       |   1 -
 drivers/soc/starfive/Makefile                      |   3 -
 drivers/soc/sunxi/Makefile                         |   1 -
 drivers/soc/tegra/Makefile                         |   1 -
 drivers/soc/ti/Makefile                            |   2 -
 drivers/soc/xilinx/Makefile                        |   1 -
 include/dt-bindings/arm/qcom,ids.h                 |   3 +-
 include/dt-bindings/firmware/qcom,scm.h            |  21 +++
 include/dt-bindings/power/qcom,rpmhpd.h            |  30 ++++
 include/linux/firmware/qcom/qcom_scm.h             |   2 +-
 include/linux/soc/qcom/qcom_aoss.h                 |   4 +-
 include/linux/soc/qcom/smem.h                      |   1 +
 163 files changed, 892 insertions(+), 494 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
 delete mode 100644 arch/arm/mach-ux500/pm_domains.h
 create mode 100644 drivers/genpd/Makefile
 create mode 100644 drivers/genpd/actions/Makefile
 rename drivers/{soc => genpd}/actions/owl-sps-helper.c (100%)
 rename drivers/{soc => genpd}/actions/owl-sps.c (100%)
 create mode 100644 drivers/genpd/amlogic/Makefile
 rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (100%)
 rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (100%)
 rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (100%)
 create mode 100644 drivers/genpd/apple/Makefile
 rename drivers/{soc/apple/apple-pmgr-pwrstate.c => genpd/apple/pmgr-pwrstate.c} (100%)
 create mode 100644 drivers/genpd/bcm/Makefile
 rename drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm-pmb.c (100%)
 rename drivers/{soc => genpd}/bcm/bcm2835-power.c (100%)
 rename drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm63xx-power.c (100%)
 rename drivers/{soc => genpd}/bcm/raspberrypi-power.c (100%)
 create mode 100644 drivers/genpd/imx/Makefile
 rename drivers/{soc => genpd}/imx/gpc.c (100%)
 rename drivers/{soc => genpd}/imx/gpcv2.c (100%)
 rename drivers/{soc => genpd}/imx/imx8m-blk-ctrl.c (100%)
 rename drivers/{soc => genpd}/imx/imx8mp-blk-ctrl.c (100%)
 rename drivers/{soc => genpd}/imx/imx93-blk-ctrl.c (100%)
 rename drivers/{soc => genpd}/imx/imx93-pd.c (100%)
 create mode 100644 drivers/genpd/mediatek/Makefile
 rename drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.c (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.h (100%)
 rename drivers/{soc => genpd}/mediatek/mtk-scpsys.c (100%)
 create mode 100644 drivers/genpd/qcom/Makefile
 rename drivers/{soc => genpd}/qcom/cpr.c (99%)
 rename drivers/{soc => genpd}/qcom/rpmhpd.c (92%)
 rename drivers/{soc => genpd}/qcom/rpmpd.c (96%)
 create mode 100644 drivers/genpd/renesas/Makefile
 rename drivers/{soc => genpd}/renesas/r8a7742-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7743-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7745-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77470-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a774a1-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a774b1-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a774c0-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a774e1-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7779-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7790-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7791-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7792-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7794-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7795-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a7796-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77965-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77970-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77980-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77990-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a77995-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a779a0-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a779f0-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/r8a779g0-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/rcar-gen4-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/rcar-gen4-sysc.h (100%)
 rename drivers/{soc => genpd}/renesas/rcar-sysc.c (100%)
 rename drivers/{soc => genpd}/renesas/rcar-sysc.h (100%)
 rename drivers/{soc => genpd}/renesas/rmobile-sysc.c (100%)
 create mode 100644 drivers/genpd/rockchip/Makefile
 rename drivers/{soc/rockchip/pm_domains.c => genpd/rockchip/pm-domains.c} (100%)
 create mode 100644 drivers/genpd/samsung/Makefile
 rename drivers/{soc/samsung/pm_domains.c => genpd/samsung/exynos-pm-domains.c} (100%)
 create mode 100644 drivers/genpd/st/Makefile
 rename arch/arm/mach-ux500/pm_domains.c => drivers/genpd/st/ste-ux500-pm-domain.c (75%)
 create mode 100644 drivers/genpd/starfive/Makefile
 rename drivers/{soc/starfive/jh71xx_pmu.c => genpd/starfive/jh71xx-pmu.c} (100%)
 create mode 100644 drivers/genpd/sunxi/Makefile
 rename drivers/{soc => genpd}/sunxi/sun20i-ppu.c (100%)
 create mode 100644 drivers/genpd/tegra/Makefile
 rename drivers/{soc => genpd}/tegra/powergate-bpmp.c (100%)
 create mode 100644 drivers/genpd/ti/Makefile
 rename drivers/{soc => genpd}/ti/omap_prm.c (100%)
 rename drivers/{soc => genpd}/ti/ti_sci_pm_domains.c (100%)
 create mode 100644 drivers/genpd/xilinx/Makefile
 rename drivers/{soc/xilinx/zynqmp_pm_domains.c => genpd/xilinx/zynqmp-pm-domains.c} (100%)
 delete mode 100644 drivers/soc/actions/Makefile
 delete mode 100644 drivers/soc/bcm/bcm63xx/Kconfig
 delete mode 100644 drivers/soc/bcm/bcm63xx/Makefile
 create mode 100644 drivers/soc/qcom/rpm-proc.c
 delete mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 include/dt-bindings/power/qcom,rpmhpd.h
