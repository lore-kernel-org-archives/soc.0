Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2251C375AB8
	for <soc@lists.linux.dev>; Tue,  3 Mar 2026 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530915; cv=none; b=Bu64W78dcB60YCliH6+yjCRw7cnE/565Pjg0qA9mPPw/nkKy+TJzC9dX7kg9kQ+TVcZ5R6DEwM8iXMkWGqhrP5PK/T1lWCLqAMc4KyHOqXWHB+3bq6KkxqPNR3UyFjCwpxDs+H8alKQkMRbx3Omwr74j4v1UOQCmWG6AABAsFZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530915; c=relaxed/simple;
	bh=RBO3R16O0sDAGsLWLLL9G0J//Gc7/3lkaAYridPyYBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLftaz18ZLea3Cv2FOwbMzKl5kNHv99QxEFQDxa9YIVeeKfm/1mbKczT50khCi4Go7txAiLspA5QsYJ9GEjKtkizlPWRwj0ohT0F/fAwGNsFJ9bZ46vugLgQu5uSNONbYjSJWT2mItiJA7YSWCR9TWVCPWDuNOdbznX9YlSwasI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C43Bl11F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C43Bl11F"
Received: by smtp.kernel.org (Postfix)
	id E850AC2BCAF; Tue,  3 Mar 2026 09:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B480DC116C6;
	Tue,  3 Mar 2026 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772530914;
	bh=RBO3R16O0sDAGsLWLLL9G0J//Gc7/3lkaAYridPyYBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C43Bl11Fv1b2oDw9+Am9xI7rkvTPmRbLKcTPeNJ9A0M5b24nahBp/rBy8WyZA9X1Q
	 tPRDlX7ExdkD+CSwgmv15TOy1Xo76IWXqokc91CRUoDEoBuk9CEGBBCD/n/eyXKPjC
	 TrS4tYYKLMj0od/ZkolSjos+a3d1hAlOexoupCnH+VqDHtvTBLQUIBIezH01Qay/Yd
	 dz2Fr6TJ9/VEUT81sDYfUzabH485KwBKH/1XkvatQVJClZijFqe+rZPE+jsRp4OTsh
	 iVZfxqa30CMn64Kno5+nZ48g5PqPajyXRTtJW8QNRqfHebkbF4NO60JIbGqR9pxO+V
	 SKyQJJXCVzvgQ==
Date: Tue, 3 Mar 2026 09:41:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org, jonathan.cameron@huawei.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.0-rc1
Message-ID: <20260303-crazy-shrink-ef2c085c99c4@spud>
References: <20260213-stole-economist-d5b0ac711d42@spud>
 <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WGuT6KOIaKQwVd6I"
Content-Disposition: inline
In-Reply-To: <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>


--WGuT6KOIaKQwVd6I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 09:15:14AM +0100, Linus Walleij wrote:
> Hi Conor,
>=20
> On Fri, Feb 13, 2026 at 1:20=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > Conor Dooley (1):
> >       riscv: dts: microchip: add can resets to mpfs
> >
> > Felix Gu (2):
> >       cache: starfive: fix device node leak in starlink_cache_init()
> >       cache: ax45mp: Fix device node reference leak in ax45mp_cache_ini=
t()
> >
> > Zilin Guan (1):
> >       soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_prob=
e()
>=20
> You have DTS fixes mixed up with cache/SoC fixes, this is
> a bit unorthodox, is there some hard dependency or can you send
> the DTS fix separately?

There's no dependency of course, I'll split it out.
Ordinarily I would always split them, but I'd swear I was told at one
point that since fixes were on one branch in the soc tree that it was
okay for me to do the same. In this case I did it on one branch to be
less work to get onto a potential fixes PR that went out before -rc1.

>=20
> I guess we could also split it off manually ... I'm just a bit insecure
> with that.
>=20
> Yours,
> Linus Walleij

--WGuT6KOIaKQwVd6I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaasyAAKCRB4tDGHoIJi
0rKhAQDsHwQDCU1cb9YoTXmjbsk/nlwiWAA9XdCAYXBWmaWzZwEA51dZkTd6WlVD
8SX3PkhsEhUTNejz2QU5fbOBNq83lA8=
=ypO9
-----END PGP SIGNATURE-----

--WGuT6KOIaKQwVd6I--
