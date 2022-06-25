Return-Path: <SRS0=C9JC=XA=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F2C433EF
	for <soc@archiver.kernel.org>; Sat, 25 Jun 2022 23:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8D4EC3411C; Sat, 25 Jun 2022 23:28:47 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4971AC341C7
	for <soc@kernel.org>; Sat, 25 Jun 2022 23:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4971AC341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2ef5380669cso54993197b3.9
        for <soc@kernel.org>; Sat, 25 Jun 2022 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ZHbHCzgoQABSLSyZg/clIwjQ3dcNnkQ5dXPgPYxATQ=;
        b=N4D4Xi/ZkS3g3tlO204tZ0mkKhnIOSd0acgAfI4W+ZQommQ6v+6ziiA9vaKLZB1zm3
         ylk5U6EcbKo2nBk3LV4euELboUgU97u10+M1vva8j1SQ9NaOUirt1OsOICRsZxACg39f
         lgjgv0snIW55QwjgLDiw+ocE7KVu13CPv/p2Qtk6lVq6Ub5vFMo9cuwQoJE4N06H78Hm
         tGRrQnvm18hSZ4Z4tIHIAyTHJz2gIfo/cPqp9gfycDseZ35TW5OgJ3cGaPs6XzYWAJSC
         LR1o3zCklx/ZCZPlE4JK6uVQOh1UlN9XUpSz9K7shEAVGA8y9CmkSSZoICDXatuWfoqw
         2LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ZHbHCzgoQABSLSyZg/clIwjQ3dcNnkQ5dXPgPYxATQ=;
        b=RRoja6IpVs8Zy1bEfRDx5EjfKMY7TCN9mC1MeCzw9TLD7j19+xeQozWV4QBmFPsoNR
         QrlRBCc0V9x542N9cjhe3CgqIlj8nV1GE4+ev8K7oONOalmslhWjujc/Rd9o+yg1pfYI
         BGlGq4H4SSUjfAOvDPUpmbiZhlrgjGQuCG+sgHBMp/YjK9rnQPrxG6zcJ9L1F3FACOcb
         MUbm5DMJi1saKS3TM/zTVrKcQyvTXGOPNQ9SUcOzARPFTgYwYRfdsevns1bmU6D/7n2V
         uGpiXt6fW5jRE85N0JOKUknzXdbRhzKZI0lypjXaqWPTHXc3dZffYOvQ/vTH2LtdgNOY
         kDjA==
X-Gm-Message-State: AJIora/nvWQ4gcahDTp+nFFq4+APg7Ze/RwA8yHPR1atSWIzESBczods
	JB5ES09fFruto+qRdyOfxdrnVdZ/GJgIJ2YwEEEBguMlZTo=
X-Google-Smtp-Source: AGRyM1spnHk4DL1GaXxVekSrkt1iH996cdrejY3FYGxU0SDg1CbcxSaWPwj2DH8lacg9auY41J3Ys1RDyCcjq6nVpWg=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr6969123ywe.448.1656199726318; Sat, 25
 Jun 2022 16:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Jun 2022 01:28:35 +0200
Message-ID: <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 16, 2022 at 2:54 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> gpio-keys schema requires keys to have more generic name.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

OK, do you want me to apply this one patch to the pinctrl tree or
will you collect a series?

Yours,
Linus Walleij
