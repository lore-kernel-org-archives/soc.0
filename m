Return-Path: <SRS0=4CuT=4O=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF181C4332F
	for <soc@archiver.kernel.org>; Fri, 16 Dec 2022 13:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9AF1CC433D2; Fri, 16 Dec 2022 13:20:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B542DC433EF;
	Fri, 16 Dec 2022 13:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B542DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso1786808wmb.0;
        Fri, 16 Dec 2022 05:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVkJauk19hoE6f3kxeOjvaH1U7eIS3w4LTh0tk+l6YI=;
        b=PUNPY06DZ5RUnX+JRgGiNnOXOovHSAA+nil1/3hZlXM+yy273Bw3n0BC8Rh7HUpN8k
         NFrC5v9eUwzsAnPW6lgbRV3BvsFRNLGC8lgPHxWS8yNeuGiIisfvvg7MBE9hmfWZHmDH
         7zWNExs5ZuI7EtJORjxKVTHS7W6Kma7YryTqBN8VWmqXGUvYh/sqB5QPc+s8Xmjfpbsn
         I/ICf9a8jt6DTin/MapZ15Pk3p0XuEEBgwDwk6zrF3078Q8uWVNH7f8qfCsh9Mw1+Dof
         Bblb4x/J0pBpTj1pFwQOGxAIvqaorfzAnrpQRFqCkg+SNakUEgv70Kz4UQoi9PYW1NBw
         wV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVkJauk19hoE6f3kxeOjvaH1U7eIS3w4LTh0tk+l6YI=;
        b=KXvh8eUmjcH1rl5d4z1DcF+MQeIwJtwVRvCQxsUc47A7bOGeH7+JxV6AbsGW54At3h
         9/UlKsK9Ewm8umzJKDT8JQjD4+0XYUbQSWwitdhLolIQeKbZi1gL45Lh6bCOP0wojmBP
         zu4JbR7p2NBJVdxLnecKtm+wLMjICjdq65jFbFY53IHwNEoo3rXRPHQPLTV/XYObHQgS
         v4iNR3EOO4ArZDcmtKidpktTtUytDJEus9FPQSF3a/GBnfh/5PSuzPZZ70oGviEpfmVp
         WM9IIuEz0qZeeScmYjuDdCKGTsq74nIA6OkWBxMBZLl/iV62IC7g971LF0Xp/QT4zOQZ
         Xc6A==
X-Gm-Message-State: ANoB5pkhZOcOWKOdddm3OsXB6J2lQEhTywJ/rf1pQO+i8nvDtLNWGClh
	DINCrl/Z+4nr2VrUTwlTXK4eCGZT1Hc=
X-Google-Smtp-Source: AA0mqf4nEP4C4o6ZpBz5fXqKFX2qlIszB/th0rN27adgcD60jatZtWbG/cg5bFKqEdq7plzEAMLcfg==
X-Received: by 2002:a05:600c:1d27:b0:3d2:27ba:dde0 with SMTP id l39-20020a05600c1d2700b003d227badde0mr15404710wms.33.1671196811680;
        Fri, 16 Dec 2022 05:20:11 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c358200b003d1f2c3e571sm10756854wmq.33.2022.12.16.05.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 05:20:11 -0800 (PST)
Date: Fri, 16 Dec 2022 14:20:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Sumit Gupta <sumitg@nvidia.com>,
	Petlozu Pravareshwar <petlozup@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: tegra: fix CPU_BIG_ENDIAN dependencies
Message-ID: <Y5xwiV/OiAKmnsVt@orome>
References: <20221215165336.1781080-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W9s2yv2C2NngHnLL"
Content-Disposition: inline
In-Reply-To: <20221215165336.1781080-1-arnd@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)


--W9s2yv2C2NngHnLL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2022 at 05:53:21PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> My previous patch to prevent BPMP from being enabled on big
> endian kernels caused a build regression:
>=20
> WARNING: unmet direct dependencies detected for TEGRA_BPMP
>   Depends on [n]: ARCH_TEGRA [=3Dy] && TEGRA_HSP_MBOX [=3Dy] && TEGRA_IVC=
 [=3Dy] && !CPU_BIG_ENDIAN [=3Dy]
>   Selected by [y]:
>   - ARCH_TEGRA_186_SOC [=3Dy] && ARCH_TEGRA [=3Dy] && ARM64 [=3Dy]
>   - ARCH_TEGRA_194_SOC [=3Dy] && ARCH_TEGRA [=3Dy] && ARM64 [=3Dy]
>   - ARCH_TEGRA_234_SOC [=3Dy] && ARCH_TEGRA [=3Dy] && ARM64 [=3Dy]
>=20
> Add even more such dependencies for the SoC types that use
> the BPMP driver.
>=20
> Fixes: 4ddb1bf1a837 ("tegra: mark BPMP driver as little-endian only")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/tegra/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

Do you want to pick this up into ARM SoC directly? If so:

Acked-by: Thierry Reding <treding@nvidia.com>

--W9s2yv2C2NngHnLL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmOccIkACgkQ3SOs138+
s6GNmBAAnncANtXp6N1jNx8+Ps/0lg/2MM5Lp/GFca9eT9f6011lLAN5Qu2eiInv
Be5dzOyAgjCcriwLtQjS/wJzScflRvS+pgJe7CvED8lyI85Ys7pyt1Pl1T6XJAkT
mZLDbtBtlyE655D8dLvYhMqOk7qZglk3gIKakXulNESv46biLYk09AO5ewrYDQCw
FNOsWpeKLq+05KJZKOlWyAJk3aajntCKayhNqnp8agO5VHhjpsdxP1oBAw0tnfl+
V5wxaV9cGERAcJ2Gd4NG7GkYutWpaLK9+aMySjW9fgNRbvpzZJWXH0iGoAsGgO8l
1JVe8gV6Y9ASOmFrdM6bY0zs9YZHp3waeRvr/cVs0r5rl3yaN751u8bYqEEVTjkQ
lwgZXGOINhhYxpOmPLG7u6SD5lqvykrkFJQAPn4Z+g6LfadWzrGcfIja+DByk2vb
nWXWi/7aF0tL0EQWi4soEFQQVjZfL2yN0AGcuSrPM+lFBbgxqcR6fBvtFR95J5M1
kctUBWzjJp4fvTzUO+tyIbiK+SkqYkKNzQbZKe44CCPh2KptXfeYrOnc0qoFo/Xh
+DSmG/HQ4eg0GAjXm4wD8Ek9p6Bn8fQ2KmRcEnSrDXxvAuyXhYXXxmNxEBdDQfN4
RSjNRZs1Klfx3a3oUCLabck4tSJHWb1DLeqPNSqK7RiGHLxeZwU=
=oTaX
-----END PGP SIGNATURE-----

--W9s2yv2C2NngHnLL--
