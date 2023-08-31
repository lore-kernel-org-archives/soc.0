Return-Path: <SRS0=f61G=EQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA869C83F10
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 06:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A807C433C9; Thu, 31 Aug 2023 06:21:00 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49831C433C8
	for <soc@kernel.org>; Thu, 31 Aug 2023 06:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49831C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so492797a12.0
        for <soc@kernel.org>; Wed, 30 Aug 2023 23:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693462857; x=1694067657; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pG3JY/czPpavqqVu3lLo9xEZ0gRVLmUoMl7zqpjOA3s=;
        b=KUXmzxc4er1XT/nxD7Qz2nFvB/x4qB+fc0AgxWlSzrWqaXYVFnsAe9/DGbxHa/yVAH
         gNwlvsQoUH+hUEDwDz+pFxFXI0eNLsp4jqTWL2MRdrpgaNyVBR8e5fG4SshOBtNSFZhy
         zg00Wi2hbx3JEkr6XwZkID2dSnmrJB2WL8apAc+KqqqGpEVsPFH+vVAQzbaBNSdDz72y
         KX9xlOl5M2gtLHv6zSjS8iSe6DW/7tmwkVSSLvh5ZgtR/z9Ibp8auFySxuCcv6dseyLk
         6ogUJQuFEyoMNogrbwCFH0G5QImQEhiKNjp/LaH384wwWxyPKXuqv/udJddjs1AhJEEm
         vhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693462857; x=1694067657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pG3JY/czPpavqqVu3lLo9xEZ0gRVLmUoMl7zqpjOA3s=;
        b=jJyJpcyHuMcxWMxoLaWhmZVNFzRTaTuOM8pBeUY4E7KLHO+EplIGGPaNn6Q2EJRKVR
         LnqvP/JzKhrP+SBReEDM1NQO1AkuMFiqNdzUyHagAT61Vu7xu8KAwMcWvq539tNTUazL
         nwdm0QCYApGyGNQ3+qTS8UO8tollsP9AHO9rD+VZEST2cj5+x89JOSTowulqJsPGJlw9
         n4VQRO30vyp4/lr3JWOyAmK47Xo0xdoKtumQHlyFf6SiVu31hEZOTddZZXw4EarUb0NW
         ZEaKfGhIa5/5QzJTskxWLm579F8u6vv+k6dqdiNu4ji4ZJgy6ZdmiuB1DojSswyE4xlR
         9FsQ==
X-Gm-Message-State: AOJu0YyFRVbVV+TVAFLbONOHd5uNpQFpx6CNsQH9bEQ6gVC8/m4XAUNc
	QNP3rriWWMdA2HhU/NSGguk0oA==
X-Google-Smtp-Source: AGHT+IE5VrHVFgWGXJLbJl+dOweoU18kkN+ftvOBbWJPeXG1U8hZQKsjqxQ+o+0QMmm7ATpbH7hmvA==
X-Received: by 2002:a17:906:8466:b0:9a5:c4ae:9fd4 with SMTP id hx6-20020a170906846600b009a5c4ae9fd4mr3234720ejc.59.1693462857179;
        Wed, 30 Aug 2023 23:20:57 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id h18-20020a1709066d9200b0099b5a71b0bfsm384516ejt.94.2023.08.30.23.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:20:56 -0700 (PDT)
Message-ID: <4cbe662d-cd20-ceef-e3e4-6608029f94b7@linaro.org>
Date: Thu, 31 Aug 2023 08:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: cosmo.chou@quantatw.com, potin.lai@quantatw.com, daniel-hsu@quantatw.com
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
 <20230831055030.3958798-2-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230831055030.3958798-2-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2023 07:50, Peter Yin wrote:
> Add linux device tree entry related to
> Minerva specific devices connected to BMC SoC.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
>  2 files changed, 378 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9e1d7bf3cff6..edb0b2105333 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-wedge400.dtb \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-facebook-yosemitev2.dtb \
> +	aspeed-bmc-facebook-minerva.dtb \

Third or fourth time: that's not a correct order. This is a nit, but
since you keep ignoring it, I don't believe any other feedback was
applied. Why you did not respond to my comments but just ignored them?


Best regards,
Krzysztof

