Return-Path: <SRS0=qZpA=7E=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75D6C6FA99
	for <soc@archiver.kernel.org>; Sun, 12 Mar 2023 16:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89895C4339E; Sun, 12 Mar 2023 16:38:20 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74F8BC433D2
	for <soc@kernel.org>; Sun, 12 Mar 2023 16:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74F8BC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id r15so12415988edq.11
        for <soc@kernel.org>; Sun, 12 Mar 2023 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678639097;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAkezKPH4FZf1ldQ9Tq9wViZer8JsvhMKxU65DAB8CY=;
        b=M4YVMftyRVu2XpsQIzZw0TB0yiNMa0MkQwrw2+Dv0k3Oqon86vXwgGcNSIEh/uqHhN
         AHvIuREbbb6paUlcwUsJntWF8D7Ikl0+tV8nhzxSFZ4sV65ipyCm8McrMRoOpsFt4+vZ
         9YojraMkuUePspl5nCGncgH5CXWPyDNN65PHFUALvlwWNJcjzt6R9/dVXfuHvH9sukOM
         y5NXpgikCollhiDgoBVhvTN8KbZ60sGs0BXMfoFxxoxa291MBxB7BFJjVevQSvqos0gB
         Ssw7jkNGWBf9Cin0yWJvL4Kv5lcja5D4mHOwDXWsSkEFsZ26XCDW8naP3EcNtQaYZX5H
         EUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678639097;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAkezKPH4FZf1ldQ9Tq9wViZer8JsvhMKxU65DAB8CY=;
        b=lUI3KNJL0aw8EBxcgqGl8OruB/EJ1WT0y6nu9aFOiIvieVVJ79eYw0c4YvIKF8Rob8
         L9gk6tX+8aCfXNPylqgMzr8Pyp6fAvu/oEcwYoVUGuGPaB73QwBdZAgTjPQpU5i0TWvS
         EHuTCob6ELGLUaHhD6yr0KrY0Bpkp8vblzWcrKMxvHZdAtSe4xlVGvpdG8PMYXgMHWG5
         olBs+7txvAuRpRwEEDgNjxnzw9bVlljdEIyXQxXgfORIzkaS0aploGYRxUIKvwrE75FT
         hJSv4HzxBQIEz02WSc/xSEG4eelDmXGBD6shZ6LQ0uNwNxgQrW7Ufmd7PIqbef7cAdwz
         SC/w==
X-Gm-Message-State: AO0yUKVDtnM/WaDBOurawibY/CK0QBp3GzVAp2hhsXn1DKEdkQGHwIY9
	YIewBR7zOzfeG1QsHlJ+OEsMYQ==
X-Google-Smtp-Source: AK7set/J/U/eNijOA4x4nTFGgcG6zFkRtuOBlsnVmgFeFIFGuxnZTkq+iKjwRwqaWIOLlgrCGRvxpA==
X-Received: by 2002:aa7:d6d0:0:b0:4ae:eb17:3afc with SMTP id x16-20020aa7d6d0000000b004aeeb173afcmr26071336edr.7.1678639097601;
        Sun, 12 Mar 2023 09:38:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id g5-20020a50d0c5000000b004fbba1226d3sm689767edf.45.2023.03.12.09.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 09:38:17 -0700 (PDT)
Message-ID: <ba843f20-dce4-72d6-5291-c28dd0ad77a5@linaro.org>
Date: Sun, 12 Mar 2023 17:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] arm64: dts: toshiba: adjust whitespace around '='
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: nobuhiro1.iwamatsu@toshiba.co.jp, arnd@arndb.de, olof@lixom.net,
 arm@kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
 <20220526204606.833054-4-krzysztof.kozlowski@linaro.org>
 <TYWPR01MB94205D3C70257E28F691D05C92D89@TYWPR01MB9420.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYWPR01MB94205D3C70257E28F691D05C92D89@TYWPR01MB9420.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2022 08:20, nobuhiro1.iwamatsu@toshiba.co.jp wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, May 27, 2022 5:46 AM
>> To: Arnd Bergmann <arnd@arndb.de>; Olof Johansson <olof@lixom.net>;
>> arm@kernel.org; soc@kernel.org; iwamatsu nobuhiro(岩松 信洋 □ＳＷＣ◯Ａ
>> ＣＴ) <nobuhiro1.iwamatsu@toshiba.co.jp>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; linux-arm-kernel@lists.infradead.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Subject: [PATCH 4/5] arm64: dts: toshiba: adjust whitespace around '='
>>
>> Fix whitespace coding style: use single space instead of tabs or multiple
>> spaces around '=' sign in property assignment.  No functional changes (same
>> DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
> 
> Thank you.
> Applied on visconti/fixes.

This was supposed to be applied almost a year ago but I still cannot
find it in mainline. I assume it was lost, so I'll take it with my other
cleanups. Let me know otherwise (but then please really take it...).

Best regards,
Krzysztof

