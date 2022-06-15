Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858F2C433EF
	for <soc@archiver.kernel.org>; Wed, 15 Jun 2022 19:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4DE12C3411F; Wed, 15 Jun 2022 19:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B74C34115;
	Wed, 15 Jun 2022 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655319705;
	bh=grI/E/QZ5ERwT9OO/ZQPCT8dkKTt7PUUnI2KLjlKE8Q=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=OpRplBTxWLKoGMpgWbF0oXpFX6G+Qpdqxg2Kt1NSMe2/OBoXX9+inOAAiCoWM+qYu
	 5as/CbL1wOdFy4N3vq+xlnFDV/dAh99seZnP6yqeEhfmM/StAoNN7makdOHuZkigke
	 o3rUCuokHu63hoSVVWoX2AcKLioipV/SlLqKvBZJQ8g8NznNtQ1kr1m1ftYYGFpEFw
	 GJk738goof5YUtUOxqW8/QAPxpSol1LmAbgTkhPBRxPvnBZc42bdlrlcMB8xHUYlIx
	 OMW+HDIiCvbcHIlj5x4tBdO/Lb4G3XDYRp34Cbjui7dqoT+mf/v5uH0WPjetO6xeS2
	 vn9DgohZWM+vQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aaf96491f1a94b5694003797853aa732@cqplus1.com>
References: <cover.1655194858.git.qinjian@cqplus1.com> <42ed93cf0e5cfeaffdf50d63da558a3f1f6c1021.1655194858.git.qinjian@cqplus1.com> <20220614192555.86436C3411B@smtp.kernel.org> <aaf96491f1a94b5694003797853aa732@cqplus1.com>
Subject: RE: [PATCH v18 05/10] clk: Add Sunplus SP7021 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org <krzysztof.kozlowski+dt@linaro.org>, robh+dt@kernel.org <robh+dt@kernel.org>, mturquette@baylibre.com <mturquette@baylibre.com>, linux@armlinux.org.uk <linux@armlinux.org.uk>, arnd@arndb.de <arnd@arndb.de>, olof@lixom.net <olof@lixom.net>, soc@kernel.org <soc@kernel.org>, linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>
To: <qinjian@cqplus1.com>
Date: Wed, 15 Jun 2022 12:01:43 -0700
User-Agent: alot/0.10
Message-Id: <20220615190145.29B74C34115@smtp.kernel.org>

Quoting qinjian (2022-06-14 19:25:22)
> > > diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> > > new file mode 100644
> > > index 000000000..0caef1bc7
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-sp7021.c
> > > @@ -0,0 +1,725 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >=20
> > This isn't a common license on driver files. Is it intended? Or
> > copy/paste from DT?
>=20
> Yes, I copy/paste from DT.
> Did I need changed it to 'GPL-2.0-only'?

It's up to you.

>=20
> Should I use __devm_clk_hw_register_gate() with parent_data
> or
> devm_clk_hw_register_gate() with parent_name?
>=20

Please add a devm_clk_hw_register_gate_parent_data() and use that.
