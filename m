Return-Path: <SRS0=6tPc=XX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD479C43334
	for <soc@archiver.kernel.org>; Mon, 18 Jul 2022 13:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85557C341C0; Mon, 18 Jul 2022 13:44:05 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 163E4C341CE;
	Mon, 18 Jul 2022 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 163E4C341CE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ot1-f50.google.com ([209.85.210.50]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MdNTs-1neNGr3RPU-00ZPZF; Mon, 18 Jul 2022 15:44:02 +0200
Received: by mail-ot1-f50.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so9164648otb.5;
        Mon, 18 Jul 2022 06:44:01 -0700 (PDT)
X-Gm-Message-State: AJIora+NfQ1Lw322rraGcd4kfIRQz59+wT7OlDA0YRq6SuXHT+gH2j3d
	exHSja7Q5RMLlAEGCK85ZPkOIfJsKsHoA/EMbLE=
X-Google-Smtp-Source: AGRyM1txCh5KSHFufIxKnjrUsQfdXMF5DhA1iW62NG52SJqnf8FXUR7Q6wJLhAzG6EEmYmN/Lvx4Nc0/ujPqwaXi97Q=
X-Received: by 2002:a81:1914:0:b0:31c:e12a:f33a with SMTP id
 20-20020a811914000000b0031ce12af33amr29924965ywz.209.1658144567116; Mon, 18
 Jul 2022 04:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220623072428.33697-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623072428.33697-1-krzysztof.kozlowski@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jul 2022 13:42:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ob26oEL=af0KpyCqA4nxHW_PaaK3azKT504Q+VrFctA@mail.gmail.com>
Message-ID: <CAK8P3a0ob26oEL=af0KpyCqA4nxHW_PaaK3azKT504Q+VrFctA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: centriq2400: drop the board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@aj.id.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:itagdtLqmmYa85HRGpMKKRtERfKx3jKFcu79Ytvhi+eirp3WLsS
 l9yGtZfp7c078+eY2ag9cy+O83Cue9/VfkqpW53X6TWoV5U/UKBNwlLGiJoCWgCWujzfSsX
 lSud/14DH48T9CCOv1cDtFg48AU2MSUopbbHoj7eCTvOw1Fv0XgKHdYxo2IOoWzVi8a2mBv
 9Fn+YEJA0JpGyTluD8mew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y8Cu37XK1OY=:afW/WoOgTj1IREO4e0Rd5T
 W7Y0MB/Zq6WyBOU74LytZWDeTZW30Swxti4wTRxs4/oBVwyeQgeS0l78v6O9e8pplvDDOxiNP
 TB37m9D4hc+Fy2T+bQW0+4p9lzK75wT+0MLKnccQLO4y4HxD9EgE+s0/HGtUmAFaRwTqDkyTM
 9aiYOd/k+XGgjY3FAHzGhbPI2chrF259/3mRNsvYC2MJX3kSTkVLXOzjNRyGeGkULwQCxN4Zh
 0roDziyNTVbj3x1iOPFrphWZLvW1DM2S64u/5Ka2oCip1SDoEdR+tjWscVA5Qo9O0SXcCYtpt
 TSpG26ZUoYANGsguK0ogLcm5sSQhNiSOd8yuv1++reprLX+89N8dhWLuDe2AcPduks6MDXXQv
 IJv8B0Eg5960zZZmvPZGrGP74dVApc0+ZJ7woVatZnxqrI4w2vlRSC9Jf/bjYLzfOGKVWZMYS
 pvTMwI/Kml8cksdSYN+SLc4815E0kmqg1VNNN4u5QkQEPNN2676z/KqESTkZQddSNsjcs/ec7
 F16mLe6JrzWuFRIgRppizgSw4wud2G5jxXfHNOF5Q0DgLZs2S68st64nmeZVR4UE0Aq6TvkvK
 uCMEUAN4PQThqu4L04+sQHWkQbBChL1Xwq20O8A9WOGca2S4FpiRV9YgAXG3JWaesnZ6XQ3UM
 banHxMyBpUMt7IUES7n+hHn6TQ82BMGko55ujcUgCSZlGUza1td3Ytb/gUX59vgIEnmPTfPsU
 x/CIlVDnN0bRcDx2OnEvgpifxZxYqlEbviSXQly1DIa75KrIV5TFGdBDaaiyuTovV6qBPtZ9d
 wNW+hVb7KJdVjDWxsfSs4wTLXhtPpx5TqtUfRndZEV4brzD3LmGM+glHqaElmvCZxixhY5U9t
 cGy/10eNMHr4HU2jciPg==

On Thu, Jun 23, 2022 at 9:24 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The board is unmaintained and unused, according to Joel, so simply let's
> remove it.
>
> Link: https://lore.kernel.org/all/CACPK8XfxXi8kQr+vxta8rD6SBgxLf_oBjAH0UkPBacQta552YQ@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 -
>  .../dts/aspeed-bmc-arm-centriq2400-rep.dts    | 225 ------------------

I found this one in my patchwork backlog. I had expected Joel it pick it up, but
it's not in linux-next yet.

Joel, should I just apply it for 5.20 or do you want to send me a pull
request with
this included?

         Arnd
