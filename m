Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0698028A3FA
	for <soc@lists.linux.dev>; Fri,  5 Dec 2025 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959345; cv=none; b=lNS8JQ9bBydygSi7mYv+Dv7qcXr+UXHgFfjCc7Pt7mTKGHaLHauoCG2u8TkTI7QEV4nbcAvypXx9WlxB6iImG1skjMocl3VryDEJl2S1kZvond2WIFcoHDhYaEtQkScjvU4tl3WigKWOhFRPLqtrTIKTZLf4Qhdl4Oq7GJhtMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959345; c=relaxed/simple;
	bh=WQmuB0xVPYSjfIr7ZC3urduzqkRVWySJrmX96JscCzE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=n/uCnNFzTWclX/eUxYF1vrS3FVGIQRchEmdM3atFGPl01IL62gX2O1uK44eCV+Pm080KzPtHoTOIyP4GM1jftmtlW9wIXBp692B7aK36oCCAaWTzhjGfJbd0uAuOKuWJid8JvixxqTIfien5/O0LUC5iFVn4Dwv5yxu5jMBz3iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=L7XI/97E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gwG9TMq5; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="L7XI/97E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gwG9TMq5"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 530C71D00173;
	Fri,  5 Dec 2025 13:29:03 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 13:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764959343;
	 x=1765045743; bh=7MMeSi1ExULwndphGmSlo/DR1SMhNrdAgFLUqreIbM4=; b=
	L7XI/97EZgOSZjyZ/dnCh3yTzvMlgm5hKycG7hBwIbNYxnwN+zoc1ozpxvEWqaom
	ewhpK+Nx7AiWv9e9laM7U/AA3ubkGORWN0vIDMU7ghEQmaffjKSaYcenZCX8aY05
	N6J5vozRFVNCVk9o03HYz+Af07BRddrRY4cAgwRune+Rwyu8VDYzYm7A/P6ALdo0
	OTV1pDzRpYgoK0k67NZXMRzv449Gb8Y5iOwYCUABpdYbdgdSiQsidHC6bmbrugfT
	CRtakxvXh7h744jr/RzOjzX1zq9ewScniXRr+Xiar/foMM+/WyGZWUyHh5KoiD3S
	HkFcb+ZZkGjlV8hoQ85c5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764959343; x=
	1765045743; bh=7MMeSi1ExULwndphGmSlo/DR1SMhNrdAgFLUqreIbM4=; b=g
	wG9TMq5l4aoriP9b9+OrFI0l1am4We2TggmU37bjA0AcdQTeDjkqpPb1dHVrg2aH
	QQ1ZfzYzB2OHriWtTAzyh+tpjLvJHEsbMEHIo0sJfMwNaN72BM4P3om+dD+YnxD3
	J37MJroS0Vq2+pV1JdRp4DUzzQ0jY4sduWF+0Bgg9c2PfUIe2xDk6GsbM21WVoo0
	GcCjzCcke/7P3kOwdYUAzhk9FKS1t0DXhu6J8CLPyTLe4beuML2loEq1PVd2mqi0
	/58FaHWF9Bl1fxhiBnh1+EoLxpaoeuBs41ru6hfcUUZkZE/ztuDcovmQtuyb9n/S
	HK/uGhZByigCbIVeV631A==
X-ME-Sender: <xms:byQzaYAr80D6hkK5SNrP9coQZMOhp66PMRPgPBm3z7rEJzGUVBdMEQ>
    <xme:byQzaVVZLRbMO11pZNaFuxed7aYgB_D9pJsA4yhdA4ZQvDIR67JX0bMK9TkVMnRrS
    hNfV8WazUIGVmyActv2EG1jIlvDUzfiHCnBtp9sMRf8Op1TOH81PQT4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeltdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfeffleeludehheeljedthfehgedtffehtdffieelheekteffvedtgeehudfhiedunecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggs
    rdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:byQzaRsGt_43z-kjhJrsSP1T1rht8JbNRNlYVldXKFwe-Qg5N2AmhQ>
    <xmx:byQzaRXCegny-FYfLBX57Yc4HifyDIQk28KoErlrdEEYwBK7vWXpjg>
    <xmx:byQzadETEhhshg6qwEhib8kG4DDxWVj5E9PsmaDVx9Di_dZA_RFbmw>
    <xmx:byQzaT1gzYV54I9F3hFoWeQO5y4Wh5YzxhJIX6jnFxyu-x30HpqPmQ>
    <xmx:byQzaSlH_waUWzqHxE8J9lbMY_Q-8xtGJo0KAO2ZkWuD3zum_PMx3Ey7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EE16BC40054; Fri,  5 Dec 2025 13:29:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Am9m4lpOTbR7
