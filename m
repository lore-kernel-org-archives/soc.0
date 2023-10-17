Return-Path: <chanwoo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D287CDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 08:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3316C433C7; Tue, 17 Oct 2023 08:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB45C433C8;
	Tue, 17 Oct 2023 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697532734;
	bh=S8dBHgS0EWTG/ajGFs9LTs9c3mXYVBKXTQoIOh3MYZk=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=qmGl+7Ch+Zs7/V9N16p77UJoCDDBMgWzU6fUkF6l+WM7LqPA2PN+s85fAK1nXcfub
	 EWhm1VNc7ncSUcRfoHQLFQ0ku5d3hAsd9/SrtTEm6K8F8Nbpq1KCdOn749f5yYPa4A
	 dIl5lUcjQy83wvuEHABNMxUZ08Y0smJSIpXWFYfVlEdhy0Gr0cn2UJb8F7sMRzvpNg
	 F89w4HjLQpcJ7K2NX/I4lw5+J3dlt5/YmqRqcBLj0bMVc6DNFszGaaPhDQT3Mv54jK
	 EGPiGfRBlMhzakwZiPeUbToF5TJPQ053qKOHqCauUkcAGbR+nD59cm/sY56Lj8x1rl
	 BqXIEpSo+txdA==
Message-ID: <ef25ed87-f065-4a75-9e57-1f1073d9c805@kernel.org>
Date: Tue, 17 Oct 2023 17:52:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for
 pll_{0516,0517,518}
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-10-peter.griffin@linaro.org>
From: Chanwoo Choi <chanwoo@kernel.org>
In-Reply-To: <20231011184823.443959-10-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23. 10. 12. 03:48, Peter Griffin wrote:
> These plls are found in the Tensor gs101 SoC found in the Pixel 6.
> 
> pll0516x: Integer PLL with high frequency
> pll0517x: Integer PLL with middle frequency
> pll0518x: Integer PLL with low frequency
> 
> PLL0516x
> FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> 
> PLL0517x and PLL0518x
> FOUT = (MDIV * FIN)/PDIV*2^SDIV)
> 
> The PLLs are similar enough to pll_0822x that the same code can handle
> both. The main difference is the change in the fout formula for the
> high frequency 0516 pll.
> 
> Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
> MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.
> 
> When defining the PLL the "con" parameter should be set to CON3
> register, like this
> 
> PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>     PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
>     NULL),
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c | 9 ++++++++-
>  drivers/clk/samsung/clk-pll.h | 3 +++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 74934c6182ce..4ef9fea2a425 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
>  	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
>  	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
>  
> -	fvco *= mdiv;
> +	if (pll->type == pll_0516x)
> +		fvco = fvco * 2 * mdiv;
> +	else
> +		fvco *= mdiv;
> +
>  	do_div(fvco, (pdiv << sdiv));
>  
>  	return (unsigned long)fvco;
> @@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>  	case pll_1417x:
>  	case pll_0818x:
>  	case pll_0822x:
> +	case pll_0516x:
> +	case pll_0517x:
> +	case pll_0518x:
>  		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
>  		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
>  		if (!pll->rate_table)
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index 0725d485c6ee..ffd3d52c0dec 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -38,6 +38,9 @@ enum samsung_pll_type {
>  	pll_0822x,
>  	pll_0831x,
>  	pll_142xx,
> +	pll_0516x,
> +	pll_0517x,
> +	pll_0518x,
>  };
>  
>  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \

I replied it with ack before. Again, reply it with ack.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

