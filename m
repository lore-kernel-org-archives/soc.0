Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD038E5EE
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084422; cv=none; b=ejZR6dI5sIyFmXTiy3OnGepQNK3JEHwNlsLXvj223ijgVrIW8TMZZttIairVHjrALh70Kl8C072oozCXNjcdoLelmyhokOeo8LjfuNDA7M6xHOmGnY4Lfab4X7SQCDJWPzCLLG/f/OhkKoSU9/C+Vl8YCwWzu9MONi2g8o+LwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084422; c=relaxed/simple;
	bh=7zP5KoNIlilnzRQ0nDLi8KeFSGOQAqvQNCbb5Kh3OjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2icxutrPNXidseymIZ0qgTjHuZdlzCU7yycyTsgIWme3uSw9LQCgsw8Enoi107Xceg4ykufDO1ZhJKNr0NO3ynI7ihKjkeUjo6qmCwsN7kCMYKD9Khb8m7R7fLJnMgkhZcOafR3nsuVeZWTbBlrv4EeDSfWK6N3CcLIumIM65k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGlwC0s6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGlwC0s6"
Received: by smtp.kernel.org (Postfix)
	id E5A03C116D0; Thu, 22 Jan 2026 12:20:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 022BFC116C6
	for <soc@kernel.org>; Thu, 22 Jan 2026 12:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 022BFC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso618713f8f.2
        for <soc@kernel.org>; Thu, 22 Jan 2026 04:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769084417; x=1769689217; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnONHadiHlGxqKbve/p4kfBxT1gNFOR6bKW+t+kxRsI=;
        b=BGlwC0s6vZAnPF/gC3BdDO8qdS345+/5Fa+p7DMMZDOrBgTGQauKcitCi0gqVC836H
         pYdOf5q9JizH9QJfYcka6C83ekHGAEIMK3doqx5SNbjOSLa4Qvcdk8Vla3P1LsSc5HOl
         f2iH8BinIim2kB2Ba7EaW7fUFT6PpvTE3VN2kqCvmO58g0A70qAjUGMZZrfDUy/fuyl5
         oP4/8Vwdrhih/SoJPIx0SYtrVzc5j5kUH63T4Ni21BQ+umJZNPmNuyeFGGUYcmJUwKxz
         Ya8Yl4IxJ4/DPXPDSVyHGeBl1NdA8iqBWFA1nkpqGZ9J8HnKyTt7zUzwis+IAUAV/OEh
         P42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084417; x=1769689217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnONHadiHlGxqKbve/p4kfBxT1gNFOR6bKW+t+kxRsI=;
        b=UD8HXqtjIY0F/IVrzRVn0oQTzNCjlvuXItq/wqkkAhgiMya89YkoK2YnPHNSTZS4BT
         7zE/vm0FWABMCohlOsnLbPDA6KKwSS1kanmBODJW3V/qjrU/2K4QQuSXcx9zcyL804Om
         qXKWOHMf2mVCNeWkDQPnyb9YPHegRRhuWGSINs3UjUJf5Re4jLgeH4eRDw+QELzmqesA
         N6qZYcBVxjxCViv0T1OlvCzsii8mO9N3/aFEqkbowvAS1ZQU2a8nFaeii5pwe9JRDwW3
         e9ES0hxFv3iqfqGGGIp3q2cSkiFCuOh1b5eC0+9yJ9O2q0CuIj9unLL1etmrOubJmdKN
         zZyA==
X-Forwarded-Encrypted: i=1; AJvYcCX/O8MSXzRhWqMqB0rLmMDQfnkyBTAlJ8pNvNqugu9zUshPdWbNWW0o+ic/TZonQyw3eds=@kernel.org
X-Gm-Message-State: AOJu0YydkI+/TO0a7UlktE/1F3PvP2+lds0ztT/rnsz3OZL9a4bUWZmL
	j0ZmZeZcEgvxdUwXYD7Q+oG5BOSsv96tNjGBqq0PA+KW86jzXOpv4EPK
