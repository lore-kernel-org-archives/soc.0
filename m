Return-Path: <SRS0=9Cuv=WO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF22C433EF
	for <soc@archiver.kernel.org>; Tue,  7 Jun 2022 11:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33C7AC34114; Tue,  7 Jun 2022 11:57:12 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F22BC385A5
	for <soc@kernel.org>; Tue,  7 Jun 2022 11:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F22BC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id z7so22638056edm.13
        for <soc@kernel.org>; Tue, 07 Jun 2022 04:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sv7ySlJYlyYKUpAcQrKFFpWkB9BOyCw7FGbzXDHtuOg=;
        b=GDFtLI6TiFEB9XBEeWMrxN9/h3S8Vk+tbhLh89pDqWQV8nukxDjJGCz5R+5qf7Iusb
         3C2DUlq5KeVLPq35U1+yTj34Ry49hjaFJ4fDn6pJFKZpzraPxS3GzDUute3X1V6jiWCv
         HeOjJGObw7cB0Gv8dtIYgpP63hDfp1Hnr5w110otrGGPA4Fx2bctY6Rj12MvanBRhryq
         H63YeWzmEQ0Kbe+JtNleE1M7eFaCWBoW/T2ZukS2sTwLlHvIla32rDsFKHUv4wN98vFp
         uVIP8CMwseBiu0nRlFv/watH7oTZmbq5d828E71IxAz6TN3XucT3RkCkfIcX1kWr6nim
         ZoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sv7ySlJYlyYKUpAcQrKFFpWkB9BOyCw7FGbzXDHtuOg=;
        b=Y4tBoasHt4TydLh9mgn19xZZzVWjkxCiGckMPp44yO/J4Jo4O01jXSlfI6PYq2RLmi
         bP5iU1hNrt9ijQlGm/FSY/cI58CCxvPXIsnv4WTxNR7SuC5sEVLydZQ7g/WHdHBTsfP4
         5+d0q2CUswjhpi67j0h3sy51sQLwLppBXpjufIqyVi31emge5hnxIzpyp+5czIks49OZ
         D/Pf78HA1WzWoGskB8mKFjYDLpLJtZgzaAhPEtYR+XCwi3m6OtmEvLBmBVe/8+Idsn4s
         QUpv3GyYT3rnq85sNn01kNIyOsvXVT7DZzL6lXRLBw9C2/jMYXox85PUZDdSDvyRYTBq
         DVgQ==
X-Gm-Message-State: AOAM533yicmeC5CVqw3/hm8lKgqTDKl2d8aPxh41tbNS9z6KgNmuX8+p
	rvYY5a2P/TiZPsbsXMeFzMw7Mg==
X-Google-Smtp-Source: ABdhPJziqHi5ZgWy6/fdz2QXIjy2GgumEbw1uZDzUdvopDa4v/ubEVhpR/dJQNdOKQbLirBbEaT7pg==
X-Received: by 2002:a05:6402:3482:b0:42d:e063:7c1d with SMTP id v2-20020a056402348200b0042de0637c1dmr32989224edc.40.1654603031110;
        Tue, 07 Jun 2022 04:57:11 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g9-20020aa7c849000000b0042a2d9af0f8sm10036993edt.79.2022.06.07.04.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 04:57:10 -0700 (PDT)
Message-ID: <99398f9a-0516-eabf-62f5-e6f286679657@linaro.org>
Date: Tue, 7 Jun 2022 13:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v17 02/10] dt-bindings: reset: Add bindings for SP7021
 reset driver
Content-Language: en-US
To: Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <cover.1654565776.git.qinjian@cqplus1.com>
 <9f0b7682ae5f4c29686304db8bf0e15417706115.1654565776.git.qinjian@cqplus1.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9f0b7682ae5f4c29686304db8bf0e15417706115.1654565776.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/06/2022 03:58, Qin Jian wrote:
> Add documentation to describe Sunplus SP7021 reset driver bindings.
> 
> Reviewed-by: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

Wrong addresses...


Best regards,
Krzysztof
