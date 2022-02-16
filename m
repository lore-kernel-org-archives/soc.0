Return-Path: <SRS0=Rl0z=S7=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5650BC433F5
	for <soc@archiver.kernel.org>; Wed, 16 Feb 2022 16:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CBBEC340ED; Wed, 16 Feb 2022 16:51:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BE29C004E1
	for <soc@kernel.org>; Wed, 16 Feb 2022 16:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BE29C004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nKNWO-0004io-U6; Wed, 16 Feb 2022 17:51:16 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nKNWO-00Gzwh-Qh; Wed, 16 Feb 2022 17:51:16 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nKNWM-001luP-SI; Wed, 16 Feb 2022 17:51:14 +0100
Message-ID: <259b06179c0cbce518a5d8276d10d27fd5aa7247.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates vor v5.17
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,  Sascha Hauer
 <kernel@pengutronix.de>
Date: Wed, 16 Feb 2022 17:51:14 +0100
In-Reply-To: <CAK8P3a0C5Yy370KDQudiqhvU5MJ7oaj8VfCo-P4x54SVmT1HKQ@mail.gmail.com>
References: <20220105172618.302522-1-p.zabel@pengutronix.de>
	 <CAK8P3a0C5Yy370KDQudiqhvU5MJ7oaj8VfCo-P4x54SVmT1HKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Hi Arnd,

On Tue, 2022-02-08 at 11:06 +0100, Arnd Bergmann wrote:
On Wed, Jan 5, 2022 at 6:26 PM Philipp Zabel <p.zabel@pengutronix.de>
wrote:
>=20
> Dear arm-soc maintainers,
>=20
> The following changes since commit
> fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>=20
> =C2=A0 Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.17
>=20
> for you to fetch changes up to
> 89e7a6698fdd6d0cccf5bab11abc51f813944cd8:
>=20
> =C2=A0 reset: uniphier-glue: Use devm_add_action_or_reset() (2021-12-16
> 09:59:55 +0100)
>=20
> ----------------------------------------------------------------
> Reset controller updates vor v5.17
>=20
> Add an optional variant of of_reset_control_get_exclusive(),
> document
> a deprecated hi3660-reset device tree property, check whether reset
> deassertion worked in the reset-rzg2l-usbphy-ctrl driver, and
> simplify
> the uniphier-glue driver a bit.

Hi Philipp,

As you probably noticed, we made a mistake here and this branch
ended up not making it into v5.17-rc1, sorry about that.

Thank you for the notice. I was on vacation, blissfully unaware :)

> As far as I can tell, there are three bugfixes that we probably want
> in v5.17 after all, but the of_reset_control_get_optional_exclusive()
> interface is probably v5.18 material, as this is not a bugfix.

That one already made its way into v5.17-rc1 via timers, commit
863298738076 ("Merge branch 'reset/of-get-optional-exclusive' of
git://git.pengutronix.de/pza/linux into timers/drivers/next").

There are no dependencies on it in the reset queue, so I think we can
just drop it, no furter action required.=20

> If you like, I can cherry-pick the contents into the 5.17 fixes
> branch
> and the 5.18 drivers branch, or you can send me updated pull
> requests that incorporate more changes you have already queued.
>=20
> Please let me know how you would like to proceed.

Could you pick up these two commits:
  5e23c1ec4347 ("reset: renesas: Check return value of reset_control_deasse=
rt()")
  f90f1bbe0d70 ("dt-bindings: reset: document deprecated HiSilicon property=
")
into v5.17 fixes?

The remaining two commits:
  89e7a6698fdd ("reset: uniphier-glue: Use devm_add_action_or_reset()")
  9568d0259fec ("reset: uniphier-glue: Use reset_control_bulk API")
are not really bugfixes, I'd just move them over into my for-v5.18
queue and send them again with the next pull request.

regards
Philipp
