Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCEA4400
	for <soc@lists.linux.dev>; Wed, 14 May 2025 04:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747198128; cv=none; b=NYbSQWa2vLU6pSgDCcLyv/zoDI7+w+HvLXFVvIQ40bZR7sQTKwMpnsHMOaI0u7dnQ/2mR32e0PkAn5j2MaNZHAgM0Mkj5Ja77pb7F/xMyLY32WBd7O0+EJ7QRyJvW40K0N0ccktJz+Yfmx4Gc2UzkUYBptrVBveaARYFek0H6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747198128; c=relaxed/simple;
	bh=GxaUcFGYaz+B0AiRsGQ/HWk9RekqZ44abVdxA5e2Lsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5/Xh+mrchi7zX1uwnGp5G5rRg19lysb4uh40ZwRwMFcIm0mirpN2Fdn/J+C/DGlCXrNAHY7dD2k2noOhIcdGeiUXxgm5yfs1WY0QlH0uNxoMLUIaIawaQskL5+QYC5H3bGuJZTttEzLCmVS+x/KIXhFVfNNIDbCqHPA1uA68jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 167D6C4CEEF; Wed, 14 May 2025 04:48:48 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3948FC4CEED
	for <soc@kernel.org>; Wed, 14 May 2025 04:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3948FC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C761234348B;
	Wed, 14 May 2025 04:48:45 +0000 (UTC)
Date: Wed, 14 May 2025 04:48:41 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.16
Message-ID: <20250514044841-GYA524674@gentoo>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

  Please pull SpacemiT's device tree changes for v6.16, thanks

  Please note, there are clock dt-binding dependencies which also included 
in this PR, they are exactly same commits (same hash) which already queued
at clock's tree[1].

  Let me know if this works for you.

Link: https://lore.kernel.org/all/a28e4eca6e2a9522cb8e707845a9117b@kernel.org/ [1]

Yixun Lan (dlan)

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.16-1

for you to fetch changes up to 3aa64cd126b4fd298ba5d28227ea3f82cd6f541c:

  riscv: dts: spacemit: add gpio LED for system heartbeat (2025-05-14 11:43:59 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.16

- Add clock driver, fix for pinctrl/uart
- Add gpio support, enable LED heartbeat

----------------------------------------------------------------
Haylen Chu (3):
      dt-bindings: soc: spacemit: Add spacemit,k1-syscon
      dt-bindings: clock: spacemit: Add spacemit,k1-pll
      riscv: dts: spacemit: Add clock tree for SpacemiT K1

Yixun Lan (5):
      Merge tag 'spacemit-clk-binding-for-6.16' of https://github.com/spacemit-com/linux into spacemit-dt-for-6.16
      riscv: dts: spacemit: Acquire clocks for pinctrl
      riscv: dts: spacemit: Acquire clocks for UART
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |  50 +++++
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  80 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 132 ++++++++++-
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 247 +++++++++++++++++++++
 6 files changed, 514 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 include/dt-bindings/clock/spacemit,k1-syscon.h
