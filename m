Return-Path: <SRS0=wgmR=CF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72F3EB64D9
	for <soc@archiver.kernel.org>; Sat, 17 Jun 2023 20:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3A32C433CB; Sat, 17 Jun 2023 20:29:56 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F127C433C8
	for <soc@kernel.org>; Sat, 17 Jun 2023 20:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F127C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5196a728d90so2859305a12.0
        for <soc@kernel.org>; Sat, 17 Jun 2023 13:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687033793; x=1689625793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WotXs+XtzzrhlYB5laz6cnJm1VOdwaPgisww3kS+BtM=;
        b=lW9fTA9v9HxxmIHFjctBcM5mJ8sibJgQJFs7a+noaiQ3kf+VggSz3rxCQS77BYbuKj
         ibyDg5uP78O5Ypgznaqh1Y8JVeE+0649VRACesm/ssk3yZRpIKxHwqt8sBiR5QwvpnrQ
         ym94m87zIjd+jps/yrzwuUFHyyz/kBbeYTQM3IDQlWp+Tuyek65gi3/hZHV3GwZL4dFA
         4muMUlITlw2uO8ywZPtFhKoIdbzxUc0+4qaAbl+qdxHOu4ExleWtWpUpqCpIDKJJEmGn
         5T04eLpsuGKo1r2rRhWP7VBJL7dSFL9qcNT32JOCE8QXZpu94h2rTmVHE/QlafnT4wXm
         beog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687033793; x=1689625793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WotXs+XtzzrhlYB5laz6cnJm1VOdwaPgisww3kS+BtM=;
        b=PNf4wRqmJdv1wXQNpavYWg1iKQxhiwkftllT5oJ0Z3q+27Ppn4bKZhYS9kWeb5iMu2
         9H80P7fR/jeKC491bNthiURP4FRJuy7qd8uHGo/6z8tzfDkssl5YvQU/sQJXfRQHrPA/
         2T98Xj9rHiQQJJdthrqC5kkqR+WijaRjKnHgNoWtdyW9hr19MkftgBlSvlpVjKjiMEqj
         Ayzx25RT380gKtUmBMAklX9sE2uBJDx6IpT+y3Zoa7t1jOZFJd/7s8sUOvWWujwHGW6a
         YKODQD8/6K+wExdGBoudCsuRJQTIpIQFuq46f7tNR9K7qh1RUCDlNwH70Z0Qp7CnwVeF
         HEDg==
X-Gm-Message-State: AC+VfDzhRJeZJSmoB7dLW5MTZZnd9W+zV8eIQt6JkhDUG7k90o6L8ROh
	bG42TWXFpAj7+RCykUyvdLtVCg==
X-Google-Smtp-Source: ACHHUZ53sBLPaVvnnGgxK0nUyl1GvLMLow9cJxFJcPNV2oyhFecpAq7IGFCYchBcJkCqaWuR6eSlkw==
X-Received: by 2002:a17:907:3187:b0:96f:c0b0:f137 with SMTP id xe7-20020a170907318700b0096fc0b0f137mr5548380ejb.16.1687033793351;
        Sat, 17 Jun 2023 13:29:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709064ac200b00977eda0ea29sm12728337ejt.14.2023.06.17.13.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 13:29:52 -0700 (PDT)
Message-ID: <fe1f44f0-3c6d-4375-6aad-286d6d539d73@linaro.org>
Date: Sat, 17 Jun 2023 22:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3] Documentation/process: add soc maintainer handbook
To: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, soc@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Olof Johansson <olof@lixom.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20230606-escapable-stuffed-7ca5033e7741@wendy>
 <05c50d10-080b-43ab-9131-98f71508ac2d@app.fastmail.com>
 <20230617-succulent-surgery-3dbbf9454737@spud>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230617-succulent-surgery-3dbbf9454737@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2023 20:32, Conor Dooley wrote:
> Hey Arnd,
> 
> On Tue, Jun 06, 2023 at 12:23:26PM +0200, Arnd Bergmann wrote:
>> On Tue, Jun 6, 2023, at 10:27, Conor Dooley wrote:
>>> Arnd suggested that adding a maintainer handbook for the SoC "subsystem"
>>> would be helpful in trying to bring on board maintainers for the various
>>> new platforms cropping up in RISC-V land.
>>>
>>> Add a document briefly describing the role of the SoC subsystem and some
>>> basic advice for (new) platform maintainers.
>>>
>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> Changes in v3:
>>> - sort out a rake of spelling/grammar bits spotted by Randy, apart from
>>>   the one noted as a suggestion
>>> - drop the refs for document filepaths
>>
>> Thanks, I've applied this in the soc/newsoc branch of the soc tree
>> now, which is where I'm already queuing new platforms.
> 
> Having cited this document for the first time, it came to mind that I
> never mentioned putting the submaintainer trees into linux-next. Should
> I send a follow-up patch for that, or do you think that that isn't

This is common maintainer stuff, so every maintainer - not only SoC
related - should ensure his tree is in next. I would trim all such
common things from the document and store it somewhere else, because
otherwise people will just not read it.

Best regards,
Krzysztof

