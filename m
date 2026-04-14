Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA473E7179
	for <soc@lists.linux.dev>; Tue, 14 Apr 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175738; cv=none; b=Ey61TOV6Pw1APANoyfVwd/5YxplVxQ0b2dts098WZsBDiZnM08j33HqxUSRWKw8uySe9FKp7YD1Q7va4mcPPg/nTMWPzGv35rghTqVrNrfZJ3faQmeGNoqtZuSRPs86ZnCgMcloIrMxykk30DTBkLvBZZIGW09UpC4gM9PdESf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175738; c=relaxed/simple;
	bh=/Mr/wlWVzKqN06fIqsjXgeaRfYAFw5fIknUNgHNbLRs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=nYLjBsBEaePsuIGOIwMxd966FyNKzlAbKpIEeu8gS+3OOcJh+JYeP9y9W2KBWRnhl+QzU3Gb0fDQKwoB5fCV7AX+udtD3HOEfLqcmoLgRfmetDWyX4x/U9AIzES7fzxHgPfjNlar2ViXvwx0MKAHpK8wk3S5mJiI2yeCeu35XxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=re6Onb2O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="re6Onb2O"
Received: by smtp.kernel.org (Postfix)
	id 2C667C2BCB5; Tue, 14 Apr 2026 14:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5A9C19425;
	Tue, 14 Apr 2026 14:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776175738;
	bh=/Mr/wlWVzKqN06fIqsjXgeaRfYAFw5fIknUNgHNbLRs=;
	h=Date:From:Subject:To:Cc:From;
	b=re6Onb2Oixbima3J0ouaE0vDkjYODpBBdsAsSsiMfOlbZox46nOI7bTdfiBorSqln
	 J+3i0W2Ue7NQLgO5tcTsWRmFSuAidU5HJNfBL/83JmkqTLHxPTP8lAwV4hycndrbxg
	 KWE3OaBkUlFUlLY1s+h/oSrxjZogOCsJA/0c6DM5OcQR+fAXCoGRvIuShkW3xzG3hl
	 rjS+ciPXBMUysWkjsA3rpCqC1xduCJAJJcP6WI3KXKdJtu/d7J6wtYwDbSnA6REKC3
	 Rt2XqOt6LcxzROWYiLtfl7BlxZX5CgenKuwpmnYQq9GBhqVitpa4KZ2G6u1oPM33oz
	 yQC7zJvW1UqVA==
Message-ID: <69cdadd6-523c-4a79-8cb3-1deff5910699@kernel.org>
Date: Tue, 14 Apr 2026 16:08:54 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [GIT PULL] SOC FSL for 6.20
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 7.1

Changes to fsl-mc bus are reviewed or acked by Ioana Ciornei.

Thanks
Christophe

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux 
tags/soc_fsl-7.1-1

for you to fetch changes up to 1bc2b368e0338bf1a977502d6c4716c888d1fbdb:

   bus: fsl-mc: wait for the MC firmware to complete its boot 
(2026-04-14 08:01:09 +0200)

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
