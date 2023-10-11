Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96D8CD6E67
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 13:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 813EBC433C8; Wed, 11 Oct 2023 13:27:26 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94E78C433C9
	for <soc@kernel.org>; Wed, 11 Oct 2023 13:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94E78C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3af604c3f8fso4763540b6e.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697030843; x=1697635643; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J5R4Azbu7hiSMoO3CcwbpnXuSGW+r6gu8ebn/VNh4qs=;
        b=W9AgCx+8npaCFe2ErYJ6WxHL5lQ+U27SeZuar/odt2pSnvhHdxbf2IZUnx1LUsi1j2
         WokGQHzRuPrzC7KM7QginvUkEuT/Rab3KNkHzb4mmz+4JEC6azN6OlCOBiKK9lhkzFze
         yOGSP64XFJL1u0B/7QywtpK5DN5BlQKkKbxY8on+u+lQ5DpdcgPl16q7QMtJSAPlGLVs
         4yCblSIWLUIYdGGBPruRXdtDzD7kMt6NVas9djN/dvn3e+zOoLW9goBCR8b+dO4JC0D8
         V6MZKBqURstw/2WVx35hRKos5mppOZSUYg4UM5kjOxVpbO0bQOtLG24ddW39wKfLieZA
         EnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697030843; x=1697635643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5R4Azbu7hiSMoO3CcwbpnXuSGW+r6gu8ebn/VNh4qs=;
        b=stmdGSwUSQnriZZZOgX9KxizI7ZhTzSHJqnWxb16JwNipVWRwSSO4dImAxPA7LN4W5
         6yEqC0YLovRDMSK06Rw2VYL+5CiKq5bI0rOhvRGx6/Shd9xVRGa8C1BzhvfXaqqw0C8J
         L7B+sQcNNDS5UkaCvBPIfXH9oWGWmu4eLpHF/wYUehSwXuXW79kADhLjUEC+Lr0nCMdM
         tL0BXEY24uoAUbWVjFX8Il1QCqvBQUhLlBH0VZn0+4V9b+jS+D3DIw4rTWP82X4OgkM8
         F6cGmLFQ+P31rF53CF2nLSoIXE+UTxD+wzamY6UH/ZCPVr/mdEoLrRlsUNxt3gDuJNrg
         5xXQ==
X-Gm-Message-State: AOJu0YxdxWI3AthZgvPZdlh2WpTLtH/6cYT5avHTZdGvYB4iBbgVJ75U
	qSpsT1VnHJb92o3RYrprmcyZ4HI2nVHNZMnf0OPJlQ==
X-Google-Smtp-Source: AGHT+IEl4MC4gBK7y4h1vXjlEl4INwrOMHMEVICuGPvkoTpxt+/f+cbntbu2E912Znr1yoiGGG01H3kikZpiQvQrQG0=
X-Received: by 2002:aca:1719:0:b0:3a8:432a:ea13 with SMTP id
 j25-20020aca1719000000b003a8432aea13mr21803799oii.46.1697030843628; Wed, 11
 Oct 2023 06:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org> <1b7dcc34-1c9c-44cb-ae14-f63aca2317ea@linaro.org>
In-Reply-To: <1b7dcc34-1c9c-44cb-ae14-f63aca2317ea@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Oct 2023 14:27:11 +0100
Message-ID: <CADrjBPqz=7L-cP5-muJbFWZ0DTH4LP-gqCxXRDGKebxpG1FYvQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review.

On Wed, 11 Oct 2023 at 13:09, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 00:49, Peter Griffin wrote:
> > Add dedicated google-gs101-uart compatible to the dt-schema for
> > representing uart of the Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > index 8bd88d5cbb11..72471ebe5734 100644
> > --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > @@ -19,11 +19,13 @@ properties:
> >    compatible:
> >      oneOf:
> >        - items:
> > +          - const: google,gs101-uart
>
> You just broke existing users.
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
>

Will fix in v3

fyi I've been running with

make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
dt_binding_check DT_SCHEMA_FILES=google
make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
dt_binding_check DT_SCHEMA_FILES=samsung
make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  CHECK_DTBS=y
W=1 google/gs101-oriole.dtb

But clearly that wasn't enough to catch this.  `make dtbs_check W=1`
takes a long time
and gives so much output. I suppose adding a few of the other exynos
based boards should
still be fairly quick and hopefully catch things like this. For example adding

make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y
W=1 exynos/exynos850-e850-96.dtb
make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y
W=1 exynos/exynos5433-tm2.dtb
make -j$js ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y
W=1 exynos/exynosautov9-sadk.dtb

regards,

Peter.
