Return-Path: <SRS0=Y/x0=33=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884EAC4332F
	for <soc@archiver.kernel.org>; Sun, 27 Nov 2022 21:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44D55C4347C; Sun, 27 Nov 2022 21:08:30 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E5EEC433C1
	for <soc@kernel.org>; Sun, 27 Nov 2022 21:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E5EEC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id a7so11069911ljq.12
        for <soc@kernel.org>; Sun, 27 Nov 2022 13:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQYm1e4H6Vkp4DL5/TiXL9Cz/h8OYYvPgZOczJW5nyM=;
        b=pT3HaFu9cU9HMEhxgVzzS7f3D9TufxB0wrRxVR4oPrjfGuYiUi+4/6mcpcOSse1eaC
         xoDxfgVwzFTuLBFGFgVZv2XHMra60/MOXFaLbuDLNubuzXIYXnhyCCsIwYq+zitwYm4D
         9OBny9/3h1bktFRE62+9yJi+xNIiobPcMz1UNYYE6bkrDEtkFKZXvlbeRlsIBRSSsihM
         Iyaa5YpfOCghq1RplmOmbPJJwJNcBdYMakWOv7V4MwrvcHpd224Spb1z8ZKnxRFFHZWr
         zA9PouRyFSSJtot2u+VbUAAZtoHjPCJ9+GPIfE9oKHr7UhHnlF0mS0Px8sFFuaf3VGlS
         Ivwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQYm1e4H6Vkp4DL5/TiXL9Cz/h8OYYvPgZOczJW5nyM=;
        b=mLU+ieX3lP+LK7jXxuQEBUdhwOv0IxuRsmUzJoqSbTolsmtgDgL9kwvUahn4VTTqGS
         Bkvrw5fpiJKz3X+9OOQTnr0Xk+a43Y1Xhv9nkxiVBfRJUxlwvaV31bn+hvTDhv7Cf+sN
         7/BPuUAifEA/u9XHn3PnSVC2jPbhq3XJdCBRcdsKmXQRn+DNXbwCZYrAKwz4vERYRhAy
         O0EP7wHHzx8WKwG4FpfwKHef6DR3A8ar4dwBe9YbdA0q6Bk7kkGcfu41DTVKNKBIJ1iE
         YJHbSVDSJ4AYa2BW0j1xi9oLP3Wz/DaJ6xQtCClncLaIFaCFGKhj00bbaJltougU86G5
         nj9w==
X-Gm-Message-State: ANoB5pnz2A5QhSmBXuEUUYx9UO+Oe/DsCUEST3cPScE1yf6GVHs4dZMp
	uGGinuUJJmxxJPmqkxMJof/vBQ==
X-Google-Smtp-Source: AA0mqf7t8v/MRSZQOjDsyj59nBL5nfeomU+AHen/BKd0CVSqEQo7q6UPSAw4lqfDnteG4CxMN5v1OA==
X-Received: by 2002:a2e:8e33:0:b0:277:1d5b:74b with SMTP id r19-20020a2e8e33000000b002771d5b074bmr9151666ljk.522.1669583307357;
        Sun, 27 Nov 2022 13:08:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b004979db5aa5bsm1414367lfr.223.2022.11.27.13.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:08:26 -0800 (PST)
Message-ID: <292eca02-e59a-88af-8823-f14440ffe592@linaro.org>
Date: Sun, 27 Nov 2022 22:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8974: Add OnePlus One
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Julian Goldsmith <julian@juliangoldsmith.com>,
 Oleg Chernovskiy <kanedias@keemail.me>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221127181835.806410-1-luca@z3ntu.xyz>
 <20221127181835.806410-2-luca@z3ntu.xyz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127181835.806410-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2022 19:18, Luca Weiss wrote:
> From: Julian Goldsmith <julian@juliangoldsmith.com>
> 
> OnePlus One is a smartphone launched in 2014 and is based on the
> Snapdragon 801 SoC (-AC variant).
> 

Thank you for your patch. There is something to discuss/improve.
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&gcc {
> +	compatible = "qcom,gcc-msm8974pro-ac";
> +};
> +
> +&otg {
> +	phys = <&usb_hs1_phy>;
> +	phy-select = <&tcsr 0xb000 0>;
> +	extcon = <&smbb>, <&usb_id>;
> +	vbus-supply = <&chg_otg>;
> +
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +
> +	status = "okay";
> +
> +	ulpi {
> +		phy@a {
> +			status = "okay";

Override by label (usb_hs1_phy). If the labels are named similarly, e.g.
usb_oth and usb_hs1_phy, then they will appear next to each other during
override/extend.

Best regards,
Krzysztof

