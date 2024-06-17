Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527F2C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 10:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6F40C4AF52; Mon, 17 Jun 2024 10:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EBAC4AF1D;
	Mon, 17 Jun 2024 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718621883;
	bh=vGVqNMgn8ym0b/X0ooctaC+q7aEY+biPORpOUZ/L700=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=nUMuTVXcpNhALRwtz+OJJwl24X4V47I1rKLv3gK2ww0eZXJK8TV9gc1n68GCz16/+
	 u6Z18JZCwPDlg9lszL9W8DEgNwsvdgQSPX5sHZljM4G0iaiaG2cAvpl2k3BMfiqS8h
	 e3BxkF3vqy46VWXhBB65Vl+3FMefQv4yZfwZBbn025/6HAdbHp0nF6z8HVqwtjLGpV
	 BVfgfVlKakqT+vVGdUKRfpFxktPJrrVXvJ4UjROJRI6x7AAyDn4DbZ7ZTJ1oU+6NSS
	 YihSm9rfiFnc1jTa49vNe7NYJRaGt6LAAimXPthqGEXrCsZL2nJIn7y7sEjL8f7jNT
	 2ViHFtHmqUsew==
Date: Mon, 17 Jun 2024 12:57:58 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 03/17] firmware: turris-mox-rwtm: Use macro constant
 instead of hardcoded 4096
Message-ID: <20240617125758.05bd5208@dellmb>
In-Reply-To: <CAHp75VeRjddGOG72dkH7pvrebA2-BkzrEH2ZBk0s8Xtk-bD1ew@mail.gmail.com>
References: <20240613161045.29606-1-kabel@kernel.org>
	<20240613161045.29606-4-kabel@kernel.org>
	<CAHp75VeRjddGOG72dkH7pvrebA2-BkzrEH2ZBk0s8Xtk-bD1ew@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 19:51:56 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Jun 13, 2024 at 6:10=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> >
> > The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer being
> > allocated to one PAGE_SIZE bytes. Use new local macro constant
> > RWTM_DMA_BUFFER_SIZE at allocation time and when used in mox_hwrng_read=
(). =20
>=20
> ...
>=20
> > +#define RWTM_DMA_BUFFER_SIZE   PAGE_SIZE =20
>=20
> Is it guaranteed to work on any possible PAGE_SIZE settings? We have
> some architectures that may have it quite different to 4k. Even if
> this driver will never be run in such an environment, strictly
> speaking it might not be a good idea to replace 4096 with PAGE_SIZE.

It would work with 64K, but I will use SZ_4K from sizes.h.

> ...
>=20
> > +       if (max > RWTM_DMA_BUFFER_SIZE)
> > +               max =3D RWTM_DMA_BUFFER_SIZE; =20
>=20
> You probably want max() from minmax.c.

You mean min() :)
