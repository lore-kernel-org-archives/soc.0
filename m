Return-Path: <SRS0=yjTQ=6X=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52423C64ED8
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 04:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 161A7C4339C; Mon, 27 Feb 2023 04:28:15 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D4D2C433D2
	for <soc@kernel.org>; Mon, 27 Feb 2023 04:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D4D2C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id q189so2774427pga.9
        for <soc@kernel.org>; Sun, 26 Feb 2023 20:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMvkWjZNPPFl1pl6IaXhWMOFP4oUQ7mx0SfykEhX4AQ=;
        b=a8nxOFzJthk2KULRQ7fJuTH1ykL4dpMUTRb8Yi8d+6LJ5GcWR7OB4odOLdot4sqkKj
         5JfbokevLgJZdOes29MK9qUlhRhuZlmLygzbMbqmnKohfPfQi+rVMiglPcpiDAbHaMwV
         opICb88ttD10bHt8A+nX51ok/xtztTqUyfZly2soKwIsHS4JF0gNz+7w23S/ACXwuKwx
         CgZsiWNwKHOh6rcZ/uIoQsvBy2PpP+AiNp9hHPLX9Ib4gMRJKfz2u7xbdTNJiS7+kU75
         vq0dCTsJ2ItUQRzaa1J+i1mxtZ+DTLflpfuTszmRcHRbkKvgl8FDRvAH+1xzWQ1xaZ5o
         Qo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMvkWjZNPPFl1pl6IaXhWMOFP4oUQ7mx0SfykEhX4AQ=;
        b=UOEZYV8d5YWE/p4xJGhCcgQ0ro0P1Qn4XmI6k9v+2raXfiLCiLG3Ci1sWPsBBR47sx
         Y50qXw5kX5h4kqAaooDtKl0goQPP2eNqn6gd///HoOUliQ2+VUe/7qr3pYWuwu8obTNy
         KVqt/ccxIxTvg2Vv2Y9diGMFtdF45WK6ctX0Vmd/Q1QojQcS6mw+H6Sp4ESg14StJoce
         VmYUGE9i1eFlQ6ZXWVN+bJEnjp7rX/51iQp9tjCXW2Luhxn1VUtBk8il0jX0oOYq/Tgb
         vFOLrp/pj+rnnPk+WDaZztXX2GL480nm4PMgYo/HtTVoILW1+N03J/h+mtaMwQbB58vt
         Zqgg==
X-Gm-Message-State: AO0yUKXOQ5ZHErxJMq85dNfMCVY4c5eD8IkPYpnn4ae0dbEnrE3ov7vJ
	TPotF6aEBcdEqMDrAEXoW2sJHA==
X-Google-Smtp-Source: AK7set9GRzJ36aXs3VcwXq4IrdwM9TW62o8bs1MKgJLWEB7nYBiBcYlTgsuE9nvQM1DXtJiAr6coZQ==
X-Received: by 2002:aa7:9eda:0:b0:5a8:5e6d:28d7 with SMTP id r26-20020aa79eda000000b005a85e6d28d7mr18966817pfq.0.1677472093500;
        Sun, 26 Feb 2023 20:28:13 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id h26-20020aa786da000000b005e4c3e2022fsm3178721pfo.72.2023.02.26.20.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 20:28:12 -0800 (PST)
Date: Mon, 27 Feb 2023 09:58:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH] ARM: dts: spear320-hmi: correct STMPE GPIO compatible
Message-ID: <20230227042810.vki4khjrusnf2r4b@vireshk-i7>
References: <20230225162237.40242-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225162237.40242-1-krzysztof.kozlowski@linaro.org>

On 25-02-23, 17:22, Krzysztof Kozlowski wrote:
> The compatible is st,stmpe-gpio.
> 
> Fixes: e2eb69183ec4 ("ARM: SPEAr320: DT: Add SPEAr 320 HMI board support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/spear320-hmi.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
> index 34503ac9c51c..721e5ee7b680 100644
> --- a/arch/arm/boot/dts/spear320-hmi.dts
> +++ b/arch/arm/boot/dts/spear320-hmi.dts
> @@ -241,7 +241,7 @@ stmpe811@41 {
>  					irq-trigger = <0x1>;
>  
>  					stmpegpio: stmpe-gpio {
> -						compatible = "stmpe,gpio";
> +						compatible = "st,stmpe-gpio";
>  						reg = <0>;
>  						gpio-controller;
>  						#gpio-cells = <2>;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
