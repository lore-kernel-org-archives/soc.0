Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489A62E719B
	for <soc@lists.linux.dev>; Fri,  5 Dec 2025 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959194; cv=none; b=PbIEW3/Njj53M21RnJe40Tr0fCo0g8Yr/4BXWqv13mYUasWFu8+3Gmb5rwkdLhGI46hQx54Z2+kbE5NIq/y9P1NcMp1P/6gHI4uZ5a1+988yf9JsL7tpAj1XybDDsEDgJUgnHcDNwXxCfqYA2gp3/sltrnpYafbGBmjec5NxPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959194; c=relaxed/simple;
	bh=/9/JlluMFSw5g8x1WNyv4DkpiYZ5juz5y7g7IlEd3Nw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=NSHTA3wOL8EbBi9dN04DLFT2CRBVWnmudxgySGZU6RgF3XMwevbLc1ScbpKI8QF6/ZGyBovN+NU5Hjll1/p0qO9+den8KpqEaUW2VJQ8NXHB0bABnmplwx86gXYkcaFm5ooZ3VFoudSr8vrfE2Vekf0LvVAiYKc9Q8sA7nb31bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kY1SDh5S; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lSi3Zq5A; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kY1SDh5S";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lSi3Zq5A"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8B0137A0189;
	Fri,  5 Dec 2025 13:26:31 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 13:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1764959191; x=1765045591; bh=nP
	qydn2keEbLZ+PDjtZN3gmL/j/+WbvJVseRhOSLE04=; b=kY1SDh5SRJoJg5fWFo
	1Vd0Tv4BQOci9CXGxEWyhq1KvmDI29wFEeB0483Ros/u2rMBySroPISzMwUE0+Nm
	JLHplM6Qyhs3TYf4PZo+U48ExEv8IHNRoVvReFbo7I0P/mrO7dMMVtXKYZ1FfoeJ
	g3GmkZ3PgMeBQdGCZoSGX9nd7TlFsCPUXkdTGHqfSInoGK9zgyErTT7VHAhSttOF
	7gU71uufQn4GOMoJMcOCXJcVeUoCh+pFPgTsFvmW0x+Iu3HoQPierOx6ft/Xa0j/
	DVo8o0xfrl9c+iXkc9pY111N791PoJmG8LtCcNDTxm6FyBWE/Gb/se5Hm0jQ+PKx
	I76A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1764959191; x=1765045591; bh=nPqydn2keEbLZ+PDjtZN3gmL/j/+
	WbvJVseRhOSLE04=; b=lSi3Zq5ATK8N1AlAZYarCJSPzYb4C96VN+MeWlwQmZ86
	qUk5UP3NP2+l/FUuNe+HSXPebd0BLRLEw7XMQBMXdwwd3G27WClwrlTTWdRAbCyJ
	NtNysuUmudg7buYp9W/Hb64DawfKlhpChyVDaJaRI4Zwk9Tm2nCUj/FPtZfZLjbs
	9pbuk1xgwEmQB27BSxMLi5xA4tWbRUEdJ3Qs0PhyfWJtIC818/Vxy2HWms5iRWrv
	pJmNopVF+cIdrUbck+QmgF0CpiAht2e7kAMbtLxZ7kUlFXrC/E0Wc48V6sNUkUDz
	x2niBCIBuf4mb/RnTigwEZS7VxC8TAs/KLb0kzDNsw==
X-ME-Sender: <xms:1yMzaWaD89lSCQDRcFsJuSCYsfbklAdW40ckju5XQRl1msPfQqg1Yg>
    <xme:1yMzaUNqUwYbq9PemMq5wlsQH808dMUfwttLi6-skTKXdknYAq94cDS0LgWenzGwM
    gDANxTIpODj7yl20B8HueeV-bFKFZnmYSNEq4vDSIJzFteEjgDu8FMm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeltdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkffutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceuvghr
    ghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnheple
    evheekfffgtdehkeevhefhtdehfeekgfegkeehuefhgfehjeetvefgtdduvdeknecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrh
    hnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrggu
    vggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1yMzaQFJr_rTUtDwHYsmS8TMlsFQArBYRJ7uwH6lDXEPBA1e104Acw>
    <xmx:1yMzaQPiUX4MNljV6E2CCrkapvu5W2g4DAX2_BycaWPE-A6K2DD-cQ>
    <xmx:1yMzaSeAwvHxNjETShuee1dn_PSjEtG-SjLaCOA_RQsrmHijnRNKxw>
    <xmx:1yMzadvEiCoZ8OEzMVZMKaguqfBkpcgWqWOLRvg69y6IZKDz8B67pw>
    <xmx:1yMzaXeFo_pcCtuav3yyw5ARwDmzo-q0be9VmYhLF4XuPl3Ny4Bcxflc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 39C12C40054; Fri,  5 Dec 2025 13:26:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Am9m4lpOTbR7
