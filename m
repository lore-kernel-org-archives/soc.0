Return-Path: <SRS0=a+z/=5R=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA18C05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 09:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF8E5C433EF; Fri, 20 Jan 2023 09:07:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B67E5C4339C
	for <soc@kernel.org>; Fri, 20 Jan 2023 09:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B67E5C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id d2so4213529wrp.8
        for <soc@kernel.org>; Fri, 20 Jan 2023 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9cxosX/i5nv3EeDP+R/+smZUAdn9NQG0UWoxfN1zBA=;
        b=tAzBgOXegXMIff64cxp1KeBPq6FHZg/dktVY3gc2WeTpXyyTabEyuMhnkY4Ajfyg3q
         qU6mBjnCDTsEqtSoJHAkQ9cG2N4Qt6LiUFIhXDHPVQOTkzhg2ZI81vDlIGhL2JRA9A3e
         tw2GcXAroNgZN3/a5OvpTdddfTnLO3t9kVCnlzsZ7AjS5Kc2KgRHPiQwKpoFBsKoDxYN
         47rG4SVhVyRZc7fUW4R3WWzHYqjIwck/y1HqIU3yqXeEzyj3fNUUlpifTVLCWSaCXtiw
         Nxa0B4qi3JYsA8C3q4Q2JGl2FPstEoZWwNk2REzElun0BxxzQCC/kXOlJ2iczy0GvJwO
         wl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9cxosX/i5nv3EeDP+R/+smZUAdn9NQG0UWoxfN1zBA=;
        b=gOp3bE3M93sB/+He8teTa78Kv2WsFx/OghJSJx2tiiS5SIyWZdfw21W5LNnkIDB5TO
         euVU2tJUsO0qKFAlRB4ubrUs74JxPPHe+cYqvcNpPzIMyEXbIm9TiPZEoCmZ+RMRu4wl
         NIIxbCskU2oWQtwXU+GTYWmqnK3u+8AuiOPAqdBRhMG9fFh1xWz8MbNTqeBIaIcAX4tl
         9do/uC3LQSE88c7rLAFz04TlM0LfE6cpS40FBUvwba4CdRho0z8p/pPZ0q4/P5ZBbF6v
         Dtc0v09eFB44md5MbKUK61GdxTNMtkzOY3aj4+Q7WQbXRCZhq+FTeOYiJfWLeOYGhjqg
         WZKw==
X-Gm-Message-State: AFqh2kpzCgBR6AESUS1WOpoHghYg9uiAL1WZ1mfWLXLZdW807DhJRTVN
	lZD72m/SB4mkoQoOmEPEEFZa4w==
X-Google-Smtp-Source: AMrXdXsHwTJReQjKFzfioraTTDlbnBxvBKuyMDPfO/H6c7I+wvv/GRJ0uzqiO/nuw8Z4Ho3JJyOwVA==
X-Received: by 2002:a5d:6350:0:b0:2bc:7d12:7400 with SMTP id b16-20020a5d6350000000b002bc7d127400mr12788369wrw.36.1674205647883;
        Fri, 20 Jan 2023 01:07:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe10d000000b002b6bcc0b64dsm23316547wrz.4.2023.01.20.01.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 01:07:27 -0800 (PST)
Message-ID: <fa9e401c-01d8-dd50-366e-ef582828797f@linaro.org>
Date: Fri, 20 Jan 2023 10:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/9] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-2-alexander.stein@ew.tq-group.com>
 <3c1b8078-1f23-aba7-f3b6-ddead64e85c8@linaro.org>
 <23586057.ouqheUzb2q@steina-w>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <23586057.ouqheUzb2q@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2023 09:58, Alexander Stein wrote:
> Hi Krzysztof,
> 
> thanks for your feedback.
> 
> Am Donnerstag, 19. Januar 2023, 17:59:20 CET schrieb Krzysztof Kozlowski:
>> On 19/01/2023 15:42, Alexander Stein wrote:
>>> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
>>>
>>> TQMLS102xA is a SOM family using NXP LS1021A CPU family.
>>> MBLS102xA is an evaluation mainbord for this SOM.
>>
>> typo: mainboard
> 
> Thanks.
> 
>>> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>>
>>>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
>>> b/Documentation/devicetree/bindings/arm/fsl.yaml index
>>> 3ba354578e8f9..b54a920934c9d 100644
>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>>>
>>> @@ -1164,6 +1164,13 @@ properties:
>>>                - fsl,ls1021a-twr
>>>            
>>>            - const: fsl,ls1021a
>>>
>>> +      - description: TQ-Systems TQMLS1021A SoM on MBLS102xA board
>>> +        items:
>>> +          - enum:
>>> +              - tq,ls1021a-tqmls1021a-mbls102xa
>>
>> Can mbls102xa come with something else than tqmls1021a?
> 
> I don't expect this. MBLS102xa is the starterkit carrier board for TQMLS1021A 
> module. But the module can come on other custom carrier boards.
> This name schema is similar to e.g. imx8mp-tqma8mpql-mba8mpxl.dts

If mbls102xa has soldered module, I would drop some part of it. It's
really redundant. If it is a SoM, so module could be replaced, then it
would make sense.

> 
>>> +          - const: tq,ls1021a-tqmls1021a
>>
>> Why duplicating ls1021a? Can tqmls1021a come with something else? This
>> is redundant.
> 
> I agree this is somewhat redundant, but this follows the naming scheme 
> '<vendor>,<soc>-<module>' which is rather widespread for i.MX boards/modules. 
> TQMLS1021A is the module name I can't change, actually part of the series 
> TQMLS102xA.

Ah, you're right... the double ls1021a is a bit confusing but that's
indeed common pattern.

Best regards,
Krzysztof

