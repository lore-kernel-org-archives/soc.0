Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CED30F94D
	for <soc@lists.linux.dev>; Wed, 15 Apr 2026 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776232665; cv=none; b=NF69eAuW707jxyk9meYzTTQs/exarg7cisON2zjOXkQIk/0vdzuUZlWPCwE7EoN67Yeo/Wx8LWXXvBIuZhtR2Wjasjh5qRXl9XYIRw67JfrZGXiluOYZqRHqa3tAAub3zWtXzFD5PU4x5O3yHsi3sWeeEr83yaab1bJP9wPnr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776232665; c=relaxed/simple;
	bh=PjSnTV4MTkCnNE445WevLA/WZXxDGKFWb/5i7Xs5Aig=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=l1OIHnPMUEm1KcpSi5rTDe7XL/aKn0vBD5Yibbkji3xUpKuxWfBPX0OQsHXgjgVy1EclZESYmg6y4K2L2QkZLTObzWcFR2YymzV/tysRq5ZrjIR6FV5FTwDBEITjbeax1YYWNXqX0gTYFLGHyGY9xP5WMjbPtguPq995OJeUIss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=No6f1Qrd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="No6f1Qrd"
Received: by smtp.kernel.org (Postfix)
	id 49E61C2BCB0; Wed, 15 Apr 2026 05:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512FFC19424;
	Wed, 15 Apr 2026 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776232665;
	bh=PjSnTV4MTkCnNE445WevLA/WZXxDGKFWb/5i7Xs5Aig=;
	h=Date:From:Subject:To:Cc:From;
	b=No6f1QrdH9TxdOZk6CiVMAxWbhl/QhQsrodwnXN9uP9ms5rGGLOE8/+A3RCjbkk86
	 h1ranMgn7F+h+sS33A1oaIxC4Vsd9GepUB0n8VLWgacX0OGpxnhbPAJM0sfYXKCKF8
	 XUmtrY7GCtOaG6Xw9HJGe19JBaA1n5OeovIK5aw7/ORMzEbS2Ks8nxsTBMvY9R0gYV
	 HPwF3HIbG4QznGiSRtz5DZVdcjaTU00Bcj55e1o2Emhl51vn7zyzVvkZ+Urt6v8Vtk
	 RPwYK265nF81zu4S96ZPaLi+q46Il7gWGhskdmtNqmwsmiaUConk3+f2v1pQ0PfIgr
	 gO1/BFG7nGuIw==
Message-ID: <310b65ba-1d73-4ce0-b332-00cde70acc69@kernel.org>
Date: Wed, 15 Apr 2026 07:57:41 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [GIT PULL] SOC FSL for 7.1 (retry)
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

As you are worried about the last minute rebase done yesterday, here is 
a new pull request without the rebase. It means it is based on tag 
soc_fsl-7.0-2 that you merged into 7.0-rc5 some weeks ago.

Most commits have spent several weeks in linux-next, only the last one 
spent only 10 days there, but it is not a major change and it is 
originating from the maintainer of fsl-mc bus directly.
Commit a0fe29d20e78 ("soc: fsl: qe: panic on ioremap() failure in 
qe_reset()") is also flagged as being commited 10 days ago, but this is 
just because I droped the preceding commit.

Please pull the following Freescale Soc Drivers changes for 7.1

Changes to fsl-mc bus are reviewed or acked by Ioana Ciornei.

Thanks
Christophe

The following changes since commit 3f4e403304186d79fddace860360540fc3af97f9:

   soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in 
qmc_qe_init_resources() (2026-02-23 14:49:27 +0100)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux 
tags/soc_fsl-7.1-2

for you to fetch changes up to 208858b1b48eba83d073542372329cf8ed606526:

   bus: fsl-mc: wait for the MC firmware to complete its boot 
(2026-04-04 18:54:05 +0200)

----------------------------------------------------------------
FSL SOC Changes for 7.1

Freescale QUICC Engine:
- Add missing cleanup on device removal and switch to 
irq_domain_create_linear()
in interrupt controller for IO Ports
- Panic on ioremap() failure in qe_reset()

Freescale Management Complex:
- Move fsl-mc over to device MSI infrastructure
- Wait for the MC firmware to complete its boot

Freescale Hypervisor:
- Fix header kernel-doc warnings

----------------------------------------------------------------
Christophe Leroy (CS GROUP) (1):
       soc: fsl: qe_ports_ic: switch to irq_domain_create_linear()

Felix Gu (1):
       soc: fsl: qe_ports_ic: Add missing cleanup on device removal

Ioana Ciornei (1):
       bus: fsl-mc: wait for the MC firmware to complete its boot

Marc Zyngier (6):
       fsl-mc: Remove MSI domain propagation to sub-devices
       fsl-mc: Add minimal infrastructure to use platform MSI
       irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent 
handling
       fsl-mc: Switch over to per-device platform MSI
       fsl-mc: Remove legacy MSI implementation
       platform-msi: Remove stale comment

Randy Dunlap (1):
       virt: fsl_hypervisor: fix header kernel-doc warnings

Wang Jun (1):
       soc: fsl: qe: panic on ioremap() failure in qe_reset()

  drivers/base/platform-msi.c                 |   4 -
  drivers/bus/fsl-mc/dprc-driver.c            |  14 +--
  drivers/bus/fsl-mc/fsl-mc-bus.c             |  50 ++++++++-
  drivers/bus/fsl-mc/fsl-mc-msi.c             | 166 
+++++----------------------
  drivers/bus/fsl-mc/fsl-mc-private.h         |   2 +-
  drivers/irqchip/Kconfig                     |   6 -
  drivers/irqchip/Makefile                    |   1 -
  drivers/irqchip/irq-gic-its-msi-parent.c    |   7 +-
  drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c | 168 
----------------------------
  drivers/soc/fsl/qe/qe.c                     |   3 +
  drivers/soc/fsl/qe/qe_ports_ic.c            |  23 ++--
  include/linux/fsl/mc.h                      |   6 +-
  include/linux/irqdomain_defs.h              |   1 -
  include/uapi/linux/fsl_hypervisor.h         |   4 +-
  14 files changed, 106 insertions(+), 349 deletions(-)
  delete mode 100644 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
