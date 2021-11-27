Return-Path: <SRS0=27Us=QO=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDDBC433F5
	for <soc@archiver.kernel.org>; Sat, 27 Nov 2021 01:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49B41C53FCA; Sat, 27 Nov 2021 01:43:58 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C14FC004E1
	for <soc@kernel.org>; Sat, 27 Nov 2021 01:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C14FC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso16279057otf.12
        for <soc@kernel.org>; Fri, 26 Nov 2021 17:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GeK4HqT/e1fsu13zkPU3IkJgtVeOhkfl5fSuGo1DHZQ=;
        b=qjLR5eTJSJaMo0ZSTUaBFBSGHI8nrLplXVuWtlCvohacrdV5/VJanyfb6He9KQ9pob
         k3CiZkYVdqEnxPQ/9mk3fScPbrwJJ7UNhePze4FuVXq2XBnOMgOQixfV+6Gz0Q+b16hW
         5aAM5CecwMN3xGteRRD6GOLbLe/X8bh9vGAMYQ2Vl5fKDrmHfFmsLi0N8FwwHW0YG0HM
         SKL5xqf1GWiWTCVyQMwm1gX/GD2Kp00RI2WXFporHY04CsZ2HdH1o1BN1xd7i+WLvz5T
         ZTUqJ16/Yue3RT05FTsStDTQu8lr+P48rNfr4cK8L/zrgv5tAni8VwPwK4/C4bNTgzyC
         +Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GeK4HqT/e1fsu13zkPU3IkJgtVeOhkfl5fSuGo1DHZQ=;
        b=XKZx0fChxeTc2MIcjCnM3DwM/TLJqYd8sjCk7kQRbKkm7JMjYqUXVxFTtbywQBD2nh
         5YUUHVBnha5SbCNsJoHg6TfCSbsy3xNuBeV7Bupnirm7iWzGgzo3PC6b9ssK7ge1NLI/
         xZooqSBb8TA8/D+bM9wUis6adqtj2su++7n7TACUvZFnnRqYvNuzAFLxnRwrDAK69p6M
         evNiBvJI68Htc9fM0NTxYdVEx4ivwnCnolZjicJvf8embblOsL8GB11oKySOW8HJVH8o
         c95TAsEsSDEH/AJ3S232PYHKEKRgOoal8EaHsY5Oddp0hK1HRIrYyvmOAIYpHjsI7i8z
         tokQ==
X-Gm-Message-State: AOAM533Vvt/hCcQJv1YQztJnY8Yepl8KuRtNdfql/tiYM9l4EwbBYtjd
	mZ/grYWY5Z8Kl/bFoEpL3qBwQu5UgD3DYdytA4Ri9w==
X-Google-Smtp-Source: ABdhPJyTlLOzBIZDBtBqbPekB83he0Wo6ZiqdSb7UFzeK3WWORy7nuj2f1/Qlo8XTqr792YAu5+oqYOGKdxlpC0Ganw=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr30467451otl.237.1637977436884;
 Fri, 26 Nov 2021 17:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-5-Mr.Bossman075@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Nov 2021 02:43:45 +0100
Message-ID: <CACRpkdaf9EoR15fOMXipr-z0zqwdDNtS_j9n7_M0QvxGYi2Gdg@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] pinctrl: freescale: Add i.MXRT1050 pinctrl
 driver support
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, 
	aisheng.dong@nxp.com, stefan@agner.ch, gregkh@linuxfoundation.org, 
	arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, 
	abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, 
	giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 10:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Add the pinctrl driver support for i.MXRT1050.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Nothing done

I need a review from one of the Freescale pinctrl driver maintainers for this
patch.

Yours,
Linus Walleij
