Return-Path: <SRS0=KieJ=B3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6FC7EE23
	for <soc@archiver.kernel.org>; Wed,  7 Jun 2023 06:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F423CC433AA; Wed,  7 Jun 2023 06:58:05 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DB02C433A8
	for <soc@kernel.org>; Wed,  7 Jun 2023 06:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1DB02C433A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-977d0ee1736so536405366b.0
        for <soc@kernel.org>; Tue, 06 Jun 2023 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686121081; x=1688713081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4r5ckWADvIeunNEBSYEKM/Q/81CyZ43oAc3SDHOV06A=;
        b=D5LHu0NTTbEdUyGlMZ43xZPsl509RpHKHHhl33Qtv5+IetJFJX9U92zpFIdk/i1RLf
         4eNXmSRqrbIQVFYTRHxZm1aKIPebzkD1fBQDFjzGsVeHKS2wzjUKeBzPqQfsxtsXV14a
         5NrG7kd/PvckTQmCTpUHGy+IUFgT+HmqoImaC/5bCXZcKq0I27285PXg1InggQEUE8HZ
         W+is7a9B9fsx+ZIlSXs3rw8bVSnUtGiyhU6jIMCulcaio0t94so88ivQS4eHRsl3S5fF
         7fiV2DEYsxx0/dsmbicQoa1YwBR23HsQGwaZ5DGaQJKKxbG7evIzlV4sP6W7HKXtVJSl
         Yojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686121081; x=1688713081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4r5ckWADvIeunNEBSYEKM/Q/81CyZ43oAc3SDHOV06A=;
        b=IA6U8v/8mUutoCfhElsj1Tdu72P5wmH6yPKFnMYwH56HxkTRXOFqI2J0AhC8SJZuqY
         Pp4iulBA9T4crK/kgqasvpeuypBuxnQNs47ftIaKhP0C+f+FK32Fk+pHguo/DJB6Iy26
         zXGyHVmNlqcLGhu4FBj+BVctRUZOyELEXNnKTUbrxz5mvNiEXSZI78hn2EhCS6QWgvwC
         Dfj54AuoTXaW+BEaqEBn8bxP5nKVZKuVwSqGpV1tB+nHEX03WAeoiDE2UEjc1WrZtYFu
         ZUPWmhTw8sTzbJ7nJG/pC2ucbNZmUgRZA3kZnXJ7LNS9fjBjAlTyx1qZ5pjqrsgsi6zg
         W7bA==
X-Gm-Message-State: AC+VfDyx+k0WumcqORwI+VvBfKHe/uxXWWUrMZ/OJzklrqDLxsXEzmb9
	CYU8B3IfaOKxzInLOICt6GTuWg==
X-Google-Smtp-Source: ACHHUZ7fu0rabSgiRWnoDuVUvfCn6LZF2OhmoDNeDBuj4KR7YKeD2MulnLNleOKJe6o6wIMQqNdSFQ==
X-Received: by 2002:a17:907:2d93:b0:973:cc48:f19c with SMTP id gt19-20020a1709072d9300b00973cc48f19cmr4610485ejc.56.1686121080808;
        Tue, 06 Jun 2023 23:58:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u26-20020a1709060b1a00b00977d7bd9069sm3826614ejg.179.2023.06.06.23.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 23:58:00 -0700 (PDT)
Message-ID: <2edc5ad1-0000-572d-317c-387dd9c25450@linaro.org>
Date: Wed, 7 Jun 2023 08:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230607050025.86636-1-guptarud@gmail.com>
 <20230607050025.86636-3-guptarud@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607050025.86636-3-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/06/2023 07:00, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

