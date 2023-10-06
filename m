Return-Path: <SRS0=XHl9=FU=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5822E94125
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 21:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8673C433CD; Fri,  6 Oct 2023 21:52:57 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A531AC433C8
	for <soc@kernel.org>; Fri,  6 Oct 2023 21:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A531AC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59f7f2b1036so31370907b3.3
        for <soc@kernel.org>; Fri, 06 Oct 2023 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696629175; x=1697233975; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rPxjIeED0bawl/Zg89RjgWrJXCyV4Gh65dmdUfl1ys=;
        b=mycYcxSGxsLD1MyPzakg0SMBGfi5ih5PVIDtmaC79KNgpdAQ61lWs6R7LiEAHGoR7m
         Bt/4avCPzxtdSK7OLiQdisxFos5RDRXSpoaVUOh4CED4od32DW6KXUFb+Zo8rr2mdzuk
         HXWQAIDAz0zAnSqKzAme6B26KEUxV4FiJAo+Zxfd0z8h3+2JafXksw3fSz/NnjS1si9x
         CkJNSkl1819VymuFWRz3N2E9UKIi78IwbrjpB8GVOiLfcGGsTwgEFz+aDlpspH79tWaE
         HBAfSeNwSnSgPDQUOnllYo5zx6ozi5CxKUYNVAWNZmXVQDCp8NjGUtJ4Uw8eJk+r2OBM
         r+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696629175; x=1697233975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rPxjIeED0bawl/Zg89RjgWrJXCyV4Gh65dmdUfl1ys=;
        b=IPZz8s0iwB9H/57PBnWsxwoFEUM4hGR1/AMC0BHQFaP/UKZVALswh1UHeTYzdg8U/R
         gYSCMWCDYdLI8wKNgKRuUGGkQE2J0vyU5xpwPVqFz5H4wgD6MTAC1wcTJEkPoIrw645q
         /i9kHmEFh5mlk7Cs866+9wsGoXfygI3CMH3iLJBTO+eoiw0RM9LTxVwW/4sKGicEh0/b
         5IayvPQt8N+RZeUUBX0qJIzpxLfc3Yh1qecMX3k9ubFXgSLmXgJ5kX6iv9+xkJox5ViJ
         lzMv/2c2sZIjvvwguzQizxAmpHsv7vf3g1acCQhx1nnH6lVgEUCtkojnrFbBf2kekxHI
         VVjw==
X-Gm-Message-State: AOJu0Yzg40S6IHOSGZhiOJqvA7bx99ixhoyyv4+XK7cTYoSjIEAGdCWf
	YRlpd5UJEs2xar3vV6UTt7jL5U20wjH8NrbgBNJoig==
X-Google-Smtp-Source: AGHT+IFtX2fxe7d3k5oKKf0awkIPkKawjGVBLybPNlpLznR5lXwlZYsZkR+FwG2n0CD+MRFwqqi8iiuKTGPz9YDHAGY=
X-Received: by 2002:a81:524f:0:b0:56d:2d82:63dc with SMTP id
 g76-20020a81524f000000b0056d2d8263dcmr10487001ywb.10.1696629175634; Fri, 06
 Oct 2023 14:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-2-peter.griffin@linaro.org> <419f823c-2476-4aec-b25d-7e6a2994555a@linaro.org>
In-Reply-To: <419f823c-2476-4aec-b25d-7e6a2994555a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 6 Oct 2023 23:52:44 +0200
Message-ID: <CACRpkdbAFOm07ttP9gXasTkZOc0JC3DKv9wBsVYSV3rEfqi9iQ@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: interrupt-controller: Add gs101
 interrupt controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 6:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 05/10/2023 17:55, Peter Griffin wrote:

> > Add the gs101 SoC interrupt header that provides human readable
> > constants for all the IRQs in the SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

> > +#define ITNO IRQ_TYPE_NONE
> > +#define ITER IRQ_TYPE_EDGE_RISING
> > +#define ITEF IRQ_TYPE_EDGE_FALLING
> > +#define ITEB IRQ_TYPE_EDGE_BOTH
> > +#define ITLH IRQ_TYPE_LEVEL_HIGH
> > +#define ITLL IRQ_TYPE_LEVEL_LOW
>
> No, these are not bindings.
>
> > +
> > +#define IRQ_ALIVE_EINT0              0
> > +#define IRQ_ALIVE_EINT1              1
>
> We do not keep interrupt numbers as bindings. Please drop entire file.

Agree, but it should be fine to have as a SoC-specific .dtsi under
arch/.../google/gs101-irq.dtsi though!

Yours,
Linus Walleij
