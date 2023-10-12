Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28B0CDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 10:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87286C433CB; Thu, 12 Oct 2023 10:15:20 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 475B2C433C8
	for <soc@kernel.org>; Thu, 12 Oct 2023 10:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 475B2C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-66d11fec9a5so4685826d6.1
        for <soc@kernel.org>; Thu, 12 Oct 2023 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697105718; x=1697710518; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4bfmHiCpC0jdM/8Nmc5CLWmrrts9axW4w44tXuO9DcI=;
        b=JtigCuh3ysuXJVj2Tkjl0XBbw8msa4Ro1Y75ZUPS9RJTIxO0ZtasBtTBi9Q6HHpKUk
         nz9hPcagTXexHQCa16UzYsJYHXTC4beNBdDuDqYjCtwi555bmbkJs9nBJy2uwGpbD2Uy
         5s+ur7B/eWa5PszmUxviQgcXwefuqD+pL9Vo+8Ol/weQhHG/4PW5LvQcay56wPKZkzRb
         aUtufuE6T6V41gYvrl/DP79bcF3c6UV1idqG5SvLA8YgF4+aaSFugkAAgMI+PSVgSsxk
         gVx5LOGX4jukZydVtQl/ji+q8MQgaLRzlgnby8RH9VmGR22wwXyiPIkSDYMDbYlMDb5T
         20hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697105718; x=1697710518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bfmHiCpC0jdM/8Nmc5CLWmrrts9axW4w44tXuO9DcI=;
        b=Cg+1QDiPxGepX0nII2sP0NnacTM1PnhlLNMq61yYtvtB1qVw/4xtCEgBEDIoILrI01
         i0eP6GS0zSBgvdQ2xowpI7Y4EpT/VRmQub76qtPtmpACGuGH7yNA48lUREKYDDTQASN7
         zMAF3xapED62L3G8kj7USs9g4LkmzFKqE1xU0F/2ZcAA/6vMxlJXUcbE0b3kkleqkMgo
         Rrbdx72+tW1qJmlnKILR8FuUoxiPe/NRHPSWr2Lhs+zlF03vkYlyuFiilKQRL3ozwgqh
         t2cg1z8+7FVjx8ndfz6Rs09MMSdnOoTEMw2jQYOwFwNa8V2oxh8cHeISdRDBeGEDwyLe
         mFfg==
X-Gm-Message-State: AOJu0YyOsX26kwVicDaJInDeAYr8JGx4k6iDBdTxJXbmU3w2myZLhlIn
	3kSA6zbNZ+wOmDzfugi4s+f/Pe+IJTXz7j1lPgRbnQ==
X-Google-Smtp-Source: AGHT+IEr9WuwYaxxoqJYFrbfAwBrWEHdqAE5exk8Mtmrx/Nk29qQXhDrGvuFAVS7ncKWTmolqk5rMwGO1qR3JFlm9Cg=
X-Received: by 2002:a05:6214:2c04:b0:65a:fcd1:1d85 with SMTP id
 qq4-20020a0562142c0400b0065afcd11d85mr24813204qvb.60.1697105718086; Thu, 12
 Oct 2023 03:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-3-peter.griffin@linaro.org> <5907e2b3-9a0b-4871-be08-6ca42200b8ec@linaro.org>
In-Reply-To: <5907e2b3-9a0b-4871-be08-6ca42200b8ec@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 11:15:06 +0100
Message-ID: <CADrjBPqF67bcTnssQO8cN2n1ZbevziVNa+gA5azEDz_1wXzaNQ@mail.gmail.com>
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

Hi Krzysztof,

Thanks for your review.

On Thu, 12 Oct 2023 at 07:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 20:48, Peter Griffin wrote:
> > Provide dt-schema documentation for Google gs101 SoC clock controller.
> > Currently this adds support for cmu_top, cmu_misc and cmu_apm.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/clock/google,gs101-clock.yaml    | 125 ++++++++++
> >  include/dt-bindings/clock/google,gs101.h      | 232 ++++++++++++++++++
> >  2 files changed, 357 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> >  create mode 100644 include/dt-bindings/clock/google,gs101.h
> >
> > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > new file mode 100644
> > index 000000000000..f74494594b3b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google GS101 SoC clock controller
> > +
> > +maintainers:
> > +  - Peter Griffin <peter.griffin@linaro.org>
> > +
> > +description: |
> > +  Google GS101 clock controller is comprised of several CMU units, generating
> > +  clocks for different domains. Those CMU units are modeled as separate device
> > +  tree nodes, and might depend on each other. The root clock in that clock tree
> > +  is OSCCLK (24.576 MHz). That external clock must be defined as a fixed-rate
> > +  clock in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> > +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this identifier
> > +  to specify the clock which they consume. All clocks available for usage
> > +  in clock consumer nodes are defined as preprocessor macros in
> > +  'dt-bindings/clock/gs101.h' header.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - google,gs101-cmu-top
> > +      - google,gs101-cmu-apm
> > +      - google,gs101-cmu-misc
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +allOf:
>
> No improvements here from v1.

Seems I missed the
"required:" go before "allOf:" comment here. Sorry about that I've fixed that
in v4.

Seems like a few other exynos clock yaml bindings need that fix to.

>
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: google,gs101-cmu-top
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (24.576 MHz)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
>
> enum:
>   - google,gs101-cmu-apm
>   - google,gs101-cmu-misc

Ok just to be clear, are you saying I should have it like this?

  - if:
      properties:
        compatible:
          contains:
            enum:
              - google,gs101-cmu-misc
              - google,gs101-cmu-apm

    then:
      properties:
        clocks:
          minItems: 1
          items:
            - description: External reference clock (24.576 MHz)
            - description: Misc bus clock (from CMU_TOP)

        clock-names:
          minItems: 1
          items:
            - const: oscclk
            - const: dout_cmu_misc_bus

Instead of a dedicated  'if: const <compatible> then: ' for each CMU?

If I'm wrong above would you been kind enough to elaborate a bit
more on what you want, as all this dt-schema yaml stuff is a bit new
for me

Many thanks,

Peter
