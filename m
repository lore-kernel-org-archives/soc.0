Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B911CD6E4D
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 09:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57919C433CC; Wed, 11 Oct 2023 09:06:33 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73CCAC433CB
	for <soc@kernel.org>; Wed, 11 Oct 2023 09:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73CCAC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-65b0557ec77so38603066d6.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697015190; x=1697619990; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoGJqBpx4DnJ8f9sTHuaCwd+hLOrI3etlSVQtwSYzRo=;
        b=OrmrtOMJ0SRc4wH80i2ARiC+5gYmqAigZNoXzkGX3HAQsZeA5nMamMUqtnIaxhEN+P
         P7ne6j6ypjUBNSi5isiR/qUvfT0NzyLpmzRxtZj/ow2BlUG46WdJSQPsESD2nEdsHNOn
         6KAX6sqzxdOpphGa+nfhZr62ZeRyjMF9qHuorAjfP4RmEk1WYo3484MhpdzmS/E6iHgr
         PQy2a+Y7SHx3dApoQ1t2AQXBjTg5ePY5W1gNWdFiwo8h/7+vWyJj/7wIeaQw5Wd0KCN8
         QeIdECEKVJan91U18EPv9WP72JNjOghaWJ299TRq1V22Sy0wBlI1LknEXtcNiwEeucml
         MQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697015190; x=1697619990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoGJqBpx4DnJ8f9sTHuaCwd+hLOrI3etlSVQtwSYzRo=;
        b=Cs4g95pPbrhCoW3qet7kdQ65IH58UHX2ZeNrs0wum4+ajp5PRfOq/9zoQ0jxmemXQO
         JvlANO+zXOu4InjKUP8Pzk1d99gdrX7+WvfEffg/EvNQYNZk2u1UoAmjJOmwUDHBvzA1
         8pgMO6fliaVwsbE5gPo7uxWgglqLN9wALRJN65QgqgfCL69hSLJUx5c2ihXmBnESET8o
         S9bq9znrWtEEsTFg0gqin+AAxGRrRqLAgIc0+XR82ihggWoTf73eLp4fGDfPLeWD6U9b
         WqEWxEmfJ96UROVOdIK7Kdm8PXpaZQho/4U/D7Fg0FARCIggpPmRnjlSqX1YJ0sWjr+Q
         XOFA==
X-Gm-Message-State: AOJu0YzKxfCBLtbi7Pbb7oTqMbsLn7QtL5mnlnfWnd88fKNWy0WBrMS+
	zQWxLMFcRfcm1RX+KWiZKuypBzivBo6MND9lCBG/PA==
X-Google-Smtp-Source: AGHT+IFdQ8tqBV1dqi5xaG7XGfWgTgWoFJqlw9bQU9nodG2NXg1+wmQjaus0dItmXwH0cAGNry/TzU0ByWLIxJoNkmQ=
X-Received: by 2002:a05:6214:3d06:b0:656:5441:a13f with SMTP id
 ol6-20020a0562143d0600b006565441a13fmr23058441qvb.45.1697015190275; Wed, 11
 Oct 2023 02:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org> <2023101101-mauve-underarm-1b48@gregkh>
In-Reply-To: <2023101101-mauve-underarm-1b48@gregkh>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Oct 2023 10:06:18 +0100
Message-ID: <CADrjBPr2UAfpuuw6M8T5UaiTmCYz0e3jabfDCcUJtH+35mwBKw@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To: Greg KH <greg@kroah.com>
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

Hi Greg,

Thanks for your reply!

On Wed, 11 Oct 2023 at 08:44, Greg KH <greg@kroah.com> wrote:
>
> On Tue, Oct 10, 2023 at 11:49:08PM +0100, Peter Griffin wrote:
> > Hi folks,
> >
> > Firstly, thanks to everyone who reviewed the v1 series! V2 incorporates all
> > the review feedback received so far.
> >
> > This series adds initial SoC support for the GS101 SoC and also initial board
> > support for Pixel 6 phone (Oriole).
> >
> > The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
> > (raven) phones. Currently DT is added for the gs101 SoC and Oriole.
> > As you can see from the patches the SoC is based on a Samsung Exynos SoC,
> > and therefore lots of the low level Exynos drivers can be re-used.
> >
> > The support added in this series consists of:
> > * cpus
> > * pinctrl
> > * some CCF implementation
> > * watchdog
> > * uart
> > * gpio
>
> So you have sent a patch series that crosses multiple subsystems, who is
> supposed to be taking these patches?  Or do you not want them actually
> merged?

Krzysztof indicated here:
https://lore.kernel.org/all/b1598405-b01f-426a-aaba-89f2d2dc9c2e@linaro.org/
that he would like to be the one applying the entire series through the Samsung
SoC tree. If that's fine with everyone (it's OK with me).

kind regards,

Peter.
