Return-Path: <SRS0=1P0Y=TE=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F4C433F5
	for <soc@archiver.kernel.org>; Mon, 21 Feb 2022 12:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04D8EC340EC; Mon, 21 Feb 2022 12:14:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68F18C340E9
	for <soc@kernel.org>; Mon, 21 Feb 2022 12:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68F18C340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nM7a3-0002rE-62; Mon, 21 Feb 2022 13:14:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nM7a2-000Q35-HD; Mon, 21 Feb 2022 13:14:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nM7a1-004are-49; Mon, 21 Feb 2022 13:14:13 +0100
Date: Mon, 21 Feb 2022 13:14:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lubomir Rintel <lkundrak@v3.sk>, Russell King <linux@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	soc@kernel.org
Subject: Re: [PATCH] ARM: mmp: Fix failure to remove sram device
Message-ID: <20220221121412.st63puug6tcpjq72@pengutronix.de>
References: <20210726200158.3442800-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dveipk4cw4ij6cvd"
Content-Disposition: inline
In-Reply-To: <20210726200158.3442800-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org


--dveipk4cw4ij6cvd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[adding soc@kernel.org to Cc]

On Mon, Jul 26, 2021 at 10:01:58PM +0200, Uwe Kleine-K=F6nig wrote:
> Make sure in .probe() to set driver data before the function is left to
> make it possible in .remove() to undo the actions done.
>=20
> This fixes a potential memory leak and stops returning an error code in
> .remove() that is ignored by the driver core anyhow.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

This problem is still real and the patch not applied. Who feels
responsible to pick this up?

> ---
>  arch/arm/mach-mmp/sram.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/arm/mach-mmp/sram.c b/arch/arm/mach-mmp/sram.c
> index 6794e2db1ad5..ecc46c31004f 100644
> --- a/arch/arm/mach-mmp/sram.c
> +++ b/arch/arm/mach-mmp/sram.c
> @@ -72,6 +72,8 @@ static int sram_probe(struct platform_device *pdev)
>  	if (!info)
>  		return -ENOMEM;
> =20
> +	platform_set_drvdata(pdev, info);
> +
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (res =3D=3D NULL) {
>  		dev_err(&pdev->dev, "no memory resource defined\n");
> @@ -107,8 +109,6 @@ static int sram_probe(struct platform_device *pdev)
>  	list_add(&info->node, &sram_bank_list);
>  	mutex_unlock(&sram_lock);
> =20
> -	platform_set_drvdata(pdev, info);
> -
>  	dev_info(&pdev->dev, "initialized\n");
>  	return 0;
> =20
> @@ -127,17 +127,19 @@ static int sram_remove(struct platform_device *pdev)
>  	struct sram_bank_info *info;
> =20
>  	info =3D platform_get_drvdata(pdev);
> -	if (info =3D=3D NULL)
> -		return -ENODEV;
> =20
> -	mutex_lock(&sram_lock);
> -	list_del(&info->node);
> -	mutex_unlock(&sram_lock);
> +	if (info->sram_size) {
> +		mutex_lock(&sram_lock);
> +		list_del(&info->node);
> +		mutex_unlock(&sram_lock);
> +
> +		gen_pool_destroy(info->gpool);
> +		iounmap(info->sram_virt);
> +		kfree(info->pool_name);
> +	}
> =20
> -	gen_pool_destroy(info->gpool);
> -	iounmap(info->sram_virt);
> -	kfree(info->pool_name);
>  	kfree(info);
> +
>  	return 0;
>  }

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dveipk4cw4ij6cvd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmITghAACgkQwfwUeK3K
7AnXAgf/ZFAtnmEkU5C5Or5RBYGW4UfBP/l47sk14zWR3inoZ0/QLmT1+YsJ+o1N
hbB80OeSatNVBy4H0tncnjWzhrUKIPGkqjj9PusgQSFQAGEIyp54F0dZZ6jmtZT4
vJgdc7AjgA81CEw/FyDIbNm1hiO5JIOTSyDk42sHVi0KaB4CYDreYjyL/uFoFAi6
jDBTYatOwFh2asRDScRfsGCIq18ieYki7YH5KzSlcXGTzQJl47cYDK8wFT3FWVMk
8bsuAFCLimIsPukgfENW4/1oImx0PwSCvoJYz4R9ebcIuPdkKr+InKiv1Q/rwPNO
mSaZCqVOaVpI9kizs85sJTZz410/3Q==
=it05
-----END PGP SIGNATURE-----

--dveipk4cw4ij6cvd--
