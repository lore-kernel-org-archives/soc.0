Return-Path: <SRS0=M9xQ=UQ=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A669C433FE
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 15:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D214EC385A6; Wed,  6 Apr 2022 15:55:22 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BEBBC385A3
	for <soc@kernel.org>; Wed,  6 Apr 2022 15:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BEBBC385A3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nc807-0001Ow-0D; Wed, 06 Apr 2022 17:55:19 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nc807-001RVA-Mo; Wed, 06 Apr 2022 17:55:18 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1nc805-000BEk-LA; Wed, 06 Apr 2022 17:55:17 +0200
Message-ID: <6cae40d92a645781197dbdee7a301c8ddb4ca777.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates vor v5.17
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,  Sascha Hauer
 <kernel@pengutronix.de>
Date: Wed, 06 Apr 2022 17:55:17 +0200
In-Reply-To: <259b06179c0cbce518a5d8276d10d27fd5aa7247.camel@pengutronix.de>
References: <20220105172618.302522-1-p.zabel@pengutronix.de>
	 <CAK8P3a0C5Yy370KDQudiqhvU5MJ7oaj8VfCo-P4x54SVmT1HKQ@mail.gmail.com>
	 <259b06179c0cbce518a5d8276d10d27fd5aa7247.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Hi Arnd,

On Mi, 2022-02-16 at 17:51 +0100, Philipp Zabel wrote:
> > Please let me know how you would like to proceed.
>=20
> Could you pick up these two commits:
> =C2=A0 5e23c1ec4347 ("reset: renesas: Check return value of reset_control=
_deassert()")
> =C2=A0 f90f1bbe0d70 ("dt-bindings: reset: document deprecated HiSilicon p=
roperty")
> into v5.17 fixes?

I have sent a pull request [1] containing these two now.

[1] https://lore.kernel.org/all/20220406153337.1265414-1-p.zabel@pengutroni=
x.de/


regards
Philipp
