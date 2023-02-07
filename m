Return-Path: <SRS0=2E+3=6D=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114A3C636CD
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 07:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7CD0C4339B; Tue,  7 Feb 2023 07:59:56 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C84B4C433EF
	for <soc@kernel.org>; Tue,  7 Feb 2023 07:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C84B4C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ba1so8593586wrb.5
        for <soc@kernel.org>; Mon, 06 Feb 2023 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9y/P9MXwLNgqQt+C7wIYeiUxLoDHi6tNn49iTJuqSQ=;
        b=WdD2Y/cGjIiqlS31xeZvPPnp2bp9E9bEkfrn+p1aF/sykDUZR0Mn+9UPPgIo4Ss5mR
         X7x5zwE5fV7SDsK7AQzphRSIltCWtrtKKJ5UXe52kK8RkjiP/2OlXEh11Dto5hQGQOUj
         fSXmQwUYRhlcbsJAXZirNibnhegy55SSODE8Zo9noHQiqBLOv8PODBiyjSuuN2UebDhu
         xMniewVsouwDvYuFigf0c1XoVs34BeXfuXAjTuGI+br2hw3KjbeIlUIOd4/EZlktIyX0
         DVTE6nzeYLkEVZogZyQ34rvzldQlKuKNMz9nmTpvilxR1h+W3NhjV9OCXm9W4Qk5vhT6
         LyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9y/P9MXwLNgqQt+C7wIYeiUxLoDHi6tNn49iTJuqSQ=;
        b=vNiAs3denKYVu0oRUMktonXfeHqOILiY7Lo4eCocMcwRm8KiiY7HCeWYPXIyykMnex
         5GRWUkfN8r46PC9Um3o+LQie0whn3C3MhSECjTDeVoM9eG5T/tPvqx4EVEc1IcxxyT3Y
         /bc9Kq41brTD7lZaruo605Jj/OJlf6b7mVxeLXgIIUNoJA2PC35UxROiDdWQW5uYFD0h
         LSJCwOaMAWhWKMtF1AyehQerKB5aNZJa8cnL1oBsBqROWJeOug4KRhOWU/pw35QOgst0
         0bFVpUcMxQWqVq+X7ZEPEd/c719USKO7p7iutI5liOBl0/i7xtyVGr7Q0MKF60gDZckK
         VccQ==
X-Gm-Message-State: AO0yUKVY4Tm5GzYBIOqsXR8o5rACas+vzWsj+G11iAKMIrC8CeAI7caU
	1UOoh2Kp7PPo6LhrIj+m4iNz1g==
X-Google-Smtp-Source: AK7set979LY59KDvABkxHfzPCxi00zqtmzn2pfmV76eS0PMM6Bg/n+cN4lqN+Mh65bjJmFGGKeENEA==
X-Received: by 2002:a05:6000:188d:b0:2c3:be89:7c36 with SMTP id a13-20020a056000188d00b002c3be897c36mr14479686wri.25.1675756794196;
        Mon, 06 Feb 2023 23:59:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f7-20020a056000128700b002c3df9279f5sm7432290wrx.48.2023.02.06.23.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 23:59:53 -0800 (PST)
Message-ID: <b3b9d515-20b1-62a1-3243-b1bc36c306df@linaro.org>
Date: Tue, 7 Feb 2023 08:59:51 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAfSe-v3VW_sE4FwjURoOapMXrGavOK0hzeU-84-U_6xfhYbQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2023 03:19, Chunyan Zhang wrote:
> On Thu, 19 Jan 2023 at 19:40, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 18/01/2023 09:40, Chunyan Zhang wrote:
>>> Add basic support for Unisoc's UMS512, with this patch,
>>> the board ums512-1h10 can run into console.
>>>
> 
> [snip]
> 
>>> +             ap-apb {
>>
>> Non-unit-address nodes cannot be mixed with unit address ones. Something
>> is wrong here.
> 
> To make sure I understand correctly, did you mean non-unit-address
> nodes shouldn't be the parent of unit-address nodes?
> 
> Does that mean the bus node should have a unique base address like:
>         ap-apb@70000000 {

No. I mean, run dtbs W=1 or dtbs_check DT_SCHEMA_FILES=simple-bus


Best regards,
Krzysztof

