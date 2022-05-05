Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FFDC433EF
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 16:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE4B5C385A8; Thu,  5 May 2022 16:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7A2C385AC;
	Thu,  5 May 2022 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651769882;
	bh=X5K5/2vnbr9SLa8fCYGGMq2gSl1SrV6RHmYOvMtGOU4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=H7seN6twz7Ve1fp+ODydThnFoJncvc6M9yMYotallcm8YfQghm+0RARQGFcjTWpIh
	 l2Z5pEPXFdB8KI/VuMD2ARoe46NiCuVLaXpmShZtUi0Pl3Wk9GRy2Hhlta1Xvs+FX/
	 iMBIcOj0I8EJyFFNKYmdhrtlq/uRnNUmuPHqyoHH4D6bIHZP3ypKyI3DI2zPEG1AAL
	 aKYDLXj6Rl6FS/HjvzjK6F7z+7PB/ci7Tz9Ove8wYqNrOq/qH2UPd6hnHzNq1qTrTd
	 oBnmuN/yZcpolugZQ1IoPF4XjyVSVldb2D5PNEpgaF9SltRhASkUuc8wAYNpjsHi+H
	 9nkB6f2pU8/ng==
Date: Thu, 5 May 2022 17:57:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-arm-kernel@lists.infradead.org, soc@kernel.org
Subject: Re: [PATCH RESEND] ARM: configs: at91: Enable options required for
 systemd
Message-ID: <YnQCFtAbGAlL+LgN@sirena.org.uk>
References: <20220505125736.207029-1-broonie@kernel.org>
 <1f0b04ac-af35-c20a-94aa-9a45351cc2b4@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pERLFGlZ1NmRkqwe"
Content-Disposition: inline
In-Reply-To: <1f0b04ac-af35-c20a-94aa-9a45351cc2b4@microchip.com>
X-Cookie: Real programs don't eat cache.


--pERLFGlZ1NmRkqwe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 05, 2022 at 05:28:14PM +0200, Nicolas Ferre wrote:
> On 05/05/2022 at 14:57, Mark Brown wrote:

> > @@ -205,6 +206,7 @@ CONFIG_PWM_ATMEL=y
> >   CONFIG_PWM_ATMEL_HLCDC_PWM=y
> >   CONFIG_PWM_ATMEL_TCB=y
> >   CONFIG_EXT4_FS=y
> > +CONFIG_AUTOFS4_FS=m

> While trying to add this option to our other defconfigs, I read this in the
> CONFIG_AUTOFS4_FS entry for 5.18-rc1:

> "This name exists for people to just automatically pick up the
> new name of the autofs Kconfig option. All it does is select
> the new option name.

> It will go away in a release or two as people have
> transitioned to just plain AUTOFS_FS."

> Don't we need to change to CONFIG_AUTOFS_FS now?

That should be fine.  I was just picking up options from the systemd
documentation.

--pERLFGlZ1NmRkqwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ0AhUACgkQJNaLcl1U
h9D2dQf7Bg+hA2UEoKJUSzGHdBxKtM4N0Vo4ttMT86PczaVXeggmN+SgiFWss9H/
VqGlWOQVsbr5k3yrqH1rmKn/W5gh7p7XnK+UoHS9RaO0cipD5ngJ6bh1VYPWoOsM
hZgiXp2uFqAcgfP5raOl6C7HiUL9nZz6xUevOu8JaZoTKYTGmX65tns/IGVgUpl8
aDbv8YXuHOz3ePfZ4YS2yUH0z9TaHu8pE3OvYD8mtvwlDLzcQW+KzGJWEOj/weHO
ygKJY/eYqW2HBQAiHFWfbUvNHD0JqYxdmqw7wp8oWt/d9UoQrNU66QWgyMhdvC7/
b6rUHQw3vfot1nYrzAUFfcwPekqf+w==
=xf3v
-----END PGP SIGNATURE-----

--pERLFGlZ1NmRkqwe--
