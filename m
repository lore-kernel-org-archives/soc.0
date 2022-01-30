Return-Path: <SRS0=AujI=SO=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F4DC433EF
	for <soc@archiver.kernel.org>; Sun, 30 Jan 2022 01:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7853FC340EF; Sun, 30 Jan 2022 01:36:23 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9763EC340EE
	for <soc@kernel.org>; Sun, 30 Jan 2022 01:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9763EC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id m6so29734418ybc.9
        for <soc@kernel.org>; Sat, 29 Jan 2022 17:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ePWnPQTx8X6MYeBISgp7KTdEgQnoqyN/q/sb9qzde8E=;
        b=MVYYp87Ald/WvBJI0FeEtTwNTEL8ZX5BKn5Gopf+hawZh0s0006iGXxczWIORh0D9I
         YAWEfVnJXa1SI6A9PKoXdO7N16Mp3SHAFaWEp9IwpFlfEVxDdkn4E6CbOQDjtbxN91GC
         QSHcdjfi+G1YzQArUH9SzTkQh5WF9PGNGTef4yrXFnInEja3CgdtoBYinMfqirqRevDb
         JspXlNrfCynypoWIKPb2yTdvZhuFupywOIazhqK0PfvpTQoWeJSy84O9RAsc4QfPgrLR
         bbLeVifMqFRRjo2QNoFgZK856VokJFzS3VT96XMJthOnLkwJxAR0W/dRnOfzDeY94TJ4
         h2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ePWnPQTx8X6MYeBISgp7KTdEgQnoqyN/q/sb9qzde8E=;
        b=WLDI2H0cntkNCQpHr84L7evzcTsmetWGZzZh3dE/w0G5x2KHITEX097nAzB83vkmSP
         HvVzvgX1CvVdfij2XxN54nl9XnxjPyZ3NSsJ314b8H2N+Wjx6ViInOJAuGv+jOUgyUb9
         s2mV3B6veD3JfpJ2txwjEYWqyvxFB+8SkIXmksmca0TRkQTJqC0gi6TTkKmaV5FNkryO
         870iglktY3VAqLnhweIWyhmlS+WFHntjQgfuohoTQGLDizcy5h7NmPemE+WbrCPqCle3
         0UWdAJurOv4tWjE6YgxBoQPXEq3HikPMuwWE6A8HupyWQ8GQBnh3ES0TP61wLzR4zhPJ
         oCCg==
X-Gm-Message-State: AOAM531Z0QsC69xd7WP8kimvmOqj5Vu06VqZc7NSSqoGk+z/apA8eHug
	UcyHnwg7jr8E51BStmjpsVFsEMQ+LKP1X/MK4QnABQ==
X-Google-Smtp-Source: ABdhPJxhoLeKPAxrSTTOVHmmuO/wKAH6jov5kna/TtVWgdNXPxRG1wPA5Qbv6Ikjg7GGti3nfiG7wePGvRBsfe1+8cw=
X-Received: by 2002:a25:5143:: with SMTP id f64mr23694467ybb.520.1643506581687;
 Sat, 29 Jan 2022 17:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20220129115352.13274-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220129115352.13274-1-krzysztof.kozlowski@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jan 2022 02:36:10 +0100
Message-ID: <CACRpkdYt1qM2gBefaWbWyh-a09c++wgR+12QrHZMneRK1mA9Xg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts/drivers: samsung pinctrl for v5.18
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 29, 2022 at 12:54 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Linus,
> I will send the pinctrl driver bits in separate pull to you.

OK I'll wait for it.

Yours,
Linus Walleij
