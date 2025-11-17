Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC5230103D
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 22:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763417928; cv=none; b=M/odwQYiBJUxWOl5kJ2A5TBxe1tc70xXnmbgbp+sJ3h5Cl8MdG3rzTgW5JZtdQ7SN5OJ7+i7Qu234G2Ra5vt56oBAVX1Gvt2FM+4NqbQA5u4PiVCieN/RDPhEZ66Hc68PXNy1AKTBJcjS6k+d2W8P0gd13PlrwBwLz3HFXe6kng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763417928; c=relaxed/simple;
	bh=jJjh1f/gv2gKHKxROCacOJ0vSLslf2T/x1lhC/Ni2EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nnEo0p/6qatrCF5dNIqWJS1sVeESPkVyiJwKyCrnpHOvJwqz9BMJ9ng7kltgSZEjbQb5PvSJ/STrCQ4y5VhXyDpyTG8q9xHVK7vqjLKi2yrXoxcO1wi/SRzwQ5BwZFP23J49Y/fq5GNuHAfbfafXTSLfbfcFTyscMc3RCMTkmoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=09MTnJr3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="09MTnJr3"
Received: by smtp.kernel.org (Postfix)
	id 8E37AC2BCC6; Mon, 17 Nov 2025 22:18:47 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF990C4CEF1;
	Mon, 17 Nov 2025 22:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF990C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=XiZiGkVbdwxVtmjL5kAkat9pwJdn+ImV6RiVmdUZKRM=; b=09MTnJr3HJJistsIGUge7eYPUs
	uNcDwLQaxEykrCSLBgcIMm1u9TPRUpKMHaIyqxoac6VRqEpI5uQTEUvFn4UGDpXLEtTmJCwGfVcK+
	GEiWzWh/9ekVdfs2jE4I6151B0eYzDsFAT26AM6Ym41/VAwcfTQPwAaJuZuGXVuZnCrGnZct5mDLr
	PR001IexrT/XM5TaSG9wm7lXaP4CMnoh24/nFO8KZwQQshzUqTtoF7VGYqo9CBoDKMoXAzsKT/gGg
	iGG3C2SIfo/pU8R0zjFbN/kYdp7McMiNzGUYd09iBDxgY0gaFZECnjK+urywQvQTgLK4z426ZULHN
	fm6QZ0dw==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7YP-0001OR-Qq; Mon, 17 Nov 2025 23:18:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.18 #1
Date: Mon, 17 Nov 2025 23:18:32 +0100
Message-ID: <1901272.VLH7GnMWUR@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi SoC maintainers,

please find a below some Rockchip fixes for the current 6.18 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-dtsfixes1

for you to fetch changes up to b5414520793e68d266fdd97a84989d9831156aad:

  arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on orangepi-5 (2025-11-14 00:15:33 +0100)

----------------------------------------------------------------
Regulator/supply fixes for a number of boards, removed too fast
cpu OPPs from rk3576 (not supported in newer vendor TF-A and never
supported in upstream TF-A). As well as some DTS validation fixes
and one pinctrl fix for the odroid-m1.

----------------------------------------------------------------
Alexey Charkov (1):
      arm64: dts: rockchip: Remove non-functioning CPU OPPs from RK3576

Anand Moon (1):
      arm64: dts: rockchip: Set correct pinctrl for I2S1 8ch TX on odroid-m1

Andrey Leonchikov (2):
      arm64: dts: rockchip: Fix PCIe power enable pin for BigTreeTech CB2 and Pi2
      arm64: dts: rockchip: Fix USB power enable pin for BTT CB2 and Pi2

Chukun Pan (1):
      arm64: dts: rockchip: drop reset from rk3576 i2c9 node

Diederik de Haas (2):
      arm64: dts: rockchip: Drop 'rockchip,grf' prop from tsadc on rk3328
      arm64: dts: rockchip: Fix vccio4-supply on rk3566-pinetab2

Dragan Simic (1):
      arm64: dts: rockchip: Make RK3588 GPU OPP table naming less generic

Heiko Stuebner (1):
      arm64: dts: rockchip: Fix indentation on rk3399 haikou demo dtso

Mykola Kvach (1):
      arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on orangepi-5

Quentin Schulz (2):
      arm64: dts: rockchip: include rk3399-base instead of rk3399 in rk3399-op1
      arm64: dts: rockchip: disable HS400 on RK3588 Tiger

 arch/arm64/boot/dts/rockchip/rk3328.dtsi                   |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi               |  2 +-
 .../boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso   | 10 +++++-----
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi   |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi          |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts          |  2 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi                   | 14 --------------
 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi               |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi             |  4 +---
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi                  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts        |  4 ++--
 11 files changed, 17 insertions(+), 32 deletions(-)



