Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC821147C
	for <soc@lists.linux.dev>; Mon,  7 Apr 2025 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044571; cv=none; b=C3VKYcX7jRQc/KKL2PkMNb6LAp7LUpSkXb6ou2sz5niFGbVDllfOJ1brwqnPMpx3il1iNFsWaB6ByM4juF53sAQHRC6zOHwVRfKcDrSTgjGHh/ENkXWJUU2G/mxIsrai/gTAcELQmyYGlv882qx0/0H7rYdl6Vv3R2nsCE7QXCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044571; c=relaxed/simple;
	bh=EcpHIHdpCMLJF4s/VJZo/G6a9nsNam8x34XSwJ2u6Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzbCvsdU4bI42UKLZIu4Sp5f0zcVP2751hZuN4eU+xbzn2DXK3SiEZRhjwUIt+yxNIVigXuYn068EEOoHs9O6POI2pUrJThK0RkVEwo80DRmE6OANPmoTSpHvDR1u96aUlyaU1LL4arpESG09HhDWjP03IBAL5mxof8Wa9eshKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AIOr9KeO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AIOr9KeO"
Received: by smtp.kernel.org (Postfix)
	id C6B0AC4CEDD; Mon,  7 Apr 2025 16:49:31 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75B88C4CEE9;
	Mon,  7 Apr 2025 16:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75B88C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EcpHIHdpCMLJF4s/VJZo/G6a9nsNam8x34XSwJ2u6Pg=; b=AIOr9KeOCXW3cDn3zHEBy8fKnn
	ayCLSm0pqP94IK2Qj0y6Td2zAucfuTKPpOipaO1sbrXyDxJv/XgPRrx3y74yn0qoC5fQEyMpbAaWg
	m4TUkWdviNIHqw5T04qfz8gGuOO6afiGkGiHk5+cTKWdAHXleNJXMuODJtbXy3UMJ2QCiWOtQWeRq
	3dYbcvBdcifWh1m9+Tn8IwTRX6L8Vsx6ReO4HNksS/oNHk/tVoaVkPmE1f/UG/C7MRmQSkvTEJmyn
	FZMickVV4wb45j7XJ6u4rZ+CneyK9EU3jkb+diMe3erRXkg5ciZd0v5jCHR0fjBj8XChFUeo7x8Gn
	1+vMBrGw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1pf6-0006eA-5t; Mon, 07 Apr 2025 18:49:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
Date: Mon, 07 Apr 2025 18:49:27 +0200
Message-ID: <2000188.PYKUYFuaPT@diego>
In-Reply-To:
 <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com>
References:
 <5552256.Sb9uPGUboI@phil> <8512245.T7Z3S40VBb@diego>
 <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 7. April 2025, 18:43:54 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring:
> On Mon, Apr 7, 2025 at 11:40=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> >
> > Hi Rob,
> >
> > Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Rob Herring:
> > > On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.=
de> wrote:
> > > >
> > > > Hi soc maintainers,
> > > >
> > > > I made an error and accidentially applied a patch that was meant for
> > > > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > > > commit appeared in linux-next.
> > >
> > > Both commits are in v6.15-rc1 now and the revert is not, so this
> > > should not get applied/pulled. Or you will need to revert the revert.
> >
> > yes, that was the intention.
> >
> > Back when I submitted this PR, I talked with Arnd on IRC the next day.
> >
> > As both commits are identical sans some Signed-off-by lines, he suggest=
ed
> > not trying to put a revert in, but instead let git solve it itself, bec=
ause
> >
> > arnd on IRC:
> > > [...], but I worry that this would make things worse if 'git merge'
> > > ends up doing the revert on top of the original commit once it gets to
> > > torvalds. Not sure if that's still a problem in git these days, but
> > > I've seen it happen in the past.
> > > if two identical patches are in different branches, just leaving them
> > > there is usually easier
> >
> > So this PR was already marked as "superseeded" in patchwork back
> > on march 20th.
> >
> >
> > Nevertheless, thanks for making sure no funky revert happens now.
>=20
> The commit is still in linux-next though. That's how I happened upon this.

Ah right. I've recreated my next branch earlier today, after the -rc1
release, so this should be gone with the next linux-next.

Heiko


