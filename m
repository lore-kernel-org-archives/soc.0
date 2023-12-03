Return-Path: <SRS0=l1VT=HO=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C11FC4167B
	for <soc@archiver.kernel.org>; Sun,  3 Dec 2023 21:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B38EC433CA; Sun,  3 Dec 2023 21:39:58 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 895F4C433C9
	for <soc@kernel.org>; Sun,  3 Dec 2023 21:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 895F4C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-77dd07e7d39so289785085a.0
        for <soc@kernel.org>; Sun, 03 Dec 2023 13:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701639594; x=1702244394; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7gO8de0lce7HaKv0/P/qdh9+Js5noC/xSOjvtz3e/WM=;
        b=puX/h+X+LdFOuur8dkhVL5G1BFNbudjV90DvlSpzDs4w3HzuSTJZSNja89AM6Wtilj
         +ix4JEvqyIQHPiQDVxc/So+9GDu1xoINg0Q1BExnZ5pQSB6BVl1q58OTfbpsgoJvGUhF
         UMlx5/fAoJWlM4+tUU5rnKQS39QEZluaHD9TY4WdtZKDyadzq8KfZwswAr/fjYU5bZNA
         dQXcfcvRomwbWh7knuM22zAXSyKYqhnHqrKLGNwajnZubixBzcOkmFhN8WEg003+zrjY
         qE7tq8mEKjnOn4Wh5+WAn4atuc7JPx0P97MukukrqoDQd/UvsMFapNfzWz3PYZIr1PJb
         FowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701639594; x=1702244394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gO8de0lce7HaKv0/P/qdh9+Js5noC/xSOjvtz3e/WM=;
        b=HVcwquFvTxb/znSvvyYFw9ivvygHrwNMLdIUajfnR9YRvEl9d+zZKZDfVUD6uS3yyk
         sSCuvL/LRamEO47WfaeUhD24xOyWO0dcQkRSSyPl6gPqo3ntByXd1Yl4nBmHul3fAZmk
         /oouDk5E+VmdtZpXGsRiNR79feAQmAe98fbTYSb/BuWB21mS/88ZlPPbif2zqeat3A90
         xCSToeLTapnrwxQCu7wvpu1Dux4lbtBgAWRi+sFyjM1p3HXsYwm9ttg1J7qFInfY6HiK
         ui+4yFNU5WiAN1ftMR43ORIn5AmoZ5n2Ba26VcNBA5Vm6nQMwFoR1rnk1yCs4j0d6r2Q
         sN6g==
X-Gm-Message-State: AOJu0YzIStuiM4NQDRYabpF5d5ThPrEUjRfB8q33jMkkf9IJd+3xDf+u
	1Nbn7VJbH2+YI+irlWZPYllUUo/SIceYE2f1/+jjTw==
X-Google-Smtp-Source: AGHT+IGU7r7x9r9+baipwfFC2Z6LHKfOwxTcuFhaimGYhCIcueT+DijNUTVWF4dXUB1M1ZX2RA1n39vU5/gLge1bopA=
X-Received: by 2002:a0c:e94b:0:b0:67a:a394:e20c with SMTP id
 n11-20020a0ce94b000000b0067aa394e20cmr4222616qvo.38.1701639594412; Sun, 03
 Dec 2023 13:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-10-peter.griffin@linaro.org> <b4e710c0-dddb-4217-9979-21bdc20ee302@linaro.org>
In-Reply-To: <b4e710c0-dddb-4217-9979-21bdc20ee302@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Dec 2023 21:39:43 +0000
Message-ID: <CADrjBPpcknRifds+WpuwmdzGxxFq-osLf7_Rn1ENjoRcXwCRxw@mail.gmail.com>
Subject: Re: [PATCH v5 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
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

On Sun, 3 Dec 2023 at 15:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/12/2023 17:09, Peter Griffin wrote:
> > Specifying samsung,uart-fifosize in both DT and driver static data is error
> > prone and relies on driver probe order and dt aliases to be correct.
> >
> > Additionally on many Exynos platforms these are (USI) universal serial
> > interfaces which can be uart, spi or i2c, so it can change per board.
> >
> > For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> > required property. For these platforms fifosize now *only* comes from DT.
>
> I don't see ExynosAutov9 compatible in your patch.

I dropped exynosautov9-uart compatible from this patch due to the ABI
breakage. It seems I forgot to update the commit wording though. Will
fix.

Peter.
>
> >
> > It is hoped other Exynos platforms will also switch over time.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > index ccc3626779d9..65d5d361e8f4 100644
> > --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > @@ -133,6 +133,16 @@ allOf:
> >              - const: uart
> >              - const: clk_uart_baud0
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-uart
> Best regards,
> Krzysztof
>
