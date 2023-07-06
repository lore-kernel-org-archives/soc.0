Return-Path: <SRS0=BsMw=CY=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CADDEB64D9
	for <soc@archiver.kernel.org>; Thu,  6 Jul 2023 04:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5479AC433CB; Thu,  6 Jul 2023 04:03:37 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6955BC433C8
	for <soc@kernel.org>; Thu,  6 Jul 2023 04:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6955BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6b74791c948so233939a34.3
        for <soc@kernel.org>; Wed, 05 Jul 2023 21:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688616215; x=1691208215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYnNIawbku4DKzQ1lg5ea0ay/M1V65V06UjetuXA9iA=;
        b=m0mCMyE1InXnqQ5cdii/3F7YbEoSK9lxA+z+DQdZTCfCx8cXChj8jRFysYNlLPMEAe
         EptgGsCkDLVwc4TzxOPyiJY0RfeO17V+Of1nSUEmvNq0zgf+8VEFmJVxIZuNjyQ8wtcP
         DZru+OMi/twpsdDVsIA/y1fSYVd0IJIYbi77ufYGez2Aj3f4lqGVrLsrBppNJFmEy0AQ
         3AQ2zZSaWxkkQhc2jhlgo9NRpxi2/0ljjvSbK1oY0yuwgj3qzZGtyRs9TXS2GHo3HdLn
         9E2J+F0p2vIrbu26KS4Mca5vOmuA8XX+F/HjF7XNyFoA5bWQrynh87gmX2sTdqRtGktl
         khUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688616215; x=1691208215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYnNIawbku4DKzQ1lg5ea0ay/M1V65V06UjetuXA9iA=;
        b=IOkwHE78NfDStcariW8VZMsFnCyYViwRWfORZPSPrTQysP3lfYpjRtgeSQo18a8/M6
         01dQ9Rjb8lEbN3FFAtWbEQXkHfrovvbd7L3AHhDS+bVXOBSXxpX8d/i/iKcSOrUbA0XP
         aaZAXlbWTUYdeAaEENfs6elNNiaoBAj2YMHNTBWxWSLlpnTp3P9B44ngW9+cqHWPA3jU
         4DdDbrvEpkj8e7oYTPbVkcQjwoSI0zIzVkz0KABOCEFnK4Xk1wvMPi7IrAouYEp1KTtT
         qOpCyTWWb2EuwLPuvfYws3ahDYN/8FQat8s1M78f+KTi3NByGm9X4KcyrXOlSm7CUawa
         cUBg==
X-Gm-Message-State: ABy/qLYSa2YxSXbvouohrfidZo5FaH4bGx++X6jTndXYd68gd3HnbD0x
	9okI77N8a4kZ+18FnLUEibt1yw==
X-Google-Smtp-Source: APBJJlEqmZLxNQQuzUk///fUNFmjd1X6nxiU+4HGt0ELa+ZA5RK91Tyw0++U5t+sxlKc/LKULTeoPg==
X-Received: by 2002:a05:6358:4196:b0:134:d122:b681 with SMTP id w22-20020a056358419600b00134d122b681mr580552rwc.20.1688616215142;
        Wed, 05 Jul 2023 21:03:35 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id fk25-20020a056a003a9900b0063f0068cf6csm263890pfb.198.2023.07.05.21.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 21:03:34 -0700 (PDT)
Date: Thu, 6 Jul 2023 09:33:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] ARM: dts: st: add missing space before {
Message-ID: <20230706040331.izqrdsq7wfrm6fqp@vireshk-i7>
References: <20230705150033.293832-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705150033.293832-1-krzysztof.kozlowski@linaro.org>

On 05-07-23, 17:00, Krzysztof Kozlowski wrote:
> Add missing whitespace between node name/label and opening {.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/st/spear1310.dtsi                    |  2 +-
>  arch/arm/boot/dts/st/spear1340.dtsi                    |  2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
