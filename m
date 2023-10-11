Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5367CD6E73
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 14:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2E34C433CA; Wed, 11 Oct 2023 14:16:46 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7E74C433C7
	for <soc@kernel.org>; Wed, 11 Oct 2023 14:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7E74C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d81adf0d57fso7256565276.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 07:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697033804; x=1697638604; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5AcAEIgQaz/GIuBtTUVaPCRo9z2CF/BUIUZyLtSgPXo=;
        b=ONSbpzIMdhvx4sCkDoghMjISVgy9SvYb70/Zil8JSPQ03K3JYPXLYCAs1E5+SaslvA
         db+suJ+PgIq0NnQQO9nFXu1hZ+yYbEUu5IgVzHcqvKrGMl9azvVXecTj//J4e6kmGej2
         weIpWlcgCQ+4jEPcbElIJsNP85RrPPmwExbcxm/EROYnF0QPm7NucH4pFrOUeACqSars
         YGw3ncnzVKt0Tj47nAjK25cYmKLF4+V1sD/V999T273/u2WV1KS26dXZvghFFD45owUe
         +sW2llZuAKcYjOPZehz48lXmYSvd+Bea9IIruV/K1qKXPWaZOy0uWto5dd62vV9fmeQB
         s1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697033804; x=1697638604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AcAEIgQaz/GIuBtTUVaPCRo9z2CF/BUIUZyLtSgPXo=;
        b=J24szawzAwMRqvT0BP0D4X8vsF/NDxaqstaro9DYsuM5Syp1RKcqV4wY4839BvOSS/
         VK+WZoaUvhtVteQOxGuybt/TFdzYwA3Jr1Vt530p4zI1ZB+mjt7ljiAW+nkA5UDSO1bA
         xrLle867J6tOsXqbkGzQ8PaidJ9JuCEdInbTlRTS6Ni8iZ5Zc7FXoPFCVVexP+aqtCJ2
         iTUpMEPvw5F7lA4hpStuRumy5KATLglEMmYPioN1F/EMal/fNHdTk7dfEFs8xv0Uioe3
         TLcqOEeLP820emMqylOGVKGlt0/DMB4znFc6vFsIyu9ZuHtPrEJp00u2Au09XxT59dBD
         gaOg==
X-Gm-Message-State: AOJu0Ywp/vjqZCLxceeZV37oL5J2I1geSB73vprVXqrKJup1a2cqTLJ4
	vyED40VBN+o3bsofla02Dta1c3IZZ/4jEgYdpHuSnw==
X-Google-Smtp-Source: AGHT+IEbqOax8oDVUgvao/QFTefyxeAVM5knikoYE8lBFFTckEkNGgmTmdLGag/DK7OcWkY2U7XRu7hK5hNHqf19Ykk=
X-Received: by 2002:a25:8e06:0:b0:d44:af:3cce with SMTP id p6-20020a258e06000000b00d4400af3ccemr20446932ybl.27.1697033803795;
 Wed, 11 Oct 2023 07:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org> <CADrjBPqOmGEzeVEKiysxQNo9+B0=zD3Z+G24fPDKrFsgUXYJjQ@mail.gmail.com>
 <14bb7d8d-0f99-4a5e-aee6-b0db1d17c1e6@linaro.org>
In-Reply-To: <14bb7d8d-0f99-4a5e-aee6-b0db1d17c1e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Oct 2023 15:16:32 +0100
Message-ID: <CADrjBPoJryV_WObRa+EQ38DxV2iTE4167m=HHBMM=eUpWgfzrw@mail.gmail.com>
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

Thanks for your review feedback.

On Wed, 11 Oct 2023 at 09:42, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 10/11/23 09:16, Peter Griffin wrote:
> > Hi Tudor,
> >
> > Thanks for your reply.
> >
> > On Wed, 11 Oct 2023 at 07:10, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >>
> >> Hi, Peter,
> >>
> >> On 10/10/23 23:49, Peter Griffin wrote:
> >>> Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl
> >>> compatible` I tried to narrow the interrupts check to
> >>> google,gs101-pinctrl but I still see a warning: gs101-oriole.dtb:
> >>> pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long If anyone can
> >>> educate me on what I've done wrong here it would be most appreciated!
> >>
> >> I guess the initial definition of the number of interrupts should
> >> include the largest min/maxItems. I no longer see the warning with this
> >> change:
> >
> > Yes that is how it was in v1. The review feedback though was to narrow
> > the scope to just google,gs101-pinctrl compatible using if: then: else: which
> > is what I can't get to work properly.
> >
>
> Right. The diff that I sent is on top of your changes (patch 6/20).
> I expect that when the interrupts property is defined it should include
> the min/maxItems of all the available SoCs. Then use "if Soc" to narrow
> the range.

Ah I see, yes thanks Tudor! I will incorporate this in v3.

regards,

Peter
