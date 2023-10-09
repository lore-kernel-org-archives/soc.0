Return-Path: <SRS0=6RRD=FX=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC00FE95A91
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 11:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91B86C433CD; Mon,  9 Oct 2023 11:39:25 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF5A0C433C9
	for <soc@kernel.org>; Mon,  9 Oct 2023 11:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF5A0C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-65cff6a6878so26023186d6.1
        for <soc@kernel.org>; Mon, 09 Oct 2023 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696851562; x=1697456362; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EuwFZHJVuMY/yvjjKPbV97tzmTd5bLJUXzIBt8fiBeU=;
        b=aKw8k+9Xw0TnddmYLKmR3IK/XL0ZMZNeaVB1rGYfNxjSqFdaNgPGguQ99N3x/yr1nn
         JBCKFOUjL/AmT5lq9zmX5ac03zP5VpiIeK2f6ISq6K9K9Ns9NvoRksDwDvcWF0Z7o9Ov
         B0fcrXA+hAZ8D4ULySN9Ixc/JHyUqlYpRJ2eoWsDmf2VJmvlQF8Y20+aGXgoGyQbFe9e
         XizbH/iVoXAT5EGavAw9P+Bo3e0Ok8iIFgMzr/mXQ5PzfS596SrQbL51pDTn+SUJRwVC
         aoMpaSu3ullOfa4m+EkCZVj8VDnQeE8zUiwNVIZBBxbrhfrH5DVvHu7esyu/vtzajZE2
         6LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696851562; x=1697456362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuwFZHJVuMY/yvjjKPbV97tzmTd5bLJUXzIBt8fiBeU=;
        b=eXFqQxzsIEPxAnPaBf6K+6MRX3JxOZW7kSUGhkNQ3TABkyA92laKS2IfUO0vT3Mvdt
         ojJKndCziD48sLeJt5RpZsmnQGAnnGEyqQb2mRVax9ekXE5sOcMuHvUZtHzz1/q7Wtu+
         U2gm6kTrNGxfSKwPJfNRe3DiYrb99KXqCiqVfwiDMQv2y0y58rZ6Pfgd+ytfv9D5kKUZ
         ILWbKu5bEY/N33IJSC8f7BZSlI3KrjlayAE1m3/5ck8I6GeubyRiJQR5AcOzw0g0y9BC
         4uVxR2typz2Ude9SwbR6YzXRy34jss5Wl+BfSi0ApZgxnW2XWyNO8r0RpVbRxjhVCEgp
         74fQ==
X-Gm-Message-State: AOJu0YzMqHaDa/bZ/s26G2ddBN8HsijI5RPfxPV/Ciso/NesnUCd1twq
	6yrPPKwOAiVjHCK8IgnkeOOlK7PSFpR2NTifJUn04g==
X-Google-Smtp-Source: AGHT+IHhyWHWa0UYEa7KLSkkNZGhyeUdCzA/1rc4dvVTiJ5tMM/yCOey8ADmLWlaoAKBYm19JBp5FhbJvbRLLVFW2Xo=
X-Received: by 2002:a05:6214:3187:b0:647:2f8f:8c29 with SMTP id
 lb7-20020a056214318700b006472f8f8c29mr15562695qvb.48.1696851562503; Mon, 09
 Oct 2023 04:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org> <b1598405-b01f-426a-aaba-89f2d2dc9c2e@linaro.org>
In-Reply-To: <b1598405-b01f-426a-aaba-89f2d2dc9c2e@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 9 Oct 2023 12:39:11 +0100
Message-ID: <CADrjBPovLf-L0O26JKMCOgDzDkEVZeo0sZA-M_9f2c9K7z1S2g@mail.gmail.com>
Subject: Re: [PATCH 00/21] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
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

On Thu, 5 Oct 2023 at 17:32, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/10/2023 17:55, Peter Griffin wrote:
> > Hi folks,
> >
> > This series adds initial SoC support for the GS101 SoC and also initial board
> > support for Pixel 6 phone (Oriole).
> >
> > The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro (raven).
> > Currently DT is just added for the gs101 SoC and Oriole.
>
> Thanks for submitting the patches. Nice work!

Thanks, and thankyou for reviewing the series so promptly.

>
> This is basically a custom-made variant of Exynos made by Samsung for
> Google. Something similar what is with Tesla FSD (and Axis Artpec-8
> which was not upstreamed, AFAIR). Many, many drivers and bindings will
> be re-used. I want to be sure that GS101 fits into existing Samsung
> Exynos support, re-uses it as much as possible and extend when necessary
> without breaking anything. Therefore, when the patches are ready, I
> would like to be the one applying entire set and future submissions
> through Samsung SoC tree, just like I am doing it with Tesla FSD, so I
> keep entire Samsung-ecosystem in shape.
>
> This also means that you are lucky to be selected to:
> https://elixir.bootlin.com/linux/v6.6-rc4/source/Documentation/process/maintainer-soc-clean-dts.rst
> joining there Tesla FSD and entire Samsung Exynos family :)
>
> I hope that's ok.

That's all fine, it makes sense and it was what I was expecting. Maybe
we can try and get you some Pixel 6 hardware as well. The only other
Exynos hardware I have for testing unfortunately is the e850 board Sam
has been working on.

Coincidentally https://www.crowdsupply.com/0xda/usb-cereal just started
shipping. Which is quite nice (albeit coincidental) timing, as anyone who
has a Pixel 6 device can order one so they can run upstream kernels on
their phone and have the debug UART available (which currently is the
only way to really interact with the system until we bring up more IO).

regards,

Peter
