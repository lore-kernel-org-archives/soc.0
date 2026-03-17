Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BEA25A2C6
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 08:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737132; cv=none; b=B1O7HbC40csJG4mEbnu43APCPvVgrHrpXD/Z4byd3DndzwnKex/QwLS4NCLvM0p6Dk0hKKx6cvlua3/VVQ7z62p4i6tyaftxlrLHE/sWobmglnAdmSsiF0gblv5gBAhXo5jHflWkdGtjXYh8BZ1jVSPW57TzubmZdxxzab8JiSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737132; c=relaxed/simple;
	bh=4hTToIr/78vfvHkQPMhwZI2Lj0uD6bto/uR5S2TlSDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/uqQkbY96zrmyAOYfdf8LRgQAKVTS97if3Nkg19VXtGbrnipd/0qJ+Ubp2QkBStDNHNltr0aQOqXkrDfX4dEbaqMin19GAs/x11uJ12Sw5lfhU0FDQkZ3ZM0mwzkJP4OPDATO/oXMm0aXUH0ZIpufNKsVcRsPcKvFnxZfOzX2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/2Ge6/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/2Ge6/r"
Received: by smtp.kernel.org (Postfix)
	id 70E55C2BCAF; Tue, 17 Mar 2026 08:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01724C4CEF7;
	Tue, 17 Mar 2026 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737132;
	bh=4hTToIr/78vfvHkQPMhwZI2Lj0uD6bto/uR5S2TlSDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/2Ge6/rbt4hz59fzOGAAiuf6hOLhMx5Cs7IDW1WGBgKnGFS48CdZuHdAHFI/Po68
	 PWZFpCsGTOwmsQQ9SPvjP3oohpLTH0RqjPVOFO13zJGD9AwwjyQWriz1CCOpbiwCtZ
	 5qX1DqL0+0NeZJjxaqRGrcdwVQt3YLqSqrOcR5USaK7dSbO5lTNP8rBt01x+nE+A2G
	 Kfgk2ONDpjbpWqRx6YcJX56bhe9JmOhUXq936nFyEJaxIRVj8F6czkoxoLl3ftHPYa
	 10ROh8A+K65bwc7TIw8LfzyLT89mFIWaUWf08NHkREBqKf4nhNTQgAils4AQqjHj8b
	 Ss/IAVBLGqJPQ==
Date: Tue, 17 Mar 2026 09:45:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 7.0 #1
Message-ID: <20260317-clever-flat-wolverine-313a4c@quoll>
References: <5055064.GXAFRqVoOG@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5055064.GXAFRqVoOG@phil>

On Sat, Mar 14, 2026 at 07:42:38PM +0100, Heiko Stuebner wrote:
> Hi SoC maintainers,
> 
> please find a below some Rockchip fixes for the current 7.0 release-cycle.
> And in the next PR, even one driver-fix this time.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1
> 
> for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f8634f:
> 
>   arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-03-12 20:52:53 +0100)
> 
> ----------------------------------------------------------------
> A big number of changes fixing dt-schema issues on the ARM32 side,
> fixes for the Gameforce-Ace to make the hardware work properly
> (including thermals) as well as fixing issues both on Beelink A1 (spdif)
> and Pinebook Pro (Wifi) by reverting the commits that created the issues
> 
> ----------------------------------------------------------------
> Chris Morgan (2):
>       arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
>       arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace
> 
> Fabio Estevam (11):
>       ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
>       ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk3036 boards
>       ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
>       ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
>       ARM: dts: rockchip: Remove invalid regulator-property from rk3288-veyron

Not a fix.

>       ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron

Not a fix. This is a pure style change. Fixes for current cycle means
either important issues being fixed or errors introduced in current
cycle.

Changing style from one to another is not a fix.

>       ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
>       ARM: dts: rockchip: Add missing the touchscreen interrupt on rk3288-phycore-rdk
>       ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload

Not a fix. Style of node name is not a bug, otherwise describe user
visible (not "internal tools" visible) impact.

>       ARM: dts: rockchip: Fix GMAC description n RK3288 boards
>       ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk

Several other are questionable as well, since they were in DTS for long
time. Please also read Linus' explanation here from some time ago - if
the issue is for long time and no one cared, then changing it is a normal
development.

Several changed pieces here look like 3 or more years old, so does not
fit criteria of current cycle fix at all.

Please split the pull.

Best regards,
Krzysztof

