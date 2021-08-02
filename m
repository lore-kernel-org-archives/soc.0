Return-Path: <SRS0=XkFf=MZ=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A12C4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 14:34:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D838E60F51; Mon,  2 Aug 2021 14:34:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC82E60EE8;
	Mon,  2 Aug 2021 14:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC82E60EE8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id l18so21728217wrv.5;
        Mon, 02 Aug 2021 07:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JG8ecXhoC8Ej/py6hyvwqWnXQNEv8TbQr/VbiNiY5Vs=;
        b=ZFyb3P85dZM/QXDL+mEHAN26/1R1zJUOx3eL/vqP+UTSS5rgUj+vkXhPXnCWAvN668
         Ip7WF2p3OAt6Xm8NGNI03XsHD9oan571fJ3/NkNdqYcRNwqd05CVIUi/Esq+MqEHy9J5
         WAIgWeSTD/m39ltM/Y5OJQEVaGhvt7nBw72cBFmqzF+N4bQes5UV4wV/84Cscgm7+4XN
         IeQ/OD9ZcRzt3CgRVRaq05+LZJxZYiV+5Di9SftK9eFtmu/c/TY+QT00ox+Mjm7D36d9
         AHi3X3Wy+fgkJLwDpXz/w3fg75vCKNr43sZIHpCgokqoXUX/AynzblhuXT/arwFKy5Z2
         ivsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JG8ecXhoC8Ej/py6hyvwqWnXQNEv8TbQr/VbiNiY5Vs=;
        b=Wouoro1C/Aj4nrnMPayHTe1ssqm5+LpxLjGrzr5hSRMetVdJOo89Yi+P/HUgRlCj+l
         94/6Qhx8rkhdSZ0iPi6tiZzPb+zyJ1uFmvFwzAYsCXUG+ghslNxk1IphXjVOS4AXEZDh
         1SNEXKMv3QizLjO2usFIIGSwuEo2rEjwEWsKsCm3TQkJMnfFNy2ANm1NyrhQKKQUhdAM
         b8qlF+E8v5LxElhiKynoeWyQ3GDIVE46xHjTY/JfNeOJJKjdl/DmOPLBJLFmswfipMHe
         byjc24rW2i2/nFTqs9YYxWKCYnysD2uPtIFTTwHKvFj/Bp6kK8PonamGYRuSfWIpCDVC
         Domg==
X-Gm-Message-State: AOAM532xkULOkFEMj/oSLakkvE7xOeuNk2bOFTI60+wUqSgJaIV6lkVb
	Liw5M6PmqgTjXHsKY3Hfg+g=
X-Google-Smtp-Source: ABdhPJzn4tAn4treh3aVKHh6Tm4Nuw3ZkV2gD3VoI7ADP7Kd/tFKLW9aa2wO3iqTJX4uRIB+Eksoig==
X-Received: by 2002:a05:6000:1366:: with SMTP id q6mr17641077wrz.60.1627914867426;
        Mon, 02 Aug 2021 07:34:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g11sm4659348wrd.97.2021.08.02.07.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 07:34:26 -0700 (PDT)
Date: Mon, 2 Aug 2021 16:36:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] soc/tegra: Make regulator couplers depend on
 CONFIG_REGULATOR
Message-ID: <YQgC/POOrX4t9hUN@orome.fritz.box>
References: <20210721232616.1935-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/M3eTd4X7b+v6KJy"
Content-Disposition: inline
In-Reply-To: <20210721232616.1935-1-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)


--/M3eTd4X7b+v6KJy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 02:26:16AM +0300, Dmitry Osipenko wrote:
> The regulator coupler drivers now use regulator-driver API function that
> isn't available during compile-testing. Make regulator coupler drivers
> dependent on CONFIG_REGULATOR in Kconfig.
>=20
> Fixes: 03978d42ed0d ("soc/tegra: regulators: Bump voltages on system rebo=
ot")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v2: - No changes. Re-sending to Arnd Bergmann and soc@kernel.org.
>=20
>  drivers/soc/tegra/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Seeing that Arnd hasn't picked this up yet, I've now applied it to the
Tegra tree and plan to send out a PR for v5.14 later this week.

Thierry

--/M3eTd4X7b+v6KJy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEIAmoACgkQ3SOs138+
s6EwYw/8C93PUwLlmRxlWx4ljKaUh0VrMk7Vtj/Csbd9n9qHn552gJ/iYQFJQUQP
jlOk6UQx/7Ydov0fYLbfaIVCvyO3/BzZCbR2hxjTua/DwyTnVDWW1LzHjK8UWnxF
OXr9gsg7M95UZCQiRkXIyIa/Vw2/N71uPJEsGrULKAvYkPppjig57IcHUt/kgNuo
BVe4XtCLocyb5dRqDISC/lzuraJN7+3HijN2A0bDuFylqr8pkVIl4umcDbPtpiab
Kg1rlLhkJgyEiEhkH3mpWaDaY6ngV88eBvbjNa8K/NemFtj+EaNFwMu9lCKQ2dZR
uXW5GVSW7Dn9O1mJf4tWzhlY+8IQyy79iaoRLh5koTbjtIx2drmfyEvKq064mgeJ
zCvfm2rV/OiE46NWRVyoyA3vuaFBnIB9OwqNPv3jsabp2AYBtFVyvjoxQN7M09WK
z5mG0WxKC7WbrBQyAZXttUEba3TYCP5VEg4+MNZwkQWnHeeXuG6eAywPLQ9pjPBz
Jq8+DRG/gSw9DlHTVvdnC9fBy07JJQoUC4/jrIyLwXsRM12UZCEsG4ZOvPmOOxKy
eW59yz7DE5pFGNswbVVUm3Rl+NX9uOBfV5h+vpkYGjqBHzmKw5Gjl/kmAIQtScYG
hmePRpO9EuEka0n2FfAKHP4rL3KNtkx4agaDiV5mwgATYyUzitU=
=DsWr
-----END PGP SIGNATURE-----

--/M3eTd4X7b+v6KJy--
