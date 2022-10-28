Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A92FA373D
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 00:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2892C433D7; Fri, 28 Oct 2022 00:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6573C433D6;
	Fri, 28 Oct 2022 00:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666916509;
	bh=IYSxprOBGZXOqjMhH3KDI1lPOnEG+A9vAL8HVW8xkjk=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=LqjHal5ANyuCjdv5SH39PO1qVOBGdUpjsdgzC6fz6os2iENiQhM9UwF+lba2tGARw
	 9+QnlBZIbQZgc61zvXJWeyT8OCckDAO4EkLN0+7wiFJMI4LZ711k+q+xyfshVe0B5l
	 /FR9PoByPbW7rPJ69LFirxLpDXzb2dXYWUKxUlhXrdASAqFmT8ex9HeB24nCsfKmpp
	 HJFN+/WFUCp8osXes/zDGKbAEMSK4rrTURv2oyXPWiOFh+pE2jMt/e1PN5M7igURhF
	 1wAg2ZS9ku2vyG2v2iIaBapNiXLpiytMZImFjqgHriPWQuxn//TAJyt0Q6p5iXjgWE
	 28HYTNOPIrVYg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221019133208.319626-5-kory.maincent@bootlin.com>
References: <20221019133208.319626-1-kory.maincent@bootlin.com> <20221019133208.319626-5-kory.maincent@bootlin.com>
Subject: Re: [PATCH 4/6] clk: spear: Fix CLCD clock definition on SPEAr600
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: thomas.petazzoni@bootlin.com, Kory Maincent <kory.maincent@bootlin.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 27 Oct 2022 17:21:47 -0700
User-Agent: alot/0.10
Message-Id: <20221028002149.A6573C433D6@smtp.kernel.org>

Quoting K=C3=B6ry Maincent (2022-10-19 06:32:06)
> From: Kory Maincent <kory.maincent@bootlin.com>
>=20
> There is no SPEAr600 device named "clcd". Instead, the description of the
> CLCD (color liquid crystal display controller) name is "fc200000.clcd", so
> we should associate the CLCD gateable clock to this device name.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Does this need a Fixes tag?
