Return-Path: <SRS0=ubZ2=FZ=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5C5C46CA1
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 23:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FBFCC433C9; Wed, 11 Oct 2023 23:19:39 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88E44C433CA
	for <soc@kernel.org>; Wed, 11 Oct 2023 23:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88E44C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27cfb8bc7eeso283314a91.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 16:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697066377; x=1697671177; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7sXSYGeD1Ulz8sa7/3++MxVxhYAPIleK6QJVBE+xOo=;
        b=LLo8K6rzJnbvIBGzmYoYphvUNv5UIZTViyejjCiXDVWu5LNknn/a5WFaHaFrQLETPs
         BwYvpz6AjB7JxMF18fDtABHLLWE2Yj0fz8ntHDtt0ni67e5UW7v3YqbRYs9TAC4+f1eV
         zkkfwq3WRmH65UkCkL0KNIcA/0rEx+E/LH4dhbcQ9j9Q5vRjFpBT3flXBRD4IRMct1dL
         lTBJMlQHui36m7OA/iwVWmG4jZV9gJM4zWrEl8aQI35c1YpEviEoFqbybS1i3U+OWwbr
         Lf9g4KBitlOF2XfP2YyNtA5oGm74QBPhwr3BJr+GFPayDTcRfV4grB1KEvwBQN4TaBsh
         mrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697066377; x=1697671177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7sXSYGeD1Ulz8sa7/3++MxVxhYAPIleK6QJVBE+xOo=;
        b=l3VipCBxK2oQpYsuCkdAnNdX5yeykPG43CdXqm7qELFZpaRqe9X9TvzSLEsT3mohof
         FbrPskhY3REvO/077tcqe4a7bTmADmEd75TNFQC/WFA+LdubepjrnNq+QXPyw7eZ6WP2
         fxJIkqPawqJQ2Z3eQygU7Ap5hw0LgDpOJo5CyJ6WvCecsl3sokUqD/sjeb6azQjbxTV9
         1vXafKGVJIr2LkndQ5Y183GFpTF+wuFwCV7186MIAUUJEUQ8OUAuEw9QHxmnqMqhqbfO
         keY43do3B+EDG48WT0dIpwUxjrwKSlmhoUc8HXeXrQHcwbozXk1736pJq7Xqi8qqLJ8k
         fS6Q==
X-Gm-Message-State: AOJu0YzfLzIjqqQW0Dzzh+6UGyH0v/3bhR11PIRa/JXUFuZv9FnUT/ir
	i0LdkYlCnZxahjqEhk76fYJfT9Z/l+5BWOeHfQPTZA==
X-Google-Smtp-Source: AGHT+IHvL+bbhmKDuK4Xj6D62jFyDDy2/T5qTqff65dUSGMhE1YdBYUcRmNMYPOiaGYDXSzv3kq1lrobPLTj8pwu88I=
X-Received: by 2002:a17:90a:f6d7:b0:27c:edf3:d045 with SMTP id
 er23-20020a17090af6d700b0027cedf3d045mr5447584pjb.40.1697066376694; Wed, 11
 Oct 2023 16:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-10-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-10-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 11 Oct 2023 18:19:25 -0500
Message-ID: <CAPLW+4nmonxdLCWEZy15attd5ULUfL0VgZf5YQzFBA_0bvUwUw@mail.gmail.com>
Subject: Re: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> These plls are found in the Tensor gs101 SoC found in the Pixel 6.
>
> pll0516x: Integer PLL with high frequency
> pll0517x: Integer PLL with middle frequency
> pll0518x: Integer PLL with low frequency
>
> PLL0516x
> FOUT =3D (MDIV * 2 * FIN)/PDIV * 2^SDIV)
>
> PLL0517x and PLL0518x
> FOUT =3D (MDIV * FIN)/PDIV*2^SDIV)
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
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.=
c
> index 74934c6182ce..4ef9fea2a425 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(st=
ruct clk_hw *hw,
>         pdiv =3D (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
>         sdiv =3D (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
>
> -       fvco *=3D mdiv;
> +       if (pll->type =3D=3D pll_0516x)
> +               fvco =3D fvco * 2 * mdiv;
> +       else
> +               fvco *=3D mdiv;
> +

Can be written like this I guess:

       fvco *=3D mdiv;
       if (pll->type =3D=3D pll_0516x)
              fvco *=3D 2;

if you think it's more neat. Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>         do_div(fvco, (pdiv << sdiv));
>
>         return (unsigned long)fvco;
> @@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct=
 samsung_clk_provider *ctx,
>         case pll_1417x:
>         case pll_0818x:
>         case pll_0822x:
> +       case pll_0516x:
> +       case pll_0517x:
> +       case pll_0518x:
>                 pll->enable_offs =3D PLL0822X_ENABLE_SHIFT;
>                 pll->lock_offs =3D PLL0822X_LOCK_STAT_SHIFT;
>                 if (!pll->rate_table)
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.=
h
> index 0725d485c6ee..ffd3d52c0dec 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -38,6 +38,9 @@ enum samsung_pll_type {
>         pll_0822x,
>         pll_0831x,
>         pll_142xx,
> +       pll_0516x,
> +       pll_0517x,
> +       pll_0518x,
>  };
>
>  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> --
> 2.42.0.655.g421f12c284-goog
>
>
