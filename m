Return-Path: <SRS0=WceW=CC=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E772EB64D9
	for <soc@archiver.kernel.org>; Wed, 14 Jun 2023 09:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17389C433C8; Wed, 14 Jun 2023 09:27:10 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 332E6C433C9;
	Wed, 14 Jun 2023 09:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 332E6C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-977d55ac17bso84343566b.3;
        Wed, 14 Jun 2023 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734827; x=1689326827;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wQ6sXNSnoiLXE/DbardJ3wfMBPxkEflPlrPVrnR8kc=;
        b=Pv/xsOk6BGAlH84yLUIM/cjp3Wh3JVsJc5jKSzfLlibRtXmWd7CQb0+1sLrj+Wt1sE
         kkc/cg1ChQ0aozISeEF9H6J/zd8ARemoScMQgSpB7miB629CfdYSI8I9U2I09GOIfzpz
         s80KrVjFwiWeLcUvrJlAWUw3Y6e9VTGgX4U2EvpeBQzDt8Apt7TVc4CmmwSSx3ncCuEX
         72YeV46uB4LV8HE7ReCuz+5A0Hxx4Ifxn6yCnZbuv6Rv9UJGIyVQMaIa2Ia0Q7vw0rZe
         bnIvNMJiWP2i83KvEDdRv6WtT0elVDSigQR7JOvDARLL1n9kAfQcjmOcFf8lc7FuibMB
         XGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734827; x=1689326827;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wQ6sXNSnoiLXE/DbardJ3wfMBPxkEflPlrPVrnR8kc=;
        b=S/f9fd2rh1Xu3WhuzD8bgKi9rLrNuhZYbmMyQD5A7FCHz6OgpW9X5qYcae50QaKkRd
         XJakdPWZB8XJJCwd52fS1kJbGs1wYd7+mB/NMuk9U76z+yzox8R3DMyDLSvqI7sL3esT
         lN2OU2JauF4C9nKspyczFMMWzPyAB7ayiOFXixhCDNncJ80r1BPGt1aUV01AZ7+w7KRm
         rAjt8LjqlF/ajDh8XH4PBJNflWso8edUnAESFPry3aqJuOAao6dV3vLtBGnR41sFyvO3
         FR3VHHUVoI3iN41CErOB2tCOy8SQ5upCLN4s63+U+udKpsJo6h5EUjIj0SHjDnGptyEq
         mZXg==
X-Gm-Message-State: AC+VfDxN4MrgCoDStK9YyBwowlgUlT/OdG3/609Y4ZBHaX1CSRd7UqdU
	fSEGLD8uZOgKNflBahc0KbUdBLx9z6A=
X-Google-Smtp-Source: ACHHUZ4zb4lEwBTLKRU5rl2jzJYGuBHmFC+EM3N0NE4TNv4mMBQsS4XQiWcK9ylFMyz4NC/c4pQF6A==
X-Received: by 2002:a17:906:730b:b0:973:bcf6:1d4 with SMTP id di11-20020a170906730b00b00973bcf601d4mr18042481ejc.76.1686734826688;
        Wed, 14 Jun 2023 02:27:06 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n24-20020a170906379800b0096a6bf89259sm7747066ejc.167.2023.06.14.02.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:27:06 -0700 (PDT)
Date: Wed, 14 Jun 2023 11:27:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/6] dt-bindings: Changes for v6.5-rc1
Message-ID: <ZImH6MwUTGA6s16Q@orome>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
 <20230609193620.2275240-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gxmdR8maKjlNkRiC"
Content-Disposition: inline
In-Reply-To: <20230609193620.2275240-3-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)


--gxmdR8maKjlNkRiC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 09:36:17PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
>=20
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.5-dt-bindings
>=20
> for you to fetch changes up to 5f027147e4796e9fc11083b2ad50a91c1ac36ede:
>=20
>   dt-bindings: tegra: Document Jetson Orin Nano Developer Kit (2023-06-06=
 14:39:20 +0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> dt-bindings: Changes for v6.5-rc1
>=20
> Several new modules and devices are documented and fixes incorporated
> for the Tegra234 GPIO controller pin mappings as well as the possible
> Tegra XUDC PHY connections.
>=20
> ----------------------------------------------------------------
> Prathamesh Shete (1):
>       dt-bindings: gpio: Remove FSI domain ports on Tegra234

Hi Arnd, Olof,

turns out that this patch in particular is more problematic than
initially thought and is causing issues for various distributions.

I think we want to back out this one patch and replace it by a version
that simply removes the wrong FSI ports without renumbering the
subsequent ones.

The tegra-for-6.5-memory and tegra-for-6.5-arm64-dt tags are based on an
earlier point of the dt-bindings branch, so it should be fine to pull
those in irrespective of this.

Thierry

--gxmdR8maKjlNkRiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSJh+gACgkQ3SOs138+
s6GHDg/8D38+6hVSWbefVVoEGmosbIwt/9mgBvgZiEG40e6E+LVpsptHuFU6/KBA
Xh5NdHcO3LXFa7BAabgT3lYBsW7nR1QHI9sH1+nVlPouFk3UkSckZG+t/KEjgQbE
vRYmBtDAaQC6oaQkAJIA+6ckrOInHL5OPFcd1kVGqoBPRHKq5GalVVFYKmgSbQF1
3i13LWTcUnEvFPec4kPwIvFL2LyQW8DgE1bZRfzDsY6XD5NgvA5ZjvG1KXOeOzHr
IPsEE+B+pPcDmMFOp71fHvORkDjpGbwo2GkqF8xXdL9yxzIUCWkVcJtgkO8aSn18
ZGw5Q4DrlpIugdso4P7GY0tbsC1H2fxCio67hQrXuY9E8v6Teg6VBiQxf9VOtZVr
XdPyXxCjJj1BgnkFiGXn9ICq0lgs/PBEk9+HH86t+X+9YZHC9MZV3jWydaLUvwqv
6pWCQX40q8dmTPg3WuWyR6xVtFr+IUpWSC2oqX55Ziyd8heJwz3alcdW3ufIcQhl
9XGCOkZuvxkg5lKYcfh2HSXcZzRa5tb+BCMGUWqRI3arxB7bqW4t7IKNCktZSCTo
LLGYOBq2py7MtGQ1uc2tcRdAJISVcE/4ZI/PKU1acOOCi+fHgd1oICmx2XpRSmzm
7++r/RM3CNu0pL+kxCJxMSL5Jot9C7UnZGKsCwGxftvsSXgvhcs=
=CuIk
-----END PGP SIGNATURE-----

--gxmdR8maKjlNkRiC--
