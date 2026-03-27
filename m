Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD323DA7F2
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604714; cv=none; b=sBgj4bXaI+rE/3DXx2jeq0n4UQgZGVQ93NleOqpS0O313DiJXEPQcOOqe80CWtErSeE8+ykZKA0gvR1wC1upUvh91LDLM8xJNoLo4XMPz2keh/Tg1/v21AtEftjXrudZnDQ6u6lj0drI6OsvOkmnxQFT1GX/8OWhrm/avFtkDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604714; c=relaxed/simple;
	bh=bSFcA1xaFxUDcmqgYDyvVstsL1ofyhDCy8ifaE4w2d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLPZfp6b4PQgaBbRD5TnqvgtVE/jydOMrnJVD/Hw0SO0/m4DW0mzLXe5Ty8ZgMmHciLRDHHtDCrcN+RslOWMAZrsnVFlfWYmxOAXOjGWQ7srec9z6RW4tG0pcXTQ+J89gMt5Uos3foct3Fkt7j2j+yDQ5jznjNK1nsok1xQqQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGBpav1H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGBpav1H"
Received: by smtp.kernel.org (Postfix)
	id C6685C19424; Fri, 27 Mar 2026 09:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6A7C19423;
	Fri, 27 Mar 2026 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774604713;
	bh=bSFcA1xaFxUDcmqgYDyvVstsL1ofyhDCy8ifaE4w2d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGBpav1HJZ9DCPV3EvdYAIfqRgOIPHHmCTN20l9o7LjoiKF+t7rlyL58Dgl+uYfy/
	 uJ2hmpP1wdZ5NQ8Pw8QHEMOifzX/bFAczBEBA6sDSmuXDMcm2IIZFUPFa37Rf5dVqc
	 G0nlV87/p2LNXTSHACMZpX1HizW6n+17wYexcWSSKR7hh2SP8ambiMB2TYBFxo7r7u
	 Z5+K+T8yr4XDtjAgXYBg5rNlgo1tnimUTErret+sEXCL0VDF2dP+FpnRI8KcZg21W0
	 47iKC3Ho/Gl6xfjjK6xMOSgTyuj5trOa9YJpY5XJJ00IoieX/pBrmAUCIsFB2Xr+c4
	 ixsqS8m9HEXhQ==
Date: Fri, 27 Mar 2026 09:45:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, soc@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Ilya Sorochan <k0tran@altlinux.org>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
Message-ID: <20260327-tapestry-frightful-de17113da7d3@spud>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <d7eb716d-9b9c-4474-a9ca-d44e96c46fc8@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zKp8myknkVHehXUQ"
Content-Disposition: inline
In-Reply-To: <d7eb716d-9b9c-4474-a9ca-d44e96c46fc8@kernel.org>


--zKp8myknkVHehXUQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 09:19:37AM +0100, Krzysztof Kozlowski wrote:
> On 26/03/2026 16:44, Heinrich Schuchardt wrote:
> >>
> >>> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
> >>> BootROM, and openly invite anyone that would like to help get this
> >>> effort to 100% is welcome to so that we may publish and refer to this
> >>> for technical competence. I do not object to the community supporting
> >>> this deprecated capability if there is any real documentation not bas=
ed
> >>> on rumors and memes; but no one has offered to do take a moment to do
> >>> this most basic of fact finding. Evidently the StarFive maintainer(s)
> >>> have refused to support this, GPL non-compliance persists and only a
> >>> rough description from Hal has been written to the U-Boot developer m=
ail
> >>> list that does not match my analysis, all while complaining about the
> >>> capability not being supported going forward.
> >>>
> >>> I object to this PR it is NAK from me on the basis of stuffing this in
> >>> sideways without technical justification or review. Also I do object =
to
> >=20
> > Concerning technical justification it is clear:
> >=20
> > Distro images have been supplied with U-Boot on SD-card for years and=
=20
> > the recent work in Linux and U-Boot broke booting them. This needs to b=
e=20
> > fixed.
> >=20
> >>
> >> The technical justification seemed to me to be multiple people saying =
"we
> >> need this added so that u-boot can use the sd-card". The patch has been
> >> on the list for over three weeks at this point, so there was definitely
> >> opportunity to comment on it. I don't think I have been unreasonable
> >> here. If current U-Boot needs it, then I'd still like to have it merge=
d.
> >> If you work pulls through and this becomes no-longer required, then I'd
> >> be happy to take it back out again.
> >>




> >>> "riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
> >>> wrong way around, it does not describe the hardware; if some external
> >>> carrier boards cannot deal with the capability of the Mars CM
> >>> system-on-module having card detect line then that should be dealt wi=
th
> >>> as a dtbo per-carrier board and not be replaced in the dts by a
> >>> broken-cd, although at least we had this discussion and Conor made a
> >>> decision with all the facts and discussion available.
> >>>
> >=20
> > As my patch points out the CD line is broken because it does not confor=
m=20
> > to the standard established by Raspberry.
>=20
> Initial E Shattow answer is not placed under specific commit, so I can
> only guess that it is about "riscv: dts: starfive: Milk-V Mars CM Lite
> broken-cd".

This part is about about that patch, everything else in this chain is
about "riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from
SD-card" that adds a bootph to a shared dtsi.

> The commit touches only DTS, not DTSO, so how can you claim that a DTS
> file change breaks some completely other board (Raspberry)?
>=20
> This DTS file is nowhere included (and should not be).
>=20
> Of course maybe the true question would be why anyone described a hat as
> DTS file...
>=20
> >=20
> > E. we know that by chance you have found a base board that ignores the=
=20
> > standard.
> >=20
> > Your patch 4cce8b2503ab5 made my standard compliant baseboard unusable.=
=20
>=20
> DTS of some board is a final product, so it cannot be applied to a
> baseboard, that's pretty messed DTS tree...

The cm-lite is a rpi compute module compatible device, the base boards
don't have any devices on them in a lot of cases and just provide
physical connectors, so there's no point having a distinct dts for every
baseboard of that type.
https://www.waveshare.com/product/cm4-io-base-a.htm

>=20
> > My patch in the pull request does not stop your board from booting but=
=20
> > re-enables mine.
> >=20
> > Best regards
> >=20
> > Heinrich
>=20
>=20
> Best regards,
> Krzysztof

--zKp8myknkVHehXUQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacZRpQAKCRB4tDGHoIJi
0vozAQCo9tQ//iCvrSScFC3DG5a+aZKVcy8BrKwyJSv0sAWMNAD/SBtHe6dbgU99
POVtL4iNjjxQQ0L6nNYnp5QcRDmv7A8=
=Dyc4
-----END PGP SIGNATURE-----

--zKp8myknkVHehXUQ--
