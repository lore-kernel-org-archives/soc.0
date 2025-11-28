Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97715285CA7
	for <soc@lists.linux.dev>; Fri, 28 Nov 2025 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348355; cv=none; b=Jzw48Q3HplCNXZEquQXhsF8amNKcAFX+3sryv2F2aXnqfOzjJ2TehX0vHvEK4+TnhEm9r7cl6fHUCfESbr8ioXifHJw0chVkSmoaiy+5WFv2OqRORYhbuHU4Zhyp8feOpIE21xbLJ2WVZ6Jz64ZcmDaOWSG16ZroE8FTfDuKGGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348355; c=relaxed/simple;
	bh=0MXYFNiCxQAHcOQ2F7SD/XtUoxSi4dksUaSGHbht4KE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=MSJR/beHjNwvz+UGqS7HMgQihLZzr1UDZlO1MxtYvFr6bnni+MXLgCqxCneREqeGK7Ywu+1gVqLXRjmJ90ud+RpU/kUsS23XmliOAywXVmaFNWas20i+mvYB+pBRNIzvVWVtn26/kFUf5EGcO0jq9HYVe+OPV7vYV7aN30gNqz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=el6qpgao; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ka6bXhrd; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="el6qpgao";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ka6bXhrd"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id BC2C5EC04DB;
	Fri, 28 Nov 2025 11:45:51 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 28 Nov 2025 11:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1764348351; x=1764434751; bh=3u
	q0SZEPhziDDc61M9zIiUZK8zeUmB0j8mVWX9Yf3sI=; b=el6qpgaou0Wo7IiJUl
	FmoTXHnAlqhSFW06w82HUIXlfOKNE6gR/oyElFm28Qh6hQYQm1A713mZZ1wW1Bjz
	xQy5JqBKZrGMn4UVRs9aRbPDXt02sc/SOSEgDhqrCB0E9LX7PbRQeTb3+XWhvali
	IkIiuSam1ZVtY3HKMXcNtqWUqsAQg2eyxkCmvFJ4HrDNzXSSOYBsfbsIYIY7wFMS
	bYkp7fl4/TFqqCqReJPoeWYhWt5ApLURFzoJLZeRJGVFZFa8zImZKd0dggD0sKiz
	LpRdKV/BaWOzwhye4rNRglPIGVbTbCoUvkSn2ghalycBi8vEs++6G/syrHnprMeM
	BEQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1764348351; x=1764434751; bh=3uq0SZEPhziDDc61M9zIiUZK8zeU
	mB0j8mVWX9Yf3sI=; b=Ka6bXhrdqo4gT9EBOXYojK2xxJPbbETmub3+qrwuoTdT
	zCsyra+Xber8pmjmzgGg98DajOl5vCdxgj1yB6FS1+bav7N2d1YA5LnVl/936yh+
	VxgPh22kGVHLFSsR9gh0EcLsHo/IMwRNTuX3VFM2P9AYQ5NFhcf/bSp1Zp1OTxNp
	U5KYe0JdbN1AUsWw6QVAPofJVT4Xt26lLqw8ViqNNbWY2PAWhhYiKXruHNSWcCiL
	+lQ3FLYpIfEAh5Sz1eFzG0nQKkwdODE61scGNEgbI0r3CB9sSZWJphebPhpKIGgG
	UBs7TYLMpTKQxNofVXTtdG3V5ipgeN4SOgt3s688XQ==
X-ME-Sender: <xms:v9EpacFz0RbhfuENU1DdhmpIrOscDbeHDz9Wg-VXA1lO3s0mrtP3cA>
    <xme:v9EpaQKDqNSCFpR1wfeMedp0wBdu8nRJSpxEnn9rkbzOMTxxZxULEOSvO1RSXXuyT
    dJyjEZkqL-gGkra7ybTWwMmoDkCkXg6kkyaF5IyZyTn3piVgdeIdX2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvhedtfeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:v9EpadyCi0_SBnz5QO4DK4pRy86yC9_k8Lh7p0431P610eiPt_L94A>
    <xmx:v9EpaUJG9bs_SKVZbjWDI3RDqe41OMMYKiQAGXyIvNcaQHFmUgRGQA>
    <xmx:v9EpafrIeAjOvsHU0ba1d7-PdeKWawY-xBKLSGCQ0rmdB-_YBXCKMA>
    <xmx:v9EpabJYF7gBt2yUv0j-uRY-Z0HaTihHU4dbK1UwVlHmm7bOsVsG-Q>
    <xmx:v9EpaWY_KzS8EeJncFCfIDeO-6kclFwxtrrGwrMeBuV98F3sI-9DZvF2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 41B61C40054; Fri, 28 Nov 2025 11:45:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 17:45:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <be1c0b1e-4e4c-420c-ba0c-f19ddf30e657@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.18, part 4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 2eba5e05d9bcf4cdea995ed51b0f07ba0275794a:

  Merge tag 'loongarch-fixes-6.18-2' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson (2025-11-21 11:16:14 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.18-4

for you to fetch changes up to 3ecfcf34f0992d11e5eb2458a2108b3320c61ba4:

  Merge tag 'sunxi-fixes-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes (2025-11-28 17:37:13 +0100)

----------------------------------------------------------------
soc: fixes for 6.18, part 4

A few last minute fixes came in this week:

 - interrupt and gpio numbers in foud separate i.MX8 specific
   devicetree files were wrong.

 - The vector length property in the C906 CPU description
   used the wrong unit.

 - Two bugs with uninitialized stack variables in the tee
   subsystem.

 - Alexander Stein now maintains additional devicetree files.

----------------------------------------------------------------
Alexander Stein (1):
      MAINTAINERS: Add entry for TQ-Systems AM335 device trees

Ally Heev (1):
      tee: qcomtee: fix uninitialized pointers with free attribute

Amirreza Zarrabi (1):
      tee: qcomtee: initialize result before use in release worker

Arnd Bergmann (4):
      Merge tag 'imx-fixes-6.18-2' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'qcomtee-fixes2-for-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'omap-for-v6.19/maintainers-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into arm/fixes
      Merge tag 'sunxi-fixes-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes

Frank Li (2):
      arm64: dts: imx8dxl: Correct pcie-ep interrupt number
      arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos

Maarten Zanders (1):
      ARM: dts: nxp: imx6ul: correct SAI3 interrupt line

Sergey Matyukevich (1):
      riscv: dts: allwinner: d1: fix vlenb property

Xu Yang (1):
      arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity

 MAINTAINERS                                        | 2 ++
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              | 2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 4 ++--
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      | 2 +-
 drivers/tee/qcomtee/call.c                         | 2 +-
 drivers/tee/qcomtee/core.c                         | 2 +-
 8 files changed, 15 insertions(+), 8 deletions(-)
