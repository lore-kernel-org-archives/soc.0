Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37852372ECE
	for <soc@lists.linux.dev>; Wed, 20 May 2026 21:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779311649; cv=none; b=c1ZdA/GYtmY6F/b1B3AlwPOtnGIcZJ8xRPkr5m+plzFSr0yAgcI4Dm/r/PWo4zGoPQBkilq5RQ8z/JnkiKqRBsoiIgBVzd92Z/vgWUHDwVKenHiDSYmp3a668sgMznNJsiRyNpQeCdEp1t/d9uIRdVfVe0NDp0W1jEf8iPvyGG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779311649; c=relaxed/simple;
	bh=UX924fPFz4PpUgvGbGRHhBJkkR9vH6f/1D7o7Vxfvxg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=QnEIaDZGM1+4wQpBkesaDABrwaeYYuJAISfuarePn9FW3S3c4wLTFI+lu2yQ8mR1MjF7bq1ihl0DgrE70+8rhA3dmvP1hVH+NZJOeMkIxmsPjnRSfDR7PhelIw4uCQAptwCcIeUwd27j/LzUXk/lKT+o8M/niIB38d0GBe151N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=pK/sB1ah; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OKN7RzSJ; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="pK/sB1ah";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OKN7RzSJ"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 759721D00056;
	Wed, 20 May 2026 17:14:07 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 20 May 2026 17:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1779311647; x=1779398047; bh=Y+
	g66LUpPOfLPK4MnmYTQ0SqJLvyUF53+oIedys6o8k=; b=pK/sB1ahQHjCcp1IJH
	CeczDNZRTlYfsv1EjfnjdZh/5ljo5sKnzUTPghFmxFY664DxOlbMh2CGFNTOIwRc
	d4jNGPUDgsDZpAX74ixEqEnQT3u8JogcxMNcWpNHP5tFqk6VKy7ln0X5b/dHcXQJ
	8vJ4Ajwx+a3HWoFeQwCgygjX3d7kVWZd3tvKZ6VqbJG6P0Ob9wMvSG33T5rafU98
	JYxYue2tnX3Wi8qa4Ze/T/BSQNWXlw6LCWRDVvrIxvveBi8H6FpvLhz1eEPLtoxG
	FRDAVgEEdl+FJsz+RQNdTNR5WTo7lXv8GJTNLimbYMgXnMN+6K8LxDf1G/HMJM0W
	ytBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1779311647; x=1779398047; bh=Y+g66LUpPOfLPK4MnmYTQ0SqJLvy
	UF53+oIedys6o8k=; b=OKN7RzSJWEkbanA57oH2L55BqDeVNBCcjHhY4yr/PaWP
	YLUEVBWWCX/VkbWWeZODRqG/hFRo9h5gMXV/0A1ZSRK9N8WlSomImEfylJNYXtEb
	kiVBK8I2INDfeL1hH5uFiaCKyZB9iGkRMxLs+dv1K7X7AcEJEI/plyx5ws+sJ+N5
	lx86uSJJFnI1mbSbUWe3tPXZwc3rRY+NnGPM8lOfXel+MMsDHRZmuC9jv3g4eElX
	M5c9f4lBuL/eBJl+62fJmtu6kBFUl9EwqI/iCQ0IgjJyow8AkKASfBoc6JxeEu2i
	d3ImyicVeaLOfWBYz/2cCD5cAgVwyUEYKLKPvYRJBw==
X-ME-Sender: <xms:HiQOahP7ZYGaxbcCOa0L4R-hKiOTrdLpwTFMLNQ4s61WEqHyeepAkQ>
    <xme:HiQOauzMEYMqYVYZ4a-frsyAk2PzBfefpNNTAGTmGN9ad0bVMFEyJfx2Yju-OmcPP
    RWYvuJAN-C-A-wpZV65zF1P5tH_x8nKb63W4JNdY9WyU4v0FdBQ4LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeehieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epudelieegkeevueegtedtjedttdelgeehhfdvhfeuheethfduleffuddvueelveetnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslh
    hinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HiQOai4b4JllBd01QAzGLDCA_42f9qAL1UtGy2aDtbpWdX08tPTIHg>
    <xmx:HiQOaizNa-qbBPez62dNs-ibFuxeqqt880Yh_6DcSh8ljFl83Ywyig>
    <xmx:HiQOapx23pk8F7grctr5Dy9herJp7AQ8orBcCHblZm1EQPnll0XykQ>
    <xmx:HiQOaqzSuYdO7RnOkEoCfO-ias80yEk0d8A16AS6G6QeVkWK0SyNxA>
    <xmx:HyQOaq6hBPntLmh-6fqSnkhZaIZ6BXmauB5pfVEDt5-Ri_LX_mK-Prmx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C3984182007A; Wed, 20 May 2026 17:14:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 20 May 2026 23:13:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <fa4afee7-8cb5-4555-b1e0-de376cc901e6@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1

