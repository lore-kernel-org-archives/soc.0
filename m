Return-Path: <SRS0=z+b5=W5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E32EC433EF
	for <soc@archiver.kernel.org>; Wed, 22 Jun 2022 08:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1675AC341C5; Wed, 22 Jun 2022 08:32:36 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E033C34114
	for <soc@kernel.org>; Wed, 22 Jun 2022 08:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E033C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id u12so32582115eja.8
        for <soc@kernel.org>; Wed, 22 Jun 2022 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=WIUcmFiN2jsL7oALDMp5YXGwCzJ0JqW4KnAxg4P/XMU=;
        b=k9Gvq7+J9mhzaht3u87CbdlwP+NVlSPWWWYmFGGNQIro/etVMQlfRMzzkmHXJjZLPT
         /2jU0et3pQJq3gG8wjqHhubqpZ8qBWdSe1957mW+R4AJtmASHzjgTyIApF3wYvyND+3g
         aUkPpPsFP8scmGhOZVTm/rPjEO87fQrl1bQO8axt/Kl7rVfE4dxMUEG6fZ9/21JCvJWt
         eNdIEIBF8HAoi8bZTGT83Q53cj1GvkbqS8Fshh5NyqUsWIhcjfRfAgm+IH2hC3VO5hn5
         9pQojSP5EOT+qi4lWC6syDqO1phDO4rVqb5KHTHPSDlqUso+gb+q4uZYq+dGzs+svKB6
         rUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WIUcmFiN2jsL7oALDMp5YXGwCzJ0JqW4KnAxg4P/XMU=;
        b=nimMFXIkWOiGmGW5IKlZ/MJbxnFWfDhseqJ7sLAFhM2TZcl54sJ93uzC0GhvQs/Qvq
         LVI0RYSjmFyKnhgZXdCQzsRYTgYmgX7SlLYJq7r1TZi+UVkq6UgpdwLK7ZaIKYb3aNSb
         8XwWf6WKcMtvT8GpgP1p1Xo+oclzsuc+BRGp4+HFnB1dxAcYuz2XWTminAKTTCDA2qvj
         mrKBw/OCagc0dh2p/IcJhuCbeHH/h8Of+BjT4JK2gnpzT8g4LC+zw+ua7qvj0qxdf9LB
         cbUNK4hmWNvp1qJ/2fpbrYG1iHytKmIMq5ikX4PH1MeApAm3FA5DfEG7mlolmxtSHLyh
         rCMA==
X-Gm-Message-State: AJIora83jV9lI03xLsWwJJ8kzzicvVLL0bUHdGRhBFpkTP3Am69Paju1
	PlX9ASphOyh3Ke79YaCWf922BZsReNluBA==
X-Google-Smtp-Source: AGRyM1tkWJaPUpA9hMb6RtgYb3GvUnb8qwNoBsCBzv6suFeJmRITYuJ/8pOTGlbh5lQl9YoNbT7gSA==
X-Received: by 2002:a17:906:2806:b0:70d:ed7a:ca5b with SMTP id r6-20020a170906280600b0070ded7aca5bmr2012582ejc.173.1655886753696;
        Wed, 22 Jun 2022 01:32:33 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y4-20020aa7ccc4000000b004316f94ec4esm14477994edt.66.2022.06.22.01.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 01:32:33 -0700 (PDT)
Message-ID: <50ab1e83-f14b-6d2c-df31-60a255552c46@linaro.org>
Date: Wed, 22 Jun 2022 10:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 11/40] arm64: dts: marvell: align gpio-key node names
 with dtschema
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-11-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-11-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 2 +-
>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Andrew, Gregory, Sebastian,

Any comments on Marvel parts? Shall I grab them with rest of cleanups?

Best regards,
Krzysztof
