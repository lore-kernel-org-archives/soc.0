Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7F7EB64D7
	for <soc@archiver.kernel.org>; Mon, 26 Jun 2023 16:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC7C9C433C9; Mon, 26 Jun 2023 16:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82919C433C8;
	Mon, 26 Jun 2023 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687795769;
	bh=h/4Z7NwROt2ZENLYvrrrF+SAxq3Wvkry/wxj+n2ezvY=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=ZrU2uFbyqnaPbg9sAW4tMkfscIM4gtj+NACyIgI/h7+hc8WkpX55ewlWLHlfA6l1J
	 t5VW87sY4JaTgR9zFfzgeNM3DstLLDyplMrOf34Kvk7VtC1FidfYDmx58mbid6uJmQ
	 8GcJ64YZazEaG8KBdo8zv8eb4/LvxhqHQd4IakFHEnNaH0aqy6MJ5WJ8V+9ualBO+c
	 ILAa0UljDXs5dqJawZDtmRCrW+buLQX0E3onEW+EVtHDPNZQlRE+lLxdb4Jp5DXJJ3
	 u3qWuYjelg4wWjv34WemtP957DiPojw/ZZJW6stAUBJQDyjEODkvQ41+GDyrGx0cwe
	 NqJfKPXQ/K0Zg==
Message-ID: <be147a766979642ac518710e6ff99a11.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230622141343.13595-4-ychuang570808@gmail.com>
References: <20230622141343.13595-1-ychuang570808@gmail.com> <20230622141343.13595-4-ychuang570808@gmail.com>
Subject: Re: [PATCH v3 3/3] clk: nuvoton: Use clk_parent_data instead of string for parent clock
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, soc@kernel.org, krzysztof.kozlowski+dt@linaro.org, schung@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
To: Jacky Huang <ychuang570808@gmail.com>, arnd@arndb.de, gregkh@linuxfoundation.org, mturquette@baylibre.com
Date: Mon, 26 Jun 2023 09:09:27 -0700
User-Agent: alot/0.10

Quoting Jacky Huang (2023-06-22 07:13:43)
> From: Jacky Huang <ychuang3@nuvoton.com>
>=20
> For the declaration of parent clocks, use struct clk_parent_data instead
> of a string. Due to the change in the passed arguments, replace the usage
> of devm_clk_hw_register_mux() with clk_hw_register_mux_parent_data() for
> all cases.
>=20
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 306 ++++++++++++++++++++++---------
>  1 file changed, 219 insertions(+), 87 deletions(-)
>=20
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index 733750dda0f4..f1fe7edd21b5 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -63,167 +63,298 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>  #define PLL_MODE_SS             2
> =20
>  static const struct clk_parent_data ca35clk_sel_clks[] =3D {
> -       { .index =3D 0 },  /* HXT */
> -       { .index =3D 1 },  /* CAPLL */
> -       { .index =3D 2 }   /* DDRPLL */
> +       { .fw_name =3D "hxt", },
> +       { .fw_name =3D "capll", },
> +       { .fw_name =3D "ddrpll", },

Is there any reason why this changed from numbers to strings? It is
faster to directly index vs. access the clock-names property. The
preference is to use the index field and only use fw_name if we're
migrating legacy clk drivers to use DT based lookups.
