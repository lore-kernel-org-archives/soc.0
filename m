Return-Path: <SRS0=1gXN=3V=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA164C43217
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 12:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D98AC43470; Mon, 21 Nov 2022 12:10:06 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98321C433D6;
	Mon, 21 Nov 2022 12:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98321C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id vv4so18740066ejc.2;
        Mon, 21 Nov 2022 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkb3lOzKWPhmdK/svSdbDDXxasbvhA6mXtWuXOpT/io=;
        b=ARhcmfp4g9gykm1IGK6/kMtG+59mxb6kmQ6TgZIJQC8+n4O2/oSKo2gRIn5A/bJtdy
         Ny6Femy3vWkLPbrTjzeqMO4F+/U6rzwWByaorfwtp5GnrxjOeYoh934nZS+x15UFFExl
         kcu5eCbDIlMXjXHIXxS4ml8q8Xi3BdlMvbZUO1CoT31YibHbjQs1hQKqxcpXKJ1hHRC3
         q9ZJU3KOP6H5Qr5SsHHPwxrGd+/b+zzp7NwiZ/A5DL7VVIel0Ys2GLAc5hm5mQQb7XIF
         nAKN9XE7Tyb3BYEJXDlQe2n/J7RyM8COAUt1uSbCHY24mLP3TNpjXKyCmA3+LCj9AUmx
         GMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fkb3lOzKWPhmdK/svSdbDDXxasbvhA6mXtWuXOpT/io=;
        b=FzcHpfPeievdQYtPMqhdXZguPBQpcwmuuvB3l/L1a0BrRYr519cXXdoUICB4j/t1s0
         zylM/2Iq53wL3UegEMKE8CwFNj+sMSxm5RDd7iBqrWWAKmSLJ+OfK1kVDsAlEpCV37iN
         2sUruX26FDsAgFUazuymFPP6wCoRvfNsRKb8PUozlEITbtwhcBzXTZH7q6lU6OZ7ZP+x
         JN/Ayj6h7sVALz8VDFFHW+wCR5FWfvyWu2zk5DcX8tAbdPBhI6RQI2Xdgl7ihU6IwKQw
         LgWm8HPhFDXEJk57XpafqpzIYjRMKYbGtiJbEUrmnyEMWhyKeuNHm2ng36boa3A44Ud9
         z5gg==
X-Gm-Message-State: ANoB5ply5c6Iqm949hJEyGfwDVsKBQt/PSxJ5onOYrKwvKvQJeLO43YF
	ri2aPrq27uc1OXaqJH5+PDMfvLR2PoU=
X-Google-Smtp-Source: AA0mqf5U8NSV9VzRuOjlqgSqt7jxcd/+KZ6sM03IjXrzUWfUuFE3tTKPwwEQLJbmHsv0eBdiU8tC3A==
X-Received: by 2002:a17:906:cc8f:b0:78b:8ce7:fe3c with SMTP id oq15-20020a170906cc8f00b0078b8ce7fe3cmr15021249ejb.557.1669032603279;
        Mon, 21 Nov 2022 04:10:03 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906318800b007b47748d22fsm2752872ejy.220.2022.11.21.04.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 04:10:02 -0800 (PST)
Date: Mon, 21 Nov 2022 13:10:01 +0100
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/8] dt-bindings: Changes for v6.2-rc1
Message-ID: <Y3tqmX4FV4OzOIOz@orome>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
 <20221119012025.3968358-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7/pSouzpPCyokl52"
Content-Disposition: inline
In-Reply-To: <20221119012025.3968358-4-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)


--7/pSouzpPCyokl52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2022 at 02:20:21AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.2-dt-bindings
>=20
> for you to fetch changes up to 9c812445df0507aa30ddb511a777fc5dd981eb66:
>=20
>   dt-bindings: usb: tegra-xusb: Convert to json-schema (2022-11-18 23:58:=
45 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> dt-bindings: Changes for v6.2-rc1
>=20
> New memory client IDs and IOMMU stream IDs, as well as new compatible
> strings are introduced to support more hardware on Tegra234. Some device
> tree bindings are converted to json-schema to allow formal validation.
>=20
> ----------------------------------------------------------------
> Jon Hunter (2):
>       dt-bindings: tegra: Update headers for Tegra234
>       dt-bindings: memory: Fix typos and definitions for Tegra

I was just testing a new script and noticed that the Fixes: reference in
this patch to the first one no longer matches, so I'll have to respin
this (along with for-6.2/memory and for-6.2/arm64/dt which depend on
this).

Thierry

--7/pSouzpPCyokl52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN7apkACgkQ3SOs138+
s6HbSQ/8DrhZV3H5SGvPc1SZdkuAHzTu8bkxKOjfum1o94p54/bkK5yeaoaMZlj1
q2+Nbh6UBDvH6Y2NbjWSt4xGEiYgs/YkJxj01b6Zre9SQ4grzdx4PhabjAWvCfUE
rFTA5Da7d68DXRc/3ipWvF1mwmNjL+l6tAOlRKFg80/wXJ6S+QozKxh9/Uz70K1s
KCiuWzaeJhieVNCgSidNyhOI9eAEfi2Xt9svjyjm+KYMF90x9sfBJQrpemnuejqX
u9AhoKi1dcZME/qewWqB40p6O9AJ1s4oC43Xj6U3yw3T1OLSct0e30t77lVBz7u8
YxcEOH0wshHb7PDwMKuFDGY3znGMpKnWiv3I3UfOq+Za9ahB15zAh+FdhtJUkx7N
Y7WmjXFk7xFjY4dhPqfqwzwNsDwRgbj56+AaBk23zkHS/EN4hdV585rG4vkaNOnc
vWJgM5Y8v/yHAhdjwx90Qkbw+uUCQoZVh5KJ4Lwj01I3veq9nPCtdG4NaYBqWkAY
T5XYWq5WbQNK0jTQ3lOgmQAr0XESKUDTh/gSGFJm0A3YzZJPCHmgdDsnk+02EFpM
MbhFgaJOshDopSWKGMDA22Qq/m5vag6ukEneFeOl8a1CUpZMdVFKbiTDbS9RsGYu
nHEk2FgRVKLpROA3ZJZeUtXQx/ZxNMNpk15B404zUJ7pzonKIvU=
=1i4c
-----END PGP SIGNATURE-----

--7/pSouzpPCyokl52--
