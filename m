Return-Path: <SRS0=+ipK=R5=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E189C433F5
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84873C36AE3; Thu, 13 Jan 2022 12:27:47 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A40B6C36AE9
	for <soc@kernel.org>; Thu, 13 Jan 2022 12:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A40B6C36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7439F402AA
	for <soc@kernel.org>; Thu, 13 Jan 2022 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642076850;
	bh=nWMCwBQ8qvto3g6GTsUmmbjQ5M6s0nUnB5kDMDyzI/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=NY2XkyypJfAUe+CR4evsCF0239IV6QOdkIjIG6Z0SDuWUOEmuXSP4aKUHCiUQiTRv
	 KOz42HUCybFssrJcYYyJGXQC2KeVjmt6MdLxsxgSaHZiv/oD6TN64k2kzCzN2kff3X
	 1YPhUYKjauzNSREqMoY6fS2dEDAJ9r/8q/93wSuFxSJWO3xZkUUp1Xe4sq7dmXzp8b
	 5J2SkFWMkKe+nqFlWGj9P3/Uihe1MpKe/9BdR18WpnmYCUlycDSD0AGq4DGFeEgdu2
	 sxC/ZMvhYu9fYi8JnMWz63GLGO/GTaxNALPbezrAL7CxqH8ZgKEVkFtIz3mH0YRW68
	 VDN54OKE1XHwA==
Received: by mail-wm1-f70.google.com with SMTP id b2-20020a7bc242000000b00348639aed88so1160510wmj.8
        for <soc@kernel.org>; Thu, 13 Jan 2022 04:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nWMCwBQ8qvto3g6GTsUmmbjQ5M6s0nUnB5kDMDyzI/g=;
        b=1lMrCdGAY//wVavkdY6l8WbuHqp2z1DR3tTdlXfKFDCC8OvKa1eXnu/+Az4zNw1uaF
         0F1zDE5xhJym5ZvMlgRW+/L8X/kZgcJE6rctxkvOqcUU5cnoybrk8IQz0FC4YOa0Y67+
         XUDhuNPXRAInNRSwg9ksHW6j8AhdtMe25Y/9hO9BURqoF+jj+M6CZ0/PKtySaMcjUoLD
         pWX5vfAcfQ+J1iiIxQDsRu9HufsS57O7zS3FeoY100gosZyWsWuoxH5yuW5NfJgLJm9a
         4/REeZjqNMLpNmP5RzOGvMAqkeUg1k7W4/4JUWsf1KApNTd8Oc4BDDuZvuoKjVZhKmZK
         SfOw==
X-Gm-Message-State: AOAM532koNylGrq3wiF15fDUW8/rOuWV3FF2SNDrYpDpGYkyMGWMHkUj
	BdtKfeYBmG+b8NH0D2lFOvJ9AMBTe1bw/3GoYQsSdkbPxkMa4vBDwPQmU6rE4Y3JXV5mkfjjHZz
	DFinhZNn1t2hR6WQ+p/NN4lo=
X-Received: by 2002:a05:600c:602a:: with SMTP id az42mr3740595wmb.27.1642076850057;
        Thu, 13 Jan 2022 04:27:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzedcYD/WlL7vOvIVMshZ/IWP+2akJUFLDFNrlxlTqOjVhXt7ld4JHBwe6pD2xPZ5jcRCsI9A==
X-Received: by 2002:a05:600c:602a:: with SMTP id az42mr3740566wmb.27.1642076849775;
        Thu, 13 Jan 2022 04:27:29 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c7sm3267537wri.21.2022.01.13.04.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:27:29 -0800 (PST)
Message-ID: <849c7772-0f7e-32ff-6ea6-c46aa6837bb4@canonical.com>
Date: Thu, 13 Jan 2022 13:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 10/23] dt-bindings: pinctrl: samsung: Add compatible for
 Tesla FSD SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122354epcas5p19e5cebe9e85e9ba1758fa0b9d7d1ef75@epcas5p1.samsung.com>
 <20220113121143.22280-11-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-11-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 13:11, Alim Akhtar wrote:
> Add compatible for Tesla Full Self-Driving SoC. The
> pinctrl hardware IP is similar to what found on most of the
> exynos series of SoC, so this new compatible is added in
> samsung pinctrl binding.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> index b8b475967ff9..ba972998a0e4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -24,6 +24,7 @@ Required Properties:
>    - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
>    - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
>    - "samsung,exynosautov9-pinctrl": for ExynosAutov9 compatible pin-controller.
> +  - "tesla,fsd-pinctrl": for Tesla FSD SoC compatible pin-controller.
>  

Please rebase this on my latest Samsung pinctrl dtschema patches. You
also need a tesla vendor prefix patch (separate).


Best regards,
Krzysztof
