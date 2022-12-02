Return-Path: <SRS0=1uxm=4A=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E3FC47088
	for <soc@archiver.kernel.org>; Fri,  2 Dec 2022 10:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45968C433B5; Fri,  2 Dec 2022 10:50:54 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D722C433D7
	for <soc@kernel.org>; Fri,  2 Dec 2022 10:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D722C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id d3so4999530ljl.1
        for <soc@kernel.org>; Fri, 02 Dec 2022 02:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUa/VqnmfOXM9528l3SlSKgYGZjywEB8U8BxliATOOw=;
        b=VFw82rS8XMajD7JLPjZ+OrY2yzep2Gk0Guq0onC/auwfDMFkEMBSJJx0LP3b4ROEyM
         2x3u8HkPtMufM29Iq9RK8weMrGcVDy/xOxXIpnO5gchMRnIkz9XuuvErWhRoxKUkLKVb
         iZ8pqsFFDI13GWdDwYvRk/NinjvRI7NcQoS88pEGR1eiHd+jOPwSuxn434tG0RgAtWo5
         2QpjE8VMyjSbugZmbk4n7RCYbqKN9dr0LBsqTKnbTzspVVZ4nSA3PsLaM5T3X5/PEiel
         Ymb4nUB3J5/loHSM/+OQieYDX2c6bUPKBYsnYIucB+ujPfnCgTFJRRYKGrqYfkVR7yDk
         SWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUa/VqnmfOXM9528l3SlSKgYGZjywEB8U8BxliATOOw=;
        b=V5UGbsUqspAiXlyUmq3+1WKizKwuCT/m/SuGWwTogQNSnUNc5o1NVk8ab3CYKq+xhM
         b7/bWwA6rdURUooc9IzNrM5RVPetsQmuKxRZYJrEvzk5LHYYgcwcCCZ2LWSuLAVYBlIF
         sUcJZhYeadGONIuVTPzfATR7nDEZ/e3+YLGpheQFG7d86QOd1fQg8a/UI5C/55D5VALB
         8c6/HO84TWns8eZ0JIsExnaqtfCAkSqjxf679IRAZ6ibR3dF0HsoNUnaVHAJDNQSyrKk
         BZz8o/vtWrc1jNq9Qu43v35zDbRE0RJfURgBSHwB0ubNSV+LcZO2ea96F3Sz85R2+Mc2
         uRkA==
X-Gm-Message-State: ANoB5pmAZzCywu/Q0ZqhJGkvu34K/BVUj6QGzxEdLU3zgobtyeLeeWsy
	qJAFr+uWkxlRCai4e1842o70Xw==
X-Google-Smtp-Source: AA0mqf69Td280s1XXMPVErEzICrOPlatkrfekwHdq7BevjGZeeR2/YEfCma2e9rB3r0TZ9CLNv+Ehw==
X-Received: by 2002:a05:651c:1070:b0:276:ac05:b821 with SMTP id y16-20020a05651c107000b00276ac05b821mr24330666ljm.84.1669978251393;
        Fri, 02 Dec 2022 02:50:51 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c20-20020a056512075400b004a25bb4494fsm974799lfs.178.2022.12.02.02.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:50:51 -0800 (PST)
Message-ID: <1b2ae3ef-a27e-accf-4533-66916fe59773@linaro.org>
Date: Fri, 2 Dec 2022 11:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: =?UTF-8?Q?Re=3a_Re=ef=bc=9aRe=3a_=5bPATCH=5d_arm64/boot/dts_and_arm?=
 =?UTF-8?Q?=5fscpi=3a_add_to_support_Phytium_FT2004_CPU?=
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?B?546L5rSq6L6J?= <honghui.wang@ucas.com.cn>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
References: <tencent_12CFBB7717187D6F2B9A3246@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_12CFBB7717187D6F2B9A3246@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2022 10:23, 王洪辉 wrote:
> The approach is passed the test and verification on FT2004 DEV board.

I don't know what does it mean but for sure you did not run dtbs_check.
Whether it works on your board is different story.

Please also do not top-post and respond to comments inline.

Best regards,
Krzysztof

