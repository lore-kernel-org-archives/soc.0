Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2EF8F6B
	for <soc@lists.linux.dev>; Wed,  8 Jan 2025 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346090; cv=none; b=CgTxFzPlOSWL0J/RrHgjMk5tH0ckVPnwABn8IKPseRW9Nxux9ynMzVoHbBm3YYOL/xSOE2j0RQzVJPESSYuPKUGyfk6dqjojMEqASgNpd+st8uOjSAM0Bl8FvSqNrZtfX3kfH/ZG+rjE6lZ3XkoyJJoXS/5qmH3v3oxqNHNimGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346090; c=relaxed/simple;
	bh=JZhXDPXp0k+Z4X0i1LbD9BVeQy3SLuBrRNBkCLZMI8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jd3+jn6wJDWsR3Uw0j4XrVjyOffKs6rRyM0fprxHXDBzOMRYgIkeQlQIJI+OmS/1cvmmjw5p0xNsFBa4+TgUGr9/iEvOvHXG7XM/GEmyNTYNQGE1mMlEh2g1f/s5hR0ZwPZpg8WMdtM78geSxxAz0yNQkNyLenGXe9mYIUOG49c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id E10C6C4CEE0; Wed,  8 Jan 2025 14:21:29 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A975AC4CED3;
	Wed,  8 Jan 2025 14:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A975AC4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Wed, 8 Jan 2025 22:21:22 +0800
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Inochi Amaoto <inochiama@gmail.com>, Yangyu Chen <cyy@cyyself.name>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
Message-ID: <20250108142122-GYA3300457@gentoo>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

Here is SpacemiT's device tree changes for 6.14 cycle.
All patches have been merged in linux-next tree for testing.

Please pull, thanks

Yixun Lan (dlan)

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux/ tags/spacemit-dt-for-6.14

for you to fetch changes up to e7cd95ad8013bc232316bba0a52ea11ecd5c81bd:

  riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3 (2025-01-04 10:28:18 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.14
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

Yixun Lan (3):
      MAINTAINERS: setup support for SpacemiT SoC tree
      dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |  28 ++
 Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 MAINTAINERS                                        |   9 +
 arch/riscv/Kconfig.socs                            |   5 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  22 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 464 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 13 files changed, 558 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml
 create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1.dtsi
