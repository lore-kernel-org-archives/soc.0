Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753A1C433EF
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60E23C340E5; Tue, 18 Jan 2022 18:38:46 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F422C340E0
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F422C340E0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6048640028
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642531124;
	bh=qiMWFcACm7KXDNL4mR8VjkWhK+rixFnnFkcu11vXqgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=XZCj+bMvn633jV462x1t52CuIZPi9zKfcWfvwMLRgec6j1Y37eKPYYHL8bfp4BOJk
	 2jp6uAcqBvdAQxesAi+Nni6hgIiqJQvBbtMcFeSu3YG1hl26UDmdNJBgywt/HAVIPa
	 v3Fbg37w2NDrysNPsewE5TNjpMfWEVc0KFA9zjM4+8uiw8uMcBYMmKO0IPEoCWbdZu
	 3knB1fs1chsqkx+996krSN5HsXrSOrpt4SziqCJFjJC40X9O6biH9MhNCQfvihR8sG
	 L6dGWW0VwRZg3+qOizAbHxgaBMDAcX6gGYwW0kKF+uBkRc18Q0Ny1hGdmoRj7KH/7C
	 b2fpojgaO/QHw==
Received: by mail-ed1-f70.google.com with SMTP id t13-20020a05640203cd00b00403cefbefe7so1062826edw.7
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qiMWFcACm7KXDNL4mR8VjkWhK+rixFnnFkcu11vXqgg=;
        b=4ojjH1O0OsSQVNcP1L2Y0Xy3K6SvapDFq8coSNsEBoZ/VBTaV3N11JjJY4dqk/MifN
         pg1E5tKrMh9I836aBtxNzfwmZ1rq8jh1ANv/g8VwbYXKPR1mz5O2pFABOFqJat8KA9hj
         iSVbCM5WfKC5dt10c/kFdscOMEd4UxwgvtVxfWiWaOZbP+VM3eB6fK46brRcR1qBEvwO
         5ZrzxdG3QWjI9VorDwLOcCs7g2gfuQK6SkVBADmmnXYhdSGXmV+oPBFKNv9NAXwIh1mY
         At0IbPfWg5EcGiWsEkgmZJiaIIlAi5jBeh72a/RBkk/N0G9V0l8bL44/yQ13Q+kYa+vO
         1mMQ==
X-Gm-Message-State: AOAM530+4OYtPG55+upfhoRi2zWxko9PLSORm6CRyjOTDQXH1i30kQqn
	vUexBaqgca/tFvugSHAy6MtZg4MnqzQx+aT1PZyK4O2hpj1GwzJTVtPvsSZEoHNrr5cIVg2WnyX
	2v6YNxfpGGW2mH9GHweYTa1g=
X-Received: by 2002:a05:6402:13d4:: with SMTP id a20mr24451511edx.233.1642531123690;
        Tue, 18 Jan 2022 10:38:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxooD5A0kIvNYe5f8A0rLWxL+hfWG//ldtWWszWaLLfWPoEYsl9gzRPsANc68kPgrb0WUfY1w==
X-Received: by 2002:a05:6402:13d4:: with SMTP id a20mr24451497edx.233.1642531123570;
        Tue, 18 Jan 2022 10:38:43 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f5sm199260edu.38.2022.01.18.10.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:38:43 -0800 (PST)
Message-ID: <b165825c-a04f-d5bd-6bce-8725acdc461d@canonical.com>
Date: Tue, 18 Jan 2022 19:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: samsung: Add compatible
 for Tesla FSD SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150056epcas5p4825077a17b8c37b0e7cea60c4dced3c8@epcas5p4.samsung.com>
 <20220118144851.69537-12-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-12-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add compatible for Tesla Full Self-Driving SoC. The
> pinctrl hardware IP is similar to what found on most of the
> exynos series of SoC, so this new compatible is added in

s/exynos/Exynos/

> samsung pinctrl binding.

s/samsung/Samsung/

> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

It seems that I will take my dtschema patch (together with pinctrl
driver changes) after merge window, so this will have to be rebased on
new dtschema.

Best regards,
Krzysztof
