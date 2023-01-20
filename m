Return-Path: <SRS0=a+z/=5R=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A55C25B4E
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 17:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADE7EC433EF; Fri, 20 Jan 2023 17:35:54 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00C95C4339C
	for <soc@kernel.org>; Fri, 20 Jan 2023 17:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00C95C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id bk16so5469601wrb.11
        for <soc@kernel.org>; Fri, 20 Jan 2023 09:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtibDBYP4iMtkWCSC6UIrfEqP+79E1l1LSnhYmoZi84=;
        b=a0EizrBVJ51x9XMo0SmIYGujI1VE9IuQMAZSmgDPW3HPHFB6mYwi9BGrBxpjbkObek
         itKHvG8slnp/701yTvitXMlHAStQ4lI9mGrzl3SjhF9u0iQrTZxG95kMPUuh8uXghW6r
         pRu6wigR3XGbq2vfZcGagjR/wpGM9BxewkzOfmmuGjFMBkhB1yQihKjwKg6vXsj5e+Jj
         irk/A6di6OnFkhm9W+AXN6OnzD4sMdxfpGGGdcxM2C5VTa0JLQ8R/PHNY3GXxGQSrkNo
         Q8UdRjXv4/n1eEw53K8AUfaTgN69IBSSFcGgAEcicYplX/Rw0A8jpTfAeldp4L9u00Z4
         eCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtibDBYP4iMtkWCSC6UIrfEqP+79E1l1LSnhYmoZi84=;
        b=kBTRnmKnPLZZqwmKQgZF3WB4dJaaM+a5CnCzoUSQ+8/cSl+LsBYK8XN3TLV19Zjel+
         6vjSwHhbdjJxvGpkhtKKes3xX5/11OZqyUkUOaaH0sgYtxyuvCi5fHGYCc/iCY11k6TY
         E49p3b2Ww9VYYkU3uUoYHQ+KIqe+Te+GzdW9lZsCJDQjFgb2IfL6qBeXz65gtPTEgjqp
         l5Az/LpAH6ke1vnF2TyJiVzwz0JWPTFERdv2YUROSc7DuqIEIBzyPLHGK32KRFpyJ4Gs
         t+gEU6WYYjpGekXZJ92gE5B6f0osbiMv67pyGqKZGs/2SyyvtFrOLmFO7w8crB2SQsCE
         TAvQ==
X-Gm-Message-State: AFqh2krWtRvwp7XXIVsrRtTy4zSusf9fefseuzyIMEwrzSsX7aUaNWQo
	BArhZwdvdZmIMuK3x+5kgO27wQ==
X-Google-Smtp-Source: AMrXdXt54pJEA64hU9pqLpjAzfF4EB4BwV1gaYq2BN8kjUL2tMAG73rGdCUL7ncRTIzQmMkHPYLxTw==
X-Received: by 2002:a5d:4cc8:0:b0:2bd:d779:c1b5 with SMTP id c8-20020a5d4cc8000000b002bdd779c1b5mr22020011wrt.27.1674236151289;
        Fri, 20 Jan 2023 09:35:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i6-20020adfe486000000b002423dc3b1a9sm35871262wrm.52.2023.01.20.09.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 09:35:50 -0800 (PST)
Message-ID: <780f2669-7ef0-1a17-9e04-50eeba4c2cf7@linaro.org>
Date: Fri, 20 Jan 2023 18:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 01/10] dt-bindings: arm: fsl: add TQ-Systems LS1021A
 board
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
 <20230120133455.3962413-2-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120133455.3962413-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2023 14:34, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> TQMLS102xA is a SOM family using NXP LS1021A CPU family.
> MBLS102xA is an evaluation mainboard for this SOM.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Improved the description mentioning this is a socketable module
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

