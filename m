Return-Path: <SRS0=RqzZ=75=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD55C7618D
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 18:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4165EC4339E; Thu,  6 Apr 2023 18:10:45 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 416E7C4339B
	for <soc@kernel.org>; Thu,  6 Apr 2023 18:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 416E7C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5002e950e23so1308273a12.1
        for <soc@kernel.org>; Thu, 06 Apr 2023 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680804642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+hArcc86ZP8XQBSobS6A1oZuyXWuAFhXHewFPdkAko=;
        b=R9KjY9V+CDKLJMFqIk58XpthyY1P5yr+BpSatZ+Ih5ohqs7rDh0UmvI/0HVttUtcEW
         Q+QC2/aK2be6/IGBlfJdLKBFfRDci22HyqQw0Vb2EcGbvIloK1vj8KxKCke/lfEzwHRi
         PcbKxUfkYUGDGacHabCuxJGVe5718iW/N32OvG0FhPuL4YN9EX2LpHI6tScIEgcNrFIX
         6r7iHhkgPXstB+Dw9HXmkZngU1cBoVZ2inZh8XLEE+1GLDK9QlpgYEsPPXJUvJJ6aTNY
         bsOchuCi5HoCfypfeBOTyggXvA/6/bTo+wHfK/vc7JJrTAVyGO7eEMT2uVl2qVWvsGzH
         LN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680804642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+hArcc86ZP8XQBSobS6A1oZuyXWuAFhXHewFPdkAko=;
        b=i2SEGe1icMnyaPB3FubfkfACITWYgVs8obI9ZRAm3YKk3HLR9z/sl0bjNyTSmGgZid
         j6P9pSs2P/Wo3PMA/ynue2KnEyqW8xXfyGVmEC7sBW3nDc+yGZhhs/SakBG6dUNoiXgk
         /an0X0L/UsW/15JMXoE+EknNCrcrpUrsEjx1ZHg6+r/Mkm/eDAd8FERLpuJuqV1duILJ
         PRNRhmO8pUwF6NTvzg4m0Sn+on3la4K8dJPP4Jk2aVKjJub1aonvO5U2y3bwuppgTlNZ
         ckmDP6n9objXZ5gvo8bwrkcMd9Uwml/BqqUSun7gl6oVFWDn4n5wqYVBdZZmNtJppHTX
         v/BA==
X-Gm-Message-State: AAQBX9dG5saiyp8Y9rzDEDmJJOpPtdseRT0T8TsYDMAAEh3eRFgPGS+k
	XD5xSCwvVDAiEhTm2J5AAOnz+A==
X-Google-Smtp-Source: AKy350bzO4eamTsoFTvkm3B8HbgN0MG/FfDkaVzPiAZkq5TaO+7lLXPtLRrN1Hf1AAJIjmBFObBqpg==
X-Received: by 2002:aa7:c6d2:0:b0:4fb:1c02:8750 with SMTP id b18-20020aa7c6d2000000b004fb1c028750mr396472eds.23.1680804642490;
        Thu, 06 Apr 2023 11:10:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id qu19-20020a170907111300b0092c8da1e5ecsm1097404ejb.21.2023.04.06.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:10:42 -0700 (PDT)
Message-ID: <dc794f94-42ff-33a5-facc-5fe09f6da295@linaro.org>
Date: Thu, 6 Apr 2023 20:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <stefan.wahren@i2se.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Stefan Wahren <stefan.wahren@chargebyte.com>,
 Evgeniy Polyakov <zbr@ioremap.net>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-3-stefan.wahren@chargebyte.com>
 <20230404133937.GA3778861-robh@kernel.org>
 <e2afed14-fed3-772c-3acc-dc132b5a1078@i2se.com>
 <2023040651-baboon-busybody-6175@gregkh>
 <bdcf41d5-cd61-1e95-0b21-b8fe401644bd@ioremap.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bdcf41d5-cd61-1e95-0b21-b8fe401644bd@ioremap.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2023 13:47, Evgeniy Polyakov wrote:
> Stefan, Greg, hi
> 
> On 06/04/2023 10:58, Greg Kroah-Hartman wrote:
>> On Thu, Apr 06, 2023 at 11:53:28AM +0200, Stefan Wahren wrote:
>>> Unfortunately no feedback from Evgeniy so far. Should i resend these two
>>> patches for you?
>>
>> Please do.
> 
> Thank you for the patches Stefan, but I'm no longer a w1 maintainer, 
> sorry I haven't updated the maintainers file, please send all w1 patches 
> to Greg.

Thanks Evgeniy.

If the one-wire subsystem is orphaned, I can manage the patches to
offload Greg a bit.

Best regards,
Krzysztof

