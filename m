Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B451AC27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 11:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BD66C4AF1D; Mon, 17 Jun 2024 11:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25110C2BD10;
	Mon, 17 Jun 2024 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718622849;
	bh=hiOz/a5MvNzI6raAiQizavQECRkliy2q7gjBwWohjYw=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=hBkJwJY9J48jKZvJW79RsdSVux9oSonPBc9hxt9dfg9JrjKNnQ3qkjkgATeMu3HEu
	 R1viEn7FGXLw3C0k1E/djdEX+4PxzGlaWAUVKxCu72jP4hvu+GCA/AMf1BUwzYZIKh
	 u7rUAC+MkPLmObWER5XldMjwikc6DOp/TM+OaWBbUce+pr9AYsHjADn4JJF56oJqXa
	 TPnG8r2EuzCpjRHFJHErCXj0t7YeJ0+h5FAR5TS/Fr9rd1Av2x5DszD8on17UIyTJO
	 4M2DEvC/l3PavoMTEHZL5TiVHfVNc+G0fOzoWoK1mJQ9Ce9uABCXrdC9oGCi+DESyu
	 304PFcq21jsLA==
Date: Mon, 17 Jun 2024 13:14:04 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 11/17] firmware: turris-mox-rwtm: Use dev_err_probe()
 where possible
Message-ID: <20240617131404.592a4603@dellmb>
In-Reply-To: <CAHp75VePTX3Ja61eyWjayHALKX14cSgK1QMqbFVrSRTEaJm9HA@mail.gmail.com>
References: <20240613161045.29606-1-kabel@kernel.org>
	<20240613161045.29606-12-kabel@kernel.org>
	<CAHp75VePTX3Ja61eyWjayHALKX14cSgK1QMqbFVrSRTEaJm9HA@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 22:49:18 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> >
> > Use dev_err_probe() where possible in the driver's .probe() method. =20
>=20
> ...
>=20
> >         rwtm->mbox =3D mbox_request_channel(&rwtm->mbox_client, 0);
> >         if (IS_ERR(rwtm->mbox)) {
> >                 ret =3D PTR_ERR(rwtm->mbox);
> > -               if (ret !=3D -EPROBE_DEFER)
> > -                       dev_err(dev, "Cannot request mailbox channel: %=
i\n",
> > -                               ret);
> > -               return ret; =20
>=20
> > +               if (ret =3D=3D -EPROBE_DEFER)
> > +                       return ret; =20
>=20
> What;s the point of this check, please?
>=20
> > +               return dev_err_probe(dev, ret,
> > +                                    "Cannot request mailbox channel!\n=
");
> >         } =20
>=20
>=20

The point is to not print the error message if we just need to wait for
the mailbox driver.
