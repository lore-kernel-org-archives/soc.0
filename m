Return-Path: <SRS0=gHlk=GR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C783C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 15:54:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2860B23B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 15:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2860B23B2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F8ZWmb1nXD/oPGLtp47Zxj8le18zAjGnfRhF5sG5YmU=; b=Kt8D2nEd6i6qyDlYF7Kgk77w0
	4jYFBXLXNoNnhhlTl9ons45G8baBK9+4eMPUPD+LK2qZ66rxdS7IQyCmSMWesxwcrfLsM8P5WQfnu
	YEzqMMs2GopAx/h6efsrWDv0SZVMAl/KbcteFD9MrQmurAcv6TTR62WsSCyQG+K2MiTBY0NKc81JX
	L9w5nRCilesZJQ+vVMob6IJ5JRTU068Z6IN+PQChe9z2gAzXmBFNszAJC4pcjEm2x/TRPlirlrsWY
	mo2paRncnwi5ZsYjlq1HlMQC27I+55UCg6voI+wHIc7jTW0LulRxQb1wgSXuUIZyLeDnYn7v9MCS/
	k6DeBel5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l04vN-000583-0v; Thu, 14 Jan 2021 15:52:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l04vJ-000579-Ml
 for linux-arm-kernel@lists.infradead.org; Thu, 14 Jan 2021 15:52:34 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l04vC-0006hJ-Rq; Thu, 14 Jan 2021 16:52:26 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l04vC-0003NV-9k; Thu, 14 Jan 2021 16:52:26 +0100
Date: Thu, 14 Jan 2021 16:52:26 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 6/7] tty: Drop unused efm32 serial driver
Message-ID: <20210114155226.fwca655hxkj43ksf@pengutronix.de>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
 <20210114151630.128830-7-u.kleine-koenig@pengutronix.de>
 <YABkcwgOLhrRZqRK@kroah.com>
MIME-Version: 1.0
In-Reply-To: <YABkcwgOLhrRZqRK@kroah.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_105233_793645_EF1AA76E 
X-CRM114-Status: GOOD (  17.57  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-serial@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 kernel@pengutronix.de, Olof Johansson <olof@lixom.net>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2903608753899106853=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210114155226.R6EbJr4kQZiTQKlTx7cD48szAvP7j9V3VUufo1WNQaQ@z>


--===============2903608753899106853==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wq4o5ql7etxfthma"
Content-Disposition: inline


--wq4o5ql7etxfthma
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 04:34:11PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Jan 14, 2021 at 04:16:29PM +0100, Uwe Kleine-K=F6nig wrote:
> > Support for this machine was just removed, so drop the now unused UART
> > driver, too.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/tty/serial/Kconfig       | 13 -------------
> >  drivers/tty/serial/Makefile      |  1 -
> >  include/uapi/linux/serial_core.h |  3 ---
> >  3 files changed, 17 deletions(-)
>=20
> Shouldn't you delete the .c file for the serial driver in this patch as
> well?

Yes indeed. I did so in the wrong patch (#1) :-\

I will fix this in my tree for v2.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wq4o5ql7etxfthma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAAaLUACgkQwfwUeK3K
7AkmUgf/XBt8Jep6Xkng+vi6OrgT1qzAsT+LfPwQJOyDuViFOqs+4Ci7T8U7tzUm
YL49y9Hlf5Erkg61cQ4VUbOpmTubKElJuqkoQeY75LkGyxRzNIloWtJioWXXacYk
H/8UMNh3lSj7DcyTj3oponcvPd/KWwM1k5JrqdFkgYq+jB4kp/0+7Fdt8E/KVXw7
gVV1AOy6YlAwrI8bEWCGb/MQgcgKuONYIiZ0oLr1UrNrHHGvQM4Yb7x3Etxa/LZ8
G6X0lK2kJOxEvn3M31g1upsZlt2JEsJiXu41Ji0TvCII/YUKFp5H+7pKkTqllHei
KyMdxs1bU/3MY7rIHSQqthl/VcPx2Q==
=MH6m
-----END PGP SIGNATURE-----

--wq4o5ql7etxfthma--


--===============2903608753899106853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2903608753899106853==--

