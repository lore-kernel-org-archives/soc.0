Return-Path: <SRS0=qp11=C6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BDBEB64D9
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 11:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D08CEC433C8; Wed, 12 Jul 2023 11:46:26 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4DB2C433C7
	for <soc@kernel.org>; Wed, 12 Jul 2023 11:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4DB2C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b6f943383eso110541441fa.2
        for <soc@kernel.org>; Wed, 12 Jul 2023 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689162383; x=1691754383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6oxAFthf1na6BIIid11QqD+6DrC58Bsamx6gCqg45Q=;
        b=fOzZZHToBty9nPPlmtQ2xc4c0NmYr9Kp0112ouWMxCSKv3VrHxK/RwRA5NgFj20Nyj
         FUGlYZw3trPM35KO+vFdbY0gRdnWdT3urlvr7MIdQQBpQR/mEf3qWCowWNt9O+yd5mLW
         a4a6tN0COlwOQ4nL/jFZFuTDpPFf169C6Zze/Tcapou71FnuOSDGzkTKv6owQ8+dlBOw
         clbd1P26c+ajGDdEFk+xlsa1M42OPEO13GC8BEMHDx0bN4gaSRLs8yUzIizK411mHQ1I
         C6mNo5kohqHp/G3uLhJMwe7qyEyiLHJ5V8SUDfo+tq4neehmiynlElcPIniV+w2icgzh
         ghRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162383; x=1691754383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6oxAFthf1na6BIIid11QqD+6DrC58Bsamx6gCqg45Q=;
        b=MPRojs0Y3hjzGF2ZDFBWErjXgP4f170jvrprRSvGR5ZRG0PfJpadiwvAxRswEHPCxD
         OT85ol7XUkn9FUt0BX/yut7YNwKk97fXSzQcgAIhPEpmdF7Uh8LkRO6vQAIcPbCKImJ2
         fX87bg7HVBuMp4+dLiWcT47CzqbYPahfyTrHgXkRC16scr/si21Zcm11A8htsv42WIZQ
         BF2N3A/Aan8bb+Qd85fDohOthn8ofbWPRUcUpGAJPAj3ytTL7P35z2F86KBID4NJ7b+N
         XnaynMV6vSj4KQR2iN23tynZ2p52qqZT8tWpJZ4UyAg+Gs0ij9iqWd+LORordL3zkshS
         d2Qg==
X-Gm-Message-State: ABy/qLaURxHidqFk7xfegJKB/pVtS06zmUJOqkephb+z+prgfN6KgsFI
	SlkZ/04W+f9tkSk/DMssNOzMvw==
X-Google-Smtp-Source: APBJJlH9tLxXyCwdjR9f+WErBAl9fkXrfQotNE+9Zu5RMfsAVFw4GCvJ/UQpv70M5B9nxMbbqanR1A==
X-Received: by 2002:a05:651c:120c:b0:2b5:80e0:f18e with SMTP id i12-20020a05651c120c00b002b580e0f18emr16876660lja.3.1689162383489;
        Wed, 12 Jul 2023 04:46:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b0099342c87775sm2477707eja.20.2023.07.12.04.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 04:46:22 -0700 (PDT)
Message-ID: <da79ac87-f112-be43-52b2-2293e1a99d9b@linaro.org>
Date: Wed, 12 Jul 2023 13:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Documentation/process: maintainer-soc: document
 dtbs_check requirement for Samsung
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-kernel@lists.infradead.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
 <20230712-skier-ribcage-0d82be7e16fd@wendy>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712-skier-ribcage-0d82be7e16fd@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/07/2023 11:48, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 10:41:31AM +0200, Krzysztof Kozlowski wrote:
>> Samsung ARM/ARM64 SoCs (except legacy S5PV210) are also expected not to
>> bring any new dtbs_check warnings.  In fact this have been already
>> enforced and tested since few release.
>>
>> Cc: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
> 
>> Not sure where to document this. Creating new maintainer profile for
>> Samsung SoC would be an overkill. OTOH, more SoCs might want to grow
>> this list, so this also scales poor.
> 
> To me, this portion of the document was "information to the
> submaintainer", which would be you, not information to the contributors
> to the platform. Adding the comment about Samsung SoC seems aimed at
> contributors?

Yes, I want to document it for contributors, so they won't be surprised.
Any hints where to store it? I could put it in the "About" tab of my
kernel.org repo, but no one checks this for contribution guidelines.

Best regards,
Krzysztof

