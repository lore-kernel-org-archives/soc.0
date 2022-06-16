Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA73C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B5ECC34114; Thu, 16 Jun 2022 20:39:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4B0DC3411F
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4B0DC3411F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id r1so2161868plo.10
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=BBmUYzK8f9SnovKoa+NZytnW9BcbD9Pk0ULgGxv2bI4=;
        b=rYfpldiYa2Gue535MVTLTOD1x0t7UtoovpEyoFz/741wAYWRL2XYgKvczyDgx+9vtN
         9p/GmBWldaycFlKIOVV23dF1oVi2KdLDOCUpPy4XdbPsHNIdmHUZkmv0ae81XaIxwgAK
         kA3NWrgRAao+mWdvNxhBTa8HczAGyIWxCpHII/Q3KQaT9ujGGQ8REOm4zaJazrAHS6Jx
         NeGmE4GEOTbGQwfa9OCbgT83EEwcqnKqvfzDJ/wgfviUgdm8teTFOJZQTtur4JiexEPC
         rVhne+W+zsnUvg1YsdQQjJ801tbd2hwd9soM/nk0EFYJLKJCgB8EfrF1XUCf8ricSW2i
         UCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=BBmUYzK8f9SnovKoa+NZytnW9BcbD9Pk0ULgGxv2bI4=;
        b=UxW8O/iKxh7JfOMBB0YLoV7E0xBl8CeS9ISHxkf37PF1bQXFb/cEQtkcPBjFB8b0PY
         d++C4yZH5ryczC0v8bg/eHGLTv8Jsjsu7A1NdBO3pTnXvfNAnIVr9SR+JHcmEf+He0+i
         QxbJq5yED+w0snsOx3ddf04/8/FyU/NOAlw4224XX5ejiY6ExVoSBGX8MB0ljs0oFzSM
         NLEKrWJpk5EgJQmk70KNKja7xVf/NVfgPo7Jkb9Vhz59Fcv7B9F8ZykTHXlwhxqCEYMQ
         3Y7BcMSVGypsdUnscvnHJPynW+uBtqPnmmUrRRm6Z2UYyViGVTXgCfJf3PpqALAF4AQY
         AZDw==
X-Gm-Message-State: AJIora8WWusM0fcDwPTIpIZjOqlfl4LfPPKNYGdUnbrLwy+Rzea28oh3
	Q3ZQiw+xhfCnUT/qwNbPZ/Hu2A==
X-Google-Smtp-Source: AGRyM1tMt0yXd5H9eQZJu1TilhIOEDsCnF3M8D8EuGKgWb7ezGwyekiJ5Fm9htKWuGLz4mewvPcHeA==
X-Received: by 2002:a17:90b:388f:b0:1e8:57db:443 with SMTP id mu15-20020a17090b388f00b001e857db0443mr6846943pjb.52.1655411970316;
        Thu, 16 Jun 2022 13:39:30 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00161f9e72233sm2036781pld.261.2022.06.16.13.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 13:39:29 -0700 (PDT)
Message-ID: <ba0ae6b9-c66d-81a3-f324-79efb4455ea7@linaro.org>
Date: Thu, 16 Jun 2022 13:39:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] arm64: dts: ti: adjust whitespace around '='
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>
References: <20220526204139.831895-1-krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204139.831895-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2022 13:41, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.

Hi Nishanth,

Are you ok with the patches? Any comments?

Best regards,
Krzysztof
