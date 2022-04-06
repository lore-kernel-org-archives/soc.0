Return-Path: <SRS0=Ts3h=UQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45282C433EF
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 07:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02B7FC385A9; Wed,  6 Apr 2022 07:46:59 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF0B3C385AA
	for <soc@kernel.org>; Wed,  6 Apr 2022 07:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF0B3C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id dr20so2480185ejc.6
        for <soc@kernel.org>; Wed, 06 Apr 2022 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KmxEJzWVtAPtT0hHJKYkYT+MKJ5FKhKIUSiktqCv3H0=;
        b=FTwM4mW7Uk8wlU0y17I9NC3iOW9d3uTv7LnOyLd+urZwYIj4tdPV6Zf7Sb8CC92yuI
         WycSjTVsqfFPfulEQS1WWVrpihU6LDNZofWNUFMhX5Kr89oM6wSe+X7UKK5BiHHKOpCm
         wSWgqlQybRaPxjM9aEF059CgvzrzMCMLa6aWzlqWaugml52gVv1puQYh9xhyqYyEVVPM
         Zf351ZPxXApZKClS3Fb1gMUw62rea/lC0Z4p6HUMl2LhOxgLJdBtcnSRFo58AFJArklC
         w6X7nCd7JAlb9hWt5DW+TJwYQtOZ7UDwcixBtfUcT8HF7WZrqCgMVc05AlMXm/W8erCY
         rfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KmxEJzWVtAPtT0hHJKYkYT+MKJ5FKhKIUSiktqCv3H0=;
        b=DMtIgdL0ypoIHAA/ZF4vy+mcY5vzxfTSrNy+oj/YQVVf1xz93y09A1yqEK9HmY8cLo
         uI2SciEcpI1seR9AOCD7tYpqV9BGpwX12m+i9PxIESz4PLByfIsqhM49bLv1wtFgwCp0
         EBvf93cHQ5S9BfQvuHb70rpth63nqaL4CjADUDCfEHu1aNNmatyIoi5SWvTQ8OedosMG
         bwzRFjDoqzuH98ptrHZwvr6ktuY8sEAu8bDuqBvcuycGqLfrmBYIJ9ZwnlhGKj6rDTcR
         5Fng31yXdBM8yKwbGnfvQcpzGxz4FlFCB9u0fu3+wODV6aCfbJsQTnd+CainZgbAKcaB
         lJ5A==
X-Gm-Message-State: AOAM533s+5jrK8wzsvynABRoACQq5HktD/nY1GEda2z3KQWYy/vrUiIt
	IPm26//G0eNzxg+D5sMCRmZr7A==
X-Google-Smtp-Source: ABdhPJyLX+kJl66+LI5ZU/LOjINI9y85HnNQVRa6f1zZCdvyKyniSugFb2Co7cWo++WiAQK3v1vv7A==
X-Received: by 2002:a17:907:7d9e:b0:6df:9fe8:856a with SMTP id oz30-20020a1709077d9e00b006df9fe8856amr6996138ejc.373.1649231215957;
        Wed, 06 Apr 2022 00:46:55 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id p22-20020a17090653d600b006e7eb81d0b6sm3717673ejo.29.2022.04.06.00.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 00:46:55 -0700 (PDT)
Message-ID: <d94ffddf-8bec-fecd-1eb1-a873966e60a0@linaro.org>
Date: Wed, 6 Apr 2022 09:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add binding for MA35D1 clock
 controller
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "olof@lixom.net" <olof@lixom.net>, "soc@kernel.org" <soc@kernel.org>,
 MS10 CFLi0 <CFLi0@nuvoton.com>
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-2-ychuang3@nuvoton.com>
 <866c6b42-434d-e7db-5319-2256cd7003d7@linaro.org>
 <cbe5c963-c727-0fe6-6e03-039c4334f7a9@linaro.org>
 <724094ab-ed58-debd-8901-466540a66eab@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <724094ab-ed58-debd-8901-466540a66eab@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2022 06:00, Jacky Huang wrote:
>> You also ignored my comments from your v1 (because this is not v1...).
>> Do not resend without discussion or implementation.
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof,
> 
> I am finding out the comments from all mails of this series and working 
> on them.
> I will fix all the issues before sending the next version.
> So, the next version should be V3, right?
> I will add modification history "V1 -> V2" and "V2 -> V3" to [PATCH V3 0/3].
> Is that OK?

Yes


Best regards,
Krzysztof
