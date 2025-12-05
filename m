Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8392719D093
	for <soc@lists.linux.dev>; Fri,  5 Dec 2025 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959231; cv=none; b=uUwIAmjC7QDdTp5LZu3gT4m7xq0yJnvdfgLFGxeLUaILWKm6IrdfItLN2BkWc9vU3dF3C+s/W2tBPsyJ39uqjY9e7C1HhRGYpWyEs4h0hLR4igpVFJ+Ll/q0JAKkMbpkgQaKrrk9dzZuegBLpUoBySUM1MLzA3WQIaPXjiuK5AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959231; c=relaxed/simple;
	bh=F8/yjKkIjpPxLiJLY/3+mxqFKV1bBDZVsOZazkxr4qc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JX9klNNPmqy/GpuA0ZxAj8fdnvqRH4A9H9FhW6yYcDOqH4tnYV5paEDyeE9y6TZrQ90lw9KcWZRXCCH4GnHJfCdsDnqUkMqoXSDTUiz0YPclOpaytbI6w3OQxiQXh7MQJaI9n7pqYw0uN7mpXnFO9YS09TJY1NglLd7U0VwsFmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jnfiI7Cv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ke64RuDM; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jnfiI7Cv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ke64RuDM"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id B9F341D00112;
	Fri,  5 Dec 2025 13:27:07 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 13:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764959227;
	 x=1765045627; bh=FrEHqA2e8eRqTW0SZLACyjv+SiV05LInuVXtJZRuf6Q=; b=
	jnfiI7CvR1Rj3AjJ8SAKLhrzsydEsJBnHiO2oAh8qr6YtYJXPauoXEvcY0tDeyj+
	aD5l/5p3N9rJYnqkEcXAikxBR2iI8gfQ5uqCK4JlA2+H32cHUgsT0IwbkbUV8FfC
	SrgzR8GhWuf/h+qdG4nT+mrHJCc9c5r200IVpok1+8gPCpJNCVUuCG+vBbUzxQ4p
	xGy+YmzUsigspemw2r5Xc/OwPhQnuLq1YyNgwHyU+MVq2DjosD4zVVQINYWGnha8
	Ei0f2j5H9zHmLsIcgsOflLhn88/IpP/p8VwFzfOYDrfdT+zBL8TLMg/qgMwS9rbV
	+6ro7kM/ippu9PR1ohn6kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764959227; x=
	1765045627; bh=FrEHqA2e8eRqTW0SZLACyjv+SiV05LInuVXtJZRuf6Q=; b=K
	e64RuDMjRPjYALqQw+1Y6hwzCtgOHFszjRQkjmi+pHzdrCNieSh1GqlYBaQJw4jH
	7VpuhJE+UUlrfQwbuWUgr4TRWRxKw1Y9gD9ssUakftskRXwANY5wF52yhnaFeKey
	nT0CXkpswh2c82KkpU/BTtIy0P6Kvf4G2emT8+hf5Zk2JA/8oxlhG0ShD18gRyeT
	rNci/SiSpC1TF9fYatP9L6kFNiI8t/HD7EPCuxhyuXSoMhvfdLJeYR2y+6RbK9MH
	PlmERyhg63R9uaqkoN7jHbJaHQG9z3ivcGRN9k+HoWD72+rhraNX4MkmHja+Zqft
	ahBK+MFD5/ppaNSiOTmzw==
X-ME-Sender: <xms:-yMzac0MLHYvuNJq0kAhU6pR6_1tHub-KDtvUVtpHX1KKFwKdMMxiA>
    <xme:-yMzaR51zFLsPsyTfIzucFBJM1G6wdOing2EeAqtYsEh_QRdb26Yj9PWqrpFVKpnX
    CkSh8tfgTQHkfB0mYJLMItxw-9G_O77O7RIpqZKnIxJfp7AjlC0SwrT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeltdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffgnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslh
    hinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-yMzaeiRQ5in7yBJ2hNWlb1JiIO7DxZb0X7yDOPI8DwcGLYAAPQVaw>
    <xmx:-yMzaV526FZPOtajDplsXI8fiX7poXIqmbBHYdp0PtnEfjgxjqt5EA>
    <xmx:-yMzaeZsDSGyv5hT3fk7zRKU4MCjBiZUQWt1o6oARFQbB0e9U_IHbQ>
    <xmx:-yMzaS4sN4A_jqDqPQ5GIVu2b5ww5Fc0yRgiHdeysZCrAGgGx5AQqw>
    <xmx:-yMzaUJAA8H3A1Qab6d80eBYgSdQL4wlhJHSVcqBdsq0feS7I3GIGuXj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 672F8C40054; Fri,  5 Dec 2025 13:27:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Am9m4lpOTbR7
