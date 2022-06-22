Return-Path: <SRS0=z+b5=W5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42C1C433EF
	for <soc@archiver.kernel.org>; Wed, 22 Jun 2022 08:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC328C341C8; Wed, 22 Jun 2022 08:30:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A21EBC341C5
	for <soc@kernel.org>; Wed, 22 Jun 2022 08:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A21EBC341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id m39-20020a05600c3b2700b0039c511ebbacso10604755wms.3
        for <soc@kernel.org>; Wed, 22 Jun 2022 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Ms/HKnagjpWOkTSuqrlOB4okpfVHQ9DTgJbAyIUZ6V4=;
        b=K3zDe3mPlB00MLjcFS42DXpYKYf2TVGmfQ3L8zKJgwUqbSXfnDPEcFBgyHRdKgDFXF
         WsBAZWWYEX5jzyiDDm2DMpIeXWkjx2wXt1wdHGcP1VnWaUH6spt4wZgKC2TH4MKD3zEk
         P6R8ZEcEvYlrKyuRH8sTk5ZjWNmP1jJlFyASryr9LldFHKLV+LGX4VK5+Zpsz26/P0DP
         rQ+v6cEdI9WP0jooa+fkrx2UUO/Xc9m9qkXW85yLtRb7mcw2ENOkj3tRu+O49LGOOJd2
         4S9nLF6lqzajDSNtiTff1JmVj8JKk5UTIKhFstK7gzzcwlJxt/WoKitTHv0ZEUjn+o0r
         4Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ms/HKnagjpWOkTSuqrlOB4okpfVHQ9DTgJbAyIUZ6V4=;
        b=IUsg15KndOwdCdEH2IHHTTQ8txw/vdPNQwodCFgyGG04cH5zHHlXuoXQxHZlF12fm/
         sK94AHWMFIsC0Jli0svFTTzx0hubQrEBorz2Jb/RaO6O9W30rINK5MkdaWtx0SWfQwhh
         CCZNwn5t7pC61WEPJCXgwa5bVjHPlaIkR2cLLpUbycPE3xzLe18RdRS9wOZZZ71X9xnK
         V2+nGMg97RJBE4xwjZqKJycIYP9j9DGR0lyGj7QAWxvFpv+X1Ygos4YxoTqECNqbicZV
         jeANLtMQBHXmLH5Yq0fVs6tng14WXA4Xri6AkB+j07eehmypzQuHq7Bw3vsYkXUxD1Yy
         349w==
X-Gm-Message-State: AJIora/R5Vh1EvziGnNuor2D1YnXoxPSRIU4fgkpyXUeNzU0bqgU3p+t
	qzoO9XB4Jtb/IX/bFKEwGNiT5A==
X-Google-Smtp-Source: AGRyM1tQ7QLdivgUmT4kY5FU+N9htHIPI5XIgL1dnBJAH1mNMWUvvNWGHru4x1XpllOOMXFcFsPe2Q==
X-Received: by 2002:a1c:44c5:0:b0:3a0:2ae2:5277 with SMTP id r188-20020a1c44c5000000b003a02ae25277mr1741579wma.30.1655886627887;
        Wed, 22 Jun 2022 01:30:27 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y12-20020a5d620c000000b0021b866397a7sm12912224wru.1.2022.06.22.01.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 01:30:26 -0700 (PDT)
Message-ID: <0a35d997-7e7e-8847-7c87-edd33719f7a3@linaro.org>
Date: Wed, 22 Jun 2022 10:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: adjust whitespace around '='
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2022 22:42, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.

Any comments on these two patches? If there are no objections I'll take
them with rest of cleanups.


Best regards,
Krzysztof