for you to fetch changes up to 1fcf4149418e7a8f8253dd74059d56340795503f:

  Merge tag 'riscv-dt-fixes-for-v7.1-rc3' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes (2026-05-08 15:33:36 +0200)

----------------------------------------------------------------
soc: fixes for 7.1

The ff-a firmware driver gets 11 individual bugfixes for a number
of issues with robustness to buggy firmware or client implementations.
Another firmware fix address suspend to RAM via PSCI firmware.

The final code change is for the old Arm Integrator reference
platform that recently started exposing an old NULL pointer
dereference bug.

The MAINTAINERS file gets two updates, notably James Tai and Yu-Chun
Lin are stepping up as co-maintainers for the Realtek platform.

The remaining patches are all for devicetree files. Two of these
are for riscv  boards, the rest are all for enesas Arm platforms,
addressing build time checking issues as well as minor configuration
problems.

----------------------------------------------------------------
Arnd Bergmann (3):
      Merge tag 'renesas-fixes-for-v7.1-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes
      Merge tag 'ffa-fixes-7.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'riscv-dt-fixes-for-v7.1-rc3' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes

Conor Dooley (1):
      riscv: dts: microchip: fix icicle i2c pinctrl configuration

Geert Uytterhoeven (1):
      arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks

Guenter Roeck (1):
      ARM: integrator: Fix early initialization

Jai Luthra (1):
      riscv: dts: starfive: jh7110: Drop CAMSS node

Konrad Dybcio (1):
      firmware: psci: Set pm_set_resume/suspend_via_firmware() for SYSTEM_SUSPEND

Krzysztof Kozlowski (1):
      ARM: realtek: MAINTAINERS: Include pin controller drivers

Marek Vasut (10):
      arm64: dts: renesas: draak/ebisu-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: salvator-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: rz-smarc-cru-csi-ov5645: Fix missing cells and reg in CSI2 subnode
      arm64: dts: renesas: rz-smarc-du-adv7513-smarc: Fix missing cells and reg in DU subnode
      ARM: dts: renesas: r8a7778: Add missing unit address to bus node
      ARM: dts: renesas: r8a7779: Add missing unit address to bus node
      ARM: dts: renesas: r8a7792: Add missing unit address to bus node
      ARM: dts: renesas: r7s72100: Add missing unit address to bus node
      ARM: dts: renesas: genmai: Drop superfluous cells
      ARM: dts: renesas: rskrza1: Drop superfluous cells

Sudeep Holla (11):
      firmware: arm_ffa: Check for NULL FF-A ID table while driver registration
      firmware: arm_ffa: Skip free_pages on RX buffer alloc failure
      firmware: arm_ffa: Avoid collapsing NPI work from different CPUs
      firmware: arm_ffa: Fix per-vcpu self notifications handling in workqueue
      firmware: arm_ffa: Unregister bus notifier on teardown for FF-A v1.0
      firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies
      firmware: arm_ffa: Keep framework RX release under lock
      firmware: arm_ffa: Validate framework notification message layout
      firmware: arm_ffa: Align RxTx buffer size before mapping
      firmware: arm_ffa: Snapshot notifier callbacks under lock
      firmware: arm_ffa: Fix sched-recv callback partition lookup

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g057: Add #mux-state-cells to usb2{0,1}phyrst
      arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst

Yu-Chun Lin (1):
      MAINTAINERS: Add maintainers for ARM/REALTEK ARCHITECTURE

 MAINTAINERS                                        |   5 +-
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts      |   3 -
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts     |   2 -
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   2 +-
 arch/arm/mach-versatile/integrator_cp.c            |  13 +-
 .../dts/renesas/draak-ebisu-panel-aa104xd12.dtso   |   5 +
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |   8 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |   2 +
 .../boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |   5 +
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi      |   5 +
 .../boot/dts/renesas/salvator-panel-aa104xd12.dtso |   5 +
 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi |  10 --
 .../boot/dts/microchip/mpfs-icicle-kit-prod.dts    |  10 ++
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  |  19 +++
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  27 +---
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  28 ----
 drivers/firmware/arm_ffa/bus.c                     |   4 +-
 drivers/firmware/arm_ffa/driver.c                  | 144 +++++++++++++++------
 drivers/firmware/psci/psci.c                       |  10 ++
 23 files changed, 183 insertions(+), 131 deletions(-)
