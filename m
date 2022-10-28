Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B024BECAAA1
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 00:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 963B8C4347C; Fri, 28 Oct 2022 00:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEEEC43470;
	Fri, 28 Oct 2022 00:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666916539;
	bh=fyw1edph3P2MXEHoR2fB+TjHqc4CB/i5u1tZmEhd4oM=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=Rn4a6vpTAtpaL0z1rC7CjUEAR1Ilvytss0UD5Ahq00bYjN2WoI+zfQCoEu9AJCxc5
	 jk36cWvqudnAbOKYtAikHQfeXU4snY0QSNLLZ96QA0/tqyBSoJivAx1UoXUZMkeB9i
	 d9boGCwGiMGSjN/8Eikvonx4NMGi8tc70mOrd70RVHT1Q/b77A9tVJ5NTkDtdfyAE6
	 Vbg+OUXoypWUUXw9RCSKIXKhJ+Uf2puATQvUbjC5A48bqwn7VwCa2HwR6Yqxj0iBqn
	 aZr8s43+pMQ1l719PkuRmenUekBnvZf7rMSDMiGTlkAdXzZ05NkwcOND/2pdFB6pfq
	 5yWPgZaBMZJkA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221019133208.319626-7-kory.maincent@bootlin.com>
References: <20221019133208.319626-1-kory.maincent@bootlin.com> <20221019133208.319626-7-kory.maincent@bootlin.com>
Subject: Re: [PATCH 6/6] clk: spear: Fix SSP clock definition on SPEAr600
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: thomas.petazzoni@bootlin.com, Kory Maincent <kory.maincent@bootlin.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 27 Oct 2022 17:22:17 -0700
User-Agent: alot/0.10
Message-Id: <20221028002219.6AEEEC43470@smtp.kernel.org>

Quoting K=C3=B6ry Maincent (2022-10-19 06:32:08)
> From: Kory Maincent <kory.maincent@bootlin.com>
>=20
> There is no SPEAr600 device named "ssp-pl022.x". Instead, the description
> of the SSP (Synchronous Serial Port) was recently added to the Device Tre=
e,
> and the device name is "xxx.spi", so we should associate the SSP gateable
> clock to these device names.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Does this need a Fixes tag?
