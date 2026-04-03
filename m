Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2542F379ED8
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222748; cv=none; b=S1XFIjdZ89t0LLRufXezTsVNjdtDl/djHQRBRb1MQGUzCLb9q6CC1u6ttwBEsngHDcMEq1LJaRPhIRR59lDoEvBX2HWvYHS/W3diUmUtfUt+rAxTVezUO3TKXbgYEt8JXs/2zRr4XSKu1lgPSH70XTIB4B5nUBNRdMYr7aJrHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222748; c=relaxed/simple;
	bh=CvudSdpQESAVqTPWzzFPC6z7ueI6hlQs7MwLrB6XP5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qZUL7vMv13XZ4ILekufZ79Q5Dpt5W3dtU5WlX5oSw92H3RtEefuzlfrOxPFWyccUxAIHmR9rFDy3Lm78HMKf2e3pVVx+bQ0gUL6rR7Wao8WC6QWrDv4OLNaWpiwy0rsCruJs4KFxrqgLeoMX/RZDYLhQAl9yvHOmaGIm2A3DE1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=plb+/0EY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="plb+/0EY"
Received: by smtp.kernel.org (Postfix)
	id D59D0C2BCB1; Fri,  3 Apr 2026 13:25:47 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF107C4CEF7;
	Fri,  3 Apr 2026 13:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF107C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=NF4JDG9gLpkgwa9sSYPibHIAixK9qPvEipevanGie4c=; b=plb+/0EYqxQ+ZWruLdGpjcZs63
	F/Qry1QoQpyR2ruHVovbtvdcU0KkG7PjDd/AdhiuSurFwmcmKezUo8sRh/uMKNXxeqL1j+XzZ6GjV
	S5E3o7hAVIAwE2/zXy6Zol1t7fc2wZXXzpO+aLdQvwNdfcmddasc5Mkb+V71J+8o9vXpgqw6lqjDn
	q20BV2VqWAiFOoUcV8KXcdCzbJyrAzBPzT9RSO8hmoLOOUgTfrI6WpbmM1vxebQpNKg7y/NEQlH94
	p8RETiUXkyFULd3OZvFF3Gg8ILGyXlE4D/3xVMQpNdHIozItXmfJUj77IFL+PsKUWj+aR+QeHwwwP
	W51lbgHw==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 7.1 #1
Date: Fri, 03 Apr 2026 15:25:36 +0200
Message-ID: <2771700.BddDVKsqQX@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below Rockchip ARM32 DT changes for the merge-window for 7.1 .


Please pull.
Thanks
Heiko


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts32-1

for you to fetch changes up to 94c8dc1fa8e1ad4037084204152bca1e799d7d1c:

  ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky (2026-03-24 17:06:35 +0100)

----------------------------------------------------------------
A number of dt-schema cleanups that are log standing, so not suitable
as fix for the current release.

----------------------------------------------------------------
Fabio Estevam (12):
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
      ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky

 arch/arm/boot/dts/rockchip/rk3036-evb.dts            |  4 ++--
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts          |  4 ++--
 arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts    |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts |  3 +--
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts    | 16 ++++++++++------
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi   |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts   |  2 --
 arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts  |  5 ++---
 arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts     |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts   |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts  |  2 --
 arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts   |  1 +
 arch/arm/boot/dts/rockchip/rk3288.dtsi               |  1 -
 13 files changed, 22 insertions(+), 24 deletions(-)



