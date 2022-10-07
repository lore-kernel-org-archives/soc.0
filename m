Return-Path: <SRS0=ghQ0=2I=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE88C433FE
	for <soc@archiver.kernel.org>; Fri,  7 Oct 2022 07:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 563B3C433B5; Fri,  7 Oct 2022 07:06:41 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A7EAC433D6
	for <soc@kernel.org>; Fri,  7 Oct 2022 07:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A7EAC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id m14so4702481ljg.2
        for <soc@kernel.org>; Fri, 07 Oct 2022 00:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FSmGNYPsHl9Ro1MJ7SK0qxA2b0opEEGQTUXyGcDbh9o=;
        b=foHGxaipVhE4g1J2J3AKimMGWlMyYJ94BYSHus4iZXvHzycxZHOaxVIcx75vQhOkhM
         RUVn3+LF8DvwQqMfdRMsxSMAJQngOWfZ6Svfr2JJ+G/4EvJx4bwVbjnmBY4t8CWfPni/
         aOR68VVLHTz7M7lPiPwoxWld9aXAT2/zkWVus3Zvn8q61bqVvRZ33+lRHBUNJTqjTFbs
         7XOGhE0fGA7qyBmXMZYY+mSQ5mFW34rU2W0UDjJGmxSIG+Y43UQsQLQ/lMx7EWFebWB4
         /P3j0y4pT6ICbE7mbZW5+cWBwZvsuC95D1CrY8tVaGHo0rW8nIQJiv1qvS6CfpB+hnHJ
         9lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FSmGNYPsHl9Ro1MJ7SK0qxA2b0opEEGQTUXyGcDbh9o=;
        b=Zv+rkiQ2z/INwJxGa04/M8MdXyucxUJaeo9EjDmBNT22zo3U++GYyLrE2Zs7bZ28IT
         cW+JGlBDn3cYMVVyn7QipGbtBzHU5eIWLGpvKr3x2aF0JUv93iNhADhvdMpktJP5dMa9
         cdS08Myn3a5jBx2fIJCknR95xQwa/gV3cDl0MPSreOAb0/MokdLw7mYL8uE9CCWOBWy7
         1OzG6R+0n4S4K1ZNBVXtPD5EwhIQNAyH3VnH8NvASOlQmMeWKU1EGlynKovddBI96ZMx
         GfevN09icrM408yW9Mq2spGJnJgce9pMvH5GCV2UDqQgXF2ziXEXAuG8d4l3uvOU71dU
         G9zw==
X-Gm-Message-State: ACrzQf0E78VY6k+6LepES9Re/ywvQjLoWycgGess5nQws1P56A3YB5aD
	rcHNbzM437T8QEZ9qR21dglYaY3RowZL/w==
X-Google-Smtp-Source: AMsMyM7eIvv5GKIgDiCZIjDDnCooaDnHvZD7wBLGQTTRpllEwxZlb9pUXT4af4QcZRMvuZKVS512JA==
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id k8-20020a2e92c8000000b0025d6ddfe71dmr1129408ljh.170.1665126398407;
        Fri, 07 Oct 2022 00:06:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512201100b004a27bb1ad62sm173557lfb.205.2022.10.07.00.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 00:06:38 -0700 (PDT)
Message-ID: <4b861177-df32-ab9c-c746-f32f0ee6438d@linaro.org>
Date: Fri, 7 Oct 2022 09:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 krzysztof.kozlowski@linaro.or
List-Id: <soc.lore.kernel.org>
Cc: patrick@stwcx.xyz, garnermic@fb.com, Bonnie Lo <Bonnie_Lo@Wiwynn.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org
References: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007055346.3484180-1-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2022 07:53, Delphine CC Chiu wrote:
> Add linux device tree entry related to
> greatlakes specific devices connected to BMC SoC.
> 
> ---
> --- v3 - Add documentation of board compatible (bindings)
> ---    - Add board compatible
> ---    - Remove the bootargs
> ---    - Revise the DTS node name
> ---
> --- v2 - Add binding document
> ---
> --- v1 - Initial draft

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

> ---
> 
> Signed-off-by: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 241 ++++++++++++++++++

You need to document the binding. I think you already did, but then
submitted without it. Read the process:

https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst

Best regards,
Krzysztof