Date: Fri, 05 Dec 2025 19:28:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <46536f6a-6225-4d5b-ba9e-5cfc64b414ac@app.fastmail.com>
In-Reply-To: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
Subject: [GIT PULL 4/6] soc: sew SoC familes for 6.19
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.19

for you to fetch changes up to 9b418a3bfdd421c01002424958fbd86a1001c2c2:

  Merge tag 'anlogic-initial-6.19-v2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/newsoc (2025-11-21 21:29:57 +0100)

----------------------------------------------------------------
soc: sew SoC familes for 6.19

These three new families of SoC are split out into a separate branch
because they touch multiple parts of the source tree and are better
left separate for the initial merge.

 - Black Sesame Technologies C1200 is an automotive SoC using
   Cortex-A78 CPU cores

 - Anlogic dr1v90 (not to be confused with Amlogic) is an FPGA
   platform using a single nuclei ux900 RISC-V core

 - Tenstorrent Blackhole is a Neural Processing Unit using
   custom "Tensix" cores for computation offload managed by
   Linux running on SiFive X280 RISC-V cores.

Support for all three is rather rudimentary at the moment and will get
improved as device drivers are merged through other tree.

----------------------------------------------------------------
Albert Yang (6):
      dt-bindings: vendor-prefixes: Add Black Sesame Technologies Co., Ltd.
      dt-bindings: arm: add Black Sesame Technologies (bst) SoC
      arm64: Kconfig: add ARCH_BST for Black Sesame Technologies SoCs
      arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board
      arm64: defconfig: enable BST platform support
      MAINTAINERS: add Black Sesame Technologies (BST) ARM SoC support

Arnd Bergmann (3):
      Merge tag 'tenstorrent-dt-for-v6.19' of https://github.com/tenstorrent/linux into soc/newsoc
      Merge branch 'bst/newsoc' into soc/newsoc
      Merge tag 'anlogic-initial-6.19-v2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/newsoc

Conor Dooley (1):
      MAINTAINERS: Setup support for Anlogic tree

Drew Fustini (8):
      dt-bindings: vendor-prefixes: Add Tenstorrent AI ULC
      dt-bindings: riscv: Add Tenstorrent Blackhole compatible
      dt-bindings: riscv: cpus: Add SiFive X280 compatible
      dt-bindings: timers: Add Tenstorrent Blackhole compatible
      dt-bindings: interrupt-controller: Add Tenstorrent Blackhole compatible
      riscv: dts: Add Tenstorrent Blackhole SoC PCIe cards
      riscv: Kconfig.socs: Add ARCH_TENSTORRENT for Tenstorrent SoCs
      riscv: defconfig: Enable Tenstorrent SoCs

Junhui Liu (9):
      dt-bindings: vendor-prefixes: Add Anlogic, Milianke and Nuclei
      dt-bindings: riscv: Add Nuclei UX900 compatibles
      dt-bindings: riscv: Add Anlogic DR1V90
      dt-bindings: timer: Add Anlogic DR1V90 ACLINT MTIMER
      dt-bindings: serial: snps-dw-apb-uart: Add Anlogic DR1V90 uart
      riscv: Add Anlogic SoC famly Kconfig support
      riscv: dts: Add initial Anlogic DR1V90 SoC device tree
      riscv: dts: anlogic: Add Milianke MLKPAI FS01 board
      riscv: defconfig: Enable Anlogic SoC

 Documentation/devicetree/bindings/arm/bst.yaml     |  31 ++++++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 .../devicetree/bindings/riscv/anlogic.yaml         |  27 ++++++
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   2 +
 .../devicetree/bindings/riscv/tenstorrent.yaml     |  28 ++++++
 .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  17 ++--
 .../devicetree/bindings/vendor-prefixes.yaml       |  10 ++
 MAINTAINERS                                        |  25 +++++
 arch/arm64/Kconfig.platforms                       |   8 ++
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/bst/Makefile                   |   2 +
 .../boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  24 +++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi              |  97 ++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 arch/riscv/Kconfig.socs                            |  13 +++
 arch/riscv/boot/dts/Makefile                       |   2 +
 arch/riscv/boot/dts/anlogic/Makefile               |   2 +
 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts |  28 ++++++
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            | 100 +++++++++++++++++++
 arch/riscv/boot/dts/tenstorrent/Makefile           |   2 +
 arch/riscv/boot/dts/tenstorrent/blackhole-card.dts |  14 +++
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi     | 108 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   2 +
 25 files changed, 541 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bst.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/anlogic.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 create mode 100644 arch/arm64/boot/dts/bst/Makefile
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi
 create mode 100644 arch/riscv/boot/dts/anlogic/Makefile
 create mode 100644 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
 create mode 100644 arch/riscv/boot/dts/anlogic/dr1v90.dtsi
 create mode 100644 arch/riscv/boot/dts/tenstorrent/Makefile
 create mode 100644 arch/riscv/boot/dts/tenstorrent/blackhole-card.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
