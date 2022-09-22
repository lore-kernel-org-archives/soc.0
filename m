Return-Path: <SRS0=uPeQ=ZZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9F1C6FA8B
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 06:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DB9DC433B5; Thu, 22 Sep 2022 06:46:54 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 849FDC433D6
	for <soc@kernel.org>; Thu, 22 Sep 2022 06:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 849FDC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id w8so13034500lft.12
        for <soc@kernel.org>; Wed, 21 Sep 2022 23:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lD7eGEkv9NNmbwuFNSY5wNAY2Knw/AnArDcDD7Ihsks=;
        b=YT4rwaGsNKJG3KJBaTg7AUI0lTcs5pu9cde18uITqorpKfQXMhgzunwhvvBDo9PKhC
         Qf9hYFBQWxbBaPKIpB/KhzBCCG2TPOcVFr0FNlkpyyaGJDT42yhiemFHusfEtY0LVWVa
         FNZVQ03Ncc2PhW19hQ47E8a0WhjnsAWJNPT9MVwI72MYgAqdZr4WYAzzPXEsliKFJuHA
         DdErzWJQk0NN6oPn1IxJhox2r9ZcjANslzC2xURXaooUD8aco5iN1Ai8Q0g7wm60qdNT
         IPP2luoHMWMh+0t6J4ni3MdF8Y78D3tpN635v0AsB2oXsMjym34mt5Mc7oujN6RLsCTy
         VmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lD7eGEkv9NNmbwuFNSY5wNAY2Knw/AnArDcDD7Ihsks=;
        b=jZhWxNJfSP/WsURbMpFCd9zHSbkRfREIxUU+XXQ/JL43199o4EWJLmsY3IoC6P1gn3
         xRUYp4ppmm3+P0zaECSbXU/le/b4g75nfsmqTiLdmw/Mr1q7nN9Zgbg5kQSxf0TfjCaX
         X94VBJHWPm6rC8XlumyIUnDT8md2z0vHx90Bqm7LJn8jhMR244x5r143i7rXMhFthj0p
         jkBN+dEblBqsaChuhnomueVyvWy1OjLWouDVSpHnDyVAYX6i3MRpSMs0s1dXm8x40rmw
         vMJnfq3Js30VGa8IjvsiLqRgvQRfvUMWfqMggrqMpPOBmPE3LVT52BBEmaGfGQdl6qaU
         BK4A==
X-Gm-Message-State: ACrzQf1WwBV7bJFhE+kvNHiyy006ztcxNoxLUPTJ0EjuCOzvBEYeqB6Q
	pELvXX7+H3jkW22vzzR9lqcRHQ==
X-Google-Smtp-Source: AMsMyM6BxgcSAwVtLlEKusvSWmnmLV6poxPCMlvtdabspSYBYoJIoYD1EYIbi1fGCHJMsVaqCxy8eg==
X-Received: by 2002:a19:7406:0:b0:49d:d448:59c3 with SMTP id v6-20020a197406000000b0049dd44859c3mr630832lfe.300.1663829211573;
        Wed, 21 Sep 2022 23:46:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 8-20020a2eb948000000b00261e7244887sm733355ljs.60.2022.09.21.23.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:46:51 -0700 (PDT)
Message-ID: <87800017-a620-041e-15af-3386ca671eda@linaro.org>
Date: Thu, 22 Sep 2022 08:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Content-Language: en-US
To: Konstantin Aladyshev <aladyshev22@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-2-aladyshev22@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921210950.10568-2-aladyshev22@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/09/2022 23:09, Konstantin Aladyshev wrote:
> Document AMD DaytonaX board compatible.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

