Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3FE23E226
	for <soc@lists.linux.dev>; Tue,  8 Jul 2025 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752007284; cv=none; b=l6Qa9B7Q5RvTKkbFVPtdpD8mUdYgev492eOMT+ZFIgOI23OkNMWzYcenN5LQR8AvZBIFlfuDJRqDdUCtundU2wmyjhOs3QSzZpoIb7odC8a75lEvl7uorAnOaFSyerdWCGXQaaXxcBMefvN/0Y+1jpQR0KasWFTh7MsgG+gS6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752007284; c=relaxed/simple;
	bh=Z7AlIIbi6bUKf63aYDsqGjvnvlWuk//sIyElrFrkRgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WsiZk6j5CmyFaFFct3DDxPbA52Qxi+VvtgtEGGhvvsc8g6KG73itv3fzqcSmp9jkGGOXaJzPoYdW51uEqdwL09X0TtJSygxwDaFKgPHUt/VlN/Jiw4NvaCCflHffPVoRHTFh42K0LkXLNTbf3qVt4lSounRicL4qMnKANB2uMQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=u+yrMRrg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="u+yrMRrg"
Received: by smtp.kernel.org (Postfix)
	id 29C17C4CEF5; Tue,  8 Jul 2025 20:41:24 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D78BC4CEED;
	Tue,  8 Jul 2025 20:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D78BC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=uygCH21KbdcGkN1lZ0Sna3b75q2CK0gWLRBqeJYnhYo=; b=u+yrMRrgBJXNuN+2fBDeMtSzP1
	zLsNSX3U50MzpnP+b4t1egPndg9OII9v9nXNjn5KDLv6SE+Tppp53b6/jonupNaSnCcpoUUyLrUEe
	Cf6NCv2MfHzx+9iRIdhI0wpc+s24JmAirSueEczSwCHuaDG/zXoXgdTjAY0LVY2uqoJF8TuYboRGP
	K+P6C3kT1CzO7kKju7bWyH8OVAbrrwmNIfOFdMOLzdwlGX7NK3XLsqnEKmglEghgYLWtIYEtUsmV1
	X0Bp3UKqA8NzcHEQBydRjPdcCtaPIink7ShHOdyYXqDtuApImXcmH5DA5fRFhBpoo/dXAqD/2gbBx
	wUxR8Yfw==;
Received: from i53875a8d.versanet.de ([83.135.90.141] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZF7u-0006dd-Lo; Tue, 08 Jul 2025 22:41:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.16 #1
Date: Tue, 08 Jul 2025 22:41:18 +0200
Message-ID: <5108768.AiC22s8V5E@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Arnd, Kevin, Olof,

please find a below some fixes for the current 6.16 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dtsfixes1

for you to fetch changes up to 9037532ab893635a46afe88542cd747a4a846497:

  arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a (2025-06-30 11:08:36 +0200)

----------------------------------------------------------------
Switch to the gpio variant for spi-cs and mmc-detect for some boards
as the in-controller functionality does not work as intended for them.
HDMI drive strength adjustment for better ddc communication and some
missing supplies.

----------------------------------------------------------------
Alexey Charkov (1):
      arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5

Andy Yan (3):
      arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
      arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
      arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi 4B

Diederik de Haas (1):
      arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: use cs-gpios for spi1 on ringneck

Shawn Lin (1):
      arm64: dts: rockchip: fix rk3576 pcie1 linux,pci-domain

 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    | 23 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  1 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  2 +-
 .../boot/dts/rockchip/rk3588-base-pinctrl.dtsi     | 20 ++++++-------
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |  1 +
 .../boot/dts/rockchip/rk3588-extra-pinctrl.dtsi    |  5 ++--
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |  1 +
 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi | 35 ++++++++++++++++++++++
 9 files changed, 103 insertions(+), 13 deletions(-)



