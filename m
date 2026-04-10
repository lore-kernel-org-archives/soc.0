Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4953E351C0B
	for <soc@lists.linux.dev>; Fri, 10 Apr 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814890; cv=none; b=JJMFFO+tD3P7ChqzSPFhzbcwJ+OD4bVfq+P1UWP9/2kOAsiQOKwyIZKNISF1A/Iw4LjlxcfXubphIGNb64DQiMMVMara782vtlMRwWKTf2/tokyOVdIpuvCosVeY7QL59FPvoeVb2taeqUhSX8ASy99NMkV4MWhP0cZYxiBR8/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814890; c=relaxed/simple;
	bh=IPTWF+bSuUauzYxg3Ith85NyjkeTXoDfED2bM+F3eT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqW9YSIqIRYdnO3uYuRpccEy/TmEcb9m9ZrtEEyCFEwHwQOegJgRFE3SPv0S3QwdLq+yb4PHfKbSKmKhoI+cJ0RC1vPuSSDMYoLG9Ty2c2tsVCSRmCcWpZPRXa22/dko4MPV15Lbe29JdUt8vNcwS3ArZcAXjmudKo0KRpzksiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=C4+KnbWO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="C4+KnbWO"
Received: by smtp.kernel.org (Postfix)
	id F0952C2BCAF; Fri, 10 Apr 2026 09:54:49 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D004AC19421;
	Fri, 10 Apr 2026 09:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D004AC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IPTWF+bSuUauzYxg3Ith85NyjkeTXoDfED2bM+F3eT0=; b=C4+KnbWOwwsB2t+ayIHX+1/XfX
	UQsHLnNp57WpjpGYwFzRQ9KNMQfEJCVwizu7Nm685T43rZM8gnY+Wo2tzba8qtMGMXxWf8EiPeT1k
	dGiUi6gPsN5ij9G9VYQ8ayOSnWY6cIMgNRE5NAHufPhecvzMagSR0ypzpqFIRVeR6euPMkudx/vWT
	w8iSCde0LuXcacbEuzU5+uUueYO9GJx/ftOJuuIig+dEzlAYm+4xjj+nsxR1SiES6VpPMyTlpfeLn
	kgg6IWUk+AlKq3bjUbL7DWarkX+eE+sHBNkGUXuzzS9OkX2Ms/ReR0MrmenRhb0A1YczQm+aE7i16
	KIWavJKg==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 mturquette@baylibre.com
Subject: Re: [GIT PULL] Rockchip dts32 changes for 7.1 #2
Date: Fri, 10 Apr 2026 11:54:37 +0200
Message-ID: <1879424.3VsfAaAtOV@phil>
In-Reply-To: <13980380.dW097sEU6C@phil>
References: <13980380.dW097sEU6C@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 3. April 2026, 15:39:31 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Heiko Stuebner:
> Hi soc maintainers,
>=20
> please find below a new ARM32 Rockchip SoC for 7.1 . This goes on top
> of the generic arm32 changes I just sent.
>=20
>=20
> I've split this off from the other ARM32 changes, because this contains
> a shared clock header, shared between the devicetree side and the clock-
> driver side.
>=20
> The clock pull-request is sent [0], but not merged yet - probably after
> easter I guess.
>=20
> And while in the past this has always come together in time for the
> merge-window, I wasn't sure if in the soc multi-maintainer context the
> handling changes. So depending on your preference this could also wait
> until after the clock-subsystem-side got merged.

clock maintainers seem to be on vacation since 2026-03-25, so I'm not
so sure merging the related clock driver will happen in time anymore,
hence this PR should probably be skipped for now.

Ill rebase the SoC changes onto 7.1-rc1 once the clock driver gets
merged.


Heiko


