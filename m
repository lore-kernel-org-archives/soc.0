Return-Path: <SRS0=gllw=FU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A5CE81DF0
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 12:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7606CC433CB; Fri,  6 Oct 2023 12:41:38 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E080FC4339A
	for <soc@kernel.org>; Fri,  6 Oct 2023 12:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E080FC4339A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-65b0216b067so25850466d6.1
        for <soc@kernel.org>; Fri, 06 Oct 2023 05:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696596096; x=1697200896; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BG+pU1EHGnCj6tU73G8/u9FDfygPxqAGCLjoLFitfDU=;
        b=DCY7kFJeA+aEIfopxEKj/Z4xn9rfxOWDVBUt4pqrTl4KY3AapqbWJgrJt2Q0nfRzJN
         yhp09h+QyeTk/uds+x6TngQkJYvpLXCAgnQxfkHAsReLno5ISOzp/qNg2cUnTVPKoVSC
         5iiiIz8iFQ+UIyxFElMtBz5M46LIIMOV4cEJpzVAp3PqgIw6OBdzs53LcyEdZIjMv6vL
         7gwXyDUFO5cPu09fut78IWaQLdKWGhym6movGn+gx18LSuYyKnThLwgtB4x2b+KlC+gG
         76bFckfTzDSm2wiW0P80XNAPLBcHA742rusUb4IHDFhxVYXV7dN1P4dWZ4DgaIo9iLpd
         XEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596096; x=1697200896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BG+pU1EHGnCj6tU73G8/u9FDfygPxqAGCLjoLFitfDU=;
        b=DEPdOpxV5032siTdT9ekvZsjfokuZbH7G2BM67lE1yZMEEJyUojPxfNscqPg/r5osT
         ZvE1VnsEh7f/lWs9wnrNvi/3SelAjckSr3wwSD7v+ceDbbAoB5/VdxAYjS0SoWPGgGP9
         ESJwkElGVwpGFUiG/yUfUepgnyH2Xlbe5og/NB9y8rWgKaUSLc0Kkk/bBQng+gaorR1q
         Ycgqrtmo9eGjKhP13kuTA9FYhYuTbvfjb+40EAV6ozFHGNwJypFac+KPHUc6c4iOUpuS
         uMory0xiKPhybKOhbKjLjqkKPHm78FPNiqhcmgcOGCUX1d5731gSrzIb3jn9S+MB2UE0
         o1WQ==
X-Gm-Message-State: AOJu0YykA6vbBJaC5/VUOTe9gX/0zu21V22kmx3dK5uIfhg1/rRmKmyn
	3fyG93kOiornVaNVUgTcjtv3NnzRXmjKa1PRF/Kt5Q==
X-Google-Smtp-Source: AGHT+IEc9cXq8etKpdI34yJncEC8RLd8eZzic0vY4V2CYU6+7KPMm/ULeW87OBJQQb7Lh+PasTJleL0tLgLVqUOGwPQ=
X-Received: by 2002:a05:6214:400e:b0:64f:4d4a:70c with SMTP id
 kd14-20020a056214400e00b0064f4d4a070cmr6030330qvb.27.1696596095802; Fri, 06
 Oct 2023 05:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-5-peter.griffin@linaro.org> <f997c21d-d85b-4ad1-ad5b-999524fc72ac@linaro.org>
In-Reply-To: <f997c21d-d85b-4ad1-ad5b-999524fc72ac@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Oct 2023 13:41:24 +0100
Message-ID: <CADrjBPpHTydVZdi+x6V-QoV++oQEuv4n6-NPXGB2=+AERNETyA@mail.gmail.com>
Subject: Re: [PATCH 04/21] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Many thanks for reviewing the series :)

On Thu, 5 Oct 2023 at 17:07, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/10/2023 17:56, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 163e912e9cad..02f580d6489b 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -50,6 +50,13 @@ properties:
> >                - samsung,exynosautov9-peric1-sysreg
> >            - const: samsung,exynosautov9-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
> > +              - google,gs101-apm-sysreg
> > +          - const: google,gs101-sysreg
>
> Please drop this one compatible. Exynos has it only for backwards
> compatibility.

Just double checking, you mean I should drop this one compatible?
 +          - const: google,gs101-sysreg

>
> Also, please put entire list ("items") before such entry for
> samsung,exynos5433-sysreg, so everything is more-or-less ordered
> alphabetically, by the fallback compatible.

Will do!

regards,

Peter
