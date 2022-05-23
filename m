Return-Path: <SRS0=CAhr=V7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEAEC433FE
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 10:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DF12C385A9; Mon, 23 May 2022 10:03:25 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 986ECC34116
	for <soc@kernel.org>; Mon, 23 May 2022 10:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 986ECC34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id v9so7308249lja.12
        for <soc@kernel.org>; Mon, 23 May 2022 03:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Wwkmuhu+FmNd/4eT8380gvQ4EYbdznQ/z9YW42DJoBU=;
        b=kwqTy+T/28B7ni4DmKv0V2Iq8SXEyM0UreYgOyprcFpR3fTifqpj21YBe5mnx26kSi
         9/dSH1RrzJXRq8+Xn/XoCAGVxrI2YBXPJZcwWzDpKkOp0CL0gmgvSaOJIzCeqpOcYXlb
         +tbYZxQ8UoM8cANKCb7RtMhU3HpZImnKiBuZvkyZz7jTXBMHXJdmsW9o9VfVnZfVpYeo
         jfnR+iJ/1TA+nANt5IcPmmZ1gNC6d34PUUI4STfMsoJpjJzR47HsIeFZu5lwo+rHO1cm
         rRfdTwY4pcfpNymDHY8O5DtlHdxCg/oBpvd6lMO2HNzcJ9tvlzzrIBmv+Bemi48322Gz
         7MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Wwkmuhu+FmNd/4eT8380gvQ4EYbdznQ/z9YW42DJoBU=;
        b=vPmj06ZF5kjwCV+k9527w/TCNzaKJ+xZ7JwOZ9e9GbqNk5J63fBLz5RuftqdmxcnGG
         H5K18yXfDSRpi+TqOCO7WeFQ80y+p294gWlQ35a1ALSPRYeHCVkVKHptHZW6WHuNXtX2
         iPlov3gLpyTe9RUx2agIAnfdaUm7z8xjV3dO7kuGizSJHJ48zDvVsGuupJUkLsKtV9l9
         XLahYx7fndpOeq28ywJ7+k/sGYEkl3b94ll27PvFVPA4FsYzW9NuPUzn62ks/poYD1O9
         ObOrLxkqCoUkrBgxAnwOhREKi2+c3t6LWgTze/awJaAQedayppMhrydx15z/PXeeUJP6
         9OjA==
X-Gm-Message-State: AOAM531uvy4MOo/e2uEr/389WJoBpbT6y7X3b32M+vVW54DMNltkQAuq
	PY+2ema5iPipGYyiF5/Xzx8x+g==
X-Google-Smtp-Source: ABdhPJzyVYzu2CU8h9wtVCNCmz6+lmIOKd0EHf9hvKqQm2TiSQTwZsy0ON1MFkpPXXQsedw9MovufQ==
X-Received: by 2002:a2e:5009:0:b0:253:dd39:dc19 with SMTP id e9-20020a2e5009000000b00253dd39dc19mr8890999ljb.526.1653300202766;
        Mon, 23 May 2022 03:03:22 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f14-20020ac24e4e000000b0047255d2115esm1888638lfr.141.2022.05.23.03.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 03:03:22 -0700 (PDT)
Message-ID: <fe30f58c-8e6a-d4ce-5df0-ac8fd38cda4a@linaro.org>
Date: Mon, 23 May 2022 12:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add compatible string for Kobo
 Aura 2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 l.stach@pengutronix.de, alexander.stein@ew.tq-group.com,
 marcel.ziswiler@toradex.com, linux@rempel-privat.de,
 matthias.schiffer@ew.tq-group.com, cniedermaier@dh-electronics.com,
 sebastian.reichel@collabora.com, leoyang.li@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, nicolecrivain@gmail.com
References: <20220522214415.254959-1-andreas@kemnade.info>
 <20220522214415.254959-2-andreas@kemnade.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522214415.254959-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2022 23:44, Andreas Kemnade wrote:
> This adds a compatible string for the Kobo Aura 2 eBook reader.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
