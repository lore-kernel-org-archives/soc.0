Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BED3C433EF
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A77CC340E6; Tue, 18 Jan 2022 18:36:05 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AE83C340E0
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9AE83C340E0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 71B803F1DD
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642530963;
	bh=EE0Uqs2gxfZTLiuKZr5yQERb9YnbJAH824xo2Ga77Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=VWfKvjK7OKJPAj8wXfnlcMno1Ur/yOfoHW2lOoY8f6/+0PexDw8457E+qG32QP2Wo
	 bEhLJLf18dgHkTSV4Dqq4KYWPbJ+mFaHPqmC+oDJElMVMtZDRklQatjNoOpZDhJKBe
	 o9btZEtrSiedrXV1ddXgrejC7Z2qfKtv7QN8B+EhSRkiBkdSuzvY2WfRdpIs+Wm48E
	 fMzB7LPV9yKFkQIWbvBMMJYKjMOkNxpJZ2Znx00w+Bj8Qg0vY6L5/tm4RAhzunSI+T
	 IlKD3mphx8xZMkY4VvLK2OdgmT4xSw1fXm0zCIIi8Yd79G74uypwLpw/oEiPE3ocLt
	 DdnvQu8Jc5Z/A==
Received: by mail-ed1-f69.google.com with SMTP id er7-20020a056402448700b00402bbb8ce8bso6360628edb.1
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EE0Uqs2gxfZTLiuKZr5yQERb9YnbJAH824xo2Ga77Yc=;
        b=fSMctN/7hVeEtiaFVudLJy/kxzH679BmHie8SMg+jJceQTIpp3/W5knx6vn2a6Iw/l
         aMz3OQtfb2TjIJUKvQUBRYdmcxjiYWBMN4gAs+okcQZpfVJcSMc4Nq8HGDZHTPBp312a
         j5TdiwepiJyaqw1Ay+RxvfZJ/TaXLOnpSicva7Yn6NGe0bRLfcZ9KjDhA/MBDLTU7Jih
         LV0K7zoZYV4NKt+RTi473/+6I9vCqnX/BmQQ81ycXiHAtRkrE+VYI8e/4NUjgfbLCTyX
         44tYnlIXHMPTkDi3TLo8rHTr+0jUtqZhLGyFloFa1yBY79KY50RonqgCHOIndwRUZBKV
         ++oA==
X-Gm-Message-State: AOAM531X46za6BRgIqFw7jJWkg076aZbzthsgDAYfihYgnwr4BMqULay
	4bIkeEDVwbVe0cTNmBwE1oErKJdxLf0OV61ESoZkJkRMhM1r1V+cu1FHH5veQcyuKsmuizZtx/t
	CzLDCo6km426/X5BnI8qeGHc=
X-Received: by 2002:a17:906:950d:: with SMTP id u13mr2606647ejx.153.1642530963212;
        Tue, 18 Jan 2022 10:36:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7fvH2EjM40W+CUN1OS0nmGVd/o0ku+wn5FGo24qFNppsdaH6JzDP3RNs1r7cpe3wn6aNXCg==
X-Received: by 2002:a17:906:950d:: with SMTP id u13mr2606629ejx.153.1642530963016;
        Tue, 18 Jan 2022 10:36:03 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id d7sm191717edt.74.2022.01.18.10.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:36:02 -0800 (PST)
Message-ID: <4606bf04-154f-97bb-9b8b-1103c6308004@canonical.com>
Date: Tue, 18 Jan 2022 19:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 08/16] clk: samsung: fsd: Add cmu_imem block clock
 information
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, Arjun K V <arjun.kv@samsung.com>,
 Tauseef Nomani <tauseef.n@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150045epcas5p4e54922758fb7922b1fd8de0995d2127e@epcas5p4.samsung.com>
 <20220118144851.69537-9-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-9-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> Adds cmu_imem clock related code, imem block contains IPs
> like WDT, DMA, TMU etc, these clocks are required for such
> IP function.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Arjun K V <arjun.kv@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Tauseef Nomani <tauseef.n@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 283 ++++++++++++++++++++++++++++++++++
>  1 file changed, 283 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
