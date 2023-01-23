Return-Path: <SRS0=6Gkx=5U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206BAC38142
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 17:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04563C433A8; Mon, 23 Jan 2023 17:11:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B55C8C4339E
	for <soc@kernel.org>; Mon, 23 Jan 2023 17:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B55C8C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so9115017wms.2
        for <soc@kernel.org>; Mon, 23 Jan 2023 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/1n6Rnx67kZYArlthTKZLtXubhv3HxF61v2sHJZdtI=;
        b=D6mCK+sNgyqI8k7P3xFY+QAzdy/QUXCsgKTvL9iznmaCEiA8KTzPZ2mFBeVub9/7Q6
         a7EDMeXOn8It3e3nKAuHDlTRpXllRzGRE9CN1T8MqH5ig1cE4lEukqZgSIrYzq7Sue9P
         P+iYYOAmc7TdAMF4plYPtU91tT+ZzVXkJKlxdOh/9t9/QU+5GTtOCDTuNgultTH2OUFp
         q6QVQ1cSNcSW2lmIzKW4BE96j6q5j2qTgpp8g2D2c2mnllwMBA3fCFB+7ZKl4/FykDC9
         OjApyeqiDR6rvBTdmkmCDFDbdsYEL/ll4bBjkrQqQYskcjbtrj7PDLdsmYy3U7h1iHnm
         AkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/1n6Rnx67kZYArlthTKZLtXubhv3HxF61v2sHJZdtI=;
        b=QsrLnvKwjb+YSqfWUfpXc+vpdzK0gSfN7Sg2OuLHyshAs0c4/S7XGvaxZ5UVFz0dhW
         L9Tl5Q35oGqzhO+GkEeDrcdPxhjOfCB9Ce5F5CksEqiEMYR9IppNTUt2Weo9B77wjHwu
         o28J3OSTDH1uzWlVCW5bFkG1ItSZr0E/6iAh5qd6UuKls5dF6j6nqcxfCHUmsastOlUZ
         WmRFzLMzyy+hWA4rLS5d5lu2IllzdvK2WqUQp1U+UVBNvnCYUmrvv7ByN1jQgN+xGd+G
         FJxiD+bPIcGIN4f8kpKdD/FibkEruxrQijAxzJgoOmgtYscgKVOzdXIEZLZtkRI0NeB5
         3hfg==
X-Gm-Message-State: AFqh2kqH3UlBcIRUJmPbz+4Q/Jw40GYCAdlb0l38v3oAG8oDGSsUEHMZ
	jABFUvzsXpXpe+prtjEP+8X47w==
X-Google-Smtp-Source: AMrXdXtGdUeLHbnaS4hmtb2SyIomWK0GV8Cd02EvA/qIDnUsl5zN96cLh5XItAyRcUDAWCzJAsB44Q==
X-Received: by 2002:a1c:7312:0:b0:3d2:3eda:dd1 with SMTP id d18-20020a1c7312000000b003d23eda0dd1mr23603852wmb.17.1674493904926;
        Mon, 23 Jan 2023 09:11:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h11-20020a05600c314b00b003db2e3f2c7csm15249768wmo.0.2023.01.23.09.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:11:44 -0800 (PST)
Message-ID: <1481d44d-f84c-db12-d95d-75f367e973de@linaro.org>
Date: Mon, 23 Jan 2023 18:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add MSM8926 and Samsung
 Galaxy Tab 4 10.1 LTE
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 matti.lehtimaki@gmail.com
References: <20230122144749.87597-1-newbyte@postmarketos.org>
 <20230122144749.87597-3-newbyte@postmarketos.org>
 <f67b23e8-a476-7f8c-b692-e85ebbe669f5@linaro.org>
In-Reply-To: <f67b23e8-a476-7f8c-b692-e85ebbe669f5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2023 18:10, Krzysztof Kozlowski wrote:
> On 22/01/2023 15:47, Stefan Hansson wrote:
>> MSM8926 (also known as Snapdragon 400) is very similar to MSM8226 and
>> APQ8026 with the primary difference being that it features an LTE modem
>> unlike the former two which feature a 3G modem and a GPS-only modem,
>> respectively.
>>
>> This also documents Samsung Galaxy Tab 4 10.1 LTE (samsung,matisselte)
>> which is a tablet by Samsung based on the MSM8926 SoC.
>>
>> Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 47913a8e3eea..7a0b2088ead9 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -35,6 +35,7 @@ description: |
>>          mdm9615
>>          msm8226
>>          msm8916
>> +        msm8926
>>          msm8953
>>          msm8956
>>          msm8974
>> @@ -219,6 +220,11 @@ properties:
>>            - const: qcom,msm8916-v1-qrd/9-v1
>>            - const: qcom,msm8916
>>  
>> +      - items:
>> +          - enum:
>> +              - samsung,matisselte
> 
> 1. matisse is the code name, lte is version/suffix. I don't think they
> should be together, because then it looks like "matisselte" is a name.
> It actually sounds like one word.

Update: there is already matisse-wifi, so please follow the same naming
convention. Version suffix should be separated with hyphen.

> 
> 2. You base on other SoC but you do not include its compatibles. Why? Is
> it intended? None of the properties applicable to other SoC will match
> here, thus I actually wonder if you run dtbs_check...

Best regards,
Krzysztof

