Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF842AD2A
	for <soc@lists.linux.dev>; Sun,  4 May 2025 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746396619; cv=none; b=Bbej2rCT+zCe6HR6oho3I/Qlewl1Q6QMC3x6VmeKDdWpkjh3JwZ7weT3LadxqjHEwIGfkd43IEMiPyGOtmccNE1fmtr/aR/y6FtT55nap3KaVm3NaFpIUrTxfYarmbF/dbaR1iRhxE5kNbXFFM2UrnURl2DYieJIDHOnh3OJSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746396619; c=relaxed/simple;
	bh=JjwroW+Sz58FnbQF2NHoe15WcGhpfs+l5hST+/6w2ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aeN9vMJPYEsPLakyKEKR64nVdjHHCin7PdrpRvUJl+5rVAb4j9kMSmGejSzqqexmwiTsRoxmK3lBhT9D1I95Xg64abDAM4v0yvH2+O3TeUbZVIMdh6dQJGeg7H3qH3PXdcPbxf16utHBW+JhtHD6is4zAmcL5HGymbqglRTflN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AKeciERU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AKeciERU"
Received: by smtp.kernel.org (Postfix)
	id 6A802C4CEE9; Sun,  4 May 2025 22:10:15 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24A46C4CEE7;
	Sun,  4 May 2025 22:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24A46C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=sLpW6jTBTWl6wB5elGwC1n2v3ZUSHcQl9rZfk83A14c=; b=AKeciERUlG++PembkUMAJdd63H
	3v1llWiYQP4DTT+yzeVR18isqNCTLiYN73K/RLwsG4gwH7VGxUbAeGBHTikmXrWXFaAfdhphARTI+
	4vP4VxsE3YTbUKJxOhF1izBTda2CCbcgDStmw9sxeCvVyOnUIuotfNTm3OcP6jlw6pbi6yEjKrEdG
	zcS+HVUibELouIA/ic+R3zVAW8V/JTWI6nEWmZQGntlw6Rt1E2B3Yk0/NWEbZAQPk221arAWeYrne
	5uvqYzip67fbqn4o6MYsI6rhQe6RWDBQK0A/RzDqQ0juzeYsCS35km+qvq6kmPebeqXbocQyad5Im
	J+h66POQ==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBhXI-0006CM-6R; Mon, 05 May 2025 00:10:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.15 #1
Date: Mon, 05 May 2025 00:10:11 +0200
Message-ID: <2923598.88bMQJbFj6@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Arnd, Kevin, Olof,

please find a below some fixes for the current 6.15 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.15-rockchip-dtsfixes1

for you to fetch changes up to 4bf593be2e462623c4c34c7e3b604eb3f8f9de45:

  arm64: dts: rockchip: fix Sige5 RTC interrupt pin (2025-04-29 23:21:49 +0=
200)

=2D---------------------------------------------------------------
Removal of operating-points above what the rk3588j soc is rated for, and
a number of smaller fixes: Turing RK1 fan can spin down again, fixed pins,
pinmuxing and clocks and some devicetree-correctnes improvements.

=2D---------------------------------------------------------------
Dragan Simic (1):
      arm64: dts: rockchip: Remove overdrive-mode OPPs from RK3588J SoC dtsi

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Align wifi node name with bindings in CB2

Nicolas Frattaroli (1):
      arm64: dts: rockchip: fix Sige5 RTC interrupt pin

Rob Herring (Arm) (2):
      arm64: dts: rockchip: Use "regulator-fixed" for btreg on px30-engicam=
 for vcc3v3-btreg
      arm64: dts: rockchip: Fix mmc-pwrseq clock name on rock-pi-4

Sam Edwards (1):
      arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down

Tom Vincent (1):
      arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-=
cm3588

Uwe Kleine-K=C3=B6nig (1):
      arm64: dts: rockchip: Add pinmuxing for eMMC on QNAP TS433

 .../boot/dts/rockchip/px30-engicam-common.dtsi     |  3 +-
 .../boot/dts/rockchip/px30-engicam-ctouch2.dtsi    |  2 +-
 .../rockchip/px30-engicam-px30-core-edimm2.2.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  2 +-
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |  2 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  2 +-
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |  4 ++
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  2 +
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi          | 53 +++++++-----------=
=2D---
 10 files changed, 31 insertions(+), 43 deletions(-)



