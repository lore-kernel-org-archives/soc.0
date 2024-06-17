Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E1EC27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 11:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C2B6C4AF48; Mon, 17 Jun 2024 11:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DB0C2BD10;
	Mon, 17 Jun 2024 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718622617;
	bh=5g95CklNOlOOdqT4+7OV5Cn+RCh5BsdNxmAsGqoWT94=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=MQTG5pI7nB70q7cqzhyo6EtMVFyJuoUvS3q+YcZlRDrgVN0X4cl2JiLdsa9Vk/oBf
	 hV7t/EhHolqLP7ldkpxzQ3vKxv5kiHixHgctyoRQgaWqdM92xejC+uVUyJfk/OHpb6
	 5AitjmeHyH5YFpQ8H05j4eJtR8q5VP4/Y5IA73aLG2HFUe8E3UGPFE/8Hv54k3Dfmn
	 QA0fh++gXUAKHCkw0bnF2rxWz0iGqt7oss6DqHyyBMICpYyxkU8QbK5/A+ypu1UBEX
	 5iw6E2sIYPEK0sagnNHTqKShRGGSFiehBhvfF1DhCCtbrAwxh/7mKQCE9xEUOU1VQ/
	 3AeWpRUnTY3oA==
Date: Mon, 17 Jun 2024 13:10:11 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 09/17] firmware: turris-mox-rwtm: Simplify debugfs
 code
Message-ID: <20240617131011.0bb67df5@dellmb>
In-Reply-To: <CAHp75Vd8_57Jcx-QbHdjt0Ji6p=2Wt2SULnuHRRWz0cucM2H+w@mail.gmail.com>
References: <20240613161045.29606-1-kabel@kernel.org>
	<20240613161045.29606-10-kabel@kernel.org>
	<CAHp75Vd8_57Jcx-QbHdjt0Ji6p=2Wt2SULnuHRRWz0cucM2H+w@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 22:37:39 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> >
> > Simplify debugfs code: do not check for errors, as debugfs errors should
> > be ignored, and use devm action for dropping the debugfs directory. =20
>=20
> ...
>=20
> > -static void rwtm_unregister_debugfs(struct mox_rwtm *rwtm)
> > +static void rwtm_register_debugfs(struct mox_rwtm *rwtm)
> >  {
> > -       debugfs_remove_recursive(rwtm->debugfs_root);
> > +       struct dentry *root;
> > +
> > +       root =3D debugfs_create_dir("turris-mox-rwtm", NULL);
> > +
> > +       devm_add_action_or_reset(rwtm->dev, rwtm_debugfs_release, root)=
; =20
>=20
> This is incorrect. If devm_add_action() fails, the root will be removed...
>=20
> > +       debugfs_create_file_unsafe("do_sign", 0600, root, rwtm, &do_sig=
n_fops); =20
>=20
> ...and this most likely will use the dangling pointer.

OK, I will first creae the file and then add the action.
