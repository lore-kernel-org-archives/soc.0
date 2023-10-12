Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0490ECDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 08:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9F8CC433CD; Thu, 12 Oct 2023 08:56:32 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB8E8C433C7
	for <soc@kernel.org>; Thu, 12 Oct 2023 08:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB8E8C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7a8b5ec9a6fso331009241.2
        for <soc@kernel.org>; Thu, 12 Oct 2023 01:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697100990; x=1697705790; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pPBtRkAyR8/yvLpXM2v/s42WseLth6/jHTmdZIsTmP0=;
        b=HLiUmyooPJEKM4ezhfthBSphjfFtC8NOvOqmnFuM4NwUbKcbqc1exTqtYzEDThWwDV
         WFRKqOpN+KNEH7Bdwf5DVbDHtpOyrNcA77B+cxbgBmRbNliSJmU7rrAcDqbMTSDOZczZ
         v6/0fqkYiJf+C+2WjdoA7x/j86Z2iJTFi2mVgE7ZARPJFSbGp2as6LdDibGTnsBBa90+
         cLzvDYrJJBwmlJ0+YGPa3RhxdCgvPXYUeZJvRnWXwowWfSP7fAJvM/u27wn2cmJe0YxA
         1X0cEkrKOcFb51zBhZ5JYJpCg2XkIaOZccOUUIvNQCbzOqjXGHHZC2McQ/LmHPGsjV/O
         cjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697100990; x=1697705790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPBtRkAyR8/yvLpXM2v/s42WseLth6/jHTmdZIsTmP0=;
        b=Pa7qb/Lpi/f8jsoDpgUSgJxKBGUDbJJQlAXzGqNVCC7BgcsSkBHDNLoawBkcP+FZC0
         Kgi2JMMrhpjfkSFXOKUev3XR6Uo1HQeCWqXAYFHpI52mD6IAJiS8LTMHcncPH+P7LipE
         eK6D+PY57mO+tjlcqnYOsJCAeptRhQ5RHuRMmoGbTDhQBiYbzam6JU6FQbN8kPnr2rb+
         afxhmAv9WDQiu+8hJQoMFUc8qNkvhICEtkzpGVrbL2da5mqotNCLapQp4NDXFoSz/7mp
         3YasAUBoskLD/Lisv1T3hZWtzBTsxBuMoAAJ+aONXfTAfhjoqoRkt3OHx4TdLARjwM90
         SupQ==
X-Gm-Message-State: AOJu0YxdRDGB7V1oTQuzzk9GdIsa2ErekORd9pbk6fZdY+TU/cYplvK2
	GAetsF2zsodC/mAeC931+0vBIz+tifCI9AAMdJuyaQ==
X-Google-Smtp-Source: AGHT+IFo3Lm+2RcnGTHf/V2J1XBT43I24bimP6qoGhCOeQNixS13RWY5pVJxbWa7Xp+lhHh0Is6YyxIfDwTn7aNz6FQ=
X-Received: by 2002:a67:e2cb:0:b0:452:c3a4:1f8c with SMTP id
 i11-20020a67e2cb000000b00452c3a41f8cmr18858896vsm.2.1697100990608; Thu, 12
 Oct 2023 01:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-3-peter.griffin@linaro.org> <ZScYOUi7qhvGmMIF@google.com>
 <e4523fc3-e1dd-4791-b950-98dfc6dce1f5@linaro.org>
In-Reply-To: <e4523fc3-e1dd-4791-b950-98dfc6dce1f5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 09:56:19 +0100
Message-ID: <CADrjBPpntJMsxb6oGQ7zuX3f0dgE3oYFepL4OdxamBz=_or7kw@mail.gmail.com>
Subject: Re: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: William McVicker <willmcvicker@google.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 12 Oct 2023 at 07:07, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 23:48, William McVicker wrote:
> > On 10/11/2023, Peter Griffin wrote:
> >> Provide dt-schema documentation for Google gs101 SoC clock controller.
> >> Currently this adds support for cmu_top, cmu_misc and cmu_apm.
> >>
> >> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >
> > Tested-by: Will McVicker <willmcvicker@google.com>
>
> And how do you perform testing of a binding?

I guess if William is using my script to build and flash the kernel it actually
runs the DTC checks as part of the build process.

See https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main/buildp21upstream.sh#L44

regards,

Peter.
