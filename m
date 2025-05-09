Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CBC23F413
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826654; cv=none; b=WclWFol6Xw8E9/1M0woT17oO/ODZ1uMe4AyvqON6LBURHOnapSo+YpwuTd2tlJy5qzW0scsdprC4NkNnDt5c+MUKoafNjmm385bvtG+DJCkZ9dh1Zq+be51BD247WOS3sDjAMyJz2U8N8iTJ4zNVvt/Kz9FOYvJZaar2YQs/yjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826654; c=relaxed/simple;
	bh=AkbUY/iWHKvOCPBBqULFwaNX14TVBncRRGwB/bYvIcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CnO8SB4+gGOh7ditwZ0m/5YZXuJAu25G1AZ2r2mvR+vA2PyD2TWtR54PpkGaIlmYmNx6WWdBUyud/g27m1FNAc9xL0mFhCLzFCoybMrkMKiUN/RfVQw/VKGOXa+aDR2oHoEotL1CjZTbLDYnB18Ef7c30pV6R6f0Lzwj646xGOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HAZ1E+0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HAZ1E+0n"
Received: by smtp.kernel.org (Postfix)
	id 29AADC4CEEF; Fri,  9 May 2025 21:37:34 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 890B7C4CEE4;
	Fri,  9 May 2025 21:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 890B7C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QxQXwJrG1MIxQsKzgyjzbTV53XVCvhmpZmkrCd8dgd8=; b=HAZ1E+0nJ1o48jCxodnUtC2uBj
	pKb1E7NXo7Tigo3/UD6LcWEs3SG+g3KKVWYkQv/0m2jux8iA7dnLRNYa8SjB3A7BTeffTsXNPwA8j
	GHRTtnP4IJtVt1OZlUVz6gfTb1gFswlhDAnASTTqI86JfEVeNb/YMwhB3o3vOcd/7Cn09OM2LHysZ
	XqJL+lQWMwdnPv0pYjpsHZlZIk/mO1ZSYCrqZEh1+5Tput4pNmFIbQJWiSDM5r0fwMD7M5Tq1vKfg
	dVCNDKuHKMeG8D6uXpHOXHJP7iqUsRkcFwdpwc0hW/oJt3yTBiwW8DCm63ftSU9cKct1OJSE7ogkp
	2S86RGfg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDVPN-00063i-Ju; Fri, 09 May 2025 23:37:29 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: arm <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.16 #1
Date: Fri, 09 May 2025 23:37:28 +0200
Message-ID: <2857184.BEx9A2HvPv@diego>
In-Reply-To: <c142bdf4-3910-48bb-ba5e-8accbdb32a00@app.fastmail.com>
References:
 <2307187.iZASKD2KPV@diego>
 <c142bdf4-3910-48bb-ba5e-8accbdb32a00@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Arnd,

Am Freitag, 9. Mai 2025, 23:03:54 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Arnd Bergmann:
> On Thu, May 8, 2025, at 00:04, Heiko Stuebner wrote:
> > Hi soc maintainers,
> >
> > please find below and in a subsequent pull-requests
> > Rockchip changes for for 6.16 .
> >
> > Even some arm32 boards got some love (in the next PR)
>=20
> One small issue stuck out here:
>=20
>=20
> > Yao Zi (2):
> >       arm64: dts: rockchip: Add I2C controllers for RK3528
>=20
> This creates a lot of new aliases in the dtsi file:
>=20
> index 826f9be0be19..2c9780069af9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -24,6 +24,14 @@ aliases {
>                 gpio2 =3D &gpio2;
>                 gpio3 =3D &gpio3;
>                 gpio4 =3D &gpio4;
> +               i2c0 =3D &i2c0;
> +               i2c1 =3D &i2c1;
> +               i2c2 =3D &i2c2;
> +               i2c3 =3D &i2c3;
> +               i2c4 =3D &i2c4;
> +               i2c5 =3D &i2c5;
> +               i2c6 =3D &i2c6;
> +               i2c7 =3D &i2c7;
>                 serial0 =3D &uart0;
>                 serial1 =3D &uart1;
>=20
> but the corresponding nodes are left at disabled. I see
> that the same mistake is present in the uart nodes.
>=20
> Please send a fixup to remove these from the .dtsi file
> here and the similar chips, unless you are sure that every
> board will have them enabled (like e.g. the gpio nodes).
>=20
> The aliases are not meant to refer to soc-internal names,
> but the identifiers on board.

=46or the uarts and i2c (and spi), all the identifiers are always numerical
both in the SoC documentation as well as on the boards and board
schematics.

If you look in a random Rockchip schematic file, the lines for the i2c0
controller will be called i2c0_scl_foo, i2c0_sda_foo, etc.
Similar uart0_tx, uart0_rx, etc.

So while I fully understand that mmc0 -> emmc, mmc1 -> sd-card are very
much board specific, somehow repeating the very same i2c aliases for every
board feels strange. The 7th i2c controller on the soc, will never be
called anything else than i2c7 afterall.


But ok, if you feel strongly about that, I'll move the i2c and uart aliases.


Heiko


