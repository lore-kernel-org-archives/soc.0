Return-Path: <SRS0=M/Gu=QC=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286FAC433F5
	for <soc@archiver.kernel.org>; Mon, 15 Nov 2021 16:42:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E864F61ABD; Mon, 15 Nov 2021 16:42:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC2DE61AAD;
	Mon, 15 Nov 2021 16:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC2DE61AAD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso11086960wmr.4;
        Mon, 15 Nov 2021 08:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JuqPZpJkmVPxr1XEd2xmER6X+Ym/lgTGuP07ml9bU0g=;
        b=GJUKEGDKs7KpQ/B8MSIsEkzPmGD9HaDBMQ/7KfepUnjJ4QIuJ2U4i5lEKz2HLUwjIF
         49iPrAkz1V7h60hhJ0uSWSuS2utkMm1n8Tx7HrijpwI4oJwvYg5HcF7F/AGoDIv+hyPe
         XE9LDsTth53plL96TWa6QRbA63N0tJ0RIBsghoDuPprc9XYvGjCNi4qmckFaQvoW6+lF
         LQtGZWmW/xTfoKBXq3WVZ7DPptprQvRKQWYQnOApM8xZQ6H0SFyuA1DBokbdWvjZ8WDV
         713hzutv++iddTkcWPejXBCK2u4v7IECLNl9sTHyDpa/zlE1SbZbZjmUWgmmpwd6VUEt
         0Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JuqPZpJkmVPxr1XEd2xmER6X+Ym/lgTGuP07ml9bU0g=;
        b=2GCBwaRAqC70KvIH/+Bm+DAB9jLgMbs3Kcsyy2qYwMY/uqmH0vzeYIj95SYNbASfXY
         QxDO28eWZlRCBCXFmsDWel/3lKCUqjaPa6qyD1JKXOnEW1Rkf+IVZAb6LaEDC9d/Uf33
         +0biTLl34EQqazxgOJg2q/o1uZkLExec/1mcfccha1aF0X+bZffi7vSkfVAZK9tYUpNV
         jR2Q26nLHjzf1oIvv+F2Z18T3zgW/KO9utm3sIM16Wq3FQEQw3mTuyFAYGjhFygTffkw
         7iENMv4skNKclbWUFQ59KyBLPAyrTemiWGDo1rYl+mZIFyP7eKoBBRhjcYNWQDjmrnlR
         pquw==
X-Gm-Message-State: AOAM53211CajRMT2EXwi6qT6v/8+PBRTJRAAv/NIAy0JcyMq4YGzwlIE
	grMC9teq/32SgDoS482K8+0=
X-Google-Smtp-Source: ABdhPJwok9H8xlFto8+eTwjCwgKcKtmnfgk3TO4CGlesnBQIwE8v1bZMANd9k7yeOeUrVOnuk1RzJg==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr59313728wmj.55.1636994542287;
        Mon, 15 Nov 2021 08:42:22 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net. [188.86.219.160])
        by smtp.gmail.com with ESMTPSA id j11sm14944511wrt.3.2021.11.15.08.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 08:42:21 -0800 (PST)
Message-ID: <62e52ffc-09e5-6b83-540f-f6347fca7adf@gmail.com>
Date: Mon, 15 Nov 2021 17:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] arm: dts: mt6589: Add device tree for Fairphone 1
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211024084535.30959-1-luca@z3ntu.xyz>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211024084535.30959-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/10/2021 10:45, Luca Weiss wrote:
> Add rudimentary support for the Fairphone 1, based on MT6589 to boot to
> UART console.
> 
> The recently added SMP support needs to be disabled for this board as
> the kernel panics executing /init with it, even though the CPUs seem to
> start up fine - maybe a stability issue.
> 
> [    0.072010] smp: Bringing up secondary CPUs ...
> [    0.131888] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    0.191889] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> [    0.251890] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> [    0.251982] smp: Brought up 1 node, 4 CPUs
> [    0.254745] SMP: Total of 4 processors activated (7982.28 BogoMIPS).
> [    0.255582] CPU: All CPU(s) started in SVC mode.
> 
> [    0.472039] Run /init as init process
> [    0.473317] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Now part of v5.16-next/dts32

Thanks

> ---
>   arch/arm/boot/dts/Makefile                 |  1 +
>   arch/arm/boot/dts/mt6589-fairphone-fp1.dts | 30 ++++++++++++++++++++++
>   arch/arm/boot/dts/mt6589.dtsi              |  2 +-
>   3 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7e0934180724..24f402db2613 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1437,6 +1437,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
>   	mt2701-evb.dtb \
>   	mt6580-evbp1.dtb \
>   	mt6589-aquaris5.dtb \
> +	mt6589-fairphone-fp1.dtb \
>   	mt6592-evb.dtb \
>   	mt7623a-rfb-emmc.dtb \
>   	mt7623a-rfb-nand.dtb \
> diff --git a/arch/arm/boot/dts/mt6589-fairphone-fp1.dts b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> new file mode 100644
> index 000000000000..c952347981de
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
> + */
> +
> +/dts-v1/;
> +#include "mt6589.dtsi"
> +
> +/ {
> +	model = "Fairphone 1";
> +	compatible = "fairphone,fp1", "mediatek,mt6589";
> +
> +	chosen {
> +		stdout-path = &uart3;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +};
> +
> +&cpus {
> +	/* SMP is not stable on this board, makes the kernel panic */
> +	/delete-property/ enable-method;
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
> index 70df00a7bb26..c6babc8ad2ba 100644
> --- a/arch/arm/boot/dts/mt6589.dtsi
> +++ b/arch/arm/boot/dts/mt6589.dtsi
> @@ -14,7 +14,7 @@ / {
>   	compatible = "mediatek,mt6589";
>   	interrupt-parent = <&sysirq>;
>   
> -	cpus {
> +	cpus: cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		enable-method = "mediatek,mt6589-smp";
> 
