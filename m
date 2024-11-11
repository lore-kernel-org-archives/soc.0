Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C7D49625
	for <soc@lists.linux.dev>; Mon, 11 Nov 2024 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731339308; cv=none; b=CD2/zRErpjB1diijBBWERvDp3dD48to1eIM3KsjO8mawFKw6UjGEDWFmj/MUjAKF+3unu6ptjCXHmIu9cCaeN27Jwd1EroWrxdGeo/7bAJzC2mnNFpX7ofnuHkxpW36XALk8cm1RkDwYzvWIgI6KhDg+KRb80hiOfYz/8CfiJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731339308; c=relaxed/simple;
	bh=k201cVpRmaXp36b+/Wf7VwY/gF+6PKGGNQCQ8enE59I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sE2lQnB+emtYjmRwbtYFigplv+p0YwLrEAsUi0L8rOMpJmzvS4wGeXliTkpC3MyxSreJH/hsfr7svwvuxm1ANkDkSWvH1a2yKYlolcNnQGf3gz7yEZ+aj7GoBOrei417J9zGVJWI3CY+8+rqRZ0/6vFbroN9ihRNw4u0NobXZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cwaeekky; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cwaeekky"
Received: by smtp.kernel.org (Postfix)
	id 43760C4CED6; Mon, 11 Nov 2024 15:35:08 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8059BC4CECF;
	Mon, 11 Nov 2024 15:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8059BC4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y2LinK603WP8GiL3Qqg8edQY+80d2HVOC9EVt0tprZw=; b=cwaeekkyjeaOo8UyA7/a2emnV9
	AMHqiMbLBwIWTq2Khu6mITNiEq0HyImt8ZK5OvU4ezB0BnSys8GuNuHp/Xidoo3QWuqiXCHPcU5LE
	Q6cRg6QCWLsmR75/6IrHUxdxZ8eroWX4F9X3qUknKodADPByOXOsQdsRM4BThum/teJGfwf0dfCUt
	lydYjMTZFBIVcwEEBexiwY0b8rv1WojtYHhaXxnoIsNKMxt0Mn/yuLwZm36+F+EzJlc0e/tv1v26m
	A76COKluHKxFuBFMcJEeH682JUai1QspDivPCNyqRnMbi3b5I1BuZhR5t/6ogOhLZd6vaQOX/cc3c
	30RfmA3A==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tAWRU-00046T-AR; Mon, 11 Nov 2024 16:35:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.13 #1
Date: Mon, 11 Nov 2024 16:35:03 +0100
Message-ID: <6740039.4vTCxPXJkl@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit bdb2696ac5786ed3f43520e700347fe2152ea199:

  ARM: dts: rockchip: Add Relfor Saib board (2024-10-14 11:35:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-rockchip-dts32-2

for you to fetch changes up to 2c3944d952ec4d3428a8d3163be2263579d1939a:

  ARM: dts: rockchip: adapt regulator nodenames to preferred form (2024-11-09 18:43:23 +0100)

----------------------------------------------------------------
Fixed-regulator nowadays has preferred node-naming scheme set in the
binding. This gets all boards on the same state for Rockchip arm32-dts.

----------------------------------------------------------------
Johan Jonker (1):
      ARM: dts: rockchip: adapt regulator nodenames to preferred form

 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        |  2 +-
 arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts    |  4 ++--
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts   |  6 ++---
 arch/arm/boot/dts/rockchip/rk3066a-mk808.dts       | 12 +++++-----
 arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts    | 16 ++++++-------
 arch/arm/boot/dts/rockchip/rk3128-evb.dts          |  4 ++--
 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts     | 28 +++++++++++-----------
 arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts  | 14 +++++------
 arch/arm/boot/dts/rockchip/rk3188-px3-evb.dts      |  2 +-
 arch/arm/boot/dts/rockchip/rk3188-radxarock.dts    |  8 +++----
 arch/arm/boot/dts/rockchip/rk3228-evb.dts          |  2 +-
 arch/arm/boot/dts/rockchip/rk3229-evb.dts          | 16 ++++++-------
 arch/arm/boot/dts/rockchip/rk3229-xms6.dts         | 16 ++++++-------
 arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts  |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-evb.dtsi         |  8 +++----
 .../dts/rockchip/rk3288-firefly-reload-core.dtsi   |  2 +-
 .../boot/dts/rockchip/rk3288-firefly-reload.dts    | 18 +++++++-------
 arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi     | 16 ++++++-------
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts         |  8 +++----
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts  |  6 ++---
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi |  6 ++---
 arch/arm/boot/dts/rockchip/rk3288-popmetal.dts     | 10 ++++----
 arch/arm/boot/dts/rockchip/rk3288-r89.dts          |  8 +++----
 arch/arm/boot/dts/rockchip/rk3288-rock2-som.dtsi   |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-rock2-square.dts |  6 ++---
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi      |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts |  6 ++---
 .../dts/rockchip/rk3288-veyron-chromebook.dtsi     | 10 ++++----
 arch/arm/boot/dts/rockchip/rk3288-veyron-edp.dtsi  |  4 ++--
 .../arm/boot/dts/rockchip/rk3288-veyron-fievel.dts | 10 ++++----
 .../arm/boot/dts/rockchip/rk3288-veyron-mickey.dts |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts |  4 ++--
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi      |  8 +++----
 arch/arm/boot/dts/rockchip/rk3288-vmarc-som.dtsi   |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-vyasa.dts        | 18 +++++++-------
 .../rockchip/rockchip-radxa-dalang-carrier.dtsi    |  8 +++----
 arch/arm/boot/dts/rockchip/rv1108-elgin-r1.dts     |  2 +-
 arch/arm/boot/dts/rockchip/rv1108-evb.dts          |  2 +-
 .../boot/dts/rockchip/rv1126-edgeble-neu2-io.dts   |  6 ++---
 .../arm/boot/dts/rockchip/rv1126-edgeble-neu2.dtsi |  2 +-
 40 files changed, 158 insertions(+), 158 deletions(-)



