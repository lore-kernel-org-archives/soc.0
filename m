Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F19C433ED
	for <soc@archiver.kernel.org>; Sun, 18 Apr 2021 20:36:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5E8EF60E0B; Sun, 18 Apr 2021 20:36:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254A0610A1
	for <soc@kernel.org>; Sun, 18 Apr 2021 20:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254A0610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=torvalds@linuxfoundation.org
Received: by mail-lf1-f47.google.com with SMTP id i10so16879719lfe.11
        for <soc@kernel.org>; Sun, 18 Apr 2021 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+njT44QYZ3Qq5BMIpyAraB9HjcJytfPjL+0P2G7goO4=;
        b=H5jpOUO2avviyFm4AO16gHz1ThurZ5Sr2spjH3XfrubjfbM+bL3kDD3IFgWVQjuLZ8
         dL1xkh5BT25R0YBpi3tOiYULQ92WKPw8x9uHKG1XtjRnhClzw1FUzf8p7co5UTzmWip4
         8crxUP1Jigs0m9lW0LddAxJBZNmxofFj4Br6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+njT44QYZ3Qq5BMIpyAraB9HjcJytfPjL+0P2G7goO4=;
        b=gGGT3yLMIt3fyM8BeXq75mw0AjuX07x9bu6T5G7NC8dJWa8I2uV7vRFFpdGGAXK7hx
         BspvZnV6sw5ePt779mzDTj/UockE5djgheg7jqiuIZ8GG98rRlqCoZOj6wo+9WoXiUFo
         ztL3PZiWb/NtsMHjIxkH6Q3A5sfoDmx1Fu9ve87/1HNAZBrnIlxpz8h4EaY1Eus883Nr
         vdaGetoR8mg8f874mZp+/HXpEb3SkIUeA8UwmGVZM692pKVXT8hl1AHJPPDn3hHAlgXx
         D/aY2TDk0eQPBHuppbiw2WwqjaCxhr+9l8g+vwKKztbZ81yVPw7re9Z3WaGbzGz4rEDm
         fvnw==
X-Gm-Message-State: AOAM5334McGWkNnMQdenK/qSOamOsOLiYtm765HtVGNOMJ7rfXrIcAvD
	Hooo/EkD9Cv2KpZo9R/YohvMHl8kQnmmjv+T
X-Google-Smtp-Source: ABdhPJz4nmOClfg+nC4ME/Njw/R3Yrl/1sTfiuN4ZguOJVwkA22oXhV2ajdYq6srcWE+RKnAwQtiOQ==
X-Received: by 2002:a05:6512:3b25:: with SMTP id f37mr829741lfv.127.1618778189453;
        Sun, 18 Apr 2021 13:36:29 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id x26sm1626341lfn.269.2021.04.18.13.36.28
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 13:36:29 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id x19so22364510lfa.2
        for <soc@kernel.org>; Sun, 18 Apr 2021 13:36:28 -0700 (PDT)
X-Received: by 2002:a19:ca0d:: with SMTP id a13mr1019571lfg.253.1618778188783;
 Sun, 18 Apr 2021 13:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
 <CAK8P3a3oQm7P=Mj2xU=8v=g82mN-OXk7yrPmFMcK0XpMpwRctg@mail.gmail.com>
In-Reply-To: <CAK8P3a3oQm7P=Mj2xU=8v=g82mN-OXk7yrPmFMcK0XpMpwRctg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 18 Apr 2021 13:36:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNrFFVxF-9g1bjRZaG2OL4Big1_aKTMFyGagrhVNx2Kw@mail.gmail.com>
Message-ID: <CAHk-=wgNrFFVxF-9g1bjRZaG2OL4Big1_aKTMFyGagrhVNx2Kw@mail.gmail.com>
Subject: Re: [GIT PULL] Re: ARM SoC fixes for v5.12, part 2
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 18, 2021 at 12:24 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I forgot to add the '[GIT PULL]' in the subject line, replying to myself
> here to ensure it hits the right email folder.

Well, the reply hit _my_ search criterion, but the pr-tracker-bot is a
bit more picky.

As a result, I don't think you'll get any automated reply from the bot.

So here's the manual one,

               Linus
