Return-Path: <SRS0=2ggy=HC=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90705C61D85
	for <soc@archiver.kernel.org>; Tue, 21 Nov 2023 17:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61578C433D9; Tue, 21 Nov 2023 17:15:56 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33BAAC433C8
	for <soc@kernel.org>; Tue, 21 Nov 2023 17:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33BAAC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ce322b62aeso3102702a34.3
        for <soc@kernel.org>; Tue, 21 Nov 2023 09:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700586954; x=1701191754; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wYvL1f6qyMgF9ZLkQm7l0/EVu68jtasrXI+WCiFQL18=;
        b=w3oI50//KLm9szWRTGPSZAEgusrOripMnqdZdOoc1kfVI8nY04xyHPICFKRNdE21BQ
         v2DarpEVrC+PtpByllnQ9Uljz7XzL3FICx0naQRwBtNBNiQBeMvyrbg4ijOZ3/oS+zU/
         Wrw0lGY4NWJARjHw1ccNBRjtmdlX9GDg8yS33/KGrbKVJYoil90x2ap0Y9PZiuvdua2t
         Qcu3TXlHIiD6JfQLaSiklyaIjsHhrUh94t5aKzycDHW6QyJFK2qpbpDpp7ZPCSZEgovE
         xS4PzPgghU9JbqFCaIytF+H+ycAA2tTBVDtA63XA1T865Z1BPS3sLumI/dWRWkoLbeKp
         7jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700586954; x=1701191754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYvL1f6qyMgF9ZLkQm7l0/EVu68jtasrXI+WCiFQL18=;
        b=ZkDNgrMAT1f0/uyiA0biWznDieR1/wR/HE5WKZPTD5qpcnlTiRAu885SLTSn57l/bG
         wCiOLmmcrKwzUd/VmmAApRs/BwsKJmh/OR/iqE8wWCzRjiohtxkotKtAuGvD38yd0ugC
         oF/YxDGzYLAbXhvu6NafTeTWngsyhixzXKlGSJDjn6PcDRzTeoHGU/EcF7j+IbW00lXb
         qhQRRI+RhOIcxPGQzJQrF2oPYgmQ+Tl/KaJZKzLKhrUquZK+6Z+mJ0Jm3eE05tWubETh
         ee2wVg4iW9x/rybM3OtArYNNQQTPiDQKyJwX/j/Sdsx6gNEDKrdOv8fA+5FMnJGNxLsD
         Lwgg==
X-Gm-Message-State: AOJu0YxguL1ZkUEPqYqxDsT+bxMoUHx298Tk2QtzJ/18Zp3CLDp8p5O0
	fj8NwM6Kf7KNGAfrQrwUuWwW/R7xudS6RUdGDm+3tg==
X-Google-Smtp-Source: AGHT+IE1Yjlr5gsSZr73YBwrAm/JguEA+8gBotneRznXIDcM0Spz8+slB43K4KERP5aFOuw7iXwJdfOtIrJBVa4sOBQ=
X-Received: by 2002:a05:6830:1da4:b0:6b8:807b:b50 with SMTP id
 z4-20020a0568301da400b006b8807b0b50mr13016366oti.22.1700586954278; Tue, 21
 Nov 2023 09:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-10-peter.griffin@linaro.org> <20231121151630.GA1692178-robh@kernel.org>
In-Reply-To: <20231121151630.GA1692178-robh@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 21 Nov 2023 17:15:42 +0000
Message-ID: <CADrjBPo4qw4eJLuGsv7aK4V7QjGR_n_MQ+W-Rrq92iATSLFHZQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your review.

On Tue, 21 Nov 2023 at 15:16, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Nov 20, 2023 at 09:20:27PM +0000, Peter Griffin wrote:
> > Specifying samsung,uart-fifosize in both DT and driver static data is error
> > prone and relies on driver probe order and dt aliases to be correct.
> >
> > Additionally on many Exynos platforms these are (USI) universal serial
> > interfaces which can be uart, spi or i2c, so it can change per board.
> >
> > For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> > required property. For these platforms fifosize now *only* comes from DT.
> >
> > It is hoped other Exynos platforms will also switch over time.
>
> Then allow the property on them.

Not sure I fully understand your comment. Can you elaborate? Do you
mean leave the 'samsung,uart-fifosize' as an optional property like it
is currently even for the platforms that now require it to be present
to function correctly?

I deliberately restricted the yaml change to only require this
property for the SoCs that already set the 'samsung,uart-fifosize'  dt
property. As setting the property and having the driver use what is
specified in DT also requires a corresponding driver update (otherwise
fifosize gets overwritten by the driver static data, and then becomes
dependent on probe order, dt aliases etc). The rationale was drivers
'opt in' and add themselves to the compatibles in this patch as they
migrate away from obtaining fifo size from driver static data to
obtaining it from DT.

>
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > index ccc3626779d9..22a1edadc4fe 100644
> > --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > @@ -133,6 +133,23 @@ allOf:
> >              - const: uart
> >              - const: clk_uart_baud0
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-uart
> > +              - samsung,exynosautov9-uart
> > +    then:
> > +      properties:
> > +        samsung,uart-fifosize:
> > +          description: The fifo size supported by the UART channel.
> > +          $ref: /schemas/types.yaml#/definitions/uint32
> > +          enum: [16, 64, 256]
>
> We already have 'fifo-size' in several drivers. Use that. Please move
> its type/description definitions to serial.yaml and make drivers just do
> 'fifo-size: true' if they use it.

What do you suggest we do for the samsung,uart-fifosize property that
is being used upstream?

>
> > +
> > +      required:
> > +       - samsung,uart-fifosize
>
> A new required property is an ABI break. Please explain why that is okay
> in the commit message.
>

I can update the commit message to make clear there is an ABI break.
As mentioned above the platforms where this is now required are either
already setting the property or are new in this series. Is that
sufficient justification?

regards,

Peter
