Return-Path: <SRS0=6RRD=FX=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFDDE95A91
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 11:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8227FC433C9; Mon,  9 Oct 2023 11:40:41 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A98C1C433C7
	for <soc@kernel.org>; Mon,  9 Oct 2023 11:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A98C1C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-65b0e623189so25474076d6.1
        for <soc@kernel.org>; Mon, 09 Oct 2023 04:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696851638; x=1697456438; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4M24u5c2mIJQDQiMwOb8MtlSQ2KBQ+vRSI2cRNWj+w=;
        b=mq9TAzxjjU2UEttel+tWxp5oQfMz3P7fU0aSYq53cafjLhEMZXpyBL4u5oIj2nL4r5
         l2QPWiseqjU92YtrD6Wj7xe4Uu1vBdjkpTPGUdqozAuDBGXAUHzShqCYimP9/AA+8j8l
         RRLE5JdAABH8p/so7ZkT8zHUpOI8b3CbkkoWOnU1nHX81pcDu15+HO+YRrH3x3RUN1Jq
         8wHtTwbGAYRE+zrS7PCYekz1Dip83L2jntg9fJZqGmqP+sd7Af5Eyp9aho+Lpek52FeL
         BfXHyAVHGMMwv2Kz0eGrTq/6BZ7J0Bkp6ag1hVMBM+pkdwqRoAVaZw6eBlXbOmx2odON
         6CNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696851638; x=1697456438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4M24u5c2mIJQDQiMwOb8MtlSQ2KBQ+vRSI2cRNWj+w=;
        b=L3RKknG89bmw+tCcdUpTXRCcbFBcKgyG2yXNLsBezaR9rFd0kyLcEcWEpJqiwF7SKO
         b8p2t3Q9WHFc9PjffZkZCrB8lyVjlwcADDcb/tZZIkZqK8C4cjPNiM9cYDXhHTocNwaN
         oAHBQ1yuzh9vFpSjSkdrJ9ZTTo0CyDbZaPRsXAbyWSB3/mhg5kOfLG4DCKVPRkcAEnqF
         a8cJA01336F8WkNlIoM0xnmL9/wKb+svxsyrqZHi7rAVMmyrx897q7TfgYwlp9/9lC+Z
         gX9ompHzSu7sN7rEMywfEjUpFzoQ2KQIdrUbAcZbf9FGbNgXvk2GpaewPcbLbnvGzee0
         05Tg==
X-Gm-Message-State: AOJu0Yz/LHi4DwdMla69UycxCfoA9ZSTGlLi0fxF6giJM0ZMkTNtR97l
	jNIrK3jvLGH6d1aNrqvGaV1cXBdFxtVb9B6IbpTf8Q==
X-Google-Smtp-Source: AGHT+IH045QZ313I4M7U9emKN/7xR9yaSooBxYXFWmE0YLkCD87Aj1O2LQLydzEOSpGL58hTKcngPZSWcU91EJAFVkA=
X-Received: by 2002:a0c:f38f:0:b0:64f:56fd:b7db with SMTP id
 i15-20020a0cf38f000000b0064f56fdb7dbmr14447725qvk.27.1696851638703; Mon, 09
 Oct 2023 04:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org> <5c9cc513-c826-4493-8255-1ec45047c403@linaro.org>
In-Reply-To: <5c9cc513-c826-4493-8255-1ec45047c403@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 9 Oct 2023 12:40:27 +0100
Message-ID: <CADrjBPrOPEBHcQC7csCV4WeKyZT9jU-kM=a+1GGJjpopG6m08Q@mail.gmail.com>
Subject: Re: [PATCH 00/21] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 9 Oct 2023 at 12:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/10/2023 17:55, Peter Griffin wrote:
> > Hi folks,
> >
> > This series adds initial SoC support for the GS101 SoC and also initial board
> > support for Pixel 6 phone (Oriole).
> >
> > The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro (raven).
> > Currently DT is just added for the gs101 SoC and Oriole.
> >
> > The support added in this series consists of:
> > * cpus
> > * pinctrl
> > * some CCF clock implementation
> > * watchdog
> > * uart
> > * gpio
>
> Hi Peter,
>
> Heads up, in case you are not aware Arm SoC timeframes: we are at rc5,
> so it means that anything targeting v6.7 should be applied this working
> week, before rc6. At least as ARM SoC is concerned.

Thanks for the heads up! I'm just working on v2 now incorporating all the
review feedback. I'm hoping to have that sent out by the end of today or early
tomorrow.

Thanks,

Peter.
