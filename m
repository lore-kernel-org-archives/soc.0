Return-Path: <SRS0=xdyX=X3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587FEC433EF
	for <soc@archiver.kernel.org>; Fri, 22 Jul 2022 18:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29D9FC341C7; Fri, 22 Jul 2022 18:29:36 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F5EBC341CA
	for <soc@kernel.org>; Fri, 22 Jul 2022 18:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F5EBC341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id bp17so8998330lfb.3
        for <soc@kernel.org>; Fri, 22 Jul 2022 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a+V6t6liAQ5emBUANrnh80Z6VbYR0k4klruhMYsrA7I=;
        b=JiiZH2iqIatkRp2eK11dZ0LLREG5T2jv3GgYvrd1INug58PhSjfIAaorRyTtnjC0CJ
         8uwUUyJRIGPBLVci7wRHpkncBMpSR/l6+j0Dym6EO1fld6Up1DwYV6oAxwBTFHgBO3Gm
         /sKUZTrVF6snylId2ha0VFjjgCDmdoebpyLaEJHgokYNdi8rhemRb1+XxTTFi3mEk/Di
         vrp5suHGp02+lQoteXjGtoWKa/SiDBFmDFha8MxbfdcqEoxAxkUKecvyW4RIxPfMS9xW
         pzQ0VxX3GXYAsu6b76b1hsyS3a9SCMYVNZE47plYp7CRFDXT//9/HTFN2IZux4i1PouL
         VFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a+V6t6liAQ5emBUANrnh80Z6VbYR0k4klruhMYsrA7I=;
        b=GA/tqd51bVqcfJgT3yWHwhE04X4YcDvMNF8xcWZjxorPNl335SXClXWqO6Ad2vv1l5
         GBDCRKQnJ0iHvdt1KZc0YsGyNX/tQlr2MJDxLL/hWQsGQqzfIZHem0+tu9AhriNv1R/a
         ttreaBA9Qvsg0R2OtfP/kbVCtz9Bm0LvLGU2/CB9kjPEwUDafLWqJm/jTljOUCMKBIfJ
         cfuD07BVQbxvoxCtGrDFK+Hjq/CKDkSCdI0W2zml+ylyXFRhcikg/+gbpxMQ0Ld5xI//
         ccZYnT8tRmU68t8d00KRSTzU1qmpya1vCXJ9bhQ174W2nyouz0218Prgk54BTo8Pc7ZO
         yXqA==
X-Gm-Message-State: AJIora+ERKZpoZ3WbTikDq3n9F0vjz3vWekzbHZXcAvoiABVUQWn2hbK
	E8QKKcOXJFM6vIyai+6MHczaJg==
X-Google-Smtp-Source: AGRyM1voO1vgZpH1qYd6sqkYqE0Eb8kTQ9qlepsLVPvsi1CD+x72nBMp5xxzPbE63atzPddojn3Xlg==
X-Received: by 2002:a05:6512:3a8b:b0:48a:7b80:1d9c with SMTP id q11-20020a0565123a8b00b0048a7b801d9cmr455028lfu.655.1658514573178;
        Fri, 22 Jul 2022 11:29:33 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id u4-20020a2e9b04000000b0025de8d95352sm1056688lji.1.2022.07.22.11.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 11:29:32 -0700 (PDT)
Message-ID: <b100b4d4-5ee2-2b76-285f-a9d4f4bb9306@linaro.org>
Date: Fri, 22 Jul 2022 20:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: at91: add lan966 pcb8309 board
Content-Language: en-US
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 UNGLinuxDriver@microchip.com, maxime.chevallier@bootlin.com
References: <20220722131836.2377720-1-horatiu.vultur@microchip.com>
 <20220722131836.2377720-2-horatiu.vultur@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220722131836.2377720-2-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/07/2022 15:18, Horatiu Vultur wrote:
> Add documentation for Microchip LAN9662 PCB8309.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
