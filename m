Return-Path: <SRS0=/QGC=FY=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4071DCD80C1
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 12:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E9D9C433CA; Tue, 10 Oct 2023 12:43:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id DA5B6C433C8;
	Tue, 10 Oct 2023 12:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA5B6C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A43AC15;
	Tue, 10 Oct 2023 05:44:31 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 746BC3F7A6;
	Tue, 10 Oct 2023 05:43:49 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.7
Date: Tue, 10 Oct 2023 13:43:47 +0100
Message-ID: <20231010124347.1620040-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Note that this pull request contains changes in the OPP, pmdomain and
the clock drivers. They have been acked-by the maintainers agreeing to
take these changes via Arm SoC tree. Also note the OPP changes are merged
into SCMI using immutable branch shared with OPP tree.

Please pull !

Regards,
Sudeep

-->8

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.7

for you to fetch changes up to da405477e7670782241234ea6b4309f3224ecb63:

  firmware: arm_scmi: Add qcom smc/hvc transport support (2023-10-09 22:07:13 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.7

Main additions this time include:

1. SCMI v3.2 clock configuration support:
   This helps to retrieve the enabled state of a clock as well as allow
   to set OEM specific clock configurations.

2. Support for generic performance scaling(DVFS):
   The current SCMI DVFS support is limited to the CPUs in the kernel.
   This extension enables it to used for all kind of devices and not
   only for the CPUs. It updates the SCMI cpufreq to utilize the power
   domain bindings. It also adds a more generic SCMI performance domain
   based on the genpd framework that as be used for all the non-CPU
   devices.

3. Extend the generic performance scaling(DVFS) support for firmware
   driver OPPs:
   Consumer drivers for devices that are attached to the SCMI performance
   domain can't make use of the current OPP library to scale performance
   as the OPPs are firmware driven and often obtained from the firmware
   rather than the device tree. These changes extend the generic OPP
   and genpd PM domain frameworks to identify and utilise these firmware
   driven OPPs.

4. SCMI v3.2 clock parent support:
   This enables the support for discovering and changing parent clocks
   and extending the SCMI clk driver to use the same.

5. Qualcom SMC/HVC transport support:
   The Qualcomm virtual platforms require capability id in the hypervisor
   call to identify which doorbell to assert when supporting multiple
   SMC/HVC based SCMI transport channels. Extra parameter is added to
   support the same and the same is obtained at the fixed address in the
   shared memory which is initialised by the firmware.

6. Move the existing SCMI power domain driver under drivers/pmdomain

Apart from the above main changes, it also include couple of minor fixes
and cosmetic reworks.

----------------------------------------------------------------
Cristian Marussi (6):
      firmware: arm_scmi: Simplify enable/disable clock operations
      firmware: arm_scmi: Add clock v3.2 CONFIG_SET support
      firmware: arm_scmi: Add v3.2 clock CONFIG_GET support
      firmware: arm_scmi: Add clock .state_get support to pre-v3.2
      clk: scmi: Add support for .is_enabled clk_ops
      firmware: arm_scmi: Add clock OEM config clock operations

Nikunj Kela (2):
      dt-bindings: arm: Add new compatible for smc/hvc transport for SCMI
      firmware: arm_scmi: Add qcom smc/hvc transport support

Peng Fan (2):
      firmware: arm_scmi: Add support for clock parents
      clk: scmi: Add support for clock {set,get}_parent

Rob Herring (1):
      firmware: arm_scpi: Use device_get_match_data()

Sudeep Holla (6):
      firmware: arm_scmi: Move power-domain driver to the pmdomain dir
      firmware: arm_scmi: Do not use !! on boolean when setting msg->flags
      firmware: arm_scmi: Rename scmi_{msg_,}clock_config_{get,set}_{2,21}
      Merge branch 'opp/pm-domain-scmi' of git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm into for-next/scmi/updates
      clk: scmi: Free scmi_clk allocated when the clocks with invalid info are skipped
      firmware: arm_scmi: Convert u32 to unsigned long to align with arm_smccc_1_1_invoke()

Ulf Hansson (21):
      firmware: arm_scmi: Extend perf protocol ops to get number of domains
      firmware: arm_scmi: Extend perf protocol ops to get information of a domain
      cpufreq: scmi: Prepare to move OF parsing of domain-id to cpufreq
      firmware: arm_scmi: Align perf ops to use domain-id as in-parameter
      firmware: arm_scmi: Drop redundant ->device_domain_id() from perf ops
      cpufreq: scmi: Avoid one OF parsing in scmi_get_sharing_cpus()
      dt-bindings: arm: cpus: Add a power-domain-name for a performance-domain
      dt-bindings: firmware: arm,scmi: Extend bindings for protocol@13
      dt-bindings: power: Clarify performance capabilities of power-domains
      cpufreq: scmi: Add support to parse domain-id using #power-domain-cells
      PM: domains: Allow genpd providers to manage OPP tables directly by its FW
      pmdomain: arm: Add the SCMI performance domain
      PM: domains: Introduce dev_pm_domain_set_performance_state()
      PM: domains: Implement the ->set_performance_state() callback for genpd
      OPP: Add dev_pm_opp_add_dynamic() to allow more flexibility
      OPP: Extend dev_pm_opp_data with a level
      OPP: Switch to use dev_pm_domain_set_performance_state()
      OPP: Extend support for the opp-level beyond required-opps
      firmware: arm_scmi: Simplify error path in scmi_dvfs_device_opps_add()
      firmware: arm_scmi: Specify the performance level when adding an OPP
      firmware: arm_scmi: Add generic OPP support to the SCMI performance domain

 Documentation/devicetree/bindings/arm/cpus.yaml    |   4 +-
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  15 +-
 .../devicetree/bindings/power/power-domain.yaml    |  17 +-
 MAINTAINERS                                        |   1 +
 drivers/base/power/common.c                        |  21 ++
 drivers/base/power/domain.c                        |  44 ++-
 drivers/clk/clk-scmi.c                             |  96 ++++-
 drivers/cpufreq/scmi-cpufreq.c                     |  52 ++-
 drivers/firmware/arm_scmi/Kconfig                  |  12 +
 drivers/firmware/arm_scmi/Makefile                 |   1 -
 drivers/firmware/arm_scmi/clock.c                  | 402 +++++++++++++++++++--
 drivers/firmware/arm_scmi/driver.c                 |   1 +
 drivers/firmware/arm_scmi/perf.c                   | 112 +++---
 drivers/firmware/arm_scmi/powercap.c               |   4 +-
 drivers/firmware/arm_scmi/smc.c                    |  35 +-
 drivers/firmware/arm_scpi.c                        |  13 +-
 drivers/opp/core.c                                 |  60 ++-
 drivers/opp/of.c                                   |  10 +-
 drivers/opp/opp.h                                  |   2 +-
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/arm/Makefile                      |   4 +
 drivers/pmdomain/arm/scmi_perf_domain.c            | 184 ++++++++++
 .../arm_scmi => pmdomain/arm}/scmi_pm_domain.c     |   0
 include/linux/pm.h                                 |   2 +
 include/linux/pm_domain.h                          |  11 +
 include/linux/pm_opp.h                             |  31 +-
 include/linux/scmi_protocol.h                      |  43 ++-
 27 files changed, 994 insertions(+), 184 deletions(-)
 create mode 100644 drivers/pmdomain/arm/Makefile
 create mode 100644 drivers/pmdomain/arm/scmi_perf_domain.c
 rename drivers/{firmware/arm_scmi => pmdomain/arm}/scmi_pm_domain.c (100%)
