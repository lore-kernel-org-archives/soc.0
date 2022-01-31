Return-Path: <SRS0=tObw=SP=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741B9C433F5
	for <soc@archiver.kernel.org>; Mon, 31 Jan 2022 11:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 471B2C340EE; Mon, 31 Jan 2022 11:13:31 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96D1BC340E8
	for <soc@kernel.org>; Mon, 31 Jan 2022 11:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96D1BC340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id j2so26025087ybu.0
        for <soc@kernel.org>; Mon, 31 Jan 2022 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U0Pw1BfqGZvVWUtyLjOHuhJwlMA1Use2yqcwgUkQnwE=;
        b=F/ECo8ebBP3ogDbxQiY4hhui7DC5U/UMWgo9Zxz2mCrE3YKYlRwsn8i6WMbi1ujwL+
         F6RWtT6HBlFzfySG6LZv1PSv0vwGis3HZwYSpSS9Hc29Ez3WcAtHPDp0M0EniYkeFuQP
         vMA+VOZ1Ign8qZkpcj+5tqUlZrYNyhl+lbsyQ3EgkkMF+kIkkfA4B52aHxnb2frXX0a7
         Hf5Jj2Ip5PmM4TVjHH23jDBAmknumfzIEPYA2ny7XV1pVboUBrBGG0Zl6M1/y8c1kbyM
         NyLWqgGFxGTvLnD6/N2khaA9Rqn+cJcUH8dVK5IIzrye3eEHB5fbTpdShnNmFP/AZ8Ef
         Xb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U0Pw1BfqGZvVWUtyLjOHuhJwlMA1Use2yqcwgUkQnwE=;
        b=4+U7D2/FlQAuyzcWVxyrb9336/WSpgHkecEQz5F9fObLgT+7lyxARldhb4WP3E2RIJ
         adjZfx082wMQnQpG6Wlle8wqzuhkSCRi3m4GbaALMUV7WuCclGugMihBcJkVSCJSmIHE
         EkXbSkHqKOFj0ypZAMGFT1pJm3v0XFJ/FX9QJ+yd5nlzH6UukFyvOYaihoktJ7wVYo5u
         9b24NEjiplkQ3RXMnEdEKBW8n7Hqut9ztHo/3ORtQActzfm4CUAG+AUdQYWwGJZE3dqf
         cabjnPR0hKBFLheBAa6dcP9nz+I7tlsOE3uIhrtki0v3a0SH8t418wkEwGjoQZQOW+0y
         y3/Q==
X-Gm-Message-State: AOAM531e9jBuBdNlEqGwi9HtSS3tA17axyV/B56DiLNFgR2WMuHqtdg4
	RK7CLMpuX8D+UaM8lu1N2Ozg/kNbHDqm170Q/xOS4w==
X-Google-Smtp-Source: ABdhPJwnjcbKcmXqxkDyE6M/D5slJFtoF8e/5OEa0RJfRa4THHqn7fj5ZGK9wLiBaPNsXouP0qEB6ly0WbzNmpDFVXY=
X-Received: by 2002:a25:5143:: with SMTP id f64mr30614251ybb.520.1643627609604;
 Mon, 31 Jan 2022 03:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name> <20220130145116.88406-13-nbd@nbd.name>
In-Reply-To: <20220130145116.88406-13-nbd@nbd.name>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 31 Jan 2022 12:13:18 +0100
Message-ID: <CACRpkdY38VWT_95jz25NTNtsqzkkVsSONNLswQ35JApT0HUXXQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/13] gpio: Add support for Airoha EN7523 GPIO controller
To: Felix Fietkau <nbd@nbd.name>, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, john@phrozen.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 30, 2022 at 3:54 PM Felix Fietkau <nbd@nbd.name> wrote:

> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs. Each instance in DT is for a single bank.
>
> Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

This one and patch 11 with the bindings does not seem to have any
build dependencies on the rest of the patches at all.

What about Bartosz just apply these two to the GPIO tree so we
have less stuff to iterate?

Yours,
Linus Walleij
