Return-Path: <SRS0=zm63=VD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C08C433F5
	for <soc@archiver.kernel.org>; Mon, 25 Apr 2022 11:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91198C385AD; Mon, 25 Apr 2022 11:51:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5C33C385A7;
	Mon, 25 Apr 2022 11:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5C33C385A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id k2so15344wrd.5;
        Mon, 25 Apr 2022 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9EscMvNq76GeUom/FtzlsqDl8sdOCj3rZo00CWoiuwA=;
        b=F7CeinsqS7wotCIbiDe0PSdED/m/nEhij5VdSZwAPlpQo/wUAA6kvkSFvCh1Sj7DoG
         I+Y/7wtJdsRBk/txmwJv+E+Jmm+RvsNoCjLEWMfZ6zj7g4L1DW0nQMZlFOK+vH9eE3zq
         PJP4gOEJ5i2+IuFKrf6eIJZTX0yRiYqn7rfAjkQF58tv3+sA2KEIRxqACfhrn5gXjgc2
         k3zdEaAuqNa2jxuwV3XYiLwM97lJ50Y6uUEYvTs+v/RjlVbOxHs3ND35GqFby9PFQU9g
         qNUJJ7URS8t+02Dh+OAf2PxXIXKq/oNOlq+B29sD6fa37eTGVJTR9pDnIw+Cl1yXMVRd
         lbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9EscMvNq76GeUom/FtzlsqDl8sdOCj3rZo00CWoiuwA=;
        b=Kz5KBM951qmsO7NyXbCeTfrKgopxqDMekpARpS/SYT48yIFNnMqH+FbSJE7HOeHjoc
         CSNo+ReUdHLp/pyTXpfpo1oevIHeFygZfOfZus17uHkguyRzWv9l0h3B7scCdEKs4iXM
         uSpi6xLnMjbxPeBROcXfpB3XN5tLCO1pqeP2EJAgRhw1hVM4rnlRBoV4qrxz/fLAGQJo
         XRR0iN4hG2ydvFkGl8lQxZMRsaKZji5hGAm/VcmZdfg5e6TFYysu/TGQcnkTmXWAoQr3
         KJywGKSm6TV4Wp1lVkjO3W6G7Ibtzy2Bblc8tYUiGncYS7tudp+0ViLAArR0526IfV1U
         Lg1w==
X-Gm-Message-State: AOAM531JVDnAM/pL7cNNL0qYvgpp9d4aZOC+8j41WywCET/Ou8hK+7rQ
	ZE/WybSwgIvDaXk7efYusWWr6ypOLUQslQ==
X-Google-Smtp-Source: ABdhPJx5UVMEI7qk+X/GYHCw8s1oJwyJxDKu2qUGV9WU7GKqAoeY+izqW35kJFgowSEYipjDWNs+cA==
X-Received: by 2002:a5d:4a0a:0:b0:20a:c899:cb7b with SMTP id m10-20020a5d4a0a000000b0020ac899cb7bmr13446037wrq.618.1650887465776;
        Mon, 25 Apr 2022 04:51:05 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net. [188.85.180.35])
        by smtp.gmail.com with ESMTPSA id p125-20020a1c2983000000b0038e5ca446bcsm11573603wmp.5.2022.04.25.04.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 04:51:05 -0700 (PDT)
Message-ID: <20650a35-5392-43fa-8b70-902eea860d92@gmail.com>
Date: Mon, 25 Apr 2022 13:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 3/6] ARM: dts: add clock support for Airoha EN7523
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Felix Fietkau <nbd@nbd.name>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220314084409.84394-1-nbd@nbd.name>
 <20220314084409.84394-4-nbd@nbd.name>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220314084409.84394-4-nbd@nbd.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/03/2022 09:44, Felix Fietkau wrote:
> This driver only registers fixed rate clocks, since the clocks are fully
> initialized by the boot loader and should not be changed later, according
> to Airoha.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Applied, thanks!

> ---
>   arch/arm/boot/dts/en7523.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
> index 36597f587f46..2e705b87b6c1 100644
> --- a/arch/arm/boot/dts/en7523.dtsi
> +++ b/arch/arm/boot/dts/en7523.dtsi
> @@ -3,6 +3,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/en7523-clk.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -83,6 +84,13 @@ L2_0: l2-cache0 {
>   		};
>   	};
>   
> +	scu: system-controller@1fa20000 {
> +		compatible = "airoha,en7523-scu";
> +		reg = <0x1fa20000 0x400>,
> +		      <0x1fb00000 0x1000>;
> +		#clock-cells = <1>;
> +	};
> +
>   	gic: interrupt-controller@9000000 {
>   		compatible = "arm,gic-v3";
>   		interrupt-controller;
