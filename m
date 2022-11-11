Return-Path: <SRS0=egZ4=3L=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDBCC433FE
	for <soc@archiver.kernel.org>; Fri, 11 Nov 2022 08:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFD8FC433B5; Fri, 11 Nov 2022 08:49:09 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 45D61C433D6;
	Fri, 11 Nov 2022 08:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45D61C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 11 Nov 2022 17:49:06 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id D87142059027;
	Fri, 11 Nov 2022 17:49:06 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 11 Nov 2022 17:49:06 +0900
Received: from [10.212.156.100] (unknown [10.212.156.100])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 2CBFFB62AE;
	Fri, 11 Nov 2022 17:49:06 +0900 (JST)
Message-ID: <f1c8a87c-b084-5496-d3e1-2c524e83e2a3@socionext.com>
Date: Fri, 11 Nov 2022 17:49:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: uniphier: Add system controller
 bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
 <20221107103410.3443-2-hayashi.kunihiko@socionext.com>
 <48988a50-3c3d-7a85-af28-66f7842e5893@linaro.org>
 <3fcebf71-bdcb-8592-020c-4aa240a9e9a7@socionext.com>
 <784c5975-661a-c71c-1489-229ada0a4e72@linaro.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <784c5975-661a-c71c-1489-229ada0a4e72@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/11/09 0:08, Krzysztof Kozlowski wrote:
> On 08/11/2022 15:30, Kunihiko Hayashi wrote:
>>>> +additionalProperties:
>>>> +  type: object
>>>
>>> No, instead you should describe the children. This must me
>>> additionalProperties: false
>>
>> Each controller has different children, so need to define children
>> for each controller using "if".
> 
> Then you should have different binding documents. Bindings should be
> specific.

I see. I'll separate this document into the specific documents.

Thank you,

---
Best Regards
Kunihiko Hayashi
