Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB8CCDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 11:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68D5DC433A9; Thu, 12 Oct 2023 11:51:12 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 379DEC433CA
	for <soc@kernel.org>; Thu, 12 Oct 2023 11:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 379DEC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-66cfd35f595so5064446d6.2
        for <soc@kernel.org>; Thu, 12 Oct 2023 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697111470; x=1697716270; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wguIFACywm82p+kwjY1C1abIOanzWtWu5hp7VdYjEQ=;
        b=yRwhjMTfIWkAqQiS6rapIWCShSVZXc6D6D8BpJghh7apOA59oSoJKnoXHEOXUGIWAg
         AhkjfjXQ/frJXzHul5gLcPA1CkNoWHNCQJPVumarIJyMlrrzaex8Q7q7Wg4EZt/BFRJM
         YmqM+drb5mduoaISk38sycFcTFhSvpg63vd2xMxq0vkX5bMqK78jCDIpy9oBUTXZhDuw
         vb0pXgxv1PLiJmL1PUAu7QGenAj0QvwLhGCCPji224bjnP8r0aNTJEIVLdKA8wbYRGnr
         P4AWap8usgwtFsoJteVxl6WOx+gz1l5Pzz92JrQmq/96B8nVqxVRDHpaOmtankVEkIMS
         bz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697111470; x=1697716270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wguIFACywm82p+kwjY1C1abIOanzWtWu5hp7VdYjEQ=;
        b=nM5dX17wQa5996aBCpkwD97hthQAKMsYWyjdb+2YkYctM0Hzguv/yJ6INaF7t7Jlt5
         SwIbVAvCaOTn+KZHGDM86BIjDakODjFlkBEONDYNa5UQX/RjhOA/p7R2KEaoKWj+pRob
         EA0tivLc3K/KJ7XMVQoUtdQmbI+yZri7YKEukXbCb5V3nHp+2BhTnTrfA+wAuj2jqz4T
         HzUfMjxX9y0ZMDxxkfgevtrR4Z/4VS1P8AHFWoMLgXd8x5Os+RYoUBdGFDA1BExOhVbz
         O5sP5fQ35PgIbT6P9bUTDIsCCXHCie2KH3T7Mbyy3eqKzQabZhDhlUnBqQ+yoJMF+EWM
         K5bA==
X-Gm-Message-State: AOJu0YzCErOPc2XkRYmaQ0thcL+Fc6Og6IFDqdC7OAHBfnOHqmJqXvae
	w5dpiX4fnc3xCAVmafRpfmJqK4uFdSI375uzWbVX7g==
X-Google-Smtp-Source: AGHT+IEvqT6kbO6hVsQ4G1yNHRRTZQluz8FwmB8xQs8FuXvEunZhGsOYdqUcE+o4RW+c8m2PI7lkpx1R0l5LGmrcKek=
X-Received: by 2002:a0c:d641:0:b0:668:7bc2:d64d with SMTP id
 e1-20020a0cd641000000b006687bc2d64dmr21776663qvj.27.1697111470058; Thu, 12
 Oct 2023 04:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-10-peter.griffin@linaro.org> <CAPLW+4nmonxdLCWEZy15attd5ULUfL0VgZf5YQzFBA_0bvUwUw@mail.gmail.com>
In-Reply-To: <CAPLW+4nmonxdLCWEZy15attd5ULUfL0VgZf5YQzFBA_0bvUwUw@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 12:50:58 +0100
Message-ID: <CADrjBPoCOzJ0tNU3XSZFy7PAVAUAqCN3bFFDZZPaeyZ_wTJygw@mail.gmail.com>
Subject: Re: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
To: Sam Protsenko <semen.protsenko@linaro.org>
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

Hi Sam,

On Thu, 12 Oct 2023 at 00:19, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > These plls are found in the Tensor gs101 SoC found in the Pixel 6.
> >
> > pll0516x: Integer PLL with high frequency
> > pll0517x: Integer PLL with middle frequency
> > pll0518x: Integer PLL with low frequency
> >
> > PLL0516x
> > FOUT =3D (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> >
> > PLL0517x and PLL0518x
> > FOUT =3D (MDIV * FIN)/PDIV*2^SDIV)
> >
> > The PLLs are similar enough to pll_0822x that the same code can handle
> > both. The main difference is the change in the fout formula for the
> > high frequency 0516 pll.
> >
> > Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor=
.
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
> > diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pl=
l.c
> > index 74934c6182ce..4ef9fea2a425 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(=
struct clk_hw *hw,
> >         pdiv =3D (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK=
;
> >         sdiv =3D (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK=
;
> >
> > -       fvco *=3D mdiv;
> > +       if (pll->type =3D=3D pll_0516x)
> > +               fvco =3D fvco * 2 * mdiv;
> > +       else
> > +               fvco *=3D mdiv;
> > +
>
> Can be written like this I guess:
>
>        fvco *=3D mdiv;
>        if (pll->type =3D=3D pll_0516x)
>               fvco *=3D 2;
>
> if you think it's more neat. Other than that:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

I will update like you suggest and add your Reviewed-by tag.

regards,

Peter.
