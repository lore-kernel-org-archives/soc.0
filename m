Return-Path: <SRS0=57W1=HV=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D56AC4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 23:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AEBBC433C7; Sun, 10 Dec 2023 23:44:22 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44DECC433C9
	for <soc@kernel.org>; Sun, 10 Dec 2023 23:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44DECC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-28659b38bc7so3832236a91.0
        for <soc@kernel.org>; Sun, 10 Dec 2023 15:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251859; x=1702856659; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0mKvI1T5oT5+yvWC5sePTXqeN0uumLxPtnONmcFaVU=;
        b=gZGW48PshurTykbQmp6FtabVlGgHuwt9H9mIrtCpLU7nkv+lFfKUBJPM/kqNw55Fn6
         xR5AP4Wy3LcM4PoY5PxyW4NWBzWKni0aJJvPn8tDEb9Y5M8JIgABxXmdI3AGr5Rr5H32
         YhrFnVj7koiD/V0DoATq8dAkz+i8yqWAuTO4lBMuvAYVFFAoTHNyEaVN70AJk4lpOeXh
         peIXzrJrgNtDZxG4USkRDUQ8P1o4rn+h6gVj0+PkVOH0vKyg4uGdPpcnTfuZs0DZ2GVV
         9gc9Bt1hBjaa0FHDral2om3b4nFBYMPyShBjoqkmqYd9Nv6jcYYYPujjbqtMzDrW1m9q
         G7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251859; x=1702856659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0mKvI1T5oT5+yvWC5sePTXqeN0uumLxPtnONmcFaVU=;
        b=sDZnzREBD3aXdPHQFgb+HxJISrP0ejgv20kSCVIfeA7ocRdimg7QQkkYqXHbuq/REd
         wAfKC7IVLECXDDYT4mgWGY4LhX3VJvjKaKCaMXLzJ0+fHs/IQPlsa/PWtRKcD+9YWGC4
         VI2mjSwG785afs0l5xeRw6zhiFbL0x+WQ+WRNW4Q8tVZD+Wj6xjimTYLe8k7njW9jq97
         2VyL18AMYZjxnz1G3iAGWgrq6VgcLXHGsrMDWBgm7f3cgwAKrTH7TyiTNqXG6X3GIg1u
         RTOGZKa32sk0Pea24+l+699EsckSw+lieLPHuHxL4yE+V6U4Lph3naInD1+CxCYKb3Qv
         h43g==
X-Gm-Message-State: AOJu0YxV1l4RMKpouL14EZRmJnFoMjeuyj6p7A/V/u0cN1r490hq3f3t
	Zk12aZ7jDUKB7i7MLanj+/R7Z2R5Zbne85iIvaxRMQ==
X-Google-Smtp-Source: AGHT+IEev1+mZ4JvBxNXegHv+LOLqYeURkK9tTgfUxA4P5RPEBjZl6WNk6O2WW1x3DzLpEF1RiXWgArXsFHTlxqSItE=
X-Received: by 2002:a17:90a:77c1:b0:285:8673:450d with SMTP id
 e1-20020a17090a77c100b002858673450dmr2612147pjs.40.1702251859547; Sun, 10 Dec
 2023 15:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-14-peter.griffin@linaro.org> <46c9c8b4-942d-4f6f-a6cc-00158314d5e5@linaro.org>
In-Reply-To: <46c9c8b4-942d-4f6f-a6cc-00158314d5e5@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:44:08 -0600
Message-ID: <CAPLW+4k3omxnWoDhB9UCgv6botjNxKAn804jNfrHseaZsnMJ3A@mail.gmail.com>
Subject: Re: [PATCH v6 13/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023 at 7:55=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > Add support for the pin-controller found on the gs101 SoC used in
> > Pixel 6 phones.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
>
>
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
> > index 6b58ec84e34b..3834bf953178 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -468,6 +468,8 @@ static const struct of_device_id exynos_wkup_irq_id=
s[] =3D {
> >                       .data =3D &exynos7_wkup_irq_chip },
> >       { .compatible =3D "samsung,exynosautov9-wakeup-eint",
> >                       .data =3D &exynos7_wkup_irq_chip },
> > +     { .compatible =3D "google,gs101-wakeup-eint",
> > +                     .data =3D &exynos7_wkup_irq_chip },
>
> You don't need it.
>
> >       { }
> >  };
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 79babbb39ced..b8d549fe38cb 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_=
dt_match[] =3D {
> >               .data =3D &exynosautov9_of_data },
> >       { .compatible =3D "tesla,fsd-pinctrl",
> >               .data =3D &fsd_of_data },
> > +     { .compatible =3D "google,gs101-pinctrl",
> > +             .data =3D &gs101_of_data },
>
> Place it somewhere alphabetically. Probably before tesla.
>

Assuming Krzysztof's comments are fixed, you can also add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>
> Best regards,
> Krzysztof
>
