Return-Path: <SRS0=DaLZ=3C=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D316C4332F
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 16:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF9E1C433D7; Wed,  2 Nov 2022 16:48:58 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7EE00C433C1
	for <soc@kernel.org>; Wed,  2 Nov 2022 16:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7EE00C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f181.google.com with SMTP id x21so5924344qkj.0
        for <soc@kernel.org>; Wed, 02 Nov 2022 09:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uD30lAoArCayIjKDZVlL5ocMenNCJJq05otGcDZLCH8=;
        b=zV8hhjYdbwHNiuh7M2h2tIRAFiosB9FrHDQ8qgjUuOpSzPQbfe4YhTNLXOps33072i
         vPr6OGhsDK6pjD2bmauzBU3N1bf3DKQ4krKgAghhcQChr/j/TEBm+cNcYPQplEZmtsgS
         MjtLD+wuijOdHRRalmyiqf3BBOV/cmxj6YXGyDUUrPAAZ2acn+eP4E2RwlhpVhoZzL0f
         DI9E5YnUtPK3ddkozWRaj8YerG0Edb7IQD6EJVGmUHRBo/gzfQOHVt8saSUaFSuuD8rk
         D/O3cFI4il8BU+lVZsMf+Dp5Ne3CzR3FcV7GYP2qv5NaRrJuX9t0dPTDQLxw38Dt84yl
         hmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uD30lAoArCayIjKDZVlL5ocMenNCJJq05otGcDZLCH8=;
        b=sInIvf4GZNk6RziEVEdhcLAroMmq1gGlb8CJzUtSUFxKQuP5UPnXFcarRBXQzdQwFM
         px7/hoJRQNuBfnwwScPZHM7gJNZ4llYwbQK9+QzRUxODlg7S81CqIp3mWHaRroJvwgaS
         AmL1L1VvTQ11duNlXEUre5kCyEzgm+eyJvPfYm8h05/1fEerKA/3SHVR+WLbzz32Nbyp
         d+zOweYgXjfWFmo8CQngWijIoNnWjhNf9OTgOGr0QPh5UBprOZ4CiiU/wuXvIdyh+aKT
         mytGXoNZ7ocwte/4e+O2Jvz5Svg6e8+8x1DA110h09lC0SAPU+IpggSxvhLKlQ56ioGa
         3DWQ==
X-Gm-Message-State: ACrzQf09Jc6jiXtnonFHJ5VjuaJAOXd86Qjc33oN3bPNVvRSPqhmuWG2
	0KkMnuqAmkm0VXqMKWaY5ZIajg==
X-Google-Smtp-Source: AMsMyM7PzDCe2M/7OY5FK0VrVkM/8arnKOiYqHWjZB9+WRh5VmLBtqEycnm+UfJPynJ7cCkD4hsFOw==
X-Received: by 2002:a05:620a:986:b0:6fa:3c74:e97f with SMTP id x6-20020a05620a098600b006fa3c74e97fmr9687890qkx.246.1667407736476;
        Wed, 02 Nov 2022 09:48:56 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id x18-20020a05620a259200b006bc192d277csm8942567qko.10.2022.11.02.09.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 09:48:55 -0700 (PDT)
Message-ID: <f1b5e138-e708-8aeb-9b59-96403f996fbd@linaro.org>
Date: Wed, 2 Nov 2022 12:48:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 4/4] arm64: dts: uniphier: Add NX1 SoC and boards support
Content-Language: en-US
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221027045157.23325-1-hayashi.kunihiko@socionext.com>
 <20221027045157.23325-5-hayashi.kunihiko@socionext.com>
 <a05535bc-ba18-0296-b387-d2c9c759d6f2@linaro.org>
 <54206dca-0583-88c0-9924-a80dfaf0ba94@socionext.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <54206dca-0583-88c0-9924-a80dfaf0ba94@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/11/2022 05:02, Kunihiko Hayashi wrote:
> Hi Krzysztof,
> 


>>> +				compatible = "socionext,uniphier-nx1-clock";
>>> +				#clock-cells = <1>;
>>> +			};
>>> +
>>> +			sys_rst: reset {
>>
>> reset-controller
>>
>>> +				compatible = "socionext,uniphier-nx1-reset";
>>> +				#reset-cells = <1>;
>>> +			};
>>> +
>>> +			watchdog {
>>> +				compatible = "socionext,uniphier-wdt";
>>> +			};
>>> +
>>> +			pvtctl: thermal-sensor {
>>> +				compatible = "socionext,uniphier-nx1-thermal";
>>> +				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>>> +				#thermal-sensor-cells = <0>;
>>> +				socionext,tmod-calibration = <0x0f22 0x68ee>;
>>> +			};
>>> +		};
>>> +
>>> +		spi0: spi@14006000 {
>>> +			compatible = "socionext,uniphier-scssi";
>>> +			status = "disabled";
>>> +			reg = <0x14006000 0x100>;
>>
>> Reg is second property. Status goes last. The same in other nodes.
> 
> Hmm, I've put "status" here according to the existing (uniphier's) DT policy
> and this should rewrite the policy. Is there documentation somewhere that
> recommends the order? Or, should I refer to previous comments?

Hm, your decision (as arch maintainer) is then preferred, not mine.
Although it is quite unusual to find status, not reg, as the second
property.

compatible followed by reg is not documented anywhere, it's just the
most used style. And actually most sensible as it answers to questions
from highest importance to lowest:
1. What is this device? compatible
2. Where is it? Does it match unit address? reg
3. all other properties
4. Is it off or on? status as optional property

Best regards,
Krzysztof

