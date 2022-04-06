Return-Path: <SRS0=FI0R=UQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E1C433EF
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 07:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73424C385A5; Wed,  6 Apr 2022 07:43:35 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE4CDC385A1;
	Wed,  6 Apr 2022 07:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE4CDC385A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M58SY-1natrb438e-0016zy; Wed, 06 Apr 2022 09:43:32 +0200
Received: by mail-wr1-f41.google.com with SMTP id m30so1895831wrb.1;
        Wed, 06 Apr 2022 00:43:31 -0700 (PDT)
X-Gm-Message-State: AOAM530w6vgnG23CijIm20t+5eGMNPQh/rZWr4BAq6eXPj0LNUs4EShv
	hn1yY9PDJnupu+x72x0o+Pb0Q+Y3bfnVtw+dZfI=
X-Google-Smtp-Source: ABdhPJypJul9cdCELa/1AnvYtkz00lmeff9mRrfOlzOzJtIgInlf166z4d0cq68yNgLel+5mgKe5/LD/ixwy4Exk7RQ=
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr5368683wrg.219.1649231011518; Wed, 06
 Apr 2022 00:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220307091923.9909-1-ychuang3@nuvoton.com> <20220307091923.9909-4-ychuang3@nuvoton.com>
 <2669852c-5bb6-1edf-bf58-ea815f54d50f@kernel.org> <ef8efda1-e985-0684-470f-7acf9b8a5e93@nuvoton.com>
In-Reply-To: <ef8efda1-e985-0684-470f-7acf9b8a5e93@nuvoton.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Apr 2022 09:43:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Gbr4PoJbPy3BEQ=T3iJo9kQdjes7+0UK5vnc4CDckSw@mail.gmail.com>
Message-ID: <CAK8P3a1Gbr4PoJbPy3BEQ=T3iJo9kQdjes7+0UK5vnc4CDckSw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZxXzpPnMuNkvpml9CLy34oQE32iJJrn5ti1zZVR1a3PPQ15A9Mv
 mZaw5vh0k3/ZCzJ/0QVJJPzEHC+DspfgXm7QcmtsuGbLDZAt9Sn1AjIMvIqzas0khmD/K+c
 /nxu6TAN4CaVJzZkG8d/e9Pz0T+jxDEnwkA4GFgRZvpJSveoS6mrlV1rXG6Iq/yDKEr9KMa
 zm0+ImOE79khtN9AqCkFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bW8XcZJdL28=:dDEtSNQxhBqsidppFQX6Of
 jWg9+P3CCA4MeKA3neSP98RWsoX/qZdIzTYabRSrcYmp3ztfhdC4Haqgppr573ifv8+yzqwPa
 EhO9AVwR0yPFEnWF9mb2YJKDyipzdN2kYMYWNPDqeRFWv7qXQ9+eBITx2eRuKPxlmZnkUluek
 /q353Fl8AL4ZV9WcIRGx/xPSR+U5hLwiCopdpsuGZWOD52EVs+p7Q85hrBxOW4d/g9wu8inBW
 GNXsKJ2dsWol9cYoZ92AlVy83pkr7MWpqJ7OLVF0lWwvnBA3ume8onmztq6eGzRmmucA8NqoC
 gRtzYCTgjLn8ddJFLsua2DLs4OV/sMdDvCpUbIktMGzk35vZXkyOJ0Z4Hns06UIOnRs72nGtu
 uHFPELregGf9UlQ322+O4otG+8DQG2xWeujRO88RLLQqs9rJ0zGLe4ZcAM06rgR8EJgzuxAGs
 EJyJ+AGPbzyF5wRubXGGFdX0M/QusE1bFW7q6ulUs3lEHYxOgWfKQ5g9PLajQ+RuKLzNC2EAi
 gzLxVkt0VJUqF3JfuF5OrkqJVbJ61cxzpArbMN1KhS3vhD/qKV1Dj8rsrnDgyBJ7nFmdgu0uI
 NXmJAXs6Cz/jubb58xjzhPy8mv/bTtgQa44wBJb/45m2wS0WUYiW1EarNV4PLq/wG6U7FDINF
 e/FoYEUhhMeVNuj/UoOvKidR6kt5wVYdZtii4Ja7afXt55YCyaVDrMI7M5BN+jjBgn++QaNwy
 S1qCGs/311s6OLjApXQTcYMgVLVm3jrqxki/1t2RvvpLfTf3awlerGF7U0g1nv9PaF7INc3Y9
 RwRSSTEFeD157BI7TivKBKWYok+QXOkm4T8wPeycgwmD48WRew=

On Wed, Apr 6, 2022 at 4:58 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
> On 2022/3/7 =E4=B8=8B=E5=8D=88 06:25, Krzysztof Kozlowski wrote:
> > On 07/03/2022 10:19, Jacky Huang wrote:
>
> I would add the following to end of arch/arm64/Kconfig.platforms, and
> add the
> modification to this patch series.
>
> config ARCH_MA35D1
>      bool "Nuvoton MA35D1 SOC Family"
>      select PINCTRL
>      select PINCTRL_MA35D1
>      select PM
>      select GPIOLIB
>      select SOC_BUS
>      select VIDEOMODE_HELPERS
>      select FB_MODE_HELPERS
>      help
>        This enables support for Nuvoton MA35D1 SOC Family.

Selecting SOC_BUS and the gpio/pinctrl stuff is ok, but please don't
select the video helpers from the platform config, those should not
be essential for building a kernel.

       Arnd
