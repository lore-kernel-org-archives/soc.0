Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0746F10E4
	for <soc@lists.linux.dev>; Fri, 17 Jan 2025 00:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737074960; cv=none; b=qaq5xY/rozb4Vbccw036KCNNl5K/yVTpEerNB94DFYnWX/2UaAaxsf2ZFSHluANyiog1AfgO8bBf+BkAsG8aaJ4VnLPGfqf2ZyJydC/hi1cOKl1vsXprPPe8OsxVIRyCD32mt8QizD2vS6LWUTLrbDD4k/nZyaYgpTxi+LnG2Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737074960; c=relaxed/simple;
	bh=tQoXptlxaTP0IYKPM/EBwe7OqhgjFISgld3dEmgbHu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4SFBtpi7hoh+3yQJ9tYUXZeBOwh+D9xdMPArruwkfUJz/DMkLM3qq/F5vFUMvRBa+aM5C7Uhh95EUk72hgc+xbsbk6TZlpWe4RSXaJTvglkqgvn9I811CrnLSY6eUJ6XSwu0Ttdv7bhBQgOofo5vnhCxD/pPFo60HLrqYS5yOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id A35ADC4CEE1; Fri, 17 Jan 2025 00:49:18 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 776D8C4CED6;
	Fri, 17 Jan 2025 00:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 776D8C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Fri, 17 Jan 2025 00:49:11 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: [RESEND/GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
Message-ID: <20250117004911-GYA25021@gentoo>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

Here is resend version of SpacemiT's device tree changes for 6.14 cycle.
All patches have been merged in linux-next tree for testing.

In this PR, I've rebased to 6.13-rc2 along with dts aliases fixed.

Please pull, thanks

Yixun Lan (dlan)

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux spacemit-dt-for-6.14-1

for you to fetch changes up to 3d72d603afa72082501e9076eed61e0531339ef8:

  riscv: dts: spacemit: move aliases to board dts (2025-01-17 08:05:42 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.14

- rebase to 6.13-rc2
- basic device tree support
- pinctrl dt node info
- update MAINTAINERS info

----------------------------------------------------------------
Yangyu Chen (8):
      dt-bindings: riscv: Add SpacemiT X60 compatibles
      dt-bindings: riscv: add SpacemiT K1 bindings
      dt-bindings: timer: Add SpacemiT K1 CLINT
      dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
      riscv: add SpacemiT SoC family Kconfig support
      riscv: dts: add initial SpacemiT K1 SoC device tree
      riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
      riscv: defconfig: enable SpacemiT SoC

Yixun Lan (4):
      MAINTAINERS: setup support for SpacemiT SoC tree
      dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
      riscv: dts: spacemit: move aliases to board dts

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |  28 ++
 Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 MAINTAINERS                                        |   9 +
 arch/riscv/Kconfig.socs                            |   5 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  26 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 452 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 13 files changed, 550 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml
 create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1.dtsi
