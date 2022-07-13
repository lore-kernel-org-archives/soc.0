Return-Path: <SRS0=xQP4=XS=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6900BC43334
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 10:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F3E7C385A5; Wed, 13 Jul 2022 10:58:43 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53D34C34114;
	Wed, 13 Jul 2022 10:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53D34C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id bu42so18517509lfb.0;
        Wed, 13 Jul 2022 03:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a7EdAL1phybyF7skcIdHDSL8TqoETJjf/TfW70qlhQE=;
        b=CmsqdFZkajcNWb4IErlxXvHJd2aIeR7WpcoDNsQIfxeOJc22txKTrcbrdZ0dGVV2+7
         3b7gsgj7TmTLAsJ3B5AK5T8gaLFqJreAvmhJcilnwyaAPhQf6gInX9bg/bBwdbeMGDwK
         28uWAvs6Fxn3MJPM4/+y9L+9vu3nbzkCgkJ2cwWEoMM0c/r4vacKwjBjog5FrMFRQ1MX
         ExXvhxnfPVCtfFZSke56lYbvzpf8zfBJ92VaB0J82Ssr6gkhq84X5PFQTVHW+Eg0WfHr
         ypf/I82xn6wcDzPEO0WXud2EXlrdem57gqlMTaK8tVjAm2o/IyoGJpG+gG8hV+HTspoY
         ez+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a7EdAL1phybyF7skcIdHDSL8TqoETJjf/TfW70qlhQE=;
        b=2tVTZHcYOBVdvdXcx5QwhP6Rb8T2ZUIxd59irmRayZMl4riIpvDruV3ZpOG2W8HXrp
         f5eyw9C9ivb+CJCJciP3RGYBE0auLqHZ9i5Tsvs0TZRmuOLODUvg0bfuK5FHGhhtPyXF
         PL+1GHeLuUjQsA7kR0FUhMj7IyzoQJw3nU1Z9ShECvP4NLP1lgH7As5M7CEhhwXy58S4
         uc+HCKLZArO1521MZ7v5UMB1k2GeinKR4M3QR6wntYoh1evUaYsQNfXi2mJ7uBG7j1WV
         pmni8w/HL357BLNa3EDqDYw30zso7h73kK3YOgLkQojfHC0jM/GCYI8djTm1w/zuPc2a
         UuZQ==
X-Gm-Message-State: AJIora9Mn4f62nvBfuRfio3pzxmtj4xhiP8g6euULsGmVEvK/HrwHEWa
	y1kp7X4p5SHiombyQmwzFtQ=
X-Google-Smtp-Source: AGRyM1tiNi7tM+jPk95JdtfLPm+/s8q30CPmWWNXCMmYZzbl5lIlM6TOUtjwhjklfgMb0cCoqIVQnA==
X-Received: by 2002:a05:6512:3c96:b0:489:e6c1:a5a7 with SMTP id h22-20020a0565123c9600b00489e6c1a5a7mr1797738lfv.38.1657709919880;
        Wed, 13 Jul 2022 03:58:39 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p23-20020a2e9ad7000000b0025d6f3f40b2sm1762183ljj.21.2022.07.13.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 03:58:38 -0700 (PDT)
Date: Wed, 13 Jul 2022 12:58:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-edac@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>
Subject: Re: [GIT PULL 1/7] soc/tegra: Changes for v5.20-rc1
Message-ID: <Ys6lXD6BSxjH02mW@orome>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
 <20220708185608.676474-2-thierry.reding@gmail.com>
 <CAK8P3a1bKUr77t9xkNAX=-RqzRme6Hymr3V=36MSHT_sOFEW5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TIZRcbYAEqhPciQf"
Content-Disposition: inline
In-Reply-To: <CAK8P3a1bKUr77t9xkNAX=-RqzRme6Hymr3V=36MSHT_sOFEW5A@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)


