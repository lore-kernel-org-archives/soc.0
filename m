Return-Path: <SRS0=Kfe6=U4=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC787C433EF
	for <soc@archiver.kernel.org>; Mon, 18 Apr 2022 12:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84354C385A1; Mon, 18 Apr 2022 12:09:36 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49510C385AB
	for <soc@kernel.org>; Mon, 18 Apr 2022 12:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49510C385AB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id v15so17185676edb.12
        for <soc@kernel.org>; Mon, 18 Apr 2022 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SSv/kGw/sPtJ7xffy1Sqnr1P6e8jX6vTWYRNPrJXy+E=;
        b=jl0s2qu3zHzXOOG/XXwBXtdHcq+UyIspnmNveiot9OMZOHyKn4v4BKCOQKD3pkrCK0
         eum9+ZF1+q8e+Rrh7RG1F2HOY0m66DpMB1sr8Yt+ut9a6x0bspNKX5HFWjOpW56YSIri
         oU8+DwbzF8UOaGf3e2FPU4nd6+15wc5vAyCsFKnTQnDNhqLq6wPTDO71rtAMHGmrP8WS
         ICxFiFLJ1Qwsh/Ugwo4zoH3CQl5Iw2J2Ro5IfC/VlHP33UwCBg1/0lWX6CsGMidiKZtV
         c/bcNDX7ErJz2rvQkBkpQxtATla7/1mh6xTifwt7S8mONzxQ5IyJuBuFDgF/FIDHEQL3
         bfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SSv/kGw/sPtJ7xffy1Sqnr1P6e8jX6vTWYRNPrJXy+E=;
        b=1Drtt0kDRVpMPSZ9OMucEf0xZOJ/afx6/wVEqqZYulaFdMSLqDGz4gKffbhGA+HEBV
         f7/pxM2gWl1HegpVD1T14GqrRX92VgyonBpB/nN/lk9xXJ3sja/lTjAWdUBb9e0M7xU/
         w+DTN0jeV1Pr65Dt7BAeSEm/hppLreLZqcPfq1op6DxH+6w1n5c4H7OHAbVfZBgrVNU8
         BYGy81iU5Tjx6qevwzqzXfuUIqY/yaWs1QnR+fJdfDZ1KxOY8QBrfrgu5MjE5ZJqh9Fm
         od8Fg+NZ95R63SJdg0i85fOmZOKSmMYRJ6Hn2MVPdnrdZ5IIvj8TiZNwnDC21y7alsJi
         /56A==
X-Gm-Message-State: AOAM531ciY5PtR/H+VZtpbl5HYd4WpxGe/CkLn2lAAE3G813YhUiNVvK
	RykEBU7myI+haIoOK9JeBCdT+Q==
X-Google-Smtp-Source: ABdhPJwA8yjnwIzDfarUC+vVVrE8aSLrawiRP6weL99Jh6WKXgbp7zK0u3Ij8+I1lNxfhsABKRUrJg==
X-Received: by 2002:aa7:ccd0:0:b0:41d:70e5:b87f with SMTP id y16-20020aa7ccd0000000b0041d70e5b87fmr11607725edt.20.1650283773577;
        Mon, 18 Apr 2022 05:09:33 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090626da00b006e7cb663277sm4541728ejc.90.2022.04.18.05.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 05:09:33 -0700 (PDT)
Message-ID: <f419829d-87f7-17ff-50ce-fd3628df71fe@linaro.org>
Date: Mon, 18 Apr 2022 14:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: add binding for MA35D1 clock
 controller
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, will@kernel.org, soc@kernel.org, cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-2-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220418082738.11301-2-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/04/2022 10:27, Jacky Huang wrote:
> Add the dt-bindings header for Nuvoton MA35D1, that gets shared
> between the clock controller and clock references in the dts.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
