Return-Path: <SRS0=Ya1c=SY=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD0BC433F5
	for <soc@archiver.kernel.org>; Wed,  9 Feb 2022 06:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A785C340F0; Wed,  9 Feb 2022 06:45:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFAA5C340ED
	for <soc@kernel.org>; Wed,  9 Feb 2022 06:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EFAA5C340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id x3so1417302pll.3
        for <soc@kernel.org>; Tue, 08 Feb 2022 22:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PVC8kg0m66z8nLsg7hxOAh4ZCaPmayhqQ5QiMYyZWlY=;
        b=hjkkB+DreNhYS/KptENJnaOeZzsf3zoLA17g1PzKwanvPvmLRz1rw2vIXm7TxU7Wls
         vmIPPMUYaLfI32C6XPq8PayQJN2jHoZTxlY2sA+WhqLxpB+WrlLJVb8+xuT5u3MeKJLu
         KT2rsVd5+bTcEY3UkL6L4/cD8Sdl0REnZW61J6IjgpohUtEYNdebpBTsf6tc81kEwJ91
         5jab9fomYIxnmIO56L7GOmg3B50apOtkutQKT/q/DLSktmso+CzWODSvgSIqnGW0kvgO
         Wccps8E7E9MnGF0zeqqNIY2gqkba3d3OBIbxyVg68G3xIeBzv0LNvqc8+1NhQcphvsSW
         +6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PVC8kg0m66z8nLsg7hxOAh4ZCaPmayhqQ5QiMYyZWlY=;
        b=HOg2e3lyukp9xmIJZtCr/AyzmCJiG44Zfty1P2Xp0nJL5f7ysPHMXaoFFZoxnMGSRX
         MSLDvme+z4PxtEmCzxzZEHDpHpm32j+2g6pmdZ9ng+UE3CYzBmTGyh/2oFc1lKsFRu0q
         iYWJOCusmeRsOqSbtW7S5YxUIr9EaM31cOAfmzT8gZchvpXkn46L/f3If4zLilJX3Ar6
         Wly3dcKMvc/ngF9JwN/CT/OcpnP90NHc2Ws6txpDMOGmqKI1XvbE5dG2y0WZmFHwken/
         NgGrwKR8iD+YNpXGIl/9nt8DLITGuYM/iNx6eMi5En79dF5egOvpQv9DzIGsfskgaYgN
         Ra8w==
X-Gm-Message-State: AOAM533cCbIwPludIibk2MP1zvahJFeCBjEsdsJ7F6jV+OnmWY+LdhDC
	PuYUgeDBPBOQS9On/0OFY6RZFA==
X-Google-Smtp-Source: ABdhPJyTnEiwKB7qSkQcVoYjamO3CNRQCXq2vkRCtMNivvsSE2h44qEyShyFtpctl+7fuDFYlQgCrA==
X-Received: by 2002:a17:902:b90a:: with SMTP id bf10mr847320plb.36.1644389119024;
        Tue, 08 Feb 2022 22:45:19 -0800 (PST)
Received: from localhost ([136.185.132.167])
        by smtp.gmail.com with ESMTPSA id g5sm13345929pgc.51.2022.02.08.22.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 22:45:18 -0800 (PST)
Date: Wed, 9 Feb 2022 12:15:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: spear320: Drop unused and undocumented
 'irq-over-gpio' property
Message-ID: <20220209064516.qxj7yd7r7dvz5zbz@vireshk-i7>
References: <20220204004117.1232902-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204004117.1232902-1-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52

On 03-02-22, 18:41, Rob Herring wrote:
> The property 'irq-over-gpio' is both unused and undocumented. It also
> happens to collide with standard *-gpio properties. As it is not needed,
> drop it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/spear320-hmi.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
> index 367ba48aac3e..b587e4ec11e5 100644
> --- a/arch/arm/boot/dts/spear320-hmi.dts
> +++ b/arch/arm/boot/dts/spear320-hmi.dts
> @@ -235,7 +235,6 @@ stmpe811@41 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  					reg = <0x41>;
> -					irq-over-gpio;
>  					irq-gpios = <&gpiopinctrl 29 0x4>;
>  					id = <0>;
>  					blocks = <0x5>;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