Date: Fri, 05 Dec 2025 19:26:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
Subject: [GIT PULL 0/6] soc: updates for 6.19
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Linus,

This merge window is not quite as big as the last one for us,
but it still has 974 commits from 274 developers, mostly for
arm64 devicetree files.=20

Despite the size, not much sticks out. There are six new SoC
types, with three of them being completely new platforms from
smaller companies (Tenstorrent, Black Sesame and Anlogic).

The most active developers this time, by number of patches were

     44 Frank Li
     26 Kuninori Morimoto
     26 Dmitry Baryshkov
     22 Wolfram Sang
     20 Alexander Stein
     19 Krzysztof Kozlowski
     16 Geert Uytterhoeven
     14 Richard Zhu
     14 Aaron Kling
     13 Luca Weiss
     12 Heiko Stuebner
     11 Lothar Rubusch
     11 Chen-Yu Tsai
     10 Duje Mihanovi=C4=87
     10 Cristian Cozzolino
     10 Conor Dooley
     10 Chris Morgan

Dirstat:
   0.3% Documentation/devicetree/bindings/arm/
   0.3% Documentation/devicetree/bindings/display/tegra/
   0.3% Documentation/devicetree/bindings/mmc/
   1.2% Documentation/devicetree/bindings/
   4.7% arch/arm/boot/dts/aspeed/
   1.3% arch/arm/boot/dts/intel/socfpga/
   0.3% arch/arm/boot/dts/mediatek/
   5.1% arch/arm/boot/dts/nvidia/
   0.7% arch/arm/boot/dts/nxp/imx/
   0.5% arch/arm/boot/dts/qcom/
   0.6% arch/arm/boot/dts/renesas/
   1.5% arch/arm/boot/dts/ti/omap/
   0.3% arch/arm/boot/dts/
   0.4% arch/arm/
   0.5% arch/arm64/boot/dts/allwinner/
   0.6% arch/arm64/boot/dts/amlogic/
   1.9% arch/arm64/boot/dts/cix/
   0.4% arch/arm64/boot/dts/exynos/google/
   0.3% arch/arm64/boot/dts/exynos/
   9.5% arch/arm64/boot/dts/freescale/
   0.4% arch/arm64/boot/dts/intel/
   0.5% arch/arm64/boot/dts/marvell/mmp/
  10.6% arch/arm64/boot/dts/mediatek/
   4.6% arch/arm64/boot/dts/nvidia/
  11.4% arch/arm64/boot/dts/qcom/
   5.8% arch/arm64/boot/dts/renesas/
   6.7% arch/arm64/boot/dts/rockchip/
   9.2% arch/arm64/boot/dts/ti/
   0.4% arch/arm64/boot/dts/
   0.3% arch/riscv/boot/dts/sophgo/
   1.2% arch/riscv/boot/dts/spacemit/
   0.4% arch/riscv/boot/dts/starfive/
   0.6% arch/riscv/boot/dts/
   0.3% arch/x86/kernel/
   0.5% arch/
   0.8% drivers/bus/
   0.3% drivers/cache/
   0.3% drivers/clk/
   0.6% drivers/firmware/
   0.5% drivers/irqchip/
   1.2% drivers/memory/tegra/
   2.5% drivers/reset/
   1.1% drivers/soc/qcom/
   0.5% drivers/soc/renesas/
   1.4% drivers/soc/samsung/
   0.5% drivers/soc/
   0.7% drivers/
   0.3% include/dt-bindings/clock/
   1.2% include/dt-bindings/reset/
   1.1% include/linux/soc/samsung/
   0.3% include/linux/
 982 files changed, 59312 insertions(+), 7066 deletions(-)

There was a slight delay sending it out as I was still in the
process of setting up my randconfig tests earlier this week
and I wanted to ensure everything is well tested this time.

      Arnd
