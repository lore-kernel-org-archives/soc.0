Return-Path: <SRS0=K4vu=A6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263F2C7EE24
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 18:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E80D8C4339C; Tue,  9 May 2023 18:10:02 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EF64C433B3
	for <soc@kernel.org>; Tue,  9 May 2023 18:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EF64C433B3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-965f7bdab6bso927964366b.3
        for <soc@kernel.org>; Tue, 09 May 2023 11:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655798; x=1686247798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtIwXP7XX6CNvX90xvzkTb++FzwrEZ6PL4sjQf/MAoI=;
        b=MjcfYztGjslc2Nn0eLKw9epXhQfiBsr7oQT1euGYEJff/qnIHXuBsaUcLkpeqUazO+
         XFAyqJfdsa0kMtC50UBmyfLXsCxKCdaEVzrkWsMTPVHZzfhq/T9d+I8Dmk67bk3Wo2Kg
         o3AatLjZNitUC7ZfvA+znLfiOhfPUSeONqoEtLD7ZI7bHb64P4Ypg1MXPiTOUwseqO3a
         VoTioSogb+r1CzpKFx8eTeT8HPw8ws4tp9pscMgjIMLeVl/n02g4W0aphgoYjFXWUwtc
         xTPUW/rnwGYJjRKf4GWNpLuXdn2l5VCiAxCRUV20kgZiN0ebEnxdB3DHUkrDqbtsQSP6
         KmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655798; x=1686247798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtIwXP7XX6CNvX90xvzkTb++FzwrEZ6PL4sjQf/MAoI=;
        b=IgNRbS/IZwJkcQGifEMnDJdyPL6x5IqhZ8OEXupg+IkDy3R2MDFAlCIYFEYuFzpzUb
         mma4dDPh/YNczbfMD35Hs2qP4v6jOFD/uGyBCs8Vf/uU4LlF2KPTEJmk7NdMOtBtN8LO
         dwvD0zLdATUD/2t83w2U44mhds3eZPK18iw88Ppa5NndJMvItdA/f7+k1K9MABYce+FS
         2GLfnHQkA5E83kdrLfNSLe/cr2y2TWCglKJyvMy5133lDOYeB2CkI2xmKmfF0q5yiarX
         /RW3HqJgyoi173/3Xe6wlFfFFNfcJVOETokEznWqxK3sRdCdsucCwvpkvKUz0Xpd0czN
         IyBA==
X-Gm-Message-State: AC+VfDxlqQAoGi3UYnZV1ihRNBK6mLry9dwT8KC57rzCYAGFF2TH3B4+
	OQmSMx3IcxVg26AW/jmNuXzllw==
X-Google-Smtp-Source: ACHHUZ6NF2Ql91suaaPN6PxHtMSdFZkdc+FSwOb64SB30td68JOV/MfNrqGsZjkOqMyccWiEb/SgHA==
X-Received: by 2002:a17:907:3f87:b0:969:bae5:fa3c with SMTP id hr7-20020a1709073f8700b00969bae5fa3cmr4428101ejc.63.1683655798395;
        Tue, 09 May 2023 11:09:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id kx5-20020a170907774500b0096776c39540sm1615493ejc.31.2023.05.09.11.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 11:09:57 -0700 (PDT)
Message-ID: <5fe4a4c2-e65e-0ac9-25e7-7554d48d81d5@linaro.org>
Date: Tue, 9 May 2023 20:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 11/13] ARM: dts: exynos: Fix some typos in comments
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
 <20230501195525.6268-12-aweber.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501195525.6268-12-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2023 21:55, Artur Weber wrote:
> Change 'specfic' to 'specific', 'optiosn' to 'options' and remove
> duplicated 'are listed' in DTSI heading comments.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

This needs rebasing.

Best regards,
Krzysztof

