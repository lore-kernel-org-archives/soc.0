Return-Path: <SRS0=14BC=WJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948E5C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 06:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67B79C34114; Thu,  2 Jun 2022 06:39:31 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5186C385A5
	for <soc@kernel.org>; Thu,  2 Jun 2022 06:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5186C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id o10so4998774edi.1
        for <soc@kernel.org>; Wed, 01 Jun 2022 23:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A5b239Gi6DT4HIXTPWRt0atlMQxsvSXmCt5JQ1rzGbQ=;
        b=oyM0xcXGYLvoegSnGbvs1zBuuHOgZaqlQiGBY1/hE5CJwicefXY4kdaOirF+mnxia7
         D2Z9p02CVmFY0r5hzJ8xnVNC+pBhMj5EhWuN8Q31DeeIMpzy9Tl3kcoc/0/v+tMq1JO+
         RwVle/y5nZxHcSyQvtF9UpHhV4F/Xmdyw6XNSeaby86T/SClEz0M8U9BXZzqqeFsqvgq
         xoM8Hmj3ICxlvqwhFrMFTgiZXunGs2f5IKU3OaEFee9mAdyeSJoGxZwFo/Wgv0Cm/aUt
         6LDCEBNr8J9ATNTUf6o+R0TI69dTHButBNz3EAY2jOxX5P/eD8Tm0JEZX0SmpxmdGIvx
         H8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A5b239Gi6DT4HIXTPWRt0atlMQxsvSXmCt5JQ1rzGbQ=;
        b=0tm5xRGLMkZ8gJd9a8jIMTj9o1Np3YN7GbVDDnfMxADg1dcbKGJhzNt61RON1LQMnb
         T7f5uc9f4movETCYiR1EXHwwEBFrVnCLtl0EKilsgOafvl3m3CTfN4SkMfWsW6EVmXkC
         oJs7qH9GSgxJM8X78K4MJa8R98gcEWKxmB0VjqSThJ6P+gKRt9eZ6/jb2gJjqee7al/I
         J8Jfjbf/zZIrxs1UqLA8+FrZ5KYjoVFj6d48iWUWdbeM42ZOz9H9RlGwTG33vDpL2BVG
         PoU2G5k+A6On0ZGSXJhRAF9QK1wNg9GQdSdTWiB5PwTRzTdb/S6G1jwauV4rsANK1+a9
         JN2w==
X-Gm-Message-State: AOAM533+MI5E5FPWoiIg1cRgHWLCgkOgnlBscDuEWNMyJQsN1qrJ7pc8
	lbY5/OMXwZPAuTEVtSgThAu3ww==
X-Google-Smtp-Source: ABdhPJw0pyO7gVwGvfGW448UYMATqiAz+qiA5US5uX95lkEiOVx9xVH26FUfb7xJjUyXuNC8SsQB5g==
X-Received: by 2002:a05:6402:1113:b0:428:679e:f73f with SMTP id u19-20020a056402111300b00428679ef73fmr3730916edv.378.1654151969179;
        Wed, 01 Jun 2022 23:39:29 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y24-20020a170906071800b006feed200464sm1444495ejb.131.2022.06.01.23.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:39:28 -0700 (PDT)
Message-ID: <a6be8605-e538-d74b-b1b1-66766cf6bec3@linaro.org>
Date: Thu, 2 Jun 2022 08:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/5] ARM: dts: socfpga: Change Mercury+ AA1 dts to dtsi
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org, amstan@chromium.org,
 upstream@semihalf.com
References: <20220601154647.80071-1-pan@semihalf.com>
 <20220601154647.80071-2-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601154647.80071-2-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/06/2022 17:46, Paweł Anikiel wrote:
> The Mercury+ AA1 is not a standalone board, rather it's a module
> with an Arria 10 SoC. Remove status = "okay" and i2c aliases, as they
> are routed to the base board and should be enabled from there.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
