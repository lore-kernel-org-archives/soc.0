Return-Path: <SRS0=2E+3=6D=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BD9C636CD
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 08:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AC1DC433D2; Tue,  7 Feb 2023 08:40:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D56E5C4339B
	for <soc@kernel.org>; Tue,  7 Feb 2023 08:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D56E5C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so12587196wmb.2
        for <soc@kernel.org>; Tue, 07 Feb 2023 00:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wi801jAD1aAF7DkgN/MHC5BDNiQ1q8cPSNLJa/Z/tSY=;
        b=CgNC5k5do6Psn4orEw4wwYVvZNvH00H0WQN9ifyps+I+gSxy7w9kaSSBbkC5PF2MLP
         6aDPoXyScZF0oeHHijgN0ztP/c6uyKyP+HtFPRZKK1mgZrn+hWlpZOnBRedr5HYeutF6
         nvDYMEfFykXA7wS3vPtH39896kEH2aGeumteWr57NTa06zRPqzgICNwW8M9JRJ57FwYi
         5p9PmTrHgZ0dwAaGozGAwJsp6rDZfySdNG9Kthc/dLJGhuN8ijrcdPAD7WylrF0dl9SO
         0EETlqHVxlkJL9dg8/kjKJ7mOKxCqpIXZKuEEPjvJG4fSeOn17l15LuwRVCcdlFAeqKx
         tF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wi801jAD1aAF7DkgN/MHC5BDNiQ1q8cPSNLJa/Z/tSY=;
        b=yW3HPj8hWxhfuCjqA0oFGrlU7ffDzsjJMUi5Qynkg3IKn+RBDJnZcnPuLe8xJyzQaF
         XcPLSdVpRwDplTI6VDZeJ8pgnvM9n8FqUw+U8Doj+zrVwcD15FmyoT3uFxVEvnHModKg
         MZ8baYZcghmIR8EwU0Ag9vLZR7uxuxd6N/I3df31w7Ud7MqJ3kjO5M7JVvi1iCKMlqkF
         01PzedYzOkPnhlKrNtinmm/RhiCVsXGAsG1gMCMkJjsxCDBjF3Mj6Hg3rb0Ixspac80e
         Rqn4RxNELLuJ4QWdB7+JA8v6tg4pR5PqE273aecsb/nwaJ7DN9J1XQo3kETbXXFbOEy0
         x59w==
X-Gm-Message-State: AO0yUKVzrnqGeLotQ8b00Vw+XgZmv8jaSPiIwGKCiaO88QjNDzRe1hdg
	CbdoLFmQOkDJjpBCB8JIaxRlxA==
X-Google-Smtp-Source: AK7set8tAEoMTFdEWmnCrOkIUFIbGFuR+bCI/4iF/rVhHr2TBLydT62g0GRpYRxvyP35J/O0TV2inw==
X-Received: by 2002:a1c:7417:0:b0:3dd:62fe:9914 with SMTP id p23-20020a1c7417000000b003dd62fe9914mr2393129wmc.18.1675759218083;
        Tue, 07 Feb 2023 00:40:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i14-20020a1c540e000000b003db03725e86sm13636762wmb.8.2023.02.07.00.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 00:40:17 -0800 (PST)
Message-ID: <20133e17-78da-d5f6-39bb-0031745fa294@linaro.org>
Date: Tue, 7 Feb 2023 09:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm64: dts: Add support for Unisoc's UMS512
Content-Language: en-US
To: Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Chunyan Zhang <chunyan.zhang@unisoc.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 devicetree@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <20230118084025.2898404-1-chunyan.zhang@unisoc.com>
 <41fd5c2a-9fc5-8af8-b66e-45bb83b24179@linaro.org>
 <CAAfSe-v3VW_sE4FwjURoOapMXrGavOK0hzeU-84-U_6xfhYbQQ@mail.gmail.com>
 <b3b9d515-20b1-62a1-3243-b1bc36c306df@linaro.org>
 <CAAfSe-tiF4--dYuKWgHUm52bMX3uSwxvWKKNRd=DFJTZZ=1x8A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAfSe-tiF4--dYuKWgHUm52bMX3uSwxvWKKNRd=DFJTZZ=1x8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2023 09:21, Chunyan Zhang wrote:
>>>> Non-unit-address nodes cannot be mixed with unit address ones. Something
>>>> is wrong here.
>>>
>>> To make sure I understand correctly, did you mean non-unit-address
>>> nodes shouldn't be the parent of unit-address nodes?
>>>
>>> Does that mean the bus node should have a unique base address like:
>>>         ap-apb@70000000 {
>>
>> No. I mean, run dtbs W=1 or dtbs_check DT_SCHEMA_FILES=simple-bus
> 
> Ok, I will fix that according to the report.
> 
> BTW, where can I see what W=1 means?

In standard kernel documentation or make help.

Best regards,
Krzysztof

