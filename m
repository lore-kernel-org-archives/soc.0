Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FA4C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 11:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C5C9C4AF4D; Mon, 17 Jun 2024 11:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899B8C4AF1A;
	Mon, 17 Jun 2024 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718622785;
	bh=8fj4HrEnPNXzbdjq9WPfwbaVLR4KYW+dlJeSWrJqoQU=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=IsWA4kL/i5Js9jPyo/IPjA8YYKSrF5tSJ/8ABWFFadRjBF3Mo342TPQTe4B4dfmZK
	 g6po7NCun+/gerHzNacyQPOcndZvp4Tyw1Vk6QKVTkwyHsWq6Vx/MEq69Zh0nNfDVu
	 aIeLbOUpTpKCzJiLS5VBSNra+c1PQDSGCYxh0PGvHvri+Wty8AM1XUZRX5VIm06ZjY
	 Rvb3De43HpYwfg33B0gFLyghCqeZqCXcHyup5JYy5j+3Fz22DnILTPbUFiHXWi+qG6
	 kjl9laiZVs/ZF2LinQrTr9j5VdHoW4oJXFKE2fLgYC/tm7b1WY8PPJCbMfNgPTzLI8
	 UHQynHwEMySiA==
Date: Mon, 17 Jun 2024 13:13:00 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 10/17] firmware: turris-mox-rwtm: Convert rest to
 devm_* and get rid of driver .remove()
Message-ID: <20240617131300.4d48c647@dellmb>
In-Reply-To: <CAHp75VcCjo9MTdsV7qgGk+zDgGp-QXM3tfUfMXYyVM3Ye5ig9g@mail.gmail.com>
References: <20240613161045.29606-1-kabel@kernel.org>
	<20240613161045.29606-11-kabel@kernel.org>
	<CAHp75VcCjo9MTdsV7qgGk+zDgGp-QXM3tfUfMXYyVM3Ye5ig9g@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 22:39:33 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> >
> > Use devm resource management for driver's mailbox. This allows us to get
> > rid of driver's .remove() method and gotos in .probe(). =20
>=20
> of the driver's
>=20
> ...
>=20
> > +       ret =3D devm_add_action_or_reset(dev, rwtm_devm_mbox_release, r=
wtm->mbox);
> > +       if (ret < 0) =20
>=20
> Can it return positive codes? If not, why ' < 0'?
>

Right...
