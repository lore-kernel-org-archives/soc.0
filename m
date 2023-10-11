Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8520CCD98FD
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 08:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B390C433C8; Wed, 11 Oct 2023 08:16:42 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98C9FC433C9
	for <soc@kernel.org>; Wed, 11 Oct 2023 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98C9FC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7740cedd4baso465906985a.2
        for <soc@kernel.org>; Wed, 11 Oct 2023 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697012199; x=1697616999; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA0RDDaTkiz/7JWtA8mSntXcdVkGEnyXDFoq63BjRlY=;
        b=a7aJJSSTIOPsFDi21B3yele5Hzo9Ph9iTGkdrRZJW3AVExfSbUmnr2yH8yYaMxq1Az
         Ttry+fvvVmoCyS9SNxECKY6ObeEoZyNbToPeq40NIuOSWmyQqnnHI0X7CrBwoF1QoTaT
         mUTBwYOk4nlfiRSZwM6HUD3IZGr02PJP09BxdLldqMM8x7gsL1oqbf7q2hSV5IJR1Xi9
         eCENzsX0pbPPF8DuU1ixQbm8PhuNmhSdZWrjzFOlhemkMu7WnWRS9OHqoKzM0r/9+06F
         sDz+v0Fb73YCZMqwKDdgQGNUIfk8L8Lm+qqmJJCAQDcp+GrNgkIfGzP+h2R4tqbgPiB5
         +Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012199; x=1697616999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA0RDDaTkiz/7JWtA8mSntXcdVkGEnyXDFoq63BjRlY=;
        b=QmOqrgGTrELaRwuJHjj9cpN5cvGqkzRU4IJFNREhHKVlKLZ+QVCGUmPf8aA0MBJDUt
         26u6FDAN7wvOkICAUVBY7+fjt8dUza4cNkadnBFmhqOaUSgDWz2I5uGmyvtEAFfg5TFi
         1/1nqNC0F+dZBS7UksmxxCGlFi5k2J9TLCbvpRCcskszoT/Q5/owwzkBEwUxVZ1TVzjw
         sxRlqqoAofIs1yPQF5g39XpuwPk6a8jRFSrK808K/qI3T+t3j+cg3OGGqB6sRIds6VQH
         Y01m3mR7hBOM9lS2oknUfOrTh0lVl24DvINXLpTQLf/fsKfHFqZnhcZB3zUUQvUPrSKI
         tClQ==
X-Gm-Message-State: AOJu0YwMYZqVxIjhyr4Nj+oFlwInXKYFGK+nk0rxq4NRD1u+GM7DPGds
	Ot2avZ7mVsjquyDlcofjCixJ0RNIyKKIECeF87SD/Q==
X-Google-Smtp-Source: AGHT+IG+0ROOZO1mYXDe5AanejoBg3TXGpWOGx8a61SnY82+auoDhpY/ZD9spxpXsT1DrFa9tocnRlQSlCFjBmjz/zI=
X-Received: by 2002:a0c:aa9a:0:b0:65b:771:f2ea with SMTP id
 f26-20020a0caa9a000000b0065b0771f2eamr15590074qvb.53.1697012199437; Wed, 11
 Oct 2023 01:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org> <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
In-Reply-To: <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Oct 2023 09:16:27 +0100
Message-ID: <CADrjBPqOmGEzeVEKiysxQNo9+B0=zD3Z+G24fPDKrFsgUXYJjQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To: Tudor Ambarus <tudor.ambarus@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

Thanks for your reply.

On Wed, 11 Oct 2023 at 07:10, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Hi, Peter,
>
> On 10/10/23 23:49, Peter Griffin wrote:
> > Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl
> > compatible` I tried to narrow the interrupts check to
> > google,gs101-pinctrl but I still see a warning: gs101-oriole.dtb:
> > pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long If anyone can
> > educate me on what I've done wrong here it would be most appreciated!
>
> I guess the initial definition of the number of interrupts should
> include the largest min/maxItems. I no longer see the warning with this
> change:

Yes that is how it was in v1. The review feedback though was to narrow
the scope to just google,gs101-pinctrl compatible using if: then: else: which
is what I can't get to work properly.

regards,

Peter.


>
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 2464bc43aacb..6dc648490668 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -59,7 +59,8 @@ properties:
>    interrupts:
>      description:
>        Required for GPIO banks supporting external GPIO interrupts.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 50
>
>    power-domains:
>      maxItems: 1
