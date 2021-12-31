Return-Path: <SRS0=3/FO=RQ=bootlin.com=miquel.raynal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A25C433F5
	for <soc@archiver.kernel.org>; Fri, 31 Dec 2021 12:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 718B2C36AEC; Fri, 31 Dec 2021 12:18:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78C09C36AEB;
	Fri, 31 Dec 2021 12:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78C09C36AEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9405A1BF206;
	Fri, 31 Dec 2021 12:18:04 +0000 (UTC)
Date: Fri, 31 Dec 2021 13:18:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] memory: omap: drivers for v5.17
Message-ID: <20211231131803.08fb5d49@xps13>
In-Reply-To: <20211230164901.4fbf8cc3@xps13>
References: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
	<20211224111124.6097-2-krzysztof.kozlowski@canonical.com>
	<20211230164901.4fbf8cc3@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

miquel.raynal@bootlin.com wrote on Thu, 30 Dec 2021 16:49:01 +0100:

> Hi Krzysztof, Arnd, Olof,
>=20
> krzysztof.kozlowski@canonical.com wrote on Fri, 24 Dec 2021 12:11:24
> +0100:
>=20
> > Hi Arnd and Olof,
> >=20
> > Separate topic branch for omap-gpmc driver. This includes changes to
> > mtd-nand-omap2 driver (acked by Miquel) *which will conflict NAND tree*:
> >=20
> > 1. The "of_device_id omap_nand_ids" is moved to header
> >    ../platform_data/mtd-nand-omap2.h.
> > 2. New compatible is added to above "of_device_id omap_nand_ids".
> >=20
> > One way to avoid pushing this conflict to Linus, would be if Miquel wou=
ld
> > actually pull this request instead of soc tree. =20
>=20
> Sorry for the mess, I didn't spot the conflict when sending my Ack to
> Krysztof.
>=20
> I will pull this to simplify the handling.

Pulled into nand/next, thanks!

Miqu=C3=A8l
