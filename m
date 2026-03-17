Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5541733F384
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738351; cv=none; b=q3Nnlm5qQlm+HwBSa12UGaR0EQ6/xt7rHR75PiyFSxIqmfjgnkEhd/aabGaHW5qg4ZQzHBy2GVeIT0X0/bHBWt+StE6tHU02UCRVg/03P7uCK6/BSOjRyKNUD0Na/4bb4o7tyW9gF5QLdt0eoOdMLVGjHAAZVCc9Ps2TsxW4/rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738351; c=relaxed/simple;
	bh=EaCmMqgS2+4nvttbt82WGpqHz6KtBNyGfHsClJJVb2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J3CF/uQcK1Jj4zWSJ4MtueR1rKZ0b0DvmrkG1xCZXq8EV6igalHx+FXt3xggsoivfyMPlYaUirQAWc8Ltyko0DC62ElgnRJq1lrQUBSY5ArR/NuZ2K00BzxzwhQ7dFIUdEnUkSBEPsJtt+oF5cE6hYakhc3aLkYqrfHDOfv35l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jdfOhEao; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jdfOhEao"
Received: by smtp.kernel.org (Postfix)
	id 25A78C2BCAF; Tue, 17 Mar 2026 09:05:51 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B8DAC19425;
	Tue, 17 Mar 2026 09:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B8DAC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7BAE8LjeF83jHd4SQwSadRgJd4yWJH8g5djeZ7lRo2k=; b=jdfOhEaoB2ew3o9mowKIzPE6yH
	amCO8fSi7sAl98aq+9/WYxoYuuyTuptV7QUEupijM3S6G5CnXIvTY0CZJHE0+h5weDoto2lZKK1YF
	3VIbKT4tgYShg+prxHVl1c/cdPU6xIa/WqkUQ/Fh+noU8C2AcFbBphPToLJQAKQYJMEMoPuc4XewN
	DtDIQsYbxRrkidOvBWMwz3fD5tg4ztGFAzanyucsboQZ/iAHAYJp81quKyyXaSwQ016oF0Qa8cSCw
	jfRVxDcik+T4xzaKGYru2KG63pAHCCAxPPNhX+TcMbgBcGlpeFk3G3825dCU8pFHO47Q8CjMYeHis
	JOopmjuA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 7.0 #1
Date: Tue, 17 Mar 2026 10:05:39 +0100
Message-ID: <10817796.nUPlyArG6x@phil>
In-Reply-To: <20260317-clever-flat-wolverine-313a4c@quoll>
References:
 <5055064.GXAFRqVoOG@phil> <20260317-clever-flat-wolverine-313a4c@quoll>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 17. M=C3=A4rz 2026, 09:45:30 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Krzysztof Kozlowski:
> On Sat, Mar 14, 2026 at 07:42:38PM +0100, Heiko Stuebner wrote:
> > Hi SoC maintainers,
> >=20
> > please find a below some Rockchip fixes for the current 7.0 release-cyc=
le.
> > And in the next PR, even one driver-fix this time.
> >=20
> > Please pull
> >=20
> > Thanks
> > Heiko
> >=20
> >=20
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5=
f27f:
> >=20
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.=
git tags/v7.0-rockchip-dtsfixes1
> >=20
> > for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f8634f:
> >=20
> >   arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-03=
=2D12 20:52:53 +0100)
> >=20
> > ----------------------------------------------------------------
> > A big number of changes fixing dt-schema issues on the ARM32 side,
> > fixes for the Gameforce-Ace to make the hardware work properly
> > (including thermals) as well as fixing issues both on Beelink A1 (spdif)
> > and Pinebook Pro (Wifi) by reverting the commits that created the issues
> >=20
> > ----------------------------------------------------------------
> > Chris Morgan (2):
> >       arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
> >       arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace
> >=20
> > Fabio Estevam (11):
> >       ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
> >       ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk3036=
 boards
> >       ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
> >       ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
> >       ARM: dts: rockchip: Remove invalid regulator-property from rk3288=
=2Dveyron
>=20
> Not a fix.
>=20
> >       ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron
>=20
> Not a fix. This is a pure style change. Fixes for current cycle means
> either important issues being fixed or errors introduced in current
> cycle.
>=20
> Changing style from one to another is not a fix.
>=20
> >       ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
> >       ARM: dts: rockchip: Add missing the touchscreen interrupt on rk32=
88-phycore-rdk
> >       ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload
>=20
> Not a fix. Style of node name is not a bug, otherwise describe user
> visible (not "internal tools" visible) impact.
>=20
> >       ARM: dts: rockchip: Fix GMAC description n RK3288 boards
> >       ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
>=20
> Several other are questionable as well, since they were in DTS for long
> time. Please also read Linus' explanation here from some time ago - if
> the issue is for long time and no one cared, then changing it is a normal
> development.
>=20
> Several changed pieces here look like 3 or more years old, so does not
> fit criteria of current cycle fix at all.
>=20
> Please split the pull.

I do remember in the past, changes that reduced the number of
dt-checker errors were considered fixes, but it seems that has
changed, so I'll split that accordingly.


Heiko



