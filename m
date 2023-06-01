Return-Path: <SRS0=6RqZ=BV=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61075C77B7A
	for <soc@archiver.kernel.org>; Thu,  1 Jun 2023 15:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14D56C4339E; Thu,  1 Jun 2023 15:37:29 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18082C433D2;
	Thu,  1 Jun 2023 15:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18082C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-75b17b80834so100531185a.1;
        Thu, 01 Jun 2023 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685633846; x=1688225846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBap/Q16x/Fg2P8ZaViZGUVByhe3lZyVyIrPB/uA888=;
        b=dA8JilenybulNfFZO/N0Cl5JwsZQcuttIA79XFmuMq2JAHbMRJDrjWs3IMvZCUYwoP
         r3ZN+ahBOpz54o6Fulj0jAJuAOJrgAIRgDEuIS6Vuxu/VxLZkvD44iPMbXCvTPb85Q5B
         djlJQ3T40wTiDETdG7L6LoZSjT9kY8vPdMdXaQRC+8eJSQJohZ/L/4l8tan6q9INdaGB
         CYhX6sjaMHkLPZvJL91NHy7DcmacD7gH7yaSLtyVLTb4QDdjRbc0jGBu8HzreSfSDSnx
         WlRmO3up8KsHtC/xih34wUxp6ckby1KrhFP051gjNJM2XzBnVZekwhYw3sWpIsyk4h1y
         NZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685633846; x=1688225846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xBap/Q16x/Fg2P8ZaViZGUVByhe3lZyVyIrPB/uA888=;
        b=Tsi3Rdk3Q5hPTorywvWd2K33bA17NqG2phjENVOeDgs3SzMEwLrH6ReJ6c2o02Qjl1
         EV8325i2E2Y+B5nGb2ea4AiujRh9AcahHdln4zZKTYfsxj7ysMOjKUsPyHyhpPCapO6n
         Y2UadUMn7AQwjvWymS1+DnU4WYJZGrfp4XQSoGsHhDkhIprF7iI6YguCnWuXWrhJvB4/
         +5FHdW4QgWaVcEOtYSqMUVx3oqxRncDpK+igIbR4aT1SYd0TDI2W2eIHRNEguqkKlrPA
         l2Q3B4w8w2skGj9tJB0c8ozPHrjirQWMRJHcYmRVJEpzuMwG665viwjItJiwRL33xx0g
         VhKA==
X-Gm-Message-State: AC+VfDzUWrNgg7mq4f8lqru+emPI5AkklijC1fPs8MYxNjRBPiqcilfs
	q2aW6IQyZKCowKjZoQScgTTmJdJ3QV7jKA==
X-Google-Smtp-Source: ACHHUZ46vEGXcRAe++/zXgSGLaii/NIyI+TNR8zdQcF2S3pp3Wbc8E8ri4f49sfDRrftg3r3rs3NqQ==
X-Received: by 2002:a05:620a:2a13:b0:75b:23a1:43e with SMTP id o19-20020a05620a2a1300b0075b23a1043emr12013711qkp.4.1685633846556;
        Thu, 01 Jun 2023 08:37:26 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id e25-20020a05620a12d900b0075b13a89c30sm6712333qkl.3.2023.06.01.08.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 08:37:25 -0700 (PDT)
Message-ID: <d47958c6-eec6-badd-8924-62807461546f@gmail.com>
Date: Thu, 1 Jun 2023 08:37:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/2] arm*/dts: Enable symbols for rpi device trees
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
 <20230601140214.i4yvya763sotyjz7@pengutronix.de>
 <20230601-rake-calamari-eda0c88bd9bf@wendy>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230601-rake-calamari-eda0c88bd9bf@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/1/2023 7:13 AM, Conor Dooley wrote:
> On Thu, Jun 01, 2023 at 04:02:14PM +0200, Uwe Kleine-König wrote:
>> Hello,
>>
>> On Tue, May 30, 2023 at 07:56:22PM +0200, Uwe Kleine-König wrote:
>>> based on an earlier submission by Aurelien Jarno, I rebased and slightly
>>> simplified the patches.
>>>
>>> There was some related irc conversion in #armlinux. Quoting the relevant
>>> parts:
>>>
>>> 1685078851< ukleinek> arnd, [florian]: Who would pick up https://lore.kernel.org/linux-arm-kernel/20220410225940.135744-1-aurelien@aurel32.net ?
>>> 1685078920< ukleinek> arnd, [florian]: If there is an agreement in general that this is a good idea, I can coordinate with Aurelien that for arm64 there is a v2 with the simpler approach I pointed out.
>>> 1685083481< arnd> ukleinek: I have no objections to this, if [florian] wants to pick it up and send me for 6.5.
>>> 1685083809< arnd> robher: any comments on this one?
>>> 1685466520 < [florian]> ukleinek: I was hoping we would get an Ack for robher before picking it up in the brcm soc tree, don't want to ruffle any feathers unnecessarily
>>>
>>> So it seems to start a beneficial chain reaction, only Rob's Ack is
>>> needed.
>>
>> Not sure this might help, but as Rob seems to be away for mail, I'll
>> try: arch/arm64/boot/dts/nvidia/Makefile and
>> arch/arm64/boot/dts/ti/Makefile also make use of -@. So this patch at
>> least isn't a completely new thing and maybe Florian might dare to take
>> this patch even without Rob's explicit consent?!
> 
> FWIW you can have mine, unless it is explicitly Rob's you want Florian.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

OK, I will take yours and queue those up!
-- 
Florian
