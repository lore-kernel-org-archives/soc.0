Return-Path: <SRS0=Jjzs=ZE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2577ECAAD1
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 08:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D2A1C433B5; Thu,  1 Sep 2022 08:58:47 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B85D6C433D6
	for <soc@kernel.org>; Thu,  1 Sep 2022 08:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B85D6C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id s15so12033780ljp.5
        for <soc@kernel.org>; Thu, 01 Sep 2022 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=mwYkPkbDpVvKnBCUeAO6SqNihrRVFRauQ3ciXakJntA=;
        b=cKwqNiIrCuxruPskUUyXVi0JY9nUNWB8yP5ZQhyNNBSUopD4SsK0P8gePIAcydCr7z
         r4crGQCX9xEDitfqH9Z6UxWKwsc02KM9E3EXGBjDxhJ/U9YJi0znHlHwoseHOaHNqiui
         z5FuuckuAUnshfoG1UFLG0MIPBJq6sEzM/cPdZDPL7TESLplsAH2ky6hEpuJkNgWPfyp
         nhGOokE0WMs01y19cc3exxaVmloPYyb//W6rFybNcFd/Y7AWbYNPBJ3OoozvSHzQjoJc
         RbuI9L+mP6sPKtqx+3EBJKqzFSXH8joq7o6XRrmeh2rpGwQETP24AyyrVOF93bnLkTa9
         8Drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=mwYkPkbDpVvKnBCUeAO6SqNihrRVFRauQ3ciXakJntA=;
        b=SNww3I4mmizwAIlnNnqQmyFbocy/oRFNFOiTdkf1fjsUV3uswB/2awicas3fa70IRn
         dAOLg07/h+T5OAdsFPWllxarK1PlHNCDGrWRDyn1e67B/uDzew9FlrnnJhnSZhBJplOX
         JlP4Do/G9XjPQ/0sidTe/PM4NjgAVRzSBJLFORaCG74T/WObFSFrn7pjXtHfmiUKOdV2
         veX488QSfYOjO1ILVDCKB6e3WUC7kRcdixuRnnloiywrzj+AzPL+qGBUx3WwU3OU8LE5
         E67G1dNpICNzBm7zJklkWLJhoFeayG0fVJ/ML0B6uz153cBEu9GTqwDXigzWSrX0kLRt
         a5Rg==
X-Gm-Message-State: ACgBeo2PwwAnkQcreEIe5zK6INSOH8ITrabgD0IKanNQp4GgDf89pBco
	6n8718NBW5UEEL5nceiBuRAz/Q==
X-Google-Smtp-Source: AA6agR4A/NKeMsV4Ak8gwgmbbPOMBHhorkS3+tj93KcLuvLF0EZl4lxNAvCjmnsb+w611pd+BKfYHg==
X-Received: by 2002:a05:651c:4c9:b0:25e:7979:573a with SMTP id e9-20020a05651c04c900b0025e7979573amr9289821lji.445.1662022724895;
        Thu, 01 Sep 2022 01:58:44 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id f8-20020a05651c03c800b002663afd079fsm1263777ljp.115.2022.09.01.01.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 01:58:44 -0700 (PDT)
Message-ID: <a9f4de46-e1ce-f8cd-2b0d-cd4bf36b1f84@linaro.org>
Date: Thu, 1 Sep 2022 11:58:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: Add support for Samsung Galaxy Tab
 4 10.1 (SM-T530)
Content-Language: en-US
To: =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
 linux-arm-msm@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220831173207.238080-1-matti.lehtimaki@gmail.com>
 <20220831173207.238080-4-matti.lehtimaki@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831173207.238080-4-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/08/2022 20:32, Matti Lehtimäki wrote:
> Add a device tree for the Samsung Galaxy Tab 4 10.1 (SM-T530) wifi tablet
> based on the apq8026 platform.
> 
> Currently supported are accelerometer sensor, hall sensor,
> internal storage, physical buttons (power & volume), screen
> (based on simple-framebuffer set up by the bootloader), sdcard,
> touchscreen and USB.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
> Changes in v4:
>   - Move delete-node to memory-region
>   - Move usb-switch node to blsp_i2c4
> 

(...)

> +};
> +
> +&rpm_requests {
> +	pm8226-regulators {

I don't think this passes bindings. Run `make dtbs_check`. I don't want
to keep accepting DTS which does not validate and none of submiters want
to fix this...

Rebase on top of:
https://lore.kernel.org/linux-devicetree/20220901085609.95624-1-krzysztof.kozlowski@linaro.org/T/#t

Node name should be "regulators".

Be sure your DTS has 0 warning.

Best regards,
Krzysztof
