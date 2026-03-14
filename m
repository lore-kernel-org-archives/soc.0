Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40234214F
	for <soc@lists.linux.dev>; Sat, 14 Mar 2026 18:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773513762; cv=none; b=U6+yOu9sM8k36iGMiA9yapjneC58W+wWQN80WO76yZdX+Q3i1u1jGDkP7lJwkb0qloA+y4HnY8MpycqquRpQ93vmfiJzK0HgA3DLtNTN4iYjV3QlculPEhtH3pFdbU4JHxDLs7bu3ICa3AHQ/vYdm9gd13IFStfJqHnSAqHA0fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773513762; c=relaxed/simple;
	bh=o6jJHyQRM94EhDEDtHZ59fLl5txvb02yUmvlnCjc6sM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qVBWq6B9FRjvoykWzoudsNe/CebIak72CC4mW/dQeQuj4xo+UZgRbiKnusQsEiUCzcuzr23REV5ltj56MZn+wQk50S69gPSLi009EWLReYDnDqFdUxlBugeawkV/R0/OkbNuzHjWmAXSaxSA1VHzWjXaAyRTjIYNKYXR/69x11A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=NDdbkyR5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="NDdbkyR5"
Received: by smtp.kernel.org (Postfix)
	id C4800C2BC87; Sat, 14 Mar 2026 18:42:41 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FEACC116C6;
	Sat, 14 Mar 2026 18:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FEACC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=2YspHBaRj+3aRDhXBfHzng0fFhuBsYu6B5AO6SSeqWo=; b=NDdbkyR5GVN4YheBlRPtbLPQ0P
	pghFRNN7TJyD4gO2iOLit7dhnxmOJLdNCH1a9CIutuoqPsC7P5Vh8Vf3oJilc6yly6TomHAJYBOak
	UiD93/v4tjZ5Dig067BMVEKIM6+uLRVcH+UanTdNRGdLfEXakukMlz4lFA1yEUXxNVtVYfNMl0G/o
	iwAbj0CKOYDuQ1Vua6huS0hG3xw8LVYG68ENqmq/++965x4YjRoG9WQm6A8Cwxr7qqsSUIHj1ojta
	uWFWEJ+pEIwQJ1noknm38/XuAHBbILqFFWAAFvhn1MwzlUVbryNGgNj9Fwa643mNmLxo6d6mhZVQW
	MhyJ+VZg==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 7.0 #1
Date: Sat, 14 Mar 2026 19:42:38 +0100
Message-ID: <5055064.GXAFRqVoOG@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi SoC maintainers,

please find a below some Rockchip fixes for the current 7.0 release-cycle.
And in the next PR, even one driver-fix this time.

Please pull

Thanks
Heiko


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1

for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f8634f:

  arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-03-12 20:52:53 +0100)

----------------------------------------------------------------
A big number of changes fixing dt-schema issues on the ARM32 side,
fixes for the Gameforce-Ace to make the hardware work properly
(including thermals) as well as fixing issues both on Beelink A1 (spdif)
and Pinebook Pro (Wifi) by reverting the commits that created the issues

----------------------------------------------------------------
Chris Morgan (2):
      arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
      arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace

Fabio Estevam (11):
      ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
      ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk3036 boards
      ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
      ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
      ARM: dts: rockchip: Remove invalid regulator-property from rk3288-veyron
      ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron
      ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
      ARM: dts: rockchip: Add missing the touchscreen interrupt on rk3288-phycore-rdk
      ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload
      ARM: dts: rockchip: Fix GMAC description n RK3288 boards
      ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk

Heiko Stuebner (1):
      Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"

Ming Wang (1):
      arm64: dts: rockchip: Fix Bluetooth stability on LCKFB TaiShan Pi

Robin Murphy (1):
      Revert "arm64: dts: rockchip: add SPDIF audio to Beelink A1"

 arch/arm/boot/dts/rockchip/rk3036-evb.dts          |  4 ++--
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        |  4 ++--
 arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts  |  2 +-
 .../boot/dts/rockchip/rk3288-firefly-reload.dts    |  3 +--
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts  | 16 +++++++++------
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts |  2 --
 .../arm/boot/dts/rockchip/rk3288-veyron-fievel.dts |  5 ++---
 arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts |  2 +-
 .../arm/boot/dts/rockchip/rk3288-veyron-mickey.dts |  2 --
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |  1 -
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         | 23 ----------------------
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      | 18 -----------------
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts |  4 ++--
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    | 12 +++++------
 16 files changed, 29 insertions(+), 73 deletions(-)



