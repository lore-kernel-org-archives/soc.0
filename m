Return-Path: <SRS0=2Acm=TI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11F2C433EF
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 11:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AC75C340F1; Fri, 25 Feb 2022 11:20:52 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0324C340E7;
	Fri, 25 Feb 2022 11:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0324C340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M433w-1nNYeW2SJ6-0000Jl; Fri, 25 Feb 2022 12:20:48 +0100
Received: by mail-wr1-f51.google.com with SMTP id s13so3957618wrb.6;
        Fri, 25 Feb 2022 03:20:48 -0800 (PST)
X-Gm-Message-State: AOAM531oyscCvz1ycjugo5JxISk+VZn+77hiLVs2il9OzuoGurrt5+EZ
	rKLncEb5LSQ4BGPG5xWBtO7ESnbRMfSrzk61nII=
X-Google-Smtp-Source: ABdhPJz6Sv6Vhh/XIVu7MkCYDgoQWagiA2O2Q0TopRL5dPjv2UrfovxrCvY3lRFoeExdFoiVYQQeG3layaHVGTRZZ2Y=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr6102767wra.407.1645788047928; Fri, 25
 Feb 2022 03:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com>
 <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
 <OSZPR01MB70508B35657B539FF4FA28F6EB3B9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <OSZPR01MB7050EF799D97D05A8C4597E7EB3E9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7050EF799D97D05A8C4597E7EB3E9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 12:20:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0T1eP9a_1UhYRg0wHBsjyLLORoKB+44PAPM4zj3ryVcA@mail.gmail.com>
Message-ID: <CAK8P3a0T1eP9a_1UhYRg0wHBsjyLLORoKB+44PAPM4zj3ryVcA@mail.gmail.com>
Subject: Re: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"jirislaby@kernel.org" <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sumit Garg <sumit.garg@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Hugpxyf1qMuILGYOS5E6hGf78MoLveP2eTaIqHVIugYw1Y+wuhL
 c8StmbOHPq4zGvaQng8IBgvNFNeg+e8pkcABUcfZNVK8f1sP4r8CmjsSQwW0WIrhg62kAh8
 RpXADnExoWY/PECqiOr9g0yICDOKizHDTqds39j9dVb4fe1kCxSjyhWgDiklKDU484md0SH
 GZ/eFan5CeiiH3Wl9atBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rpf24B1M0dI=:TFc9DGtCG8FrFO3gC/BKZ1
 8n2iU8cuV0ZL8TsRkD3yWZ/rdn7JaDoDIlwHRixkkMmpWdP3AuEGNb2Wt+qCgORwpH+C3CDSf
 d+kAGUEQqF36PO9ofJGZCZm7zCtnPC7HGDUr9pHOxfaUoIrpwH8/HtO9K+SSAmU+KPqc4hSzL
 hddQV8AOfwhSECef4//dj8pKJAnTyQMN5IkPOdnJhy4bQBLBayUHtpXvpssYpyzieZyV4a1PJ
 3nDr6tPqvWZ+Q/dUoTm2ZxJ4Lkfg5TgrsQhzT/qUr33vgXwEbY2S6RRFX0gqxkC7gJv/JlxeW
 auLrAYQEcfAzRxZgxnEMYIcx9tIlV8ejIIfM1qKXSUE0G47RazLKaNuOdqYX8B9lYcJiRtLdQ
 Ks4mb5rWyHgsWCoDNk7Z9Kfz0i64ZnpMY0KnufTKIuyodUdy5O2VmFptN6EkJ0raarsjwKaAd
 3gB1ozJW3SEyh2Izzgs195/tcWhMnJ2ARnOogIS3A7KBK+Vnc6/NN41mvHc7F5LRpMUzoXZ9c
 eBuVIoL6WKCQaW/xNdrNb84wSPdXX97933T2K9R7fDLtwXa92MPHLV65onCQBzMKDFjB5gDiN
 bikXFGJM0MrkpjgVfrBAP5splF+WQt80+p4oND3n4TVsATl6nHphpQAYWxkgu3Qs+Hy9G+weh
 JyWPWhLzFYTSC+JVw3wLwvklVLETvTEyLJXdu2WgmWL/1SJ3/oxd+QGcc/5DnNNjfPsYRP4xG
 WVfNYDBw86DcINLpHKxxqOMD+XB7Z8Gx0q19x22eQtZ79RkmA3qzaP4Kh5+bF+h1+pI2sSXih
 VGDmKcVjLioJKBVKfyfDEPDdjQ2St5NBg/Epx8M159W1x10m0Y=

On Fri, Feb 25, 2022 at 11:35 AM hasegawa-hitomi@fujitsu.com
<hasegawa-hitomi@fujitsu.com> wrote:
>
> Hi Greg and Jiri,
>
> I'm trying to implement a feature for A64FX that will panic when
> a diagnostic interrupt is received.
> Arnd suggested that handle_sysrq() should be used
> but I'm wonderingif it's ok to call it in NMI.
> Would you please let me know if we can call handle_sysrq() in NMI?

I see some work from Sumit Garg to make it possible, but this was never
merged, so presumably it is not safe:

https://lore.kernel.org/linux-arm-kernel/CAFA6WYOWHgmYYt=KGXDh2hKiuy_rQbJfi279ev0+s-Qh7L21kA@mail.gmail.com/t/#m2b5006f08581448020eb24566927a104d0b95c44

Sumit has worked on some related areas as well, and may have additional
ideas for you.

        Arnd
