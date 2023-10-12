Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E866ECDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 10:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A37FFC433CA; Thu, 12 Oct 2023 10:39:16 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F40CDC433CC
	for <soc@kernel.org>; Thu, 12 Oct 2023 10:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F40CDC433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-579de633419so9700457b3.3
        for <soc@kernel.org>; Thu, 12 Oct 2023 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697107153; x=1697711953; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3oDNI1r5lnQu4SogBoFfe1dTr8U9qrvg3JFlPaLZjkQ=;
        b=co5z/tsHRu7dQfwbdjqoyCrP14doh5cJGPRleWWWu4y/lZmNowPQIeZsdQY2nmaSDD
         Jkz6eF+fjwIUYryjHfILR8g4HEKiJmyc6UNovmZsYRxFCTHMgPb+Wn+2hQMtIWjtaYhT
         Qtm7EyARyzM02UqAeGA47hzoMn61eQ9Gwl70e+6HlDsQop84i4WPDVbH2IfouV2KClgl
         lbAnbZ43Io1U4KFc9NksvcCq4gn7u3SV9hoNqZ9xba2u1Fu6TyFXKqmswrs3ApDmgLQ7
         H63hjLVYcJ9Xl1Wx2Rr2igsZQwp9b7ZiboWegxpMYRG0GsrUJob1oiyPqC9U6OlZULXP
         or8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697107153; x=1697711953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oDNI1r5lnQu4SogBoFfe1dTr8U9qrvg3JFlPaLZjkQ=;
        b=WLksjcPyo/CQgj/WCkUea2E8IYkcwfEajZdOyfJ0i1kwa2bfMt/CYyEYClHcS1OqrD
         7wTeYpGqz5eozEK90shcKlRh8jiXWe6yXpbqGa0rDqnkenJm/fwkqmTjPSqzHW5gSoiU
         xgnLNgu16bXKPDbzxfiFAaH4dQBMZ52+H20uMtmikQbI2WLMYny9MyLhl2Oh8MCRPFXn
         HdmsJfTqRlxJjoo2GREE34WUhOlagDj6+KFCL4bi/1FXW03+fsjiF/TMRcmwDyZbi+qX
         olUMHWAVLmMPaXSMgfP+AcE0B/U6IhzFbpuy7/SOf6Ejt4b3mwckRJJOLQeSe7BaVQ4h
         a0+g==
X-Gm-Message-State: AOJu0Yy2RFhOxX1EbZgyPyOPQk05l5R6jjr3TUav7/O5/lm7aBGgMhb9
	KNiVwrr4h/CSd79Cjzweat/MTnjIAX52GY8R+1Q9Bw==
X-Google-Smtp-Source: AGHT+IFxRHuALoKeSjfKb3H4CN2bFTSSU2Bt+HgqEZX9jtOl6oxsdLqG69us8msuH/TRvisud8wxsgY5xod/E0gS4Uc=
X-Received: by 2002:a0d:f204:0:b0:569:479f:6d7f with SMTP id
 b4-20020a0df204000000b00569479f6d7fmr22902098ywf.43.1697107153677; Thu, 12
 Oct 2023 03:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-3-peter.griffin@linaro.org> <5907e2b3-9a0b-4871-be08-6ca42200b8ec@linaro.org>
 <CADrjBPqF67bcTnssQO8cN2n1ZbevziVNa+gA5azEDz_1wXzaNQ@mail.gmail.com> <809be13a-74b7-4934-8319-17330febc1b7@linaro.org>
In-Reply-To: <809be13a-74b7-4934-8319-17330febc1b7@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 11:39:02 +0100
Message-ID: <CADrjBPpzfOmmr4sVDSXCM_RyVK1GKM+nVN6Cm=eMSBfN3sMciA@mail.gmail.com>
Subject: Re: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi Krzysztof

On Thu, 12 Oct 2023 at 11:20, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/10/2023 12:15, Peter Griffin wrote:
>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: google,gs101-cmu-top
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          items:
> >>> +            - description: External reference clock (24.576 MHz)
> >>> +
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: oscclk
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>
> >> enum:
> >>   - google,gs101-cmu-apm
> >>   - google,gs101-cmu-misc
> >
> > Ok just to be clear, are you saying I should have it like this?
> >
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             enum:
> >               - google,gs101-cmu-misc
>
> No, my bad, I meant apm + google,gs101-cmu-top
>
> >               - google,gs101-cmu-apm

Ah OK, yes that makes more sense. Thanks for the clarification :)

Peter.
