Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEF323D283
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 06:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786342060; cv=none; b=Ulq+My+k1utzd+wpgfDYE1FypwAshtPT2mbBIiDEhI8b2mw/5bZ1oafi2aPrQ+/T4bkYe75tcuazDmSgMcc507qzpER8AKndSrEO0w4tOz1BWj17qeWVgseu2mct2n1d8tykOZCMgMVXSjFaW12aKnxY63q/ZuAi88WROl+IlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786342060; c=relaxed/simple;
	bh=RIJoqA6izcS8Z4E1nLDq29k/L/tq9z/xjbf9AeFwL6I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ZYiOEA8rHQz/HHIpfJIdUgv6ljDRzr9hIKrfPW2h24GOOkuDDWjOl6Rr4z9rTjoqxBnexXQf0A1mItwMLseOgFmoaXT2RLcCreiIQIhQQhdTT4Jbh5QtQF7DykBIdUF8v7+0qrfEcIKpvtBiou0MGuYZvXcQfYEbmjohdxhsKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxMv8773; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxMv8773"
Received: by smtp.kernel.org (Postfix)
	id 103321F00A3A; Mon, 10 Aug 2026 06:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C411F000E9;
	Mon, 10 Aug 2026 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786342059;
	bh=hY0wwFklR4ZT8U66wxz+0q7qXdWipofO8BkZ3eWnBdY=;
	h=Date:From:Subject:To:Cc;
	b=NxMv8773UOt13i5QkoRKxr+/y/L8wZxBjxbWTUO+qQ5FD4mno8scLXQgQ/+Djf9c2
	 REoL+TP6rQbCeR9H4JiBta0xlDcYaDFjNVQ98E7GQQbfHNw0sHSCO9dPobUBrTUvwl
	 Nq2Re4m2JOZteIgaxIds0+QEHkvveM6YXOK/uI9q/d7NQrfeCbBubX3OWrmkB/0CnV
	 ABk+x2UXP7j4fQNP8w8HjjsJwOUJBkDYuJr5D5UN2pWtEPSmL90kTa1dhjTLyNwia0
	 msg08mU1gEc6p7gknaOeSjRxtYg/lgVqBHleq/McTnV4dxOINP9Yack1XE8PJiEBdt
	 0yR/ebjK3hiYg==
Message-ID: <b0e98427-f0d3-47a3-a0b2-de386a5e641c@kernel.org>
Date: Mon, 10 Aug 2026 08:07:34 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [GIT PULL] SOC FSL for 7.3
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 7.3

Changes to fsl-mc bus are reviewed or acked by Ioana
Changes to powerpc are reviewed or acked by Maddy
Changes to phy is acked by Vinod
Changes to dt-binding are reviewed or acked by Conor or Krzysztof

Thanks
Christophe

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux 
tags/soc_fsl-7.3-1

for you to fetch changes up to e14b8d39388095fb806fe9f98a95b70619e4cabd:

   bus: fsl-mc: drop unused assignment of acpi_device_id::driver_data 
(2026-08-07 06:54:23 +0200)

----------------------------------------------------------------
FSL SOC Changes for 7.3

Freescale QUICC Engine:
- Use generic I/O helpers in interrupt controller for IO Ports
- Move CONFIG_QE_GPIO out of powerpc
- Fix DT scan for GPIO nodes
- Convert IO ports interrupt controller to generic IRQ chip
- Add support of IRQs in GPIO controller
- Implement get_direction() in GPIO controller
- Check platform_driver_register() in interrupt controller for IO Ports

Data Path I/O:
- Replace maintainer
- Remove redundant dev_err()
- Fix kernel-doc typos

Freescale Management Complex:
- Use strscpy() to copy strings into arrays
- Remove redundant dev_err()
- Drop unused assignment of acpi_device_id::driver_data

Other changes:
- Add kernel and device tree binding support for RCW override,
completing the SerDes PHY driver functionality
- Fix kernel-doc warnings and typos in DPAA header

----------------------------------------------------------------
Christophe Leroy (1):
       dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema

Christophe Leroy (CS GROUP) (4):
       soc: fsl: qe_ports_ic: Use generic I/O helper instead of specific 
powerPC ones
       powerpc: Move CONFIG_QE_GPIO to SoC
       soc: fsl: qe: properly scan GPIO nodes at startup
       soc: fsl: qe: implement get_direction()

David Laight (1):
       drivers/bus/fsl-mc: Use strscpy() to copy strings into arrays

Ioana Ciornei (4):
       soc: fsl: guts: use a macro to encode the DCFG CCSR space
       soc: fsl: guts: add a global structure to hold state
       soc: fsl: guts: add a central fsl_guts_read() function
       soc: fsl: guts: make it easier to determine on which SoC we are 
running

Linkai Gong (1):
       soc: fsl: qe: check platform_driver_register() in qe_ic_of_init()

Pan Chuang (2):
       soc: fsl: dpio: Remove redundant dev_err()
       bus: fsl-mc: Remove redundant dev_err()

Paul Louvel (9):
       soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler
       dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support 
interrupt type encoding
       dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
       soc: fsl: qe: Use generic_handle_domain_irq()
       soc: fsl: qe: Iterate over all pending interrupts in cascade handler
       soc: fsl: qe: Handle spurious interrupts
       soc: fsl: qe: Convert to generic IRQ chip
       soc: fsl: qe: Rename irq variable to parent_irq
       soc: fsl: qe: Add support of IRQs in QE GPIO

Pawel Zalewski (The Capable Hub) (1):
       bus: fsl-mc: drop unused assignment of acpi_device_id::driver_data

Randy Dunlap (2):
       soc: fsl: fix kernel-doc warnings and typos
       soc: fsl: dpio: fix kernel-doc typos

Roy Pledge (1):
       MAINTAINERS: Update drivers/soc/fsl/dpio maintainer

Vladimir Oltean (5):
       soc: fsl: guts: perform fsl_guts_init() error teardown in reverse 
order of setup
       soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()
       dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region
       soc: fsl: guts: implement the RCW override procedure
       phy: lynx-10g: use RCW override procedure for dynamic protocol change

  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   |  84 ++++
  .../interrupt-controller/fsl,qe-ports-ic.yaml      |   4 +-
  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          |  26 +-
  .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml      |  15 +-
  MAINTAINERS                                        |   2 +-
  arch/powerpc/platforms/Kconfig                     |   8 -
  drivers/bus/fsl-mc/dprc-driver.c                   |   6 +-
  drivers/bus/fsl-mc/fsl-mc-bus.c                    |   6 +-
  drivers/phy/freescale/Kconfig                      |   1 +
  drivers/phy/freescale/phy-fsl-lynx-10g.c           |  23 +-
  drivers/soc/fsl/dpio/dpio-driver.c                 |   6 +-
  drivers/soc/fsl/guts.c                             | 528 
+++++++++++++++++++--
  drivers/soc/fsl/qe/Kconfig                         |  10 +
  drivers/soc/fsl/qe/gpio.c                          |  53 ++-
  drivers/soc/fsl/qe/qe_ic.c                         |   3 +-
  drivers/soc/fsl/qe/qe_io.c                         |  15 +
  drivers/soc/fsl/qe/qe_ports_ic.c                   | 142 ++++--
  drivers/usb/host/Kconfig                           |   1 +
  include/linux/fsl/guts.h                           |  18 +-
  include/soc/fsl/dpaa2-fd.h                         |  19 +-
  include/soc/fsl/dpaa2-io.h                         |   4 +-
  21 files changed, 809 insertions(+), 165 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
