Return-Path: <SRS0=lTRj=WV=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF90AC43334
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 10:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8AE8C3411E; Tue, 14 Jun 2022 10:44:44 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F01AC3411B;
	Tue, 14 Jun 2022 10:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F01AC3411B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4alK-1o2hvr06C6-001jL4; Tue, 14 Jun 2022 12:44:41 +0200
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-30ec2aa3b6cso24765157b3.11;
        Tue, 14 Jun 2022 03:44:40 -0700 (PDT)
X-Gm-Message-State: AJIora8CNeRq9Bv8SWO4QD8ZmQBxuUicSKZs7ioBaOc3IaooauJvHRMR
	4MuBQhKP07DM6Phto8laWbpTEPwQQwxcesAIU90=
X-Google-Smtp-Source: AGRyM1tr/ng9g9sm93eXlz+bdGnyiIzeyyD0zeJbGcgCyaf7ssINAXTuhAQgINggNB8yp6EGGkLewqJtLvVBwFTVyu4=
X-Received: by 2002:a81:2f84:0:b0:314:2bfd:bf1f with SMTP id
 v126-20020a812f84000000b003142bfdbf1fmr4800845ywv.320.1655203479718; Tue, 14
 Jun 2022 03:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655194858.git.qinjian@cqplus1.com> <42ed93cf0e5cfeaffdf50d63da558a3f1f6c1021.1655194858.git.qinjian@cqplus1.com>
In-Reply-To: <42ed93cf0e5cfeaffdf50d63da558a3f1f6c1021.1655194858.git.qinjian@cqplus1.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Jun 2022 12:44:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0p3M2Z7aaB3tGJSud3Tr+E7BtwQka6j5HS3VooV7L8XQ@mail.gmail.com>
Message-ID: <CAK8P3a0p3M2Z7aaB3tGJSud3Tr+E7BtwQka6j5HS3VooV7L8XQ@mail.gmail.com>
Subject: Re: [PATCH v18 05/10] clk: Add Sunplus SP7021 clock driver
To: Qin Jian <qinjian@cqplus1.com>
List-Id: <soc.lore.kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1MReSGuMQD+eTGfzdKG+bLoNGaCDsHY1kkkhHwEDXtKo4WEz8cA
 8uP3DxaGJrnYh5EGIcpguElMwQRIRCABovGzCLpv52ZbF8RrF0cJga3Wja0KBe/QsE2XjMF
 d5eiWsTeKB1kX6XVR1XB/fcVsshB+lhHnOcH38YURyxLRU7O6LhUY8gpabElbV5DbS0Hr4+
 rq3Sgd7D2lad2MibB6VXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S/3SeeCIYb8=:fzfqJdi1YjLLv05J64MSGK
 mRamqht0yI1aqS51knYKxiLEukVrZQCX12mAph22e0kMRG9q0fLbE96NCCAOVJz4oDZlYXcYh
 w6X3dh9D1qPvQuAt38ZvDd/1H2jiJdN+O6luPGBYTkbPZzLYGhksZjfMPGvfH82kywHPRYDJV
 LwHo1a1TEcL6LPm+NOD8eRhfXZw8Ue+Wv2Gbs2OMrg071NAyW+PeZJcz7MoR0A/64QfCn7oFy
 bSmOGdWxGIzFUo0HchfFNZRg2qs3N4CKm4KzuSFwl5J+0bJE30L/5mnQaXC3PRCpqgzx+vsEl
 VMMvYsagrrzMiMb0kdJdFExPNWReNI7DZhpr0Y1K+3MZgTvbg0CUvSjsJBVamt24iYgRPFaAa
 Tkk9LKzOsrndAi8IO9X+QX/cyROGfPOa3DGymoF88bhFlhCz5aaRrIh6BynnK1iGaZJtjWwE+
 O1NJZx/4B4uj5WkgE8V7jvrkIwL6KQmSOd6zx0o/ii2jIN+w7s549w/YfHXaEh299ebJ2ITsN
 eXKO5I6oN+BpteeW+VYdoYDzwn1TjxbPuAvQfeCnqaHSqO0d91ZQskJ0awMEwffkVRqLsMpE/
 IP74g+oA15+saa4cEMnqt9DgExaY8RVD/D7+3cjaO2c45cP5M3tHL7c9z91yTn5hRl1eQsiMh
 41F6Q2noMqQullU/2/4sdO/qJkAG7FDCZkMvbKUSMf2L458sD54FVUNxURJYxdcdK4fYiRImb
 CKvaSiLqBI38+P3yAC1MJBuMwIwM2TE142TTm+UYs+ISi51fGiGf2gbYN8OTW3k9oHv+VOp4W
 8Tfp71ROTWYb+3CAv5GG7TDb1evwm16QwyPu6zEZllU5yPLhBqBpT76YUt4PS8HhLde8o1Sx9
 a7uwyzeOzNha5SYLSXwqqNRCyBjq9A4HPpC24SHxs=

On Tue, Jun 14, 2022 at 10:31 AM Qin Jian <qinjian@cqplus1.com> wrote:
>
> Add clock driver for Sunplus SP7021 SoC.
>
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>
> ---
> Fix the comments from Stephen Boyd.

Do you mean you still need to address the comments from Stephen, or
that you have
done this already?

I can't apply the series if there are patches in it that still need to
be fixed or
finish review, so I hope this is only waiting for a final Ack.

        Arnd
