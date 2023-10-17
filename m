Return-Path: <SRS0=tRV6=F7=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F48ECDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 20:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08BAAC433D9; Tue, 17 Oct 2023 20:39:41 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C075DC433C8
	for <soc@kernel.org>; Tue, 17 Oct 2023 20:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C075DC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-66d4453ba38so19846266d6.0
        for <soc@kernel.org>; Tue, 17 Oct 2023 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697575178; x=1698179978; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XA1skjAgHjdCnqisORMj4wpVmNxlLSwRWz+H3/RjpJo=;
        b=sU2DlGoeKPE5L7pFEVjpZ569pKeWK5JnTBo/RsEJ/eeWDsPeGQQnkf2BdBND09ktsB
         zt1pfF1+NNH1Yi7BRgM7krZDD+UW2GB7tERnZM1a3eYij4EbG+ItTdQ8AD0ccznideLL
         Q9TftXtrfw7r/1x/VvrQG0jdKKqgc8o2bENvNjKzNykSlpMkNgfgu1ijch9U/oBpLP4G
         aeV6l/hyG6jNNrnxj5o8vYVdWbRrXKGcWYwjN+AVUZ+xp00nmbZiIYfh/0zegN+X7QqK
         N2UjXPE0T/2LPeH0krcpSYlpxvd8Ki1orJ/GrI/cZu4FN/droRDp5sTdswEy2gSNo0zV
         dn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697575178; x=1698179978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XA1skjAgHjdCnqisORMj4wpVmNxlLSwRWz+H3/RjpJo=;
        b=dyn8ZkK14OFlXxTERbBnImRJAU4Ucfvd7T4xKg3ShcON36J6MWkkllUYN9gAO0PhhV
         zLlWvU5lMnu65wpIceeKmndgpVLi/Vh4Wn87EwCFp+A5NoGwhSBp2LP0jkQmbMQk0uPJ
         pH4J8wWw4C8LoHiCSicv/73N8yBTaPJpfsW6KyK+6WAu7VBCq/NvvbgABhOGfqEmqSPT
         sGJmp4++vZ04DQ6Dp24bHSdSdvrAgvlCte6k6oZbIhBBLhVpYcwD2teJ+zi4VDHav3Au
         CfyPBJCGajhqAgzGM/k40MET2QP0JAEM9+82KIJJ/xW7DW2YIQ9+dmer1R439dl021+p
         r65Q==
X-Gm-Message-State: AOJu0YxZLALQJl73ntUbdDzJJpx8r3u8XZBEQ950xLLa/WSeqqppApaT
	T9mveFDnUda6TQx1IDqArGr9b3M2j+nRTRAjU27ndg==
X-Google-Smtp-Source: AGHT+IG0jZyX5mwItbRNqua2+caVQuoRBxev+i2K+Vc8lTvA4KemQ/ckZaqEBKGa2oMjPe/6P4JpungwpD5qkdU5/AQ=
X-Received: by 2002:ad4:5ae8:0:b0:64f:49d1:3fe7 with SMTP id
 c8-20020ad45ae8000000b0064f49d13fe7mr4054747qvh.23.1697575178600; Tue, 17 Oct
 2023 13:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-10-peter.griffin@linaro.org> <ef25ed87-f065-4a75-9e57-1f1073d9c805@kernel.org>
In-Reply-To: <ef25ed87-f065-4a75-9e57-1f1073d9c805@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 17 Oct 2023 21:39:27 +0100
Message-ID: <CADrjBPqHKG84k0YDMzKcxdLJL-Vcp2HqTPm9vMWYnmZBYNX2Pw@mail.gmail.com>
Subject: Re: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
To: Chanwoo Choi <chanwoo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Oct 2023 at 09:52, Chanwoo Choi <chanwoo@kernel.org> wrote:
>
> On 23. 10. 12. 03:48, Peter Griffin wrote:
> > These plls are found in the Tensor gs101 SoC found in the Pixel 6.
> >
> > pll0516x: Integer PLL with high frequency
> > pll0517x: Integer PLL with middle frequency
> > pll0518x: Integer PLL with low frequency
> >
> > PLL0516x
> > FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> >
> > PLL0517x and PLL0518x
> > FOUT = (MDIV * FIN)/PDIV*2^SDIV)
> >
> > The PLLs are similar enough to pll_0822x that the same code can handle
> > both. The main difference is the change in the fout formula for the
> > high frequency 0516 pll.
> >
> > Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
> > MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.
> >
> > When defining the PLL the "con" parameter should be set to CON3
> > register, like this
> >
> > PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
> >     PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
> >     NULL),
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-pll.c | 9 ++++++++-
> >  drivers/clk/samsung/clk-pll.h | 3 +++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> > index 74934c6182ce..4ef9fea2a425 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
> >       pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
> >       sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
> >
> > -     fvco *= mdiv;
> > +     if (pll->type == pll_0516x)
> > +             fvco = fvco * 2 * mdiv;
> > +     else
> > +             fvco *= mdiv;
> > +
> >       do_div(fvco, (pdiv << sdiv));
> >
> >       return (unsigned long)fvco;
> > @@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
> >       case pll_1417x:
> >       case pll_0818x:
> >       case pll_0822x:
> > +     case pll_0516x:
> > +     case pll_0517x:
> > +     case pll_0518x:
> >               pll->enable_offs = PLL0822X_ENABLE_SHIFT;
> >               pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
> >               if (!pll->rate_table)
> > diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> > index 0725d485c6ee..ffd3d52c0dec 100644
> > --- a/drivers/clk/samsung/clk-pll.h
> > +++ b/drivers/clk/samsung/clk-pll.h
> > @@ -38,6 +38,9 @@ enum samsung_pll_type {
> >       pll_0822x,
> >       pll_0831x,
> >       pll_142xx,
> > +     pll_0516x,
> > +     pll_0517x,
> > +     pll_0518x,
> >  };
> >
> >  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
>
> I replied it with ack before. Again, reply it with ack.
>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks Chanwoo. I will add that in v4
