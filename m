Return-Path: <SRS0=RBmb=ME=linaro.org=bryan.odonoghue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FBCC4345F
	for <soc@archiver.kernel.org>; Wed,  1 May 2024 10:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0B94C32789; Wed,  1 May 2024 10:44:35 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 480E4C4AF18
	for <soc@kernel.org>; Wed,  1 May 2024 10:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 480E4C4AF18
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-349545c3eb8so4350535f8f.2
        for <soc@kernel.org>; Wed, 01 May 2024 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714560273; x=1715165073; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYmuLFK3BGv9NhdBLgDNFCQmHdP6DRQ3PI9eDeKznd4=;
        b=AY4LOF+7A/H9+fWpwZW91FJtNOHkCvPbkaH14sbz91Igdmgf4xeOikhBt33QwLwwg/
         e3qAtA7697Sln7dqAoY2N9EwmLMTligPbAiZgLTFnAjkCDsnZyDzGMI26t/Qo4hrUaXz
         D63N7utnZ5HcX1b4kl8CaTe9YhFlhgxEOCUuygzgP/h5L//hKS4ze8xkdqd07fFMok7g
         9nveH2hNpAP/Ha6oB/tmd4loSQ9aNVt4n7MzE4MkNWWdZIBA4Ptud3qJRh7Aqjb0DyEJ
         /1QyFsGJAQ/MQTfIEKZI5PJCKe35lsSPFjbzefKDErgJUCZ4vBRhO1qiTPrimv1UtRVM
         NgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714560273; x=1715165073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYmuLFK3BGv9NhdBLgDNFCQmHdP6DRQ3PI9eDeKznd4=;
        b=dt3fSgYdBMiZLJdHyaUozMf74fYL+SoySiFOsqbZKkNfCwqByF1q6ltThDG+7V/ZJB
         JZAckU5ZAaDf7wBR4R5OavGvK4NLxXd8bajgXgdrt5IupinCgreoT5vi41mVUNe9n9GV
         cWmkx9hxPhBwYx3kFu9RrU1K4WXDs1QXvHJuDrqRO90JjLH33NJMpjscIluq7SUaLwsR
         poJG9yvBQ/1ojzJmNgK1nEne4hxOYoqP2y83JdHMu2XeZu1Qy0k2NNKiaIuwG0E2yQr1
         SzbWRk9wKT/ZcQc9GW2hQjcwai3IT7XWhvArYcDPy5fcQplq9W0FE/fXZMdpLJv5VqDi
         BWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEjM2EPAcSj6NbsWHvnfehaH1LwHgXA3JiX5bPZ6npHkh4ovVpRBoqnkUizvNcvD6hRhSw81sFzXiQHPN57w==
X-Gm-Message-State: AOJu0YwGZRRHmGPBwmVWdwaPPFUVch5vpW73mdsGzTmK9PC9a0wa4fPT
	Em1aXE4rGdc09jgNJpCm4O6xx9odGll6UIAv83OOf4C4mI0svTPqjRDskHP28Po=
X-Google-Smtp-Source: AGHT+IGkxuY4dhK1o59E+WzYjdOhu0VVa0wkXzXcFXoTG3txAyFGqsjz9Wd91uyD57Er84He7gVn7w==
X-Received: by 2002:a05:6000:128a:b0:34c:c9dc:ccc5 with SMTP id f10-20020a056000128a00b0034cc9dcccc5mr1636807wrx.28.1714560272686;
        Wed, 01 May 2024 03:44:32 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d64c1000000b0034d24477662sm3562035wri.8.2024.05.01.03.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 03:44:32 -0700 (PDT)
Message-ID: <e4703eb2-dda5-41b1-bd47-8dd4d15dfb9f@linaro.org>
Date: Wed, 1 May 2024 11:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
List-Id: <soc.lore.kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Robert Richter <rric@kernel.org>,
 Chanho Min <chanho.min@lge.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20240430191856.874600-2-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 20:18, Rob Herring (Arm) wrote:
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> @@ -16,7 +16,7 @@ chosen {
>   		stdout-path = "serial0";
>   	};
>   
> -	memory {
> +	memory@40000000 {
>   		device_type = "memory";
>   		reg = <0x0 0x40000000 0x0 0x20000000>;
>   	};

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
