Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103FCC433F5
	for <soc@archiver.kernel.org>; Tue, 11 Oct 2022 01:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB881C43470; Tue, 11 Oct 2022 01:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6245C433C1;
	Tue, 11 Oct 2022 01:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665450076;
	bh=zxJYT5ycVFhBgH4yblE9JhcDtsnHB0kvpqIUWjbYkk8=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=ISiIv29GNFnuiufbYk7G6jhYGTWdwA4hnHBrFAFh+POBIB1RQeB3l+vAycDM3G1OQ
	 0Zpc+GXAfiwJZoyDi70kCADXdW1jgDuTtAvkD0T/g8EgPYbpZKB1TWo1cbQ/ms1pB9
	 sJw4CPb0nTxRaz06j3hqQbZyNmuwNoifBnO18pMcl1EiE3buxFDszW88sUCIIcXHRs
	 XNhlu+D2O5ZLEQqhmJ1sv+Lq2GbbGvoY1RPlSXbLe4raz2E8ByAr5jiNGyjryg8qbo
	 xeqp1C7bx2DzkWRcyRtpLJYUqptIis9cgcDMb/k/nwuLgXaHW4JiAjq1BWknrBycvn
	 uoJStHYC3zK9w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org>
References: <f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org>
Subject: Re: [PATCH] clk: spear: Move prototype to accessible header
From: Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: <soc.lore.kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, Viresh Kumar <vireshk@kernel.org>, soc@kernel.org
Date: Mon, 10 Oct 2022 18:01:14 -0700
User-Agent: alot/0.10
Message-Id: <20221011010116.A6245C433C1@smtp.kernel.org>

Quoting Viresh Kumar (2022-10-09 21:22:37)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/spear/spear6xx_clock.c:116:13: warning: no previous prototyp=
e for function 'spear6xx_clk_init' [-Wmissing-prototypes]
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/include/linux/clk/spear.h b/include/linux/clk/spear.h
> index a64d034ceddd..eaf95ca656f8 100644
> --- a/include/linux/clk/spear.h
> +++ b/include/linux/clk/spear.h
> @@ -8,6 +8,20 @@
>  #ifndef __LINUX_CLK_SPEAR_H
>  #define __LINUX_CLK_SPEAR_H
> =20
> +#ifdef CONFIG_ARCH_SPEAR3XX
> +void __init spear3xx_clk_init(void __iomem *misc_base,

__init is meaningless in header files

> +                             void __iomem *soc_config_base);
> +#else
> +static inline void __init spear3xx_clk_init(void __iomem *misc_base,
> +                                           void __iomem *soc_config_base=
) {}
> +#endif
> +
