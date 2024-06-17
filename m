Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFF9C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 13:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFE7EC4AF1C; Mon, 17 Jun 2024 13:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE60C2BD10;
	Mon, 17 Jun 2024 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718629457;
	bh=uG/2G0yfdvsRN88cHYTXnUndSdaYJ2nJqUx7wlqjUnc=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=Ul0QWdqM5NbnHCz9Tq6BVRvXgoQ0DDjh+QD9SpPxRORTLHDregVRwxD0W65nq2Bta
	 ig/4SZWXKAucNeN5P+KuJTC9Cfc3ColtxBIXHMHEIRUNTI11whnfDOHC0N7jvbqimh
	 BqcDg6UNinAM7auE2kWwWXlbOg6G3PJLcVfyKBsuKYJHx9sYHFWqUxsLsJiTnzPt9n
	 Umd/1IDG41q9FFj5y0X30gfRk8dnI4p5DshOBewDjdBy0TH4+GtyRlaYbLvqKyN4sn
	 jie8UB0JrjNfMTXInAnAnJS4t4XMo2Y5FLFz4VyXnvyYIuruDd33A/nnyOKJ6Ud2ke
	 tSxzGNxL5hQrQ==
Date: Mon, 17 Jun 2024 15:04:11 +0200
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
Message-ID: <20240617150411.7d448219@dellmb>
In-Reply-To: <CAHp75VdCgugaEB+FErA5j5oGNfjpwhHpX-vnDXWT=4XGA50+8A@mail.gmail.com>
References: <20240613161045.29606-1-kabel@kernel.org>
	<20240613161045.29606-12-kabel@kernel.org>
	<CAHp75VePTX3Ja61eyWjayHALKX14cSgK1QMqbFVrSRTEaJm9HA@mail.gmail.com>
	<20240617131404.592a4603@dellmb>
	<CAHp75VdCgugaEB+FErA5j5oGNfjpwhHpX-vnDXWT=4XGA50+8A@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Jun 2024 14:26:00 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, Jun 17, 2024 at 1:14=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> > On Thu, 13 Jun 2024 22:49:18 +0200
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote: =20
> > > On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kerne=
l.org> wrote: =20
>=20
> ...
>=20
> > > >         rwtm->mbox =3D mbox_request_channel(&rwtm->mbox_client, 0);
> > > >         if (IS_ERR(rwtm->mbox)) {
> > > >                 ret =3D PTR_ERR(rwtm->mbox);
> > > > -               if (ret !=3D -EPROBE_DEFER)
> > > > -                       dev_err(dev, "Cannot request mailbox channe=
l: %i\n",
> > > > -                               ret);
> > > > -               return ret; =20
> > > =20
> > > > +               if (ret =3D=3D -EPROBE_DEFER)
> > > > +                       return ret; =20
> > >
> > > What;s the point of this check, please?
> > > =20
> > > > +               return dev_err_probe(dev, ret,
> > > > +                                    "Cannot request mailbox channe=
l!\n");
> > > >         } =20
> >
> > The point is to not print the error message if we just need to wait for
> > the mailbox driver. =20
>=20
> Right, but that was the initial idea behind dev_err_probe(). Have you
> checked its implementation (and I hope it's documented as well)?
>=20

OK I am blushing now :-) Thanks, I'll drop the check
