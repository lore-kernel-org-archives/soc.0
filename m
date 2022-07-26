Return-Path: <SRS0=0qZW=X7=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B088DC00140
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 15:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BF09C433D7; Tue, 26 Jul 2022 15:58:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7A1DC433D6;
	Tue, 26 Jul 2022 15:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7A1DC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so385631pjk.1;
        Tue, 26 Jul 2022 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=vceTr9PbHgS7inYnpxj9pAebnTFEc9gOhZMQ08CgBlU=;
        b=QOwMzncj8BYBPgQW3UQwzOEZKrMXb/Ew5zDbZXaxXSuu2i/4Pn3iqO58tA0J2ffDYC
         hjY5u6ENlKNfjZeDzNZXJhL2DXznhHB4aLsjiX+MD3TlkrQAtSGl2cQi/gbfSCBWJlTe
         SjvgmrdF11fkZyStx10amU6gUKVaE4kgG7yTZSFbrb+2kmYSz6k0TokSb1IOj23F61dQ
         tFSWMxaVR4Q9f/tSmFbIW8VySxoIRnSdE3OD0JfJ2jNz5jccimkAkaOP4R0wximIZzjO
         gHEp3fMWcLJuHORo2ZVygwfixILSaEvcgx9sf7aXZ0Xb7OTsojUCMxxaUzgzTd1duqQj
         J7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vceTr9PbHgS7inYnpxj9pAebnTFEc9gOhZMQ08CgBlU=;
        b=veAXBjPucRTICrnFuDhXwiWHGWGowD373g3SOusc4DHB/t9Vn3w6gKGz89FxpW51uc
         1oQEAO2o8EU/3CsnjnK9lkuI12X5XTL9KEUaV+etrKhKu73VoNQTizs4x4gwKf/m74dN
         zUYUeloyCeeyVgzR/DmUdBSQ6/diyTm4NjimGuWRsTX6iCc9sFifWkPIXRulwl3QBQsD
         p/+r/EK3afRSwe8EDEVta9ZZO1WPVRNHnPJAUjgSbssrzEqQ0rypTPfHu/J2S+hryTIv
         gRB7/wiXdw7uXgAWF/ES0NfzCg9A2XNcll06GTi9B7FBCsHqYfHB8nM206tCKeZEt+fX
         UcWQ==
X-Gm-Message-State: AJIora8NdGzDvMIH497X0Q26bKBhHkNIClQEIxmEl8BumFCwAX3rmRpQ
	Yskp+3d6KeYgNBUnvcW+jg4=
X-Google-Smtp-Source: AGRyM1vq/iJIGqBfIpH7h2igFX/YIJ3gqQDe3IIPX87H2wR84iDbN004uwu9hRfn13qOFsg0Kov5XQ==
X-Received: by 2002:a17:902:e5c7:b0:16d:82dd:8c3d with SMTP id u7-20020a170902e5c700b0016d82dd8c3dmr7989689plf.62.1658851136039;
        Tue, 26 Jul 2022 08:58:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w1-20020a17090a028100b001f216a9d021sm13343952pja.40.2022.07.26.08.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 08:58:55 -0700 (PDT)
Message-ID: <d46287c3-42b0-8138-9a4d-0428133cb9df@gmail.com>
Date: Tue, 26 Jul 2022 08:58:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] dt-bindings: soc: bcm: drop quotes when not needed
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Saenz Julienne <nsaenz@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/26/22 04:58, Krzysztof Kozlowski wrote:
> Id and schema fields do not need quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
