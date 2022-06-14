Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EAFC43334
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 19:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B07AEC3411E; Tue, 14 Jun 2022 19:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86436C3411B;
	Tue, 14 Jun 2022 19:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655234755;
	bh=zR4N6VFQrTCHnvSWBbsp4C65ceeJXY4ywAxcS0YZrjw=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=f2CSbF3r+QJeBCBKi/nH+JCmfalOxnJcoqS6v5dNMKb/0K4LAvDhwXzzgL8v5LXa+
	 jqiA+0vWxDuXcBHYK0+yTzZm8o8auoVqHE7dZolGP6wquoKGXajarJ5k3hR2D7vCHb
	 j16x/awsEn3yYDSoUDb5I61S2Em0UPgAtq3pqS/s8hMTl+icLw6ph+Xmh8eIkJH3An
	 9TwRN4U2r2tkC9AMaqrkimOv9IiTjg36yHbDoMvBHMsOOyysHjDZ3nxmAL5/c/fmxY
	 yOawj7GIarD1MhpMnwCC98WLNj9KuDwgp0I5i15Un7NJy9GPw4ix4rysAT1AqpzYrK
	 Dp8ouTSM0dPvg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42ed93cf0e5cfeaffdf50d63da558a3f1f6c1021.1655194858.git.qinjian@cqplus1.com>
References: <cover.1655194858.git.qinjian@cqplus1.com> <42ed93cf0e5cfeaffdf50d63da558a3f1f6c1021.1655194858.git.qinjian@cqplus1.com>
Subject: Re: [PATCH v18 05/10] clk: Add Sunplus SP7021 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Qin Jian <qinjian@cqplus1.com>
To: Qin Jian <qinjian@cqplus1.com>
Date: Tue, 14 Jun 2022 12:25:53 -0700
User-Agent: alot/0.10
Message-Id: <20220614192555.86436C3411B@smtp.kernel.org>

Quoting Qin Jian (2022-06-14 01:31:04)
> diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> new file mode 100644
> index 000000000..0caef1bc7
> --- /dev/null
> +++ b/drivers/clk/clk-sp7021.c
> @@ -0,0 +1,725 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

This isn't a common license on driver files. Is it intended? Or
copy/paste from DT?

> +/*
> + * Copyright (C) Sunplus Technology Co., Ltd.
> + *       All rights reserved.
> + */
[...]
> +
> +static int sp7021_clk_probe(struct platform_device *pdev)
> +{
[...]
> +
> +       /* gates */
> +       for (i =3D 0; i < ARRAY_SIZE(sp_clk_gates); i++) {
> +               char name[10];
> +               u32 j =3D sp_clk_gates[i].reg;
> +               struct clk_parent_data *pd =3D sp_clk_gates[i].ext_parent=
 ? &pd_ext : &pd_sys;
> +
> +               sprintf(name, "%02d_0x%02x", i, j);
> +               hws[i] =3D clk_hw_register_gate_parent_data(dev, name, pd=
, 0,

This needs to be devm as well. Otherwise if the driver is unbound we'll
leak these registered clks.

> +                                                         clk_base + (j >=
> 4) * 4,
> +                                                         j & 0x0f,
> +                                                         CLK_GATE_HIWORD=
_MASK,
> +                                                         NULL);
> +               if (IS_ERR(hws[i])) {
> +                       ret =3D PTR_ERR(hws[i]);
> +                       goto unregister_gates;
> +               }
> +       }
> +
> +       clk_data->num =3D CLK_MAX;
> +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, c=
lk_data);
> +       if (ret)
> +               goto unregister_gates;
> +
> +       return 0;
> +
> +unregister_gates:
> +       while (i--)
> +               clk_hw_unregister_gate(hws[i]);
> +
> +       return ret;
> +}
> +
