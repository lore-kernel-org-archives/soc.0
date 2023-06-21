Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30F1EB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 12:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D633C433C9; Wed, 21 Jun 2023 12:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9261C433C8;
	Wed, 21 Jun 2023 12:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687351910;
	bh=/Hkm++/tE6ZrYuLRdKzKly3jNBg1mAMPb2Gv7kJxnN8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ROKrPDP5Wd7iusGM/T8CWHoQRVahWjqt5IBGnz7MA7QlY3qToSvCp1OE3rfFXz5o7
	 0pfgb6Pkl8CxcxPkGp9PupqYJVqYJNRoIWwxDYahtYYnee356/GNVGoNtMFOSpLKDj
	 UTpepZbwzVgF4UatLa0Wfi89711K9xEBVmqKBs3w=
Date: Wed, 21 Jun 2023 14:51:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, soc@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, schung@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [PATCH v2 2/2] clk: nuvoton: Use clk_parent_data instead of
 string for parent clock
Message-ID: <2023062103-obtuse-parasitic-e675@gregkh>
References: <20230621031605.234149-1-ychuang570808@gmail.com>
 <20230621031605.234149-3-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621031605.234149-3-ychuang570808@gmail.com>

On Wed, Jun 21, 2023 at 03:16:05AM +0000, Jacky Huang wrote:
>  
> -	hws[AXICLK_MUX] = ma35d1_clk_mux(dev, "axiclk_mux", clk_base + REG_CLK_CLKDIV0,
> -					 26, 1, axiclk_sel_clks,
> -					 ARRAY_SIZE(axiclk_sel_clks));
> -	hws[SYSCLK0_MUX] = ma35d1_clk_mux(dev, "sysclk0_mux", clk_base + REG_CLK_CLKSEL0,
> -					  2, 1, sysclk0_sel_clks,
> -					  ARRAY_SIZE(sysclk0_sel_clks));
> -	hws[SYSCLK1_MUX] = ma35d1_clk_mux(dev, "sysclk1_mux", clk_base + REG_CLK_CLKSEL0,
> -					  4, 1, sysclk1_sel_clks,
> -					  ARRAY_SIZE(sysclk1_sel_clks));
> +	hws[AXICLK_MUX] = ma35d1_clk_mux(dev, "axiclk_mux", clk_base + REG_CLK_CLKDIV0, 26, 1,
> +					 axiclk_sel_clks, ARRAY_SIZE(axiclk_sel_clks));
> +
> +	hws[SYSCLK0_MUX] = ma35d1_clk_mux(dev, "sysclk0_mux",
> +					  clk_base + REG_CLK_CLKSEL0, 2, 1,
> +					  sysclk0_sel_clks, ARRAY_SIZE(sysclk0_sel_clks));
> +
> +	hws[SYSCLK1_MUX] = ma35d1_clk_mux(dev, "sysclk1_mux", clk_base + REG_CLK_CLKSEL0, 4, 1,
> +					  sysclk1_sel_clks, ARRAY_SIZE(sysclk1_sel_clks));
> +

No need to reformat lines that are not actually changing anything, as
this makes the patch harder to review for real changes in it :(

thanks,

greg k-h
