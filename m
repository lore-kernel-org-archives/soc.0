Return-Path: <SRS0=HH3A=VO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F75CC433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 14:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06CD4C385AA; Fri,  6 May 2022 14:33:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27AEAC385A8;
	Fri,  6 May 2022 14:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27AEAC385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id b19so10285233wrh.11;
        Fri, 06 May 2022 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y33Xj9lfrhQCQVz3ZtJ2FhWyC2SIErwnhGhTjgcM4sk=;
        b=mb/oTBoKx5F7B+hWw+q9fw3TJn58oRsN7hJ+nH+prHCKuB5wPUt58N2dV+/DKeDUrc
         pIwIgeDBzZhC8geyWxyTow7ISiDYtbMrSNg4gWCCQ8x5a8WQhsrOt9k92TJ84JIpQQWD
         pNUreQseajprjJxCih51fKUJwHYPuSIr5zLPcULAmYqM0buk53ucDcb8duQNfQG2OtZk
         JCLJ6wk50WRD6UuwURqLTUxYTxMovQ7vbCOCoaNO4IEnSpmvoKcvpi0YrlNuYvdUMKcn
         exw6pC/qgWed3O4WuLcB3WvwrvTvmVLu4NuL3/fkC0fe86GBoSGAg97LKk0hAMJXtIjr
         PG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y33Xj9lfrhQCQVz3ZtJ2FhWyC2SIErwnhGhTjgcM4sk=;
        b=Inb12RY0JhJEk0SveYp4nDFdFo1C3ztIaTQEIuNeoyKUiSRFhTxzV9tHmku6gh2nNc
         ZXu7yns+g/6vbl0hl5gTiczDm5K8mys46b2NIo4gyaTb3CV8rdIfjExJnjhUNz9oO0D3
         BuP65id06mS7fcwjeS6vqKJSezEV6eWd2E6/UKNqyNbZj0xANENLLpmTZDaJzOfVWH2i
         QhbPlU5dRlRebGlspp83qk9tAMUyj8neiLGFnia7CeuDG+QCHBWFGvTbc7mc/B6DwZZz
         zXkelmbkJAoAbD3bgOJIJ5iLK1c6HsUJQ/yIJyrv0GVDPC20H8069AJSLRHiaL9nhW22
         Ztgg==
X-Gm-Message-State: AOAM533GxbENKmRTOL+mhmRcPG7OCm8xn7eABmd6TNc2hNG4i52d5075
	K9plQLQDZn3Hs6QvrMkeaOUwHs5g1JE=
X-Google-Smtp-Source: ABdhPJwQmjpC1HaW8wxx3Oi4kTprDgWcs6sV9lnZKHXXh387eAWIRIOd3VajBPGX5Oy+zybyIBwwUw==
X-Received: by 2002:a5d:66c8:0:b0:20a:c807:6061 with SMTP id k8-20020a5d66c8000000b0020ac8076061mr2840840wrw.399.1651847630684;
        Fri, 06 May 2022 07:33:50 -0700 (PDT)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z25-20020a7bc159000000b0039466988f6csm4441031wmi.31.2022.05.06.07.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:33:49 -0700 (PDT)
Date: Fri, 6 May 2022 16:33:47 +0200
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/6] ARM: tegra: Default configuration fixes for v5.18
Message-ID: <YnUxy4Gr7kUuWr7/@orome>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
 <20220506143005.3916655-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f7wcx2TOfZPtxqKM"
Content-Disposition: inline
In-Reply-To: <20220506143005.3916655-4-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)


--f7wcx2TOfZPtxqKM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2022 at 04:30:03PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc=
17:
>=20
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.19-arm-defconfig
>=20
> for you to fetch changes up to 39ad93d280506f4953a9d0c545cfffa581889326:
>=20
>   ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver (2022-0=
4-06 17:03:30 +0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> ARM: tegra: Default configuration fixes for v5.18
>=20
> This contains two updates to the default configuration needed because of
> a Kconfig symbol name change. This fixes a failure that was detected in
> the NVIDIA automated test farm.
>=20
> ----------------------------------------------------------------
> Dmitry Osipenko (2):
>       ARM: tegra_defconfig: Update CONFIG_TEGRA_VDE option
>       ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver
>=20
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  arch/arm/configs/tegra_defconfig    | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Hi ARM SoC maintainers,

I just noticed as these were coming into my inbox that I had already
sent this out as fixes for v5.18 and you've already pulled this one in,
so feel free to ignore this GIT PULL 4/6.

Thierry

--f7wcx2TOfZPtxqKM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJ1McsACgkQ3SOs138+
s6FTuQ/+K66b5evRZqwUUv3W+kP1tPD1mCgN8wbMwyBHewVMRLB9lNHMqqCWX+df
kwczhOVx68t/tJDEf/c55AomeflE5/4sZni4V0GEXHj8xoBoXg88kORQ8KLBErTs
k4D7xfshcGN6kFkpC8iPy5qKQpZqSqq/Kypw2UHyYrLT/S7CwlZw7apCShkrZZqw
ZU+CeN+DFY8afSwtHB8idqGlHsdT3sEHUBUMbytUE307zOOvbMZQuOjcNJ4Bozf3
VHt9cWG8OYhuq5QCjCFQj48/E5jR8Rb0VacqdoJkQjSbwCcx9pJ99GxPeccpGtmC
5YxS0Kf79a2VTOmu4NgU+reB54aMlzmbT9hRlwfB4WO2D7dI2gK97+vlNWNl5K9Y
IoIFDeMwjfAm5kBI1/Q/TFX80oN3wQcYFySs2Up6V5oxBgVAbCQ3Uy23MMDXP9ob
ausTYTztLzpLrgkmHNHoSqeCRwFaJ1eXmdCYlN0VWGXBfwudRjM1dzKLFUee1Mw0
p2bmLej1udVBE7vM9hslrwjOmTuvTbwwoGhkGT9kH01HqpWQyuGiXMjaJedar3g8
IL8nFE1Wp9Fc/KJj3yWaQcvHR7j284Rs83eoZXLbzSeDDq92LG55GXx81c1MA4O+
4vSw04xu0tMJofhWZ+JDhuU8j0BEm5FzZb2Xbfe/JzQQpH26q0g=
=jky/
-----END PGP SIGNATURE-----

--f7wcx2TOfZPtxqKM--
