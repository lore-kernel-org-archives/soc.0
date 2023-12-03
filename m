Return-Path: <SRS0=l1VT=HO=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8C4C4167B
	for <soc@archiver.kernel.org>; Sun,  3 Dec 2023 21:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85A3CC433C8; Sun,  3 Dec 2023 21:47:30 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6A49C433C7
	for <soc@kernel.org>; Sun,  3 Dec 2023 21:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6A49C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42548f6c565so13898021cf.2
        for <soc@kernel.org>; Sun, 03 Dec 2023 13:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701640047; x=1702244847; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ypEtajSEZ/3+dju5T9JaBFEQ3JvraP41o/ylPX1p/IQ=;
        b=xKuUJdfad00DBfNKbR9MdKlZJKGUmcCrQ7zAqe33opeU1NfLWY59y4tps+xgohwIXS
         f5daWiMcKG0LMkyE8/u8g79cJVXe8Afc95TnRr7JA6GXPSNj7ccmafir1Zf6hyUY+s0c
         uUZ/e9IUcUgLfXTnHrKpGRumSnbE+KOouuMdsptt/qzZnREjhIy/jGC/RlLqXvDyyMIa
         KawJotkdO0Vom677YqgyGLTCkfBWezFe0H3nlhRYaPIxyay1VB+tK3EfhoP9r+Dv+Qcc
         OYCR2nSymLwbZKh/IZKQpGrSvkURDWeUuf9k/l4lykK2pjhuutd+YaERRmA0GDcjfr4Z
         Ny2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701640047; x=1702244847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypEtajSEZ/3+dju5T9JaBFEQ3JvraP41o/ylPX1p/IQ=;
        b=Ur/r2+ORyFufCygIeHTSsvAPjuUKGd+3ex3/ORpWDjIpQCmOWWoMPmdAc0KmhwoHWx
         PPCZLyDhe9SM930OVp5pNr+ICj2DfAxdI0KjAEk88P29jIskgEPO8u0cnWwetQsiV4lY
         B71ADTWBPW4REEiWapf2+WPY3LNCABowz39Yfejq7VakKq/wxYIselwKx48eEHWdk9u2
         Y4RKf9t9+abenkiT8O3mri1kUfAEIoBOvYF6C5HeV0yFmfpnKNYiLdJUSWNQLSWtAccU
         WDMIAwOVUVSFftG0gjMVUku5GdHV9hocKuy5/UbyVfGVOxliWkIpcOsj7jmw+jMApd3T
         uKnA==
X-Gm-Message-State: AOJu0YyG3jaQuIJgbqRz6j3EKawlTmyLRTwtG38BotIOOfr9QZS5fg+g
	pUe9lHNDZLt/S+lqnxe+DuBb+3ENgcPHweqCYtpTcg==
X-Google-Smtp-Source: AGHT+IHc/rln86HWRtRO8D+k4deS4wGOzHWIyvONBd5JHCCN4rJ37HsOLKPo9YqdJjypf9JsSc1dyZOBRmsFYFPuzZM=
X-Received: by 2002:a05:622a:1752:b0:425:4043:96cc with SMTP id
 l18-20020a05622a175200b00425404396ccmr5772334qtk.89.1701640047675; Sun, 03
 Dec 2023 13:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-11-peter.griffin@linaro.org> <2854a9b5-d6c8-454c-bc3b-79744e613686@linaro.org>
In-Reply-To: <2854a9b5-d6c8-454c-bc3b-79744e613686@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Dec 2023 21:47:16 +0000
Message-ID: <CADrjBPofpjB7iA3u1LGy61F_0dPX40ZrtJsHd6zumTOFu3bEjg@mail.gmail.com>
Subject: Re: [PATCH v5 10/20] dt-bindings: soc: samsung: usi: add
 google,gs101-usi compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sun, 3 Dec 2023 at 15:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/12/2023 17:09, Peter Griffin wrote:
> > From: Tudor Ambarus <tudor.ambarus@linaro.org>
> >
> > Add google,gs101-usi dedicated compatible for representing USI of Google
> > GS101 SoC.
> >
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> > index 61be1f2ddbe7..a10a438d89f0 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> > @@ -28,6 +28,9 @@ properties:
> >                - samsung,exynosautov9-usi
> >                - samsung,exynosautov920-usi
> >            - const: samsung,exynos850-usi
> > +      - items:
> > +          - const: google,gs101-usi
>
> This should be part of previous enum.

will fix,

Thanks,

Peter.
