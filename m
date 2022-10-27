Return-Path: <SRS0=QEF6=24=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACE8FA3740
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 14:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFCB2C433D6; Thu, 27 Oct 2022 14:54:09 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86E01C433C1
	for <soc@kernel.org>; Thu, 27 Oct 2022 14:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86E01C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f179.google.com with SMTP id hh9so1256348qtb.13
        for <soc@kernel.org>; Thu, 27 Oct 2022 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Esp3bgczyp/bd42qH2O1nm3VZIXuQMi2cu0xsZVGq+s=;
        b=N/CCjZm3MpGvyBcgyzc5rLM02GMUIWyAFnlKPuGtsSSnW2FE8nLpElsmTEY8gt9NRG
         oKzGanNkFtGI1G9DxTjfx0/1K33r1hbq0UII3+P3OYcVAfMDj5T3iu+yqtamFLdYekGC
         IDpcyemQU0BPKpALZMjrUFTV5YKVa6ky2sykjBxRogU0pMoDDmFla4OhTR/9uHXRWx9e
         eyMKMaQF7Js/HaQLBvi5sud2DwOQLhDlE5yeTYOuX05akiEgBVac1CfwkYV53t+/X3b/
         iKSzu1ST4J0jj1t+9sAFjJOYgRec8QqHLiAYu0T7ewgeM6vEJlIQ7Jk7bqteBd7xkzxU
         o14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Esp3bgczyp/bd42qH2O1nm3VZIXuQMi2cu0xsZVGq+s=;
        b=mL0qls0zxCzXrruefUkvCLZuIEL5QinykxXREaGLMgosrBqtq6DdyBh3pKGITWybkn
         7kTI57/tHvkSoZCmALc0/Gp0Ao9vBsW3XgNXkSLPgujQulZ4106hVALfcqbpZWGhQPaN
         miYo5cSApyvCufV50Tw9G5akCx0IQOilEyqA9aCyKx3sUGttiRND/JMENUECa/8d4AKy
         Bo4eaDlaRkIyXK2H7f2EbsJwdjsfvtNnFKNjQ0AK9QwWmEmIxBikMW0kTUmiX+2LjGaQ
         AWYxvkH2ainkIq2MM8YWFUVNwyzzUSEO7/MIFZ8sED9Q1UlkqFiiqJA5eIO/HfSwLfTn
         ub3A==
X-Gm-Message-State: ACrzQf1mTKUAAC8VjF9OrcOnkdrbevEHsPDAmdIxvxoM+8p/PLQ3MZGA
	Z4TKxUc3GX3aW/28ng/QZGs+9g==
X-Google-Smtp-Source: AMsMyM4FAvMRQOjYBuzP0DxssE5MRDphL4DEBLzHhTJRFGW9EiSIvlE4OfLPQd15r5f3FSv7HrFpJg==
X-Received: by 2002:a05:622a:1ba5:b0:3a4:ffd9:22d8 with SMTP id bp37-20020a05622a1ba500b003a4ffd922d8mr1390995qtb.356.1666882447502;
        Thu, 27 Oct 2022 07:54:07 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id d9-20020a05620a240900b006b8e8c657ccsm1096333qkn.117.2022.10.27.07.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 07:54:06 -0700 (PDT)
Message-ID: <43e02cd7-94d3-372c-8091-60faf821880d@linaro.org>
Date: Thu, 27 Oct 2022 10:54:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 1/4] dt-bindings: arm: rockchip: Add Rockchip RK3128
 Evaluation board
Content-Language: en-US
To: Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com,
 heiko@sntech.de
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
 <16afe467-7b9e-6e99-ca27-7eefce50a066@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <16afe467-7b9e-6e99-ca27-7eefce50a066@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2022 20:51, Johan Jonker wrote:
> Add Rockchip RK3128 Evaluation board.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

