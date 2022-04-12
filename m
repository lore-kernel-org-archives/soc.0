Return-Path: <SRS0=+HBL=UW=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37E4C433EF
	for <soc@archiver.kernel.org>; Tue, 12 Apr 2022 11:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 918BCC385A5; Tue, 12 Apr 2022 11:56:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF04CC385A1
	for <soc@kernel.org>; Tue, 12 Apr 2022 11:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF04CC385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id t25so9369497edt.9
        for <soc@kernel.org>; Tue, 12 Apr 2022 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6vxAMFFRr0NPCcUM2OeYvzLThu9KnprPtO/7Wfh+zGw=;
        b=ptim7LvKUVHYzXsNFJJ5lOaaox1uNgxiKhyPHrCda1KZNkPqmpHSSM7S74nwKh0dvL
         q4cVJEO3EkbIGIxyLH0TfH+HhFu8S3eeUES7UGraptR5tLGLxg/ZBaIJjGjNy2yAQ411
         uWchf47F0ACHsaUCiCK25xpQ0DHeL5nvO42fGfhWpzKbtesbxetvVWBKFtMtK3QlbKBz
         oahU5jP207DqRKUf7G82xDiGfJykhP2Q4aHMc8q37r87gs0Rve8ahNDV/Q1036Usxs5a
         aSiovyNq2WTYnHCtFmwmQ/Gbql3e6KlXgej00MEIrsa75JJj9G4N7uo9tII/8ItCdq5y
         NlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6vxAMFFRr0NPCcUM2OeYvzLThu9KnprPtO/7Wfh+zGw=;
        b=XBSvChoNX2ZuknYdZh+o1PWJYtBI1EX7MSNfJ7YRd1PVDranOgmwJd3Z8zG4Lg0SM3
         h4iW/QN5pXsdyyhXWjWBasAvhoInFIz5V0Stzp5OLHRx6Z8AUxsB14EyPFKPCv2TNAco
         wfiw88erY4oZghC7pX5apIi4DB/zXNxdtV7obNWMyf78lSiSdjULBxer62nrHbN2A7Wi
         2xdaHngRlDhMy96kogbGR3SSV9KfHsTktHVCNx79VRAK2+cxi5Hl56ZcH1Gwc0StvqRe
         y+pkAKvS6DxmkCcvxDl02SyyV6mSBZoQpju2Hx60XpF3pJdv1rFydU9XaDSfUs7DvhGZ
         N6xg==
X-Gm-Message-State: AOAM531RytkHJTPfcR8Z5+Ypc4ZAfItr4zfdY6NXhhQXUYAMOxlBVx0Q
	+g9aM7PatZUMdGp//v9bO8DqtQ==
X-Google-Smtp-Source: ABdhPJy/oRgec0WQTvkI71j0XXmhBfTd5Z+XNoP8pK290bttfxckXJziNbgyTb89bNmiFkhIQYDrxA==
X-Received: by 2002:aa7:c790:0:b0:41d:7e0f:f15c with SMTP id n16-20020aa7c790000000b0041d7e0ff15cmr9193914eds.129.1649764603156;
        Tue, 12 Apr 2022 04:56:43 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c11-20020a056402120b00b004196059efd1sm17152944edw.75.2022.04.12.04.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:56:42 -0700 (PDT)
Message-ID: <a8d09ab7-7e5d-2166-13b4-621259bc46d6@linaro.org>
Date: Tue, 12 Apr 2022 13:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2 v2] ARM: dts: Add initial LS1021A IoT board dts
 support
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Changming Huang <jerry.huang@nxp.com>, robh+dt@kernel.org,
 krzk+dt@kernel.org, shawnguo@kernel.org, festevam@gmail.com,
 l.stach@pengutronix.de, alexander.stein@ew.tq-group.com,
 marcel.ziswiler@toradex.com, tharvey@gateworks.com, linux@rempel-privat.de,
 matthias.schiffer@ew.tq-group.com, cniedermaier@dh-electronics.com,
 sebastian.reichel@collabora.com, leoyang.li@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org
Cc: Alison Wang <alison.wang@nxp.com>
References: <20220411090828.1965450-1-jerry.huang@nxp.com>
 <20220411090828.1965450-2-jerry.huang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411090828.1965450-2-jerry.huang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2022 11:08, Changming Huang wrote:
> The LS1021A-IoT gateway reference design is a purpose-built,
> small footprint hardware platform equipped with a wide array
> of both high-speed connectivity and low speed serial interfaces.

Thank you for your patch. There is something to discuss/improve.

> +
> +&enet2 {
> +	fixed-link = <0 1 1000 0 0>;
> +	phy-connection-type = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&esdhc{
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	gpio: pca9555@23 {

Here and in all other places - generic node name, please. For example
pca9555 is "gpio"

> +		compatible = "nxp,pca9555";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		reg = <0x23>;

Please put "reg" after compatible, everywhere.

> +	};
> +
> +	codec: sgtl5000@2a {

Ditto...

> +		#sound-dai-cells=<0x0>;
> +		compatible = "fsl,sgtl5000";
> +		reg = <0x2a>;
> +		VDDA-supply = <&reg_3p3v>;
> +		VDDIO-supply = <&reg_2p5v>;
> +		clocks = <&sys_mclk 1>;
> +	};
> +
> +	adc: max1239@35 {

and so on.


Best regards,
Krzysztof