Date: Fri, 05 Dec 2025 19:26:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <347a999a-037b-42f7-b4ba-b05b81207fea@app.fastmail.com>
In-Reply-To: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
Subject: [GIT PULL 1/6] soc: defconfig for 6.19
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8be=
caa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
efconfig-6.19

for you to fetch changes up to 00de4ef9d3abc0b195988c23aea2fefe5f76d3c4:

  Merge tag 'riscv-config-for-v6.19' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/conor/linux into soc/defconfig (2025-11-27 23:03:34 +010=
0)

----------------------------------------------------------------
soc: defconfig for 6.19

As usual, a number of newly added drivers get enabled in the arm64 defco=
nfig,
in addition to minor housekeeping work on defconfig files for arm32, arm=
64 and
riscv.

----------------------------------------------------------------
Alex Elder (1):
      riscv: defconfig: enable SPI_FSL_QUADSPI as a module

Andy Yan (1):
      arm64: defconfig: Enable Rockchip extensions for Synopsys DW DP

Arnd Bergmann (10):
      Merge tag 'renesas-arm-defconfig-for-v6.19-tag1' of git://git.kern=
el.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'mtk-defconfig-for-v6.19' of https://git.kernel.org/pub/=
scm/linux/kernel/git/mediatek/linux into soc/defconfig
      Merge tag 'tegra-for-6.19-arm-defconfig' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/tegra/linux into soc/defconfig
      Merge tag 'tegra-for-6.19-arm64-defconfig' of git://git.kernel.org=
/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig
      Merge tag 'imx-defconfig-6.19' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'at91-defconfig-6.19' of https://git.kernel.org/pub/scm/=
linux/kernel/git/at91/linux into soc/defconfig
      Merge tag 'omap-for-v6.19/defconfig-signed' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/khilman/linux-omap into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.19' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'v6.19-rockchip-defconfig64-1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig
      Merge tag 'riscv-config-for-v6.19' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/conor/linux into soc/defconfig

Claudiu Beznea (1):
      arm64: defconfig: Enable Renesas RZ/G3S thermal driver

Cosmin Tanislav (1):
      arm64: defconfig: Enable RZ/T2H / RZ/N2H ADC driver

Cristian Ciocaltea (1):
      arm64: defconfig: Enable DW HDMI QP CEC support

Dario Binacchi (1):
      ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm

Fange Zhang (1):
      arm64: defconfig: Enable SX150x GPIO expander driver

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.18-rc1

Huang Shijie (1):
      arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT

John Madieu (1):
      arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

Jon Hunter (1):
      ARM: tegra: Enable EXT4 for Tegra

Jo=C3=A3o Paulo Gon=C3=A7alves (1):
      arm64: defconfig: Enable i.MX95 drivers for pinctrl, Ethernet and =
PCIe

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable two Novatek display panels for MTP8750 an=
d Tianma

Laurentiu Mihalcea (1):
      arm64: defconfig: enable i.MX AIPSTZ driver

Luca Weiss (1):
      arm64: defconfig: Enable configs for Fairphone 3, 4, 5 smartphones

Luo Jie (1):
      arm64: defconfig: Build NSS clock controller driver for IPQ5424

Macpaul Lin (1):
      arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK U=
FS board

Manikandan Muralidharan (1):
      ARM: at91: at91_dt_defconfig: set MMC_SPI to module

Manivannan Sadhasivam (1):
      arm64: defconfig: Enable SCSI UFS Crypto and Block Inline encrypti=
on drivers

Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

Michael Riesch (1):
      arm64: defconfig: enable rockchip camera interface

Parvathi Pudi (1):
      ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver

Shubhi Garg (1):
      arm64: defconfig: Enable NVIDIA VRS PSEQ RTC

Tudor Ambarus (1):
      arm64: defconfig: enable Exynos ACPM clocks

 arch/arm/configs/at91_dt_defconfig  |  2 +-
 arch/arm/configs/multi_v7_defconfig |  2 ++
 arch/arm/configs/mxs_defconfig      |  2 ++
 arch/arm/configs/shmobile_defconfig |  4 ++-
 arch/arm/configs/tegra_defconfig    |  4 ---
 arch/arm64/configs/defconfig        | 49 ++++++++++++++++++++++++++++++=
+++++--
 arch/riscv/configs/defconfig        |  1 +
 7 files changed, 56 insertions(+), 8 deletions(-)
