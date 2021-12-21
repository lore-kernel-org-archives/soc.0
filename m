Return-Path: <SRS0=Ha9N=RG=konsulko.com=trini@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E00C433EF
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 16:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD461C36AE8; Tue, 21 Dec 2021 16:09:38 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26E7FC36AE9
	for <soc@kernel.org>; Tue, 21 Dec 2021 16:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26E7FC36AE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qv1-f52.google.com with SMTP id h5so11117615qvh.8
        for <soc@kernel.org>; Tue, 21 Dec 2021 08:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sDHaRbhuC79BvGEiY197i/14OhtcoJmxWUUsJ+hn1tM=;
        b=AWIEpNjI0GhhacozwgXfNDX8HXru6njjnqzuOakQpFbzg0QGvP9eC1eXYeLtovkZf3
         pXG37qJeKRrA2jHAjPcBxHr1auYJfg8mNBhVXC8b17MWr/4irNUkEMqOza5G14kKBf0D
         tJPSGx5XSrb2y2dsYd4Jt6BML/La7k2bAtll4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sDHaRbhuC79BvGEiY197i/14OhtcoJmxWUUsJ+hn1tM=;
        b=NUeN+14o8I2xd7+Rj7Kh07crA5TuddrzeoUS5t9JPdAqmnKSN6hUL7Oz9N1Gg36Iz6
         jajeNlrBjlw3oRw8w4LcCKPYt4oMDh7mudIuKDacl9OWcK2s18EEoNprgWNi8YIJHah7
         XvASYY4j7t208cx9F/c2iiX92S7mGrPChTWGoNRqCvkGin/C0GRsqv3OQTBYVHpDc+k0
         0MB1oT6vaIncBzieTdgpTKYRmw24slspqN+91taHoy75pj96cUPR80Kk2iT/DSc5T1Tk
         /kAQkkUCPK7vvNNYNmCs4iF8tAqKxr9FRSdQvEMx6K7ewkDXVgavhM7fVXtnBwkYGrSU
         G5DQ==
X-Gm-Message-State: AOAM531CGZF5n3iK5Vj2TT8iVgJJDTKUPK5mGHpyKmB/HP1rCQbRzQ+j
	fWiFnErFPGug7jpIfHgf8qqUwg==
X-Google-Smtp-Source: ABdhPJz0w0/IwKbdnz/unPro2aAspCcZT1Eu2iawUsmmWEfjRFqBP2h+TqQfprKzOuORjbN2gVfCOA==
X-Received: by 2002:a05:6214:400e:: with SMTP id kd14mr2790790qvb.68.1640102976088;
        Tue, 21 Dec 2021 08:09:36 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b01-cbda-04c9-073b-bd3f-c77c.res6.spectrum.com. [2603:6081:7b01:cbda:4c9:73b:bd3f:c77c])
        by smtp.gmail.com with ESMTPSA id b11sm16667254qtx.85.2021.12.21.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 08:09:35 -0800 (PST)
Date: Tue, 21 Dec 2021 11:09:33 -0500
From: Tom Rini <trini@konsulko.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>, SoC <soc@kernel.org>,
	arm-soc <arm@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL 1/2] arm64: TI K3 SoC configs changes for v5.17
Message-ID: <20211221160933.GM2773246@bill-the-cat>
References: <20211217172806.10023-1-vigneshr@ti.com>
 <CAK8P3a2VSBvOn1o+q1PYZaQ6LS9U4cz+DZGuDbisHkwNs2dAAw@mail.gmail.com>
 <06e60038-1365-fc35-801e-448c9025fb2a@ti.com>
 <20211221153250.GA2081238@bill-the-cat>
 <CAK8P3a2wNNSQkN_m3DzEF5RLmq1aED1JpOkXW9Yq13+ypiAaGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fzZfjcV6kaBgkq89"
Content-Disposition: inline
In-Reply-To: <CAK8P3a2wNNSQkN_m3DzEF5RLmq1aED1JpOkXW9Yq13+ypiAaGQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett


--fzZfjcV6kaBgkq89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 04:55:48PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 21, 2021 at 4:32 PM Tom Rini <trini@konsulko.com> wrote:
> > On Mon, Dec 20, 2021 at 11:10:25PM +0530, Vignesh Raghavendra wrote:
> > >
> > > Currently its not possible to build PCIE_CADENCE_PLAT_HOST/EP drivers=
 as
> > > modules (symbols are bool only).
> > > PCIe is not necessary for basic boot either. So, I can drop these
> > > configs until these drivers are build able as modules, if you prefer.
> >
> > Is PCIe required for basic boot for the other platforms in the defconfig
> > which do enable it in the defconfig today?  It is required for non-basic
> > boot (whatever storage one puts in a PCIe slot).  If someone is going to
> > be fixing the PCIe driver to be able to be modular, that's fine too but
> > I ran in to this trying to see what works out of the box in the
> > defconfig, on this platform and hit both of these rather large
> > omissions.
>=20
> If PCI is often used for storage, then that's ok. There are a number of
> other platforms where PCIe is only used for wireless networking or
> other secondary devices, but they are still built-in because they got
> added before it became possible for PCIe host drivers to be loadable
> modules. I would like to eventually go through and turn those into
> loadable modules, but for the moment it would be good to only add
> built-in drivers where this is actually useful.

That's good to know.  My question tho is, what's actually useful?  The
EVM is 2 PCIe x8 type slots.  I honestly don't know if that means "super
useful, arbitrary devices are expected to work" or "not useful,
arbitrary devices are not expected to work".  Is the functional
definition of what's in the defconfig vs left up to users,
distributions, etc, to find and enabled defined, or at least well known
/ explained somewhere?  Where I'm coming from on this is that these
platforms practically are, and can be SystemReady IR certified.  So
what's needed here to ensure there's a good experience distros to enable
what needs enabling for full functionality?  What we hit was "lets throw
some stuff at this board to test it out and.. wait, PCIe isn't enabled
at all? USB host isn't enabled at all?"

And all that said, if someone is going to be fixing the PCIe drivers to
be enabled as modules soon, and just getting it handled that way in the
next appropriately timed merge window, OK, fine, good enough.

--=20
Tom

--fzZfjcV6kaBgkq89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHB/DcACgkQFHw5/5Y0
tyyG8gv+PfvguS1egaG9IzL+unAozNxHjgHPHeglLDukR0djwaNh8fM2uvo5Ll0+
aPkw20zu0aFXIhs2vtICLFD0SEhwKzrKN33eKUFboD8rFdgIvw7CMhIAsZgaIuu0
DZVy2XE4k40AO/iNGcTjegUa+zMUHDJ8xNQFb/q9iV5muynaeD5AKvSqa/j/z8xE
SJT8RCsbpm0ZW156jqTOObOmCr/9lN9/hrZmENDgnWp1O35LJEkxaPhiuPR1utix
td1Kdflw4+z0EqoBJcnzOzD0/XInZFCQ0b5sSl94XWVvuBR6dmhVrPasySQOB+ci
MyQeWtOY8P4VhTE7OlIb25UiyzlFpKFZelvF0MFeNjx7Sz5S8bPHjgBr2ry17r7A
8pNxc8pUDwgofwSZOxNBJQeHma+xLW4UiQvR7LMbRB9g6HIv7wEz9m/EoQLjurfL
oSLB9y/1Tw+cfi/df11aShUgKsko71gCLCFJFsHOYfgUVzilaHORo69CfFcqCmC5
3E+Umpnh
=rBqo
-----END PGP SIGNATURE-----

--fzZfjcV6kaBgkq89--
