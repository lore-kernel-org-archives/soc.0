Return-Path: <SRS0=pai9=2V=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF7BC4332F
	for <soc@archiver.kernel.org>; Thu, 20 Oct 2022 04:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D12B3C43470; Thu, 20 Oct 2022 04:36:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1090C433D6
	for <soc@kernel.org>; Thu, 20 Oct 2022 04:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1090C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id u6so1707832plq.12
        for <soc@kernel.org>; Wed, 19 Oct 2022 21:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hQl2xZYeQM+maPS5+wYcZN71xZnoLpUn4u2n9e80A1k=;
        b=VVCyCBne3egzpFuhrKEfIJkrp75Jz1ao+512Mq7obhK9H2gHLqxnb0fOSyHPyUCWPY
         H+pga1QGEb8LKqRW6F5bZ8oOGRgEPnHt3atLKn2x4swvheId21kGBqC7Xg3q8yaTPHfc
         M+mYcRu/ofWtNUyJvpeFFjquHqKNtAiXiQhfT2e5uTnjeyEzMVMMwuqcMp0F1exuspjV
         7gDs9b3vI/SbdTW44+/ZordSgddEgDQPAEPXaOH8R5dpTNFbDudY1EFC1vwaxxBZrQPL
         3N/LBQLk6Eil69yQ8IUTa3UkMzozOEpUA93eySIPuF8Lqbw/LnMx2aMykdMXiCfY5/0U
         nuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQl2xZYeQM+maPS5+wYcZN71xZnoLpUn4u2n9e80A1k=;
        b=kZm7m1hwO+9RWRXS72poOLFlWcabTKAEGdNko3EihaoBZ3BvpX7JqbQOjpJNz0tzb/
         npuHJaqc2gdgQfK4C1PNWrwD0o1urVPbGMSPahSWpXOothKuUM2k4w+lCAt0+UdDPvAM
         r4/2XGDkLS7hpyRaEe8gAqMXlAmzO+u2cmJ3Ry1wd9iP8oqMAX03abGi7P1LKVvlcP1V
         J92uN0aBSqMltcXRxsuPztVDTmeGyq/N/MM+ooFdqrEmcvtsi2Lb1agr4F+srKKG6tY9
         duiIb4HR+vgvy4xCLssQaxmdjM3KCredmGwQ1TefK4XDmtskYMOOv4+z84xFAjuduyhT
         F2pg==
X-Gm-Message-State: ACrzQf34IsU1hF8pnXzsurFkKhCtvHJVeRQKCx2s8axFix1Ra12jmb62
	JWbnaRYtiocaR3It6zs+fOcAqA==
X-Google-Smtp-Source: AMsMyM5zzjWfS/DI9BhJnlbWYlBt7rgwoFs02MxbqPnbIHLzHL2X4Z2CL+tsFOb7bIpWQg9BvHojZg==
X-Received: by 2002:a17:902:7b95:b0:178:ab50:76b5 with SMTP id w21-20020a1709027b9500b00178ab5076b5mr12139210pll.161.1666240594345;
        Wed, 19 Oct 2022 21:36:34 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id y2-20020a170902864200b001754cfb5e21sm11614884plt.96.2022.10.19.21.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 21:36:33 -0700 (PDT)
Date: Thu, 20 Oct 2022 10:06:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 5/6] arm: dts: spear600: Add ssp controller nodes
Message-ID: <20221020043632.cbofx5jvajhy4xba@vireshk-i7>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
 <20221019133208.319626-6-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019133208.319626-6-kory.maincent@bootlin.com>

On 19-10-22, 15:32, Köry Maincent wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> The SPEAr600 has three Synchronous serial port to enables synchronous
> serial communication with slave or master peripherals (SPI). Lets add these
> nodes to be able to use them.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  arch/arm/boot/dts/spear600.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
> index 9d5a04a46b14..6b67c0ceaed9 100644
> --- a/arch/arm/boot/dts/spear600.dtsi
> +++ b/arch/arm/boot/dts/spear600.dtsi
> @@ -207,6 +207,36 @@ adc: adc@d820b000 {
>  				interrupts = <6>;
>  				status = "disabled";
>  			};
> +
> +			ssp1: spi@d0100000 {
> +				compatible = "arm,pl022", "arm,primecell";
> +				reg = <0xd0100000 0x1000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupt-parent = <&vic0>;
> +				interrupts = <26>;
> +				status = "disabled";
> +			};
> +
> +			ssp2: spi@d0180000 {
> +				compatible = "arm,pl022", "arm,primecell";
> +				reg = <0xd0180000 0x1000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupt-parent = <&vic0>;
> +				interrupts = <27>;
> +				status = "disabled";
> +			};
> +
> +			ssp3: spi@d8180000 {
> +				compatible = "arm,pl022", "arm,primecell";
> +				reg = <0xd8180000 0x1000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupt-parent = <&vic1>;
> +				interrupts = <5>;
> +				status = "disabled";
> +			};
>  		};
>  	};
>  };

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
