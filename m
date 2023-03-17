Return-Path: <SRS0=IDeX=7J=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0527DC74A5B
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 12:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3B0AC4339B; Fri, 17 Mar 2023 12:40:52 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31219C4339C
	for <soc@kernel.org>; Fri, 17 Mar 2023 12:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31219C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id z21so19864284edb.4
        for <soc@kernel.org>; Fri, 17 Mar 2023 05:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679056849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdfsyAZ8ebq/tYreK/csP/pvOMbudUDFDkVltciv0uI=;
        b=DmKCuYf57JxQkvV+oLSMw/3rwVLdO7+tezGzmiFu2UkO2yOD68Ip/2c9FyYX9hPkq4
         abXeKYtJpIvWFgpswGgMf9ZnwEVuQnQiWTixr93uOH6IxffVVcB+QNRTMUzQJCdzYR6D
         6XbgMKVqfsWHyrMD7wVr3ue8C5CYVc8UYEZYq0Jxt0lUQROxIiQnX4pv/imU4sKvsf28
         bYyM+OUB3ohBoEkciJF4M9EmmfxDNwILJyx5OdTtpPuAlJz/gZZolC/Et+eTLB2Bdvv7
         q3y+VSM9UBngg6C/6aEriqfHuVG9zZbBnl2rRmiKzTUd1HpAs2e62MP+NX7TTniyNI4u
         8dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdfsyAZ8ebq/tYreK/csP/pvOMbudUDFDkVltciv0uI=;
        b=qIQvej2AOWV9A+krv5WD197G09hGy80NQPbRPg/72n8Pu6rILd1QgDAxE6SIYua8Ut
         HUjGYSaE4o4Q5g/PB32gdOKRxz2betQqSGzOuTI8lVoU1UGg7VxcVqSzsGw36Jiv4dYr
         zrsAk1UgQsHwYmlXCSWGWTAln2w/682+3CrdYppbXvvb315IA/zemDERnWUB7mAn6dyU
         pxn61B0kZTTpHshVCfznTa22zvKIyjI8b/TctNtlMWgmP7Y3WgRxbKCQpQoU2bP5TwKf
         AxdIcc6rakzBYKbQ3uW+puIz3/4UaGhex8Mn9UtjrwVUXWgxF8vU6q3+JyBh8u3LsBeF
         LpWw==
X-Gm-Message-State: AO0yUKUH7+ytqlFzDXRyZT/lYQN0HLHd0Sn4pvS7RvkLgjd/Wqodz4zj
	/aiA2rp+1v7rDglbzsuJ9feYng==
X-Google-Smtp-Source: AK7set+V3e2JzutohwFlOeDNYQueNhcUfJCbnZtB2g+Wl5NQZpHl9n0X9hbbpdxrXm05AQ+lCva1XQ==
X-Received: by 2002:a17:906:3986:b0:91f:32f9:82f0 with SMTP id h6-20020a170906398600b0091f32f982f0mr13762286eje.29.1679056849465;
        Fri, 17 Mar 2023 05:40:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d013:3eeb:7658:cec? ([2a02:810d:15c0:828:d013:3eeb:7658:cec])
        by smtp.gmail.com with ESMTPSA id yj8-20020a170907708800b00930170bc292sm941591ejb.22.2023.03.17.05.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:40:49 -0700 (PDT)
Message-ID: <cce4f28e-075d-137d-3f64-6bfd4074be72@linaro.org>
Date: Fri, 17 Mar 2023 13:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] arm64: dts: cavium: Fix GICv3 ITS nodes
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Richter <rric@kernel.org>, SoC Team <soc@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230208185506.2305349-1-robh@kernel.org>
 <CAL_JsqLz9mtsOr1sTB+eAxGOsZFthrLV-LbFBW7o7RdwgLCBZQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqLz9mtsOr1sTB+eAxGOsZFthrLV-LbFBW7o7RdwgLCBZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/03/2023 20:51, Rob Herring wrote:
> On Wed, Feb 8, 2023 at 12:55 PM Rob Herring <robh@kernel.org> wrote:
>>
>> The GICv3 ITS is an MSI controller, therefore its node name should be
>> 'msi-controller'. The ITS node is also expected to have '#msi-cells'.
>> Add it on Thunder as there are no users. Thunder2 uses 'msi-parent', but
>> Robin says that should be 'msi-map' instead and I'm not sure what's
>> correct for it.
>>
>> The unit-addresses of both the ITS and main GIC node on thunder2 are also
>> wrong, so fix them while we're here.
>>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi  | 3 ++-
>>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi | 4 ++--
>>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> Ping!
> 
> Should we remove these platforms instead if they aren't maintained?

5 weeks should be enough... Applied with my other cleanups.

Best regards,
Krzysztof

