Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C181D8DF6
	for <soc@lists.linux.dev>; Tue,  8 Apr 2025 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121972; cv=none; b=LCxiH+sso2JabNgB5DBbXqOjXiuB6A4x5n3OyNNzGGRYSXPrYt1Zj4LfE+Yf+fnJxVuWGKtYrWqT/LvgKPzaorSssJsA/mL0VfSfCocNrNmKKGXYGLxcpfwriFz7C0r23fZ+NfBfy+o/4B94LbM/Ud1ztUGf2tU8c8o+bsHRwoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121972; c=relaxed/simple;
	bh=YOxUvMH6Zjumv6uHhZAYRdSZLUXfa/+e73bmK4g3BQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MozI9xLFAZSWUZVqTqE6SabRtTXiZxysiy8XDSYVx/IToiGbBhZQ/RWoWWaB92FUSaeQap2D9sn/oXL9zBTB+TXSF48HMUPwf+aclZpHvffK3MkmRkIpdnELtMxosDPQ/W5gj2z2D9ja6NO3OpUNdeiP3zqcW0GaKCWK0QbO1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ePGC82kz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ePGC82kz"
Received: by smtp.kernel.org (Postfix)
	id BBF52C4CEE7; Tue,  8 Apr 2025 14:19:31 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC5A4C4CEEA;
	Tue,  8 Apr 2025 14:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC5A4C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YOxUvMH6Zjumv6uHhZAYRdSZLUXfa/+e73bmK4g3BQ8=; b=ePGC82kzJBY/yq1PD5kMYbXCXg
	pvjT/0wBdmPg69EVUa5+WAk+HJaPIMT17bcZxqeuKBXgEgs09ZW7ZKoVOIHy1Bsb1dJ+csPHrfY8Y
	IFTp0IMWG7r0E+9wv0Bu8Cr3K3KrASy5tAirBVK5wIA8o+3Oly8KXH3i8nZ+kGJsSAXkppFZ9MR8Y
	z88RLyu8ZYI/BaFMoEId/t5P5xdK68B/vs6S/eTi0VafM5Ydv91RicAz0/3UhkEi2IpwfKrLY7s1R
	Bo4VedZS7BO5+goFyYngm8hIPI9ms3vIfZsE1ZIQS6ZbyG0Z4TdMngAzVkLdVzBSYBuYWvm1SotIK
	ZC4LHAcA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u29nT-0004Js-C2; Tue, 08 Apr 2025 16:19:27 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
Date: Tue, 08 Apr 2025 16:19:26 +0200
Message-ID: <2021039.usQuhbGJ8B@diego>
In-Reply-To:
 <CAL_Jsq+EwYZYYePusUZbOh+n6-MVt2AFGEiPg8AzHR73K-9-BQ@mail.gmail.com>
References:
 <5552256.Sb9uPGUboI@phil> <2000188.PYKUYFuaPT@diego>
 <CAL_Jsq+EwYZYYePusUZbOh+n6-MVt2AFGEiPg8AzHR73K-9-BQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 8. April 2025, 16:01:21 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rob Herring:
> On Mon, Apr 7, 2025 at 11:49=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> >
> > Am Montag, 7. April 2025, 18:43:54 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Rob Herring:
> > > On Mon, Apr 7, 2025 at 11:40=E2=80=AFAM Heiko St=C3=BCbner <heiko@snt=
ech.de> wrote:
> > > >
> > > > Hi Rob,
> > > >
> > > > Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Rob Herring:
> > > > > On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@snt=
ech.de> wrote:
> > > > > >
> > > > > > Hi soc maintainers,
> > > > > >
> > > > > > I made an error and accidentially applied a patch that was mean=
t for
> > > > > > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > > > > > commit appeared in linux-next.
> > > > >
> > > > > Both commits are in v6.15-rc1 now and the revert is not, so this
> > > > > should not get applied/pulled. Or you will need to revert the rev=
ert.
> > > >
> > > > yes, that was the intention.
> > > >
> > > > Back when I submitted this PR, I talked with Arnd on IRC the next d=
ay.
> > > >
> > > > As both commits are identical sans some Signed-off-by lines, he sug=
gested
> > > > not trying to put a revert in, but instead let git solve it itself,=
 because
> > > >
> > > > arnd on IRC:
> > > > > [...], but I worry that this would make things worse if 'git merg=
e'
> > > > > ends up doing the revert on top of the original commit once it ge=
ts to
> > > > > torvalds. Not sure if that's still a problem in git these days, b=
ut
> > > > > I've seen it happen in the past.
> > > > > if two identical patches are in different branches, just leaving =
them
> > > > > there is usually easier
> > > >
> > > > So this PR was already marked as "superseeded" in patchwork back
> > > > on march 20th.
> > > >
> > > >
> > > > Nevertheless, thanks for making sure no funky revert happens now.
> > >
> > > The commit is still in linux-next though. That's how I happened upon =
this.
> >
> > Ah right. I've recreated my next branch earlier today, after the -rc1
> > release, so this should be gone with the next linux-next.
>=20
> Still there today and now we have:

Not much luck for me this week it seems.

So I've now re-created the for-next branch again, especially without the
stuff from below. I guess the Revert slipped in again via that miss-merged
branch.

Looking at the rec-created
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/lo=
g/Documentation/devicetree?h=3Dfor-next

that revert should be finally gone now and not reappear.


> ['tsd,px30-cobra-ltk050h3146w', 'rockchip,px30-cobra', 'rockchip,px30']
> ['tsd,px30-cobra-ltk050h3146w-a2', 'rockchip,px30-cobra', 'rockchip,px30']
> ['tsd,px30-cobra-ltk500hd1829', 'tsd,px30-cobra', 'rockchip,px30']
>=20
> Which appear on no list.

And I've also fixed my scripts to not miss-merge branches not actually
intended for next.

Heiko


