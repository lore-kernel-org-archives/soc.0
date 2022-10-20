Return-Path: <SRS0=pai9=2V=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4989EC433FE
	for <soc@archiver.kernel.org>; Thu, 20 Oct 2022 04:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3118BC433D6; Thu, 20 Oct 2022 04:35:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 875F6C433C1
	for <soc@kernel.org>; Thu, 20 Oct 2022 04:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 875F6C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f174.google.com with SMTP id f193so18202007pgc.0
        for <soc@kernel.org>; Wed, 19 Oct 2022 21:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vaTJwOuEg93iQQbdS+3fyrSbZ2F6gvnRoRGn3vEwwlc=;
        b=fXLmBLGDsn3B1lcmX2rR2fnv1LRU+O9Z+KLUZE5v0P4rE+VHfpNukHXhWNOsPICWI8
         cE3IUw79W3w8yjrc+G0PYZdUZ6G2ZxF03miAuDIzD3GUlTDyZcBL9/xhRFymof7pPulU
         YhmHORcwwHiczDf1HHypj8Bl8F/pQaYb+M4O0Ep+dd1SwIWvcEySoL1LFQ/npC4EDgKt
         S2B3c4QSUxF0Oc6zU+xrGZ0sACC1tPTY2WVb06qsIMrgIS486MWUeF0Gvzyax7ObtMc7
         lYQhp2JCfO0wAfqNfx0EtjFLAzR58ILRo6wnMzaCaV+2Gc23+oLE3V3/fxQwg6qutx24
         LYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vaTJwOuEg93iQQbdS+3fyrSbZ2F6gvnRoRGn3vEwwlc=;
        b=fd/xQnVVLvIPFWQ5NyVKorxXnEUlESs2O4WhQWR2k6erb+e3RXY8nuWAJ89YLLgJQC
         M7gzCu5nwlYeK8sCarqkpz+PuMCRDTDSRNQL3BqjazQo/OoVEpe3F8GYcxXY9icVy4DK
         0v7TI+w0VJo6wEKcbbeYYj7vZA08xtQ78FcgBqVN5Qe+dyG9HO3WMCXo15VPooyW6OHJ
         DLRgh0PgqC5/+1eC285j+/UH7+ecTXzC++OAPCHJYqWIadI7uV5UWxeli1NWvyf7esku
         3x/nX8YJaKL3DXtxMgA5zbdX5g9y92jeZRUzml1xPW8OIVhulAg0pZR+LqkI4Zh1iNXJ
         yeow==
X-Gm-Message-State: ACrzQf3eeTcuI6qLxlP+dtuYzcSWBIOLlOsED6PF4M7Lnm6SVFANSgGq
	xLWxTsgO89lM24EpUgBJ81dRZA==
X-Google-Smtp-Source: AMsMyM4lAKNM3kgTfz4JjX9/gfimDSCwGs+K08lNtqHYthW7vm65NZKtwJ65yFtOI0uccMwqOvzROw==
X-Received: by 2002:a62:164d:0:b0:562:bc4e:253 with SMTP id 74-20020a62164d000000b00562bc4e0253mr11752301pfw.26.1666240544915;
        Wed, 19 Oct 2022 21:35:44 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id e19-20020a170902ed9300b00173411a4385sm11623239plj.43.2022.10.19.21.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 21:35:23 -0700 (PDT)
Date: Thu, 20 Oct 2022 10:05:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Rajeev Kumar <rajeev-dlh.kumar@st.com>,
	Bhavna Yadav <bhavna.yadav@st.com>,
	Deepak Sikri <deepak.sikri@st.com>,
	Vijay Kumar Mishra <vijay.kumar@st.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vipin Kumar <vipin.kumar@st.com>,
	Vipul Kumar Samar <vipulkumar.samar@st.com>
Subject: Re: [PATCH 2/6] arm: dts: spear600: Fix clcd interrupt
Message-ID: <20221020043520.eitwswwxjlrso5jq@vireshk-i7>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
 <20221019133208.319626-3-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019133208.319626-3-kory.maincent@bootlin.com>

On 19-10-22, 15:32, Köry Maincent wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> Interrupt 12 of the Interrupt controller belongs to the SMI controller,
> the right one for the display controller is the interrupt 13.
> 
> Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  arch/arm/boot/dts/spear600.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
> index fd41243a0b2c..9d5a04a46b14 100644
> --- a/arch/arm/boot/dts/spear600.dtsi
> +++ b/arch/arm/boot/dts/spear600.dtsi
> @@ -47,7 +47,7 @@ clcd: clcd@fc200000 {
>  			compatible = "arm,pl110", "arm,primecell";
>  			reg = <0xfc200000 0x1000>;
>  			interrupt-parent = <&vic1>;
> -			interrupts = <12>;
> +			interrupts = <13>;
>  			status = "disabled";
>  		};

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
