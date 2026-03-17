Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3562437EFE2
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741770; cv=none; b=qP+wCAZn0XmdQJFKAFDZI16Q61angKUb23Y/o5KZIteewWa+6TZWwhvFEBghYzGuuo4G1PyizmX09h0uuj92TYk+OaFGLw1i2RzjFAEMBLBhw49JqdnX60CYwl9+47xW/zSskFQ0Spd6SrgQgHZzy3O+q78a8NjRvn0eSnUVNas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741770; c=relaxed/simple;
	bh=/yjM0B/21ksLvUSpPQe8vh9+2xhY1H13R+B+5Z9acBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qsTPgxQESU4evkUHVjWMz1nHQSBAqynyAOdKPBnZ+PTs267/ascmyl74z5t+bu/WV1LRqGwCLhLsEtRGyq7Arc4yUnQo6FHP3SfuWjcvWbFXCAXnO5f7nBEccCp9G2MApZq2SPWDQ8RnejOeWpF0cBrS1gaeL6uL3wezPqwFB/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LgP3QfHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LgP3QfHf"
Received: by smtp.kernel.org (Postfix)
	id E2580C2BC9E; Tue, 17 Mar 2026 10:02:49 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3DD0C4CEF7;
	Tue, 17 Mar 2026 10:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3DD0C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kVSAKNPWFaVjAvCtb6poHFlHo32MFz9vQGa3WsfvRMM=; b=LgP3QfHfOOYMNSRMLjnLoFRFAa
	ZCDb16yFn4AYA3tDWxE0CFUeDIiFC4NxMxix+jDDlDzm7goSZaEg7muiykq02mgzgm/4pctchpZ75
	MQ6AOfUMGYpw1H6U8uc1tfbMBWxRehX6wF88fh7EWDORMFBrzFlzQI/L6uGneN8v5nELhdGDPTm2I
	H5XtgeA+5+V5EukXV+sRWIOsH+Ey0+MiC0QYhtL3wrlq2PBNKsECLGszqHmyW/hSDtteNeYMI1QAW
	/M+Lp7uqYobYf6/Rq1/wWqxfcpZ7yU5BPA2djnbJh/+KMCY09AXRR3g+p4ENQIdyaBNT68CbUlWeu
	+/gjaZmw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 7.0 #1
Date: Tue, 17 Mar 2026 11:02:46 +0100
Message-ID: <3682281.iIbC2pHGDl@phil>
In-Reply-To: <aa9d42ad-c480-4fc8-b8be-1a0c505b4293@kernel.org>
References:
 <5055064.GXAFRqVoOG@phil> <10817796.nUPlyArG6x@phil>
 <aa9d42ad-c480-4fc8-b8be-1a0c505b4293@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 17. M=C3=A4rz 2026, 10:19:29 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Krzysztof Kozlowski:
> On 17/03/2026 10:05, Heiko Stuebner wrote:
> > Am Dienstag, 17. M=C3=A4rz 2026, 09:45:30 Mitteleurop=C3=A4ische Normal=
zeit schrieb Krzysztof Kozlowski:
> >> On Sat, Mar 14, 2026 at 07:42:38PM +0100, Heiko Stuebner wrote:
> >>> Hi SoC maintainers,
> >>>
> >>> please find a below some Rockchip fixes for the current 7.0 release-c=
ycle.
> >>> And in the next PR, even one driver-fix this time.
> >>>
> >>> Please pull
> >>>
> >>> Thanks
> >>> Heiko
> >>>
> >>>
> >>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5=
b5f27f:
> >>>
> >>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git tags/v7.0-rockchip-dtsfixes1
> >>>
> >>> for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f863=
4f:
> >>>
> >>>   arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-=
03-12 20:52:53 +0100)
> >>>
> >>> ----------------------------------------------------------------
> >>> A big number of changes fixing dt-schema issues on the ARM32 side,
> >>> fixes for the Gameforce-Ace to make the hardware work properly
> >>> (including thermals) as well as fixing issues both on Beelink A1 (spd=
if)
> >>> and Pinebook Pro (Wifi) by reverting the commits that created the iss=
ues
> >>>
> >>> ----------------------------------------------------------------
> >>> Chris Morgan (2):
> >>>       arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
> >>>       arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace
> >>>
> >>> Fabio Estevam (11):
> >>>       ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
> >>>       ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk30=
36 boards
> >>>       ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
> >>>       ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
> >>>       ARM: dts: rockchip: Remove invalid regulator-property from rk32=
88-veyron
> >>
> >> Not a fix.
> >>
> >>>       ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron
> >>
> >> Not a fix. This is a pure style change. Fixes for current cycle means
> >> either important issues being fixed or errors introduced in current
> >> cycle.
> >>
> >> Changing style from one to another is not a fix.
> >>
> >>>       ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-je=
rry
> >>>       ARM: dts: rockchip: Add missing the touchscreen interrupt on rk=
3288-phycore-rdk
> >>>       ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload
> >>
> >> Not a fix. Style of node name is not a bug, otherwise describe user
> >> visible (not "internal tools" visible) impact.
> >>
> >>>       ARM: dts: rockchip: Fix GMAC description n RK3288 boards
> >>>       ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
> >>
> >> Several other are questionable as well, since they were in DTS for long
> >> time. Please also read Linus' explanation here from some time ago - if
> >> the issue is for long time and no one cared, then changing it is a nor=
mal
> >> development.
> >>
> >> Several changed pieces here look like 3 or more years old, so does not
> >> fit criteria of current cycle fix at all.
> >>
> >> Please split the pull.
> >=20
> > I do remember in the past, changes that reduced the number of
> > dt-checker errors were considered fixes, but it seems that has
> > changed, so I'll split that accordingly.
>=20
> It is subjective and of course dtbs_check fix for issue introduced in
> current cycle is a RC-fix. I am pretty sure that many maintainers would
> pull all above to RC, but I follow a bit stricter interpretation just
> like Linus explained it:
>=20
> https://lore.kernel.org/lkml/CA+55aFyvW38WU93CqegHiKt-ReO8yNfAOUGZRFGY3-A=
q0UsETw@mail.gmail.com/
>=20
> https://lore.kernel.org/all/CAHk-%3DwgFuoHpMk_Z_R3qMXVDgq0N1592%2BbABkyGj=
wwSL4zBtHA@mail.gmail.com/
>=20
> So the issues were there probably for many years and fixes do not have
> user-visible impact, thus they look like regular improvement of poor
> code. Just like I evaluated dtbs_check findings in 2024 - 50% of
> warnings are style.


Thanks for the explanation. As I said, I'll adapt the PR accordingly :-) .

Heiko


