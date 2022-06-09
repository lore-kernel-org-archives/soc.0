Return-Path: <SRS0=EXKx=WQ=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01549C433EF
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 09:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2882C34114; Thu,  9 Jun 2022 09:40:31 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3154C3411B;
	Thu,  9 Jun 2022 09:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3154C3411B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id x16so13446932qtw.12;
        Thu, 09 Jun 2022 02:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=USvCbIzf7kAWUlatXORQPqOzuZzCVX+P1+Q0wg0R4kk=;
        b=WPo7RTfZ4gf9zVbTTEK4QuM1XcdHT/KCu7z634aGwovH9Ed5wMuohygENsT87bGniN
         TGiEFsMdARpkqtC1wWFZJ2d/A1NcaQQQ9MuPKpe4t+SIRD3jIiCbbuPXTC4bgG9Y8Ltv
         UUYRf0Mc/fc6tSw1UgTMR0/1BslHtA54MOWuKzZnAue6ioUD8FNRILJ7kIjLzXJdP62w
         8nlFMrrcpetC+1MUj4tLzStOzvhEniyKtCZC1vXVmfE/04431uo3NRzy4TvCbqRzTFNX
         XaL8giMyP+ST8L1xBM4H0VW3nJSdnf6rs0ONQt0ofo1O4rdwGRId6oPb8chu3b2mXS/X
         F9SQ==
X-Gm-Message-State: AOAM531oHNtG3t2Be0o/qs2hyCD8Epf0a9Gw0zJXJ4ctn2gg3eU3X0eH
	2r8HLJK2J7VFurQIFErFZuMGXxJiAKIMYw==
X-Google-Smtp-Source: ABdhPJw3DGvxABJTpd/S2eXyRHw4tNMzR3CJE3g0WRgBTzkJXUwNWumfRh8BtAPuFOPj/LU9UDtORg==
X-Received: by 2002:a05:622a:149:b0:304:ee20:1cf5 with SMTP id v9-20020a05622a014900b00304ee201cf5mr15003774qtw.426.1654767629753;
        Thu, 09 Jun 2022 02:40:29 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id c5-20020a379a05000000b006a6f6cdfd94sm4678189qke.117.2022.06.09.02.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 02:40:29 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31336535373so84157847b3.2;
        Thu, 09 Jun 2022 02:40:28 -0700 (PDT)
X-Received: by 2002:a81:6157:0:b0:30c:7e4d:b28e with SMTP id
 v84-20020a816157000000b0030c7e4db28emr41765469ywb.502.1654767628538; Thu, 09
 Jun 2022 02:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220526204231.832090-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204231.832090-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jun 2022 11:40:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWnqppXcOfsr=HU4cuwFx6__GK_Fjbpvdse2e3T0K92A@mail.gmail.com>
Message-ID: <CAMuHMdUWnqppXcOfsr=HU4cuwFx6__GK_Fjbpvdse2e3T0K92A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: adjust whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, 
	arm-soc <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 10:42 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
