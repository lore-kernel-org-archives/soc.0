Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B88C10DC3
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 09:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8A1FC433CB; Mon, 11 Dec 2023 09:18:06 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 344B1C433CD
	for <soc@kernel.org>; Mon, 11 Dec 2023 09:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 344B1C433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-67abd020f40so42395136d6.0
        for <soc@kernel.org>; Mon, 11 Dec 2023 01:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702286284; x=1702891084; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/z0fIrgey0ax47ogB/tuo0R84muzHuQ+ydDig5s54Lc=;
        b=nDxBkQOyXznayO5CQAPmDr664yo0KXYjXzcd7GITucjvpCj3GD8AzPIpxXOm89xa/Y
         Ncu/PsTRHSF30zJe+L49XiKzEn1Q/Z1sO9lT2XmUa8KJ8tbLCDnrTO8XQpO/BetaESW/
         9Q3SzYbgUM5fvlcWbW5PGIIxdxn1OTQp7OQCg2Iw6UEbtxZJf5sULe6Tg8/kQWGoAFYj
         VrnWsSSmqLkCftp/Ij/vG2JtO3dNmsDlfRMd7ujtJcQGYCeeTqBIglSDQPulBaQNFPuQ
         pyR3fo8Ky8zZ53P9G9MkuN7hmGeEC66KOys4LDm/pKqNJlgYyL1dfgqccx7WFnQyGKke
         9GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286284; x=1702891084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z0fIrgey0ax47ogB/tuo0R84muzHuQ+ydDig5s54Lc=;
        b=O0HP17Tvqn+PRCYbSEl6JQ4Lnlti2lUysNpdTblfWSXZ5gjICpBd0kuESdCzkxRHfD
         Rzj5tfgMiH7mmcWGXLcTjl2OvNS9te7xODJYK/2HJ5jR3W5pyeL6NKlLoC/+v7QNsQ+p
         b5U+HHIzP+9x/uGR9Hhny6jKpcAJw3yZmdwbbSmG2pW6S0jeqYWs10rPxqBGhzLeUjaC
         dgA3XzTLx8FowU8Vql1qu2WbwG6Q7F0q/y4JuIUdfgMXW20R8UQC95/aaH1yojTVHAvb
         y0ARLIz47ScMQV3Rg3AxM0bw06A6THgwJ2PlgT4rpbMUJMvlmBcgivvfrnJKGjqUlzm/
         Yy+A==
X-Gm-Message-State: AOJu0YzPoA47COI5IurBoQrsotBxVyPBcZhc65U6lDBjXmQnFXHqYX1/
	1+d3uFMTt/hGteCBkzPo536kaQC1KGcutDxt+pcZGA==
X-Google-Smtp-Source: AGHT+IF2FD/yZWTaJspuz2ZkGnHtLmu9yc29fMOCKmFWdGSQxO5eLtwgHWeyaAYDFzw+Ks+VHIEsnPYl7wNEw90Fzik=
X-Received: by 2002:ad4:5dec:0:b0:67a:568e:5b10 with SMTP id
 jn12-20020ad45dec000000b0067a568e5b10mr7473425qvb.20.1702286284034; Mon, 11
 Dec 2023 01:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-4-peter.griffin@linaro.org> <c2244932-cb2f-423a-bbe6-9ab2b08b9d63@linaro.org>
In-Reply-To: <c2244932-cb2f-423a-bbe6-9ab2b08b9d63@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 09:17:53 +0000
Message-ID: <CADrjBPpd5mT6SZyPEgxFGy18pr5Gypcwv7aoG4R978d__Pk3LA@mail.gmail.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
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

On Sun, 10 Dec 2023 at 13:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 2de4301a467d..127f4ffde76a 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -22,6 +22,12 @@ properties:
> >                - tesla,fsd-fsys1-sysreg
> >                - tesla,fsd-peric-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-apm-sysreg
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
>
> This should be part of the first enum. No need for new list for every
> new SoC. I'll fix it while applying.

Noted, thanks!

Peter
