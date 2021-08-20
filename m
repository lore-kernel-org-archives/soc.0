Return-Path: <SRS0=d+vD=NL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B9DC4338F
	for <soc@archiver.kernel.org>; Fri, 20 Aug 2021 19:56:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D758D60F8F; Fri, 20 Aug 2021 19:56:11 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CF6660E78;
	Fri, 20 Aug 2021 19:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CF6660E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Ml72g-1ml2Gb22ua-00lX3E; Fri, 20 Aug 2021 21:56:09 +0200
Received: by mail-wr1-f44.google.com with SMTP id q10so15790758wro.2;
        Fri, 20 Aug 2021 12:56:09 -0700 (PDT)
X-Gm-Message-State: AOAM530p03xErpoT7RgVb9x5sGeDhtsP+dbMotedFXVYp13hFtLZg75B
	gielZ0q4j9QDTYhnEcw6Pmjo8eZGeu3HUl4reyo=
X-Google-Smtp-Source: ABdhPJxlsOZO56JajrT3f4dcrPBCUnIdfw1q5w7mc1qjtBPwrpWswZjsj3ahvDK6RwyOb2e2+QJZRAZJL69/UIIllqY=
X-Received: by 2002:adf:e107:: with SMTP id t7mr485780wrz.165.1629489369140;
 Fri, 20 Aug 2021 12:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210820173108.01d5c6de@xhacker.debian> <29e96ece-8541-a7a2-c6a9-453be6644eed@canonical.com>
 <20210820182708.51d13e29@xhacker.debian>
In-Reply-To: <20210820182708.51d13e29@xhacker.debian>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 20 Aug 2021 21:55:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2vkZVt1bb7-iDGaSHp20U9d8QXu6AcrUMceJSS9Q_-4Q@mail.gmail.com>
Message-ID: <CAK8P3a2vkZVt1bb7-iDGaSHp20U9d8QXu6AcrUMceJSS9Q_-4Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: synaptics: add DT for AS370-RDK
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Arnd Bergmann <arnd@arndb.de>, 
	SoC Team <soc@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1zEAhe2ATod3w4FUH4b2Wuwu22USPjuiErwZWdhTjRRnaJvJVv2
 7Je4yjYVMR6PsYxG0Zb67xV3A2vOEaDrqlptxpf1lBjKpe14ydIC+OrgjASns3aum9EnoUm
 EP5bEc1LV9gR2RNlPeW+09QRF3LbMWA9BNKq/J1+r7VXNZUcrCBH0I6gQ9foxcykha9ocec
 +UixPo3tyXuuwdiYr38kA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QffU9aTovFY=:epjIwRvZtkhSPKvkb2K+Av
 RfGu/OF3yi63yMg8DChfczGKdWuUms1hzV9QoY5tz1CFgyUv+3X5NLRRy9If3x6cGT+iRSZTR
 64DQXfmaXYpGUkmRUrxwMpjzyn+TSz/9U/EeWM+j131v9V7AvNKIlT+O7s/HRN0BYBqCSvyeN
 TXbZ/l4vhy8RUjF3rLQ24/YuufaeeZFCBePZYl0d31Vml//uXvq9n4ACjZKzgftUUMCKIShB3
 2J8pdy16EpOTXPFiS8keiuqDNkSSLi5OOZ2LRARk5C3pr1AIoxaCiamA+qj3+m+Q8Pf6Y28+m
 QJBre3Qw7twPXueUzXZTAU11z7n8xXVQzSXvdSQdzEDF1yGxaxUsxdaKMB10FTS7jLvcdgn5g
 kk+zrGqe8R640tSL61v1E2nORESblRHoiWVJogQEW2hfE+101mz4ZbAbaSUEohxVTtVZw8S1t
 Kr04AllqtEy+r2aM7lfgmUL3GFsz9SYCh4lJ5MEAdQ4ssrY4/dhQq5zqRUCh9Af1S3YtX8xFj
 DOxtuFF52IQPZmHfuiNZSYWbOf9WX67Vvr3xK435bW8W8Rqg2w86oA7EIVsm6uG4j5U3f7Tcr
 VPaoV/MCAJSr0mGmM/uxkKyTALbqx2uzzN0bRi2BrwrDMCkKEdc5iYoCnbx6EFyC0wNhQTwsM
 uc4ghsfrqXVkdl0vbBfRuqjLJ8TOWKVRJ4j6T/ckAZKRhdlVopLZJ4IwqKEdx9he9X6mV4z04
 YcKx09kRvOthMcTqAf+87qecQKAgrT+5gNVBql/pbUQXpt7/duweaJaV1JRVsJ8+D/wM3/RC4
 bSUUYAiMRz9CEiCGMXv9QPBKB6tUxUbRrNnnO1y5XQN+fKUt+mG1hQn65queCN2YSL2jXRm

On Fri, Aug 20, 2021 at 12:27 PM Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:
> On Fri, 20 Aug 2021 11:59:30 +0200 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> > On 20/08/2021 11:31, Jisheng Zhang wrote:
> >
> > There is no such binding. You need to update the bindings file (first
> > patch in the series).
>
> This is my plan ;) In fact, "berlin4ct" related binding is also missing.
> I want to convert Documentation/devicetree/bindings/arm/syna.txt
> to yaml, then add missing bindings. But it's too late for 5.15,
>
> If it's fine to keep as370.dtsi without board user(s), we can drop
> this patch. I will solve this issue in next development window.

Yes, doing it for the next cycle is ok.

        Arnd
