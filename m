Return-Path: <SRS0=xttv=X7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA9CCA48C
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 09:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9525CC341C0; Tue, 26 Jul 2022 09:25:49 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86C10C341CD
	for <soc@kernel.org>; Tue, 26 Jul 2022 09:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86C10C341CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id t1so21749892lft.8
        for <soc@kernel.org>; Tue, 26 Jul 2022 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G979p6J3upzKXuhEp2GoJSICZMchF50k7d+9wNNaYqs=;
        b=dkx+YtCkGjq3xUPdQFkIaxaLSwwI2sTUB8A9ZVPPp61SEhbfSXWa9UEzjMpdzJLze4
         SoHW9hAq+ABlZ184Zwix5m5RtLD5vpRYhxZr76g0pJluxnefYFcfk/LBnBOFWDeqXLuR
         xUtZQK94Tc+uVrNBoQZCGBxnPb2BbqtrvjJHzKM2gjYcYkqqvl9aL5KbWvuJwb6mHOgT
         6hCW0Fn7I03v3gfRLx6TVRJFD4MRRJwxMKxrhmBmUIMCH1ZoNS7xHJ224G1u9eSMrBDL
         fA/L5unMC46lLOmsIt4xcrUROpwrWgci8+/OcQDI1Qi0HZX+vpsETrsA8UDFzVGV4VMm
         bPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G979p6J3upzKXuhEp2GoJSICZMchF50k7d+9wNNaYqs=;
        b=unCLDsdZDa8KTBEfBDuVqaQO6aLzmWPf2SzZTIHTAxtcy4udNdqEWgABZUZBh03S6Q
         k+Vw7xqgwivL3qdCVn8W6i8yVn2qj9h8r+Vt/gv+l5dnXBL4sA7HwwfvIlKO+tz/OaLj
         ZqgeP+7qEFstcGkgRRjT6u0yV/8XGBaYhAH7jFKes+ZjRV72dIqVW+vaZYSJhcO9Ag5a
         V/yeLAKxhcUAnFpjyWaCpOL+JWV/AR3UCnLtU0vdm2POKooSQKGOwuoLhGgwKOzriSFp
         L8lqFTVnsGmdur/qlM5kyxOP4IDKeLBjQhq9oqu211ki+56Ybkx5V9nZGTtdaHC/dvHq
         BWkg==
X-Gm-Message-State: AJIora+XtJ+4LbsLacLBNB2SnIuppGGAxw48Fom/KwwUQ4fgS6jvPcJN
	ruluHWpQbyAk2DlTGKj1eRHmQg==
X-Google-Smtp-Source: AGRyM1s6b6zrQNOjDF5dUTsxYs+5vjB/9K8JyZnwbHpkGIj49zBJrSqoE2eeJ4MZk7XgGQue7MXPZw==
X-Received: by 2002:a05:6512:3e1b:b0:48a:a3c9:a124 with SMTP id i27-20020a0565123e1b00b0048aa3c9a124mr667786lfv.14.1658827545651;
        Tue, 26 Jul 2022 02:25:45 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id j10-20020a05651231ca00b00489e812f05asm3141999lfe.21.2022.07.26.02.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 02:25:45 -0700 (PDT)
Message-ID: <4682a63d-800d-c713-8bb2-caed99156299@linaro.org>
Date: Tue, 26 Jul 2022 11:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ARM: dts: lan966x: keep lan966 entries alphabetically
 sorted
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>, arnd@arndb.de,
 olof@lixom.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220726084931.1789855-1-claudiu.beznea@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726084931.1789855-1-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/07/2022 10:49, Claudiu Beznea wrote:
> Keep LAN966 entries alphabetically sorted.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
> 
> This is based on [1] which is at the moment only in at91-dt branch.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
