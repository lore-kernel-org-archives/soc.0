Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2D78F57
	for <soc@lists.linux.dev>; Fri, 24 Jan 2025 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731043; cv=none; b=iWZ2t+YjPot47WpD/M8QwNC2gmi90UbbymQ9e5r2gQLWy0L25sJB/ttxqVA8u4Ld3SqybbKMWLIZJNWbFgQgJmTZE0FbEd0ktKuWyJzjiP/v4JmtLLAMWpP6UbHT9HLsMa8aUk/Uw6j+WD1vlOo2z2YsbmmxuOH2LfO9E7ntPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731043; c=relaxed/simple;
	bh=21frLRXIep+ymMaJ3+S7/Cf6hRd9H67VBSqw+mrmGVo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dvEL8MbWpdj/E1dPYlf4Doz3aHZUKisSe9EoT0eClLWSIPkp7l+MLnOa6fThZF4j8mtwNr+yR5ENuLTSvY1wNSfU2QkMCA9v4Z226bt80fOPi1QA2yGg+cUPPbMYoLdBf3Ug6I6F/hrLYZurSrqEJJ4SE8acEni9yAE+0maUj0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lBbw9g5w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HsVnubIz; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lBbw9g5w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HsVnubIz"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C73DA114019F;
	Fri, 24 Jan 2025 10:04:00 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 24 Jan 2025 10:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737731040;
	 x=1737817440; bh=cuv154PFa+Or4Xs/jn6LudX1tt8F7elcDG9gWdvfHYw=; b=
	lBbw9g5weWLsSg8HC8x2+yGg/Kud3X+F9AwakZ1eB897uUlJSD0heLLTLZA9WuNv
	KLro/hD48DPLKWafr2rZCMjfyrAFYo21pHRAttqeH6f5yIHHiS3Y1ZjB1aNKXtIN
	DVCD/tDLSc+bJAweEjRIGlcTDFSQLUSAIMg2l4SMr5OSzfgbbLVdZcLDJ+NBP/GB
	mjmpMeJ7lQ5rp/H31EO2tVuktFZ1wdqO54paDX8Pkvj4wVnGeXw+LvfXPhEs+c0L
	D7dTzi/Do1IEBNKkYsMjuzshM1nSwuFd5VGbbiVy67YeRgxqtqhMO+2NbuGhbccr
	vgWpASxyoqrG0urqpGUw/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737731040; x=
	1737817440; bh=cuv154PFa+Or4Xs/jn6LudX1tt8F7elcDG9gWdvfHYw=; b=H
	sVnubIzChW+3LwFxrF/AvLx1662Blj9/ibPKeFUj0bEjmgW1d7qAV1cNQpCoe/gu
	Rx3So8zwEWkDouu+hVI+nVpCOF4nSA0XpB2Ynv/g6EZBT5CYf0/VzbpbVKiOhsNr
	chDpV/4toXUn5RYEtfNXBZ0LbS0ylUXjNSsslPuLmP0fPY2BSpRtPXyl/w/escy6
	qMn7bRrZfUR06fGTBIXxUqvL3atogyVgN/Bq4wvtBTiXDkIGEM6zSBI7G3AqhiFL
	tfoHi0zMfJIv8gNayMDXmI9xvEaUt3FXKpvh+F8UbyJcu9RF76siq4iJuZP7lHS5
	KNVTGuVw7epnXi5Jf97Nw==
X-ME-Sender: <xms:4KuTZwpLZJV28rfDVcsm5cLZ3whf184qfHeBfjaPoQ6BK2XkeoYZug>
    <xme:4KuTZ2oLTdj7PPaBgRsxKWf-WMB-pFsBAPy-uomiBA1Ff2Gp-1zigSewHch3dNGWl
    CIMCFK0Tusa82UKs3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefffelleduheehleejtdfhheegtdffhedtffei
    leehkeetffevtdegheduhfeiudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4KuTZ1NwJ7qAxtEd8eh3csQVaGFjcio_cpn0ajRcrzNcfwAtcvz4jQ>
    <xmx:4KuTZ37RHH0mLvPWNc0Q9Kp44zeGXNUigGjGlrAu62iD2pfuLn0Osg>
    <xmx:4KuTZ_4q6Mmt6i16I3vMXpzseGKCP_rcpoIv2UfTz874eDuyqQUGpQ>
    <xmx:4KuTZ3geifU-M1uIcFtOq5Nb3BqihJ80tG0RZ8vMiLp_a1gkBRBdsg>
    <xmx:4KuTZxnbmaXdon_bizfuJ67ImTZguuTLylS9JC3dUwza4TDY5kDZuJGl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7401C2220075; Fri, 24 Jan 2025 10:04:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 16:03:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <f3a7e280-9d47-45f2-aef4-394b378ba99d@app.fastmail.com>
In-Reply-To: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
Subject: [GIT PULL 2/5] soc: new SoC support for 6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-new-6.14

for you to fetch changes up to 0bcf3ac14626f1c174c262834656603769579497:

  Merge tag 'spacemit-dt-for-6.14-1' of https://github.com/spacemit-com/linux into soc/newsoc (2025-01-23 17:36:29 +0100)

----------------------------------------------------------------
soc: new SoC support for 6.14

Two new SoC families are added here, with devicetree files and
a little bit of infrastructure to allow booting:

 - Blaize BLZP1600 is an AI chip using custom GSP (Graph Streaming
   Processor) cores for computation, and two small Cortex-A53 cores
   that run the operating system.

 - SpacemiT K1 is a 64-bit RISC-V chip, using eight custom RVA22
   compatible CPU cores with vector support.
   Also marketed at AI applications, it has a much slower NPU compared
   to BLZP1600, but in turn focuses on the CPU performance

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'spacemit-dt-for-6.14-1' of https://github.com/spacemit-com/linux into soc/newsoc

Nikolaos Pasaloukos (6):
      dt-bindings: Add Blaize vendor prefix
      dt-bindings: arm: blaize: Add Blaize BLZP1600 SoC
      arm64: Add Blaize BLZP1600 SoC family
      arm64: dts: Add initial support for Blaize BLZP1600 CB2
      arm64: defconfig: Enable Blaize BLZP1600 platform
      MAINTAINER: Add entry for Blaize SoC

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

 Documentation/devicetree/bindings/arm/blaize.yaml  |  40 ++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |  28 ++
 Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  18 +
 arch/arm64/Kconfig.platforms                       |   5 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/blaize/Makefile                |   2 +
 arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts |  83 ++++
 .../arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi |  23 ++
 arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi    | 205 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 arch/riscv/Kconfig.socs                            |   5 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  26 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 452 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 22 files changed, 921 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/blaize.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml
 create mode 100644 arch/arm64/boot/dts/blaize/Makefile
 create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
 create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi
 create mode 100644 arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/k1.dtsi