X-Gm-Gg: AZuq6aKnKplYhfiRa0QFoOmD82b4Aux0WaLOW67bygvkFzH4scTOLanUQ9I1pQQlaUZ
	30HWwUofDRXe/dncJBDK6KjC+9n35L95J8YnKvDtmpmwT91A1G41tBaW7jWKSAB4qXomF5qgLsJ
	Zj2j0ghVG9R+CbryCp7BiGsLqxhD7IMMw7ElRX4rDV3kQug4094Dql7pr4j1LGKZ37UkB5FVbLf
	2BpJN/w6CL9am7i6qZIgLHNpjx1sYprVr4yTF+UHMtAZ0EjvMvqVarTu3tv738cWFzj1m/oo7gB
	kJGoBJ4KT84m5hjxdOu6FzphVw28YSBfkrUr1GMeXVxaz3Xy/nWorqi1QpLjQo2CD3Rf0ev/rLB
	0dUICqLOAsplTL9hxdM/S/PwGh5SOIk4dBG7ZqmV7wwHwqn/6+mhxgvaUxUt93giyC08Pc7CH0x
	q/6FBNoHccBjJf38X7122YI9SCk3jOEeHKrSjTx+Ij0vq7R2+dczIwqGKri4lPon18eGwsvp1R+
	g==
X-Received: by 2002:a05:6000:402a:b0:435:8d80:1b81 with SMTP id ffacd0b85a97d-4358ff4487emr14838984f8f.21.1769084416943;
        Thu, 22 Jan 2026 04:20:16 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435ab458d85sm4603429f8f.26.2026.01.22.04.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:20:15 -0800 (PST)
Date: Thu, 22 Jan 2026 13:20:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, arm@kernel.org, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXIVmW_mjb0AdDwe@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <20260122-hidden-goat-of-excellence-a43b9f@quoll>
 <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfu6iycbl7nspgf5"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>


--wfu6iycbl7nspgf5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 12:02:04PM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
>=20
> On Thu, 22 Jan 2026 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> > > The following changes since commit 8f0b4cce4481fb22653697cced8d0d0402=
7cb1e8:
> > >
> > >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/=
tegra-for-6.20-dt-bindings
> > >
> > > for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c6=
27:
> > >
> > >   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 0=
1:58:18 +0100)
> > >
> > > Thanks,
> > > Thierry
> > >
> > > ----------------------------------------------------------------
> > > dt-bindings: Changes for v6.20-rc1
> > >
> > > This series updates various DT bindings for Tegra architecture,
> > > primarily focusing on schema validation fixes and new feature
> > > documentation for Tegra234 and Tegra264 SoCs. Key changes include
> > > correcting realtek,rt5640 audio codec bindings (adding missing ports,
> > > clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> > > YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> > > (introducing CMDQV and DBB clock support). Additionally, it resolves
> > > legacy warnings for Tegra30/132 display and VI interfaces.
> >
> > Same comment as was for Geert, I am surprised to see DT bindings as
> > separate pull and I see drivers were alerady merged, so I will defer
> > entire Tegra pull to Arnd.
>=20
> The soc tree used to have a separate branch for dt-bindings.
> Hence several soc submaintainers still use that split for their PRs.

Yeah. I usually also only put things in the PR for ARM SoC that have no
related driver changes (fixups, conversions, ...) and therefore nobody
else feels responsible for picking up.

Thierry

--wfu6iycbl7nspgf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlyFf0ACgkQ3SOs138+
s6Gh5A/5AfOWWZlWQRR6QIPJvWj+TJAELr21m/e0TryGwrAkQJfn8/JzMy7CUVDM
D17V/AYBsq+jqwHbo1jqn8pnHL7ivzFYRBS4j31U93plbm0FowXbS4smlMWAPCbS
jW+PJ5pjoQ3LxSN8LgAAJJxvX8xuMy07prqt+Aj45ZDlVXJ3Ie7FoxwkzsMaK5AJ
6iHcVTYZFVr/kOUbwv9JzxuuRSgV8kFKrZfWyXpNJJN0EYbB3WJd3zz9cJ1jWgOg
JI4O4OvPHZavoRaRIGw6nqQhhIFGiO8HHn9rXppwtYbQ3pZBQkOt5uZBt+e8xfTB
H6Ix2BAdtziymhzCCQNhrUC1V+iBgtZDK2lMKGc5p+fxtNewrT3ilC8zfkyZU4jY
j1hxGXOCTcjYCwtBjxUhE8KlUxRhAYIXcGF9u40BWteZc1r1Ze2ZFAqwYNL0DxU6
cy65ffKqyb9CvUTU406+zydeSJoal7xQ1y9Kd2wn7oGUh8oCGJeLniD24mgKqjuk
XKLNPipq8aqDQ+6dVxI5uiV423FCxphIzx0hNlDt5+CS8feulUYgLVazJYJ3foeB
ezwk0RPmgbh3PTqL32oCGMvvjkK9gtjdjvt9LW4TkePpO62tN7rm3dkI6EofbyZK
7bHIrJGPrUA3QtUrWsU/SoqnM33HOhjDM62NU6BA3EJb6AWZr04=
=8zEd
-----END PGP SIGNATURE-----

--wfu6iycbl7nspgf5--
