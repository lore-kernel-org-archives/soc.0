Return-Path: <SRS0=9v8K=7H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508B4C6FD1D
	for <soc@archiver.kernel.org>; Wed, 15 Mar 2023 16:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F5DBC433D2; Wed, 15 Mar 2023 16:23:24 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6700C4339C
	for <soc@kernel.org>; Wed, 15 Mar 2023 16:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6700C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id y4so48286635edo.2
        for <soc@kernel.org>; Wed, 15 Mar 2023 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678897401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2KR1l+mivREKlKJVQszhSO/59cdZ+zWncaBYgWs9bYk=;
        b=RD4NWk2T0KyTGKPN8KbwaCS3EOuKy0YIuX1mTK+FDbbbX554i+wSIT1w83c7uHErD1
         N6ExHgMEZ8wG/P8UAJ/tyx1TAsHPkbHvBukHvH4VM7AfvvxYouwR62tjBwr4FhjBBptl
         ZaTHLvCMkUXnHx+738ZFzq/3T/UeAK+hww80eBmfcq65Y+zgv96pbLQt0iO6vz7h7osL
         IY2qpHioYsNJPmVBXDQUbni8BPaSXQRpc3o7w+ucvNXvbtjcJWRXp8rCm1DhosM0qPrA
         Hq88Qqj3eX/KMoaxJ+jCOGJdzFhpK39Tya1eXN15cHuEx2cGFPNnpxhiAOq4CFYPbvNu
         EBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678897401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KR1l+mivREKlKJVQszhSO/59cdZ+zWncaBYgWs9bYk=;
        b=2HrxVcJsE3gBwiAnjYwAtOrR0FxFCFB4cOlfQMma0qBLkpTydKlkVCz9qL2BELqCU9
         +4EtDwhnr5rTSpyZRS9ZmdjhfnPxTtxh53iduL9VYQKwTl8f8LaTx9KyN7EunoLBbV4E
         kd5IgXQNOImBAUbDQzFuVFiicMwerbHIMUEnsscVkKAY6n3J8AYJIaGJB0lO75Dr+O28
         /WFKRQ7opskbZgMoGNHkSiu9bKAf5t5UA4Xo/TI4ziY5Gj/dXp7ax8WYvNYOjIpjSc2a
         McQXqAMnS+fVEZKwDoVHBaZZpRrQbPkci9268tbSH8k6NzWbFpVfogDFy8F+1Hw6gBQb
         BQuA==
X-Gm-Message-State: AO0yUKUQyh+zFunpeRb/7EZP0jIuDSatoFOwDGU5EXQg8Rw6P/WJjCA8
	x0kL8ybOUoP5KdAXRDuMrhCf3Q==
X-Google-Smtp-Source: AK7set/OGPRMMBpyR3Rx3rRvYwZzR4DAjyw3vUTcgFEho5ss29hDJ9UsDKaiNns/bkb9xdbVYXOXZg==
X-Received: by 2002:a17:906:34c2:b0:922:cb10:ad06 with SMTP id h2-20020a17090634c200b00922cb10ad06mr6427553ejb.43.1678897401102;
        Wed, 15 Mar 2023 09:23:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id v1-20020a170906488100b008d8f1b238fdsm2719423ejq.149.2023.03.15.09.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 09:23:20 -0700 (PDT)
Message-ID: <ce7ff8d4-0d5a-74e6-02cf-4d63b8dd9176@linaro.org>
Date: Wed, 15 Mar 2023 17:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: cisco: add device tree for Cisco CrayAr
 Argos.
Content-Language: en-US
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>,
 "Marcin Wierzbicki -X (mawierzb - GLOBALLOGIC INC at Cisco)"
 <mawierzb@cisco.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230315010920.2473206-1-danielwa@cisco.com>
 <d6f7a967-a0ea-c5d0-93f5-683e02673ed1@linaro.org>
 <20230315144654.GY15751@zorba>
 <f852216a-51ec-4c9c-19b5-7de7c9ce321f@linaro.org>
 <20230315155322.GZ15751@zorba>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315155322.GZ15751@zorba>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/03/2023 16:53, Daniel Walker (danielwa) wrote:
> On Wed, Mar 15, 2023 at 04:30:51PM +0100, Krzysztof Kozlowski wrote:
>> On 15/03/2023 15:46, Daniel Walker (danielwa) wrote:
>>> On Wed, Mar 15, 2023 at 07:38:52AM +0100, Krzysztof Kozlowski wrote:
>>>> On 15/03/2023 02:09, Daniel Walker wrote:
>>>>> From: Marcin Wierzbicki <mawierzb@cisco.com>
>>>>
>>>> Also few nits: subject: drop full stop.
>>>  
>>> I don't know what your asking here.
>>
>> I am asking to drop full stop from Subject.
> 
> Do you mean the period at the end of the line ?

Yes. Subject is not a full sentence.

https://en.wiktionary.org/wiki/full_stop


Best regards,
Krzysztof

