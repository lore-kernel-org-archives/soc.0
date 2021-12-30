Return-Path: <SRS0=pOrI=RP=bootlin.com=miquel.raynal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3092C433F5
	for <soc@archiver.kernel.org>; Thu, 30 Dec 2021 15:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79A6FC36AEC; Thu, 30 Dec 2021 15:49:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3719DC36AE9;
	Thu, 30 Dec 2021 15:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3719DC36AE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AF2581C0005;
	Thu, 30 Dec 2021 15:49:02 +0000 (UTC)
Date: Thu, 30 Dec 2021 16:49:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] memory: omap: drivers for v5.17
Message-ID: <20211230164901.4fbf8cc3@xps13>
In-Reply-To: <20211224111124.6097-2-krzysztof.kozlowski@canonical.com>
References: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
	<20211224111124.6097-2-krzysztof.kozlowski@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof, Arnd, Olof,

krzysztof.kozlowski@canonical.com wrote on Fri, 24 Dec 2021 12:11:24
+0100:

> Hi Arnd and Olof,
>=20
> Separate topic branch for omap-gpmc driver. This includes changes to
> mtd-nand-omap2 driver (acked by Miquel) *which will conflict NAND tree*:
>=20
> 1. The "of_device_id omap_nand_ids" is moved to header
>    ../platform_data/mtd-nand-omap2.h.
> 2. New compatible is added to above "of_device_id omap_nand_ids".
>=20
> One way to avoid pushing this conflict to Linus, would be if Miquel would
> actually pull this request instead of soc tree.

Sorry for the mess, I didn't spot the conflict when sending my Ack to
Krysztof.

I will pull this to simplify the handling.

Thanks,
Miqu=C3=A8l

>=20
> Proper resolution looks like:
> ----------------------------------------------------------------
> diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux=
/platform_data/mtd-nand-omap2.h
> index 92f011805ad4..8c2f1f185353 100644
> --- a/include/linux/platform_data/mtd-nand-omap2.h
> +++ b/include/linux/platform_data/mtd-nand-omap2.h
> @@ -65,6 +65,7 @@ struct gpmc_nand_regs {
> =20
>  static const struct of_device_id omap_nand_ids[] =3D {
>  	{ .compatible =3D "ti,omap2-nand", },
> +	{ .compatible =3D "ti,am64-nand", },
>  	{},
>  };
> ----------------------------------------------------------------
>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0d=
bf:
>=20
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git=
 tags/memory-controller-drv-omap-5.17
>=20
> for you to fetch changes up to dbcb124acebd8148e9e858a231f1798956dd3ca6:
>=20
>   mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3 (2021-12-22 =
16:51:43 +0100)
>=20
> ----------------------------------------------------------------
> Memory controller drivers for v5.14 - OMAP GPMC
>=20
> 1. Add support for AM64 SoC.
> 2. Minor improvement: use platform_get_irq().
>=20
> ----------------------------------------------------------------
> Lad Prabhakar (1):
>       memory: omap-gpmc: Use platform_get_irq() to get the interrupt
>=20
> Roger Quadros (4):
>       dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
>       memory: omap-gpmc: Add support for GPMC on AM64 SoC
>       memory: omap-gpmc: Use a compatible match table when checking for N=
AND controller
>       mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3
>=20
>  .../bindings/memory-controllers/ti,gpmc.yaml       | 23 +++++++++-
>  drivers/memory/omap-gpmc.c                         | 50 ++++++++++++++--=
------
>  drivers/mtd/nand/raw/Kconfig                       |  1 +
>  drivers/mtd/nand/raw/omap2.c                       |  5 +--
>  include/linux/platform_data/mtd-nand-omap2.h       |  9 +++-
>  5 files changed, 65 insertions(+), 23 deletions(-)
