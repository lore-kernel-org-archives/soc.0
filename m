Return-Path: <SRS0=HlOH=HD=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806B9C072A2
	for <soc@archiver.kernel.org>; Wed, 22 Nov 2023 08:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D336C433D9; Wed, 22 Nov 2023 08:42:52 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0764EC433C8
	for <soc@kernel.org>; Wed, 22 Nov 2023 08:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0764EC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-677a12f1362so25111146d6.1
        for <soc@kernel.org>; Wed, 22 Nov 2023 00:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700642570; x=1701247370; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xJJJ00lRDiFcS8bTCcGfNaw9iOLVdZbPikVW1utuBzM=;
        b=CBNjxqvwkUcs7ZAn0aNaKVvoq8x5pmKbblJR8rwREpzc/8aaAvSDqXyRh/K4ixOwEA
         hbyAze1bCvBWRiywa6nR5mQ3Mrj8gK+j2/BhnILaobnsUBfjJwxLsbyw+mx6WFzxhmx+
         gL4mZN2S3203sfW7KPdwP1g84recULjmwlGa6kC/Rndqbio74fLyvS4h1Ud+1+7ENa97
         7CpX0jODB7YjT3S8xbqKxPdt9MfsLEc4HcwDIvvg/4G5xyEmieJuKzkUXQuV/QzoO/Ye
         Fe5J61xHK/hm9z+E3chrQOVk/B29Z4tafzvjB09C1KVZ5z1h2TMoesYwZ0Pc1e9bONIJ
         ayqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700642570; x=1701247370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJJ00lRDiFcS8bTCcGfNaw9iOLVdZbPikVW1utuBzM=;
        b=NsYapPRXLGl+UZ/OIQ4BiwqeyV8YGVYNCJj/mjJz30kpZz9pocn57pjPQGoyhWJ2s/
         zFxdy+wOvB3OE7EB7zsagYLDREMw3VDCby47gR3L4fjkdUxWlFOlmRN7sPC9+SoaT2L8
         dcYrn1RNmrnYYh5EykkpfyfTaKDvDfKuShxCPLx4BR8zcc03SpfFAL4GxxeLSnY+ev+n
         ALmeWwh+SPIOLmcJd0xxaI6Ohyv4raV0JPEg7rF6z22aXrxbjOt3H7ySWtJLCvDJ6O88
         vy7nEA+M2+11tlW+PhYSjqW4Dm9u+zhIUVcLOn0bemka0YXBmWpnTJ4EiyK8ExDZGD1y
         pjQw==
X-Gm-Message-State: AOJu0YzNP4HbHz3GTDqsbDILw5iI8Znl436NxwlAmZHzOHduizm8JaoQ
	kHX1OuMUTJclvnlWA6dTkzVxdRpsnfT1TzrzEG8OEA==
X-Google-Smtp-Source: AGHT+IGuE4s7BTtl86J4aY1Nuyr+QChlQ+/ghmDxMJ+Qpji0VOMTRWww7BDliDBXUH4jhsBEXFzcxCwrF5hxCi4U9KY=
X-Received: by 2002:a05:6214:f6c:b0:64f:92af:9080 with SMTP id
 iy12-20020a0562140f6c00b0064f92af9080mr1950970qvb.21.1700642569839; Wed, 22
 Nov 2023 00:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-10-peter.griffin@linaro.org> <20231121151630.GA1692178-robh@kernel.org>
 <CADrjBPo4qw4eJLuGsv7aK4V7QjGR_n_MQ+W-Rrq92iATSLFHZQ@mail.gmail.com> <35990cd2-a4d3-473e-893e-aa16c1c63289@linaro.org>
In-Reply-To: <35990cd2-a4d3-473e-893e-aa16c1c63289@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Nov 2023 08:42:37 +0000
Message-ID: <CADrjBPr6t16Ypdg-M-r73PNiGe0XAdeCPs6Tk=iHsU3pPA9=4w@mail.gmail.com>
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
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

On Wed, 22 Nov 2023 at 07:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/11/2023 18:15, Peter Griffin wrote:
> > Hi Rob,
> >
> > Thanks for your review.
> >
> > On Tue, 21 Nov 2023 at 15:16, Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Mon, Nov 20, 2023 at 09:20:27PM +0000, Peter Griffin wrote:
> >>> Specifying samsung,uart-fifosize in both DT and driver static data is error
> >>> prone and relies on driver probe order and dt aliases to be correct.
> >>>
> >>> Additionally on many Exynos platforms these are (USI) universal serial
> >>> interfaces which can be uart, spi or i2c, so it can change per board.
> >>>
> >>> For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> >>> required property. For these platforms fifosize now *only* comes from DT.
> >>>
> >>> It is hoped other Exynos platforms will also switch over time.
> >>
> >> Then allow the property on them.
> >
> > Not sure I fully understand your comment. Can you elaborate? Do you
> > mean leave the 'samsung,uart-fifosize' as an optional property like it
> > is currently even for the platforms that now require it to be present
> > to function correctly?
> >
> > I deliberately restricted the yaml change to only require this
> > property for the SoCs that already set the 'samsung,uart-fifosize'  dt
> > property. As setting the property and having the driver use what is
> > specified in DT also requires a corresponding driver update (otherwise
> > fifosize gets overwritten by the driver static data, and then becomes
> > dependent on probe order, dt aliases etc). The rationale was drivers
> > 'opt in' and add themselves to the compatibles in this patch as they
> > migrate away from obtaining fifo size from driver static data to
> > obtaining it from DT.
>
> Your code diff looks like you are adding the property only to these models.

OK, I intended to only make it a required DT property for these
models. Presumably there is a better way to achieve that.

>
> >
> >>
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>>  .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
> >>>  1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >>> index ccc3626779d9..22a1edadc4fe 100644
> >>> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >>> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >>> @@ -133,6 +133,23 @@ allOf:
> >>>              - const: uart
> >>>              - const: clk_uart_baud0
> >>>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - google,gs101-uart
> >>> +              - samsung,exynosautov9-uart
> >>> +    then:
> >>> +      properties:
> >>> +        samsung,uart-fifosize:
> >>> +          description: The fifo size supported by the UART channel.
> >>> +          $ref: /schemas/types.yaml#/definitions/uint32
> >>> +          enum: [16, 64, 256]
> >>
> >> We already have 'fifo-size' in several drivers. Use that. Please move
> >> its type/description definitions to serial.yaml and make drivers just do
> >> 'fifo-size: true' if they use it.
> >
> > What do you suggest we do for the samsung,uart-fifosize property that
> > is being used upstream?
>
> Nothing, your diff is just wrong. Or at least nothing needed. Just drop
> all this properties: here and only make it required for Google GS101.

OK, so your happy with the approach just not the implementation/patch
and you don't want it updated to use fifo-size instead of
samsung,uart-fifosize

>
>
> >
> >>
> >>> +
> >>> +      required:
> >>> +       - samsung,uart-fifosize
> >>
> >> A new required property is an ABI break. Please explain why that is okay
> >> in the commit message.
> >>
> >
> > I can update the commit message to make clear there is an ABI break.
> > As mentioned above the platforms where this is now required are either
> > already setting the property or are new in this series. Is that
> > sufficient justification?
> Yes, but only first case. You need to order your patches correctly -
> first is ABI break expecting ExynopsAutov9 to provide FIFO size in DTS
> with its explanation. Second commit is adding GS101 where there is no
> ABI break.

OK, I'll drop the ExynopsAutov9 part then. I don't want to complicate
this series by introducing an ABI breakage on some other unrelated
Exynos platform.

Peter
