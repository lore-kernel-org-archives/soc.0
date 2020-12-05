Return-Path: <SRS0=mdI1=FJ=ucw.cz=pavel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843ADC433FE
	for <soc@archiver.kernel.org>; Sat,  5 Dec 2020 20:48:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 347CE23106; Sat,  5 Dec 2020 20:48:38 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E663230F9;
	Sat,  5 Dec 2020 20:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E663230F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=pavel@ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 326FA1C0B8D; Sat,  5 Dec 2020 21:48:35 +0100 (CET)
Date: Sat, 5 Dec 2020 21:48:34 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Douglas Anderson <dianders@chromium.org>, SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
Message-ID: <20201205204834.GC8578@amd>
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAKdAkRRq=GK7N1PDJ4zLfJVSsrd1BB=u69aXtJHh=sW4vn5LOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline
In-Reply-To: <CAKdAkRRq=GK7N1PDJ4zLfJVSsrd1BB=u69aXtJHh=sW4vn5LOg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On Fri, Nov 27, 2020 at 12:51 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > >  - Some DT patches for the Rockchip RK3399 platform,
> > >    in particular fixing the MMC device ordering that
> > >    recently became nondeterministic with async probe.
> >
> > Uhhuh.
> >
> > I didn't realize this MMC breakage happened.
> >
> > That's just an MMC bug. Other subsystems have been able to do async
> > probing without making device ordering be random.
> >
> > So this really smells wrong, and I just never realized.
> >
> > Added Douglas Anderson to the cc - the whole PROBE_PREFER_ASYNCHRONOUS
> > behavior appears broken.
> >
> > You basically should do the device numbering synchronously (or better
> > yet - asynchronously, but single-threaded for the subsystem), and then
> > asynchronously probe the actual device details after you've numbered
> > them reliably.
>=20
> Generally speaking it is either unnecessary for a lot of devices where
> we do not care what number they get, harmful (why do I need to probe
> i2c touchscreen and touchpad sequentially if I do not care which one
> comes first but my boot will take 0.5 seconds longer if I serialize),
> or impossible (if device is hit-pluggable). For many years userspace
> has been moving away from static device assignments and we should not
> be going back.

Lets not make userspace's life harder than it should be.

You can't break existing configurations, and people still use
root=3D/dev/mmcblkX. Recently kernel on Droid 4 switched from MMC on
mmcblk0 and mmcblk1 to MMC on mmcblk0 and mmcblk2. Of course that
broke my config.

And I'm fairly sure I'm not alone.

(And it may not be this bug, and I do have workaround now.)

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/L8iIACgkQMOfwapXb+vJiEACgn18v+/EzhNIclf1Mh8seK6kI
JIoAnikMuD1kNbKhB4/JxIujWDxJxAvD
=Ro3a
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
