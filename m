Return-Path: <SRS0=i2pQ=PJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CF1C433EF
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 12:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8D74E61362; Thu, 21 Oct 2021 12:23:53 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D924C61205;
	Thu, 21 Oct 2021 12:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D924C61205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N1x2P-1moLlu0w01-012KWb; Thu, 21 Oct 2021 14:23:51 +0200
Received: by mail-wm1-f46.google.com with SMTP id d198-20020a1c1dcf000000b00322f53b9b89so611527wmd.0;
        Thu, 21 Oct 2021 05:23:51 -0700 (PDT)
X-Gm-Message-State: AOAM530jeYtZPsXFXWXdhmfqxQOM2mmd40xNrgYpLw+hdkbOnRQUhdXf
	VTxkrHzyfkqWBl1WHCkviVDmeR+uRE7CPKV4oAg=
X-Google-Smtp-Source: ABdhPJyySfMSOhtA5bv4hxMOMgjYtqe9qUbX0g4CfeIRPIhQyBDPW11VeAk2UNQWRemVY//cA3QTl+gSHiVN9uJF8ao=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr6575841wma.98.1634819030835;
 Thu, 21 Oct 2021 05:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 14:23:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Message-ID: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Palmer Dabbelt <palmerdabbelt@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Rvpjvq3ld5HFiUu65M0+yZpLIImSXpv4YAGE888wD0Czl1XREbu
 lpYubGHuL/D72IhGdQhF2vvXvU5KtPbIaoFAV7c1DU2e7azIRCfmVG+ZJ3nPvV42n1LYdPr
 QAMsRPpwabWo/ZHlumqVOse3RoQHxArp+or5+0QeguzE7hHXzlZf/E5MRk/mLi8XLfv3ksq
 piyQ2LrsRUy9ypQWSeRpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PeZ3TRqNlf4=:5vvQaOgarXh3C7ZLWWzk+D
 wrbxDT7Gl42mWPb7ZxTZad5WZICDSHhHRa7PRmoCRudCufruHD5D1sFysGGlrOsCEWfj+Z+vb
 m+AMCE98DUoWdUiJj04T7YL109O6hqvc6C+6vJ/WoXaXWmFrGB9qOA+5pPx+1SSPwEha8ocIO
 BdnQyIttdvXKPbuxoSoaP1pya7GT8RGVyNQwuoyQTS0aC6xDKInsaU77+TWbZciOAIGiFXnwW
 m67zmI0lpVAaWcgnOK0FX3YV7mJ76X+PNVgkvRJmhRDQKBH+MoRRDLanIgxJOqy1mGphalhrN
 SVCZ8QDSG6VTgAeoZ2bq/aCAuAwNZDqAp6mY8lqw71K79de3sqcaawwuELO5N5tWimUoen9ZH
 fEIpW/YlW/WNfSWa8srnCo8+XUQiU0JkZGxonD300UOdCtG9Cpl3B2UUCJwxvKpumYdiefepy
 VsdaAtwoJbhZcDlvaGO5gFVrXAQ5xFJt5TheW7U21ZPnuZVaOtrVhEludLcOZyifkHgNYhbCr
 qFxVgVAhL1C6dxujcJW9CwMuvh7Fm9i5IOk21LrKfKQIB9voPJPHZT4tsDx+kcHacSvaw6nM/
 uCB9QJpSNnnj2gn4Qp0364EszMJ/TM7mTCLf3VYUKTrCOh+m6hDQ8eVK4xExmWFivM+k1DJDe
 UCwdnIddISJRwqI89Xg32aM9vYQAntN5CpCGIcrqM94aCsrV0ZTtPMuPD0a4v8zS8+Fz7aB0h
 555q1mck2xlfu8NTIGd0vqJWjDZUtOqDq/e3h2Ujh4xYHulUk58bcq5ZMnRCSoLQjoPUkQa6d
 eCiz+T9J8cakz5u/EwtP8OWAjPnk4CIS/4EotNwL1NKkwqnI9s=
Message-ID: <20211021122334.d9-C4bMXhhqIBAKRzVt3GfBnZh4jIAt1-ZpeIWPVjR0@z>

On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi Arnd and Olof,
>
> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
> August 2021 (v1, v2), resent in September and pinged two times.  They got some
> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
> unfortunately Palmer (RISC-V maintainer) did not respond here.
>
> The usual RISC-V patches go via Palmer to Linus and I am not planning to change
> that, but I want to get these fixed.
>
> Could you grab these to soc tree?

Sure, I can add them to a separate branch in the soc tree, in case the
riscv maintainers
take them after all. I notice that you have only Cc'd Palmer, but not
the other two
maintainers or the RISC-V mainling list. Adding them here to maybe get their
attention.

        Arnd
