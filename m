Return-Path: <SRS0=vWm3=VU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75907C433FE
	for <soc@archiver.kernel.org>; Thu, 12 May 2022 14:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 575ECC34119; Thu, 12 May 2022 14:11:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88F5DC385B8
	for <soc@kernel.org>; Thu, 12 May 2022 14:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88F5DC385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 1-20020a05600c248100b00393fbf11a05so5227674wms.3
        for <soc@kernel.org>; Thu, 12 May 2022 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SRwpNt4DH8DqblGWpeI/m6J/HBl7UK2S+eeIMKh0Tkc=;
        b=vRz7pNegaN7s9ys9HBCJZgVKbR7C5L5hdBVEje78wDlPADH7OwcoBwoJe5pSSFdPSW
         wQJPQ8btIA1ek+0e3nSIOG4/saxP04npfrnUgaRlbMROopUfJYN1YK9a7tTqYLEoT9C4
         MMdralMo+iefdxRWSMpSIuXOSjzIQv/refS4Pm1xmr3ukOSXv/8QglMGSh/wLO+QSWd4
         Qw+fNNaJXTH9zoZH7LidmmPy+YNNQX1qDNULasFY9OMpl7hIvDKeIt4Ti/irDm1nO2h3
         GTodUdX+gSH+/cGGqpsZ2T6aHaQjGfX2p4nxbRG7zX3+jMk92Mbjvqz9vcx51QnIMtl/
         LX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SRwpNt4DH8DqblGWpeI/m6J/HBl7UK2S+eeIMKh0Tkc=;
        b=25oQVz7SKfsHeDxTcZTDVw6tMtAKiuqdR9JvVCo8Y0Lw5AnKgY3WrBWJKWZK5/BZ0C
         ghRgZyyR3hLqWpolun8C6tHMQ8wYuU4uYbGIQsBKtPFFChSJamyDR1rG/MD90B8wuUXG
         Kgofl8dD48wYf75z1yXO2DalJZc1xxO7UOebzA5OVAs9u3nouPCWULnWp+sUEjfaT8i2
         0n+qQp3feEaY9Yflwbp5r+7rtVqx7svxnPM2UfCDAYnqfE+BkTVdH31codv5NLuqzpkn
         Tlpi9jjUEpLbQScpA2MPvvMKLHVVb+gOWgcwIs1mJN+kNxU8ZYPSoVX0uLFpxHqM0g11
         l0Fg==
X-Gm-Message-State: AOAM532SJVXtrScV6zIED00p0LOKm4f4o1CUmkqP9Esefe/ut++sB92x
	YnxLjL1dsLx9cS0Lh4rrdoLMug==
X-Google-Smtp-Source: ABdhPJxbXnBKFPQ09ZKP2iaCL8DUkX2cQXFCc0U3GkQ6NUUF3YBxMC4DeHvJ+itvzyH5DnaZCjP1Bw==
X-Received: by 2002:a05:600c:4f95:b0:394:8919:7557 with SMTP id n21-20020a05600c4f9500b0039489197557mr3001wmq.166.1652364709980;
        Thu, 12 May 2022 07:11:49 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w9-20020a5d4049000000b0020c5253d8cfsm5165586wrp.27.2022.05.12.07.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 07:11:49 -0700 (PDT)
Message-ID: <8be62b40-077a-7634-7d34-7776909a2abe@linaro.org>
Date: Thu, 12 May 2022 16:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V4 0/5] Add initial support for MA35D1 SoC
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, ychuang570808@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 SoC Team <soc@kernel.org>, cfli0@nuvoton.com
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 09:07, Arnd Bergmann wrote:
> On Tue, May 10, 2022 at 5:25 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
>>
>> This patch series adds initial support for Nuvoton MA35D1 SoC,
>> include initial dts and clock controller binding.
>>
> 
> This looks fine in principle, but we are getting close to the merge window and
> should finalize this quickly to make it into v5.19. I see that you don't have a
> console device, as commented in the .dts patch. Normally I prefer merging
> platforms only when there is at least rudimentary support for booting into
> an initramfs with a serial console, but this is a flexible rule.

I disagree. It does not look fine - does not pass `make dtbs_check` even
with Nuvoton bindings...


Best regards,
Krzysztof