--TIZRcbYAEqhPciQf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 03:27:16PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 8, 2022 at 8:56 PM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-5.20-soc
> ...
> > ----------------------------------------------------------------
> > soc/tegra: Changes for v5.20-rc1
> >
> > The bulk of these changes is the new CBB driver which is used to provide
> > (a lot of) information about SErrors when things go wrong, instead of
> > the kernel just crashing or hanging.
> >
> > In addition more SoC information is exposed to sysfs and various minor
> > issues are fixed.
> >
>=20
> Hi Thierry,
>=20
> I fear I'm going to skip this for the current merge window. It looks like
> the CBB driver you add here would fit into the existing drivers/edac/
> subsystem, or at the minimum should have been reviewed by the
> corresponding maintainers (added to Cc)  to decide whether it goes
> there or not.
>=20
> I had not previously seen this driver, but I'll let them have a look firs=
t.

EDAC looks like it's used primarily for memory controllers, which this
is not. But then I also see explicit references to non-memory-controller
references in the infrastructure, so perhaps this does fit in there. The
CBB driver is primarily a means to provide additional information about
runtime errors, so it's not directly a means of discovering the errors
(they would be detected anyway and cause a crash) and I don't think we
have a means of correcting any of these errors.

I'll ask Sumit to work with the EDAC maintainers on this.

> For the other patches, I found two more problems:
>=20
> > Bitan Biswas (1):
> >       soc/tegra: fuse: Expose Tegra production status
>=20
> Please don't just add random attributes in the soc device infrastructure.
> This one has a completely generic name but a SoC specific
> meaning, and it lacks a description in Documentation/ABI.
> Not sure what the right ABI is here, but this is something that needs
> to be discussed more broadly when you send a new version.

I wasn't aware that the SoC device infrastructure was restricted to only
standardized attributes. Looks like there are a few other outliers that
add custom attributes: UX500, ARM Integrator and RealView, and OMAP2.

Do we have some other place where this kind of thing can be exposed? Or
do we just need to come up with some better way of namespacing these?
Perhaps it would also be sufficient if all of these were better
documented so that people know what to look for on their platform of
interest.

> I see there are already some custom attributes in the same device,
> we should probably not have added those either, but I suppose
> we are stuck with those, so please add the missing documentation.

Yeah, that's a good point. These should definitely be documented
properly.

>=20
> > YueHaibing (1):
> >      soc/tegra: fuse: Add missing DMADEVICES dependency
>=20
> This one fixes the warning the wrong way: we don't 'select' random
> drivers from other subsystems, and selecting the entire
> subsystem makes it worse. Just drop the 'select' here and
> enable the drivers in the defconfig.

This doesn't actually select the DMADEVICES property. It adds a
dependency on DMADEVICES and if that is met it will select
TEGRA20_APB_DMA.

Thierry

--TIZRcbYAEqhPciQf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLOpVkACgkQ3SOs138+
s6HhfBAAr9dY2YR9GztcArzoolgqZsRvoAUpxcSx+Ht9WbmOw1o/FwryrFxIzMUL
R2IdmvNdO7a6ZegRSIVKNADbrmTkENserrulCZmY0A92Izc2T3yxWvFR1f54GFc0
CAtlHk2N7+v9f54yn3+OAz3CxX94oryjGvbfor9scNGbKZpIZ7HRu3gXAqXXeA3X
HWpcRRJRIwYSSaDA27cd9g5q5fb7Dm2WJXwosVqsG9dzndMEqFRC4PssQDBV3G+7
AobVS4Z1svgk1vsX++ATpz3FpNNDA+BbwGcos5SNNPyRe+Pk5IEMCY5ecRidH5cQ
L/4C2EYu9+PiBL+tjX3hI8Go/9uRPI2F90K5uZdKQcNObu+YlfU/icbjIXMCUz6v
s9MeTIk+yYIqmolxPeJalcGyvOR7v5St5WnAZYOKg53H75WKyVk8xJ5s9fysZHNg
ooVk9BJl/LMio94lk58GYLePpS+SBxMF04+8QhPAYdKv0nBdsiZPkNwTK+t9o6+d
VuyRMHZwHW5nOTLUKdo1CW59KspA8g1g8Wkp008+sCo5wUDGca3ueSeYjl5Fcy3Q
bBPI6T+beYVzgdXzaIjU4vQ9bGs4bZWaCiJPfX0E8hcPxZE9drcppoAOjE+ROQ8Z
hQxjbxcSah5MdAM2ICYjRzkfHoMVzWOiR9EhtZi6cLJFdAOPPYM=
=Bpjo
-----END PGP SIGNATURE-----

--TIZRcbYAEqhPciQf--
