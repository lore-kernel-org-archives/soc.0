Return-Path: <SRS0=4MWP=P4=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76740C4167B
	for <soc@archiver.kernel.org>; Tue,  9 Nov 2021 01:07:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5825D61AE3; Tue,  9 Nov 2021 01:07:26 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36CF761288
	for <soc@kernel.org>; Tue,  9 Nov 2021 01:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36CF761288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-oo1-f49.google.com with SMTP id t7-20020a4aadc7000000b002b8733ab498so6462908oon.3
        for <soc@kernel.org>; Mon, 08 Nov 2021 17:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ednwC4rk+fMRoZ56y8enAsmD1OcJ155WuvM3vrzbF0g=;
        b=kW2VZKXq10e3+j2pN2rREnvfGn/ed2pBKv/FDDZGYkiJ1B/Tm+e592rBZOssvxp1nL
         lJ8uNMknOuWUpEbsMD9f5YGmpAyp6iPS1isss6b24feSEfiOdZDz5BB1kClvWeRx3m+k
         nSKJo7mf0P6cENwhEMcYQl79zQf2G4kpxcTjF8qti3XLvenzR4E8B9owfJGlT5swp/tO
         0E211Heecg5kaSUuT4hqK7LMmN/Dv9ANQuL2x50Vl2dhZTV7X4DyPTdhV7FFap/gkuZA
         a7curh+yVVMTtyUoMlA9s4fMN4nseVOWXU0tC4BMuT7AR0lvBWHgKVcMoJw8R1BKkXeI
         mtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ednwC4rk+fMRoZ56y8enAsmD1OcJ155WuvM3vrzbF0g=;
        b=vDWEkEbsluoZhc9/WCZerOaE0XTLA++pD56J4eYtQU96Kl2mOWQM9imns398JY26U+
         XWHHc8hhocRWYTFqlh2W7pNrdH1IY8XpEtPH84aG1jOWUX0NnQHuzrsGGKFo1zbBQMle
         FvaJl6xXN8o9RMuM8PxfQrS/xqQfmafdB8vHkhWLXEOtVivSW7rT+9c90bikU904Gn5V
         19gyXDpYcqVCxFY2dislii2+JEgeokyoznaTmTLLQfpavBAgve2AFfaisyCNutzCqYaO
         jjbZPEFiNQIABpm1lTd0dUITc/MfctC5JezZaA6scogKOC+Bv436pQAST2yaXoAAH3g8
         hF8g==
X-Gm-Message-State: AOAM532vZDUS0L0KP8TPl5ST9WducEJp4zSudCqqmTbytZFh/69Mwky8
	Z2B61TDCjT9jVaNPRwg9Z0FB5wpWDqAY1+JrzKw9ww==
X-Google-Smtp-Source: ABdhPJxZSqASgOxakIs7bpwXgWYlDpKIrlNu94fm32sHo3EvuzrjMEZORAzZOMFOE3CUot1IZlKvoozayP2kRdmgAXQ=
X-Received: by 2002:a4a:e5cd:: with SMTP id r13mr1831608oov.84.1636420045513;
 Mon, 08 Nov 2021 17:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-3-Mr.Bossman075@gmail.com> <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
 <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
In-Reply-To: <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Nov 2021 02:07:14 +0100
Message-ID: <CACRpkda9e8FtjR3XB97Lu8X5=yeApk==4+zSqo3Qp6bWxgJAcw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, mturquette@baylibre.com, aisheng.dong@nxp.com, 
	linux@armlinux.org.uk, s.hauer@pengutronix.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, adrian.hunter@intel.com, 
	linux-mmc@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org, 
	linux-serial@vger.kernel.org, jirislaby@kernel.org, robh+dt@kernel.org, 
	abel.vesa@nxp.com, festevam@gmail.com, ulf.hansson@linaro.org, 
	linux-kernel@vger.kernel.org, stefan@agner.ch, olof@lixom.net, 
	sboyd@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, 
	arnd@arndb.de, devicetree@vger.kernel.org, linux-imx@nxp.com, soc@kernel.org, 
	gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 3, 2021 at 2:38 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Ah I thought it would stop make at error i see it now, is there a way to
> do one file.

Yes:

make dt_binding_check DT_SCHEMA_FILES=Documentation/...

Yours,
Linus Walleij
