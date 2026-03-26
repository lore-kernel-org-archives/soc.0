Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AD8401A00
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538064; cv=none; b=GtQ2uSBAk2fULC1YemwxF1LWrc3EQS5YqFxpuUdICD2gSd7FuCQr0fcK6qUh8oKN6Ge9HiKeK7xshD6Z5KBtp6/yYnsV49iQlU93Brh+9W4//xLN8eQt22G2s07D6aWZLpm+6JJCbkwIU+1dPvoEDMXsu35vRqrbjNvbDNnRDUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538064; c=relaxed/simple;
	bh=/daLNNTM9rUQSXmOuBpE7wReCd2Is1Xew+v0E+BbvTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiHcuElqDG3CyIwN9NfYnxnuybssoRvSX4/Ohyld9FRiGSTrsesiBKSaWc4EjHNkDbyntGtITquxSwPDHpaAi2ys3NUzdP52MrlrP3sQ0fEbXuMI809RrXQiVpm0wF5IuYSBykBQwIw3RouadsCtin6NzfvDNacS3rWLB6ZsyW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N37fVz9l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N37fVz9l"
Received: by smtp.kernel.org (Postfix)
	id 04A33C2BCB1; Thu, 26 Mar 2026 15:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BFFC116C6;
	Thu, 26 Mar 2026 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774538063;
	bh=/daLNNTM9rUQSXmOuBpE7wReCd2Is1Xew+v0E+BbvTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N37fVz9lfqf+el9FSzYEtuxokAZqBeI8JnN/j95Id20/edYvP0GMI3g6we4xeWh2k
	 xNMvSEuX1qtqZ6iqqQ0+1tqwKfoD8Qr47XUapNk+pwDA1iSblIWlyjqdqOQ+rSQVD+
	 vyUcHC7c9aPitFDjjGdFwSU7VJaEJcHTlNx8w2FUdqMAdds5+ARVQIV7oZ5MDK9gid
	 HrxsaAzR8Ob+KQdSYBCo9k6a9cL1Bv56z11+DevL3zM/i1eeOtdaZrroEi9sZAi2Qs
	 zaePllFsCVxYYIAbCNfkuO6zttY3UGqNrrTTqZdP080bk2CI8GUN7vx4l372GIPNbt
	 iaTJ/iVWwwVIQ==
Date: Thu, 26 Mar 2026 15:14:20 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ilya Sorochan <k0tran@altlinux.org>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
Message-ID: <20260326-viscous-rigor-4beb18f77eec@spud>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e3xkzywg7hTqOnSS"
Content-Disposition: inline
In-Reply-To: <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>


--e3xkzywg7hTqOnSS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
> On 3/26/26 04:13, Conor Dooley wrote:
> > Hey folks,
> >=20
> > Please pull a small fixes PR.
> >=20
> > Cheers,
> > Conor.
> >=20
> > The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81=
304a:
> >=20
> >   cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() =
(2026-02-06 19:54:40 +0000)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags=
/riscv-dt-fixes-for-v7.0-rc6
> >=20
> > for you to fetch changes up to 305f2865bd034146b2eebc77c27fc50d8d79778d:
> >=20
> >   riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card=
=2E (2026-03-19 16:00:13 +0000)
> >=20
> > ----------------------------------------------------------------
> > RISC-V devicetrees fixes for v7.0-rc6
> >=20
> > Starfive:
> > Two fixes for the SD cards on the Mars CM Lite.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > ----------------------------------------------------------------
> > Heinrich Schuchardt (1):
> >       riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
> >=20
> > Ilya Sorochan (1):
> >       riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-=
card.
> >=20
> >  arch/riscv/boot/dts/starfive/jh7110-common.dtsi           | 1 +
> >  arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-

> To be clear the "riscv: dts: starfive: jh7110-common: fix jh7110 SoC
> boot from SD-card." commit does not affect Linux whatsoever, there is no
> problem to boot Linux from SD Card impacted by having or not having this
> commit. This also is not common, so should not be in jh7110-common, as
> more JH-7110 SoC products by-the-numbers have transistor logic replacing
> this signal selection to the StarFive loader in BootROM and so
> precluding this from functioning.

All the patch does is tell bootloaders what stage of the boot they
should should pay attention to the node, and the link was to a big
mechanical deletion, with a reasonable comment from someone that
has a track record.

> This ignores the wider discussion about StarFive both deprecating this
> capability (for Secondary Program Loader i.e. U-Boot SPL) of StarFive
> Loader in JH-7110 BootROM loading from SD Card being deprecated
> officially in the latest StarFive JH-7110 Technical Reference Manual and
> StarFive JH-7110 Boot User Guide documentation, and the ongoing GPL
> non-compliance by StarFive for use of GPL 2.0+ code in the JH-7110
> BootROM; the latter being important if we want to accurately attempt to
> support this deprecated feature set as a community (even when ignoring
> for the moment this copyright license non-compliance).

I'm sorry, but I have only a passing familiarity with your work there
(as in, I have seen you talk about it on IRC and paid no attention), and
there's no way I would have associated it with this change.
I definitely was not ignoring a wider conversation by merging this
patch, I was not aware this was controversial at all!

> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
> BootROM, and openly invite anyone that would like to help get this
> effort to 100% is welcome to so that we may publish and refer to this
> for technical competence. I do not object to the community supporting
> this deprecated capability if there is any real documentation not based
> on rumors and memes; but no one has offered to do take a moment to do
> this most basic of fact finding. Evidently the StarFive maintainer(s)
> have refused to support this, GPL non-compliance persists and only a
> rough description from Hal has been written to the U-Boot developer mail
> list that does not match my analysis, all while complaining about the
> capability not being supported going forward.
>=20
> I object to this PR it is NAK from me on the basis of stuffing this in
> sideways without technical justification or review. Also I do object to

The technical justification seemed to me to be multiple people saying "we
need this added so that u-boot can use the sd-card". The patch has been
on the list for over three weeks at this point, so there was definitely
opportunity to comment on it. I don't think I have been unreasonable
here. If current U-Boot needs it, then I'd still like to have it merged.
If you work pulls through and this becomes no-longer required, then I'd
be happy to take it back out again.

> "riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
> wrong way around, it does not describe the hardware; if some external
> carrier boards cannot deal with the capability of the Mars CM
> system-on-module having card detect line then that should be dealt with
> as a dtbo per-carrier board and not be replaced in the dts by a
> broken-cd, although at least we had this discussion and Conor made a
> decision with all the facts and discussion available.
>=20
> -E

--e3xkzywg7hTqOnSS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacVNSAAKCRB4tDGHoIJi
0lV1AP0VoInrrSs7IDlZ2URE+hXiiDdC+iF335w2ry8qppHjOwEA6r5Xu+mGF5FS
6dT3nErU7s6KRrx4QupmsOoa7AR+jQQ=
=2/Nl
-----END PGP SIGNATURE-----

--e3xkzywg7hTqOnSS--
