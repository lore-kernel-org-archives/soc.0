Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA04C4338F
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Aug 2021 09:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F0BC61075
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Aug 2021 09:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237040AbhHTKAM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Aug 2021 06:00:12 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55496
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236384AbhHTKAL (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Aug 2021 06:00:11 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 217BD406E1
        for <devicetree@vger.kernel.org>; Fri, 20 Aug 2021 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629453573;
        bh=Fqy51fE3a7v2PPOBasZTqSafP+I/Fmi5vUbECyoP1RU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=W5MIa8UrnIUDd8Plaui7fVL7IumCmMXbbQkZQxv7U2Va5nBH2RETLdvRXS235NdTX
         0QAanCIgu6d9S626R08yui5P5dWcmHnbKFyxw8YKzQbRyqgicjCH0e1fBOksNSDWQv
         +j8Lw2b+rE0WHQLAf+8AvYwlAqrsF0VJHK2Al4mowfT2/0Nrstd/MZRwd/5VdfvQoz
         KLasXTgXQdCXus4FF95YSVrwKaywsWm2jMtkG4em5dfqNLTc98hmMt1OZgFxANrC2T
         E3odBM+q3tpP6xAQ63VsUJG8uQO5EUQSrBnLS6OyhEs8hOGidEOtC4WM6MRypu1row
         E+VOVDyf7p5MQ==
Received: by mail-ed1-f72.google.com with SMTP id l18-20020a0564021252b02903be7bdd65ccso4316803edw.12
        for <devicetree@vger.kernel.org>; Fri, 20 Aug 2021 02:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fqy51fE3a7v2PPOBasZTqSafP+I/Fmi5vUbECyoP1RU=;
        b=X74QdonwWdLQYZzoOpnoTVu5OitB/X73wwarTc5DCuVhVEd9dbomI5lO6DuLKT8D61
         Pw7uplUjYTXHkIsX0qCjBmbXa1jExnvsY2WFhw3JbHLaPt8sdkFr/NQ7Ki/QruAV5GFA
         b+hMnRN2gvC2y0i6l48WKSMCVJGhYLK2REbh6TEti06lS0rqyHeNx4O54nuFA1OTDJ5G
         S4tWbRN0cdCUqpb0c8KcKTIaglqhgOzOlDmtQROZMld/hnJ8lZ+LMoFAZfUKBxxdqg1h
         58OR5nxuyVZUfdlPexzkTotnOrOSVt34UQ4cyu8NKZDkf4ExyX5oBRKRZZfRQMv52kaq
         bheQ==
X-Gm-Message-State: AOAM533K8asiMTaJC3Tsi6vkZQx58jEMqvXljOH7r/xb2GIc2rc1Ua37
        wAsP0pAAs/jGf+n2IYL6LW3tZy6Lhca5hKB9Dy9iKv1jVKWD7Z+UNG+gNgjUj1LCUnemhjWeFNx
        1zJz9QIrI3y9yM31h1aD4/ItCFWrzs8E8UWGslr0=
X-Received: by 2002:a17:906:58c7:: with SMTP id e7mr20284614ejs.197.1629453572709;
        Fri, 20 Aug 2021 02:59:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPjV/AZrUJkSXfk40Y57L9b2qHiK+AgwjeB5DkLOx+R6Ax5Z6uW3MezFtxAx0FwwJ+LibmOQ==
X-Received: by 2002:a17:906:58c7:: with SMTP id e7mr20284605ejs.197.1629453572596;
        Fri, 20 Aug 2021 02:59:32 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id rp6sm1765649ejb.17.2021.08.20.02.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 02:59:32 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: synaptics: add DT for AS370-RDK
List-Id: <soc.lore.kernel.org>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
        Rob Herring <robh@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20210820173108.01d5c6de@xhacker.debian>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <29e96ece-8541-a7a2-c6a9-453be6644eed@canonical.com>
Date:   Fri, 20 Aug 2021 11:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820173108.01d5c6de@xhacker.debian>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20/08/2021 11:31, Jisheng Zhang wrote:
> Add a basic support for AS370-RDK board based on the AS370 SoC. We can
> get a basic shell on the uart console now.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
> Hi Arnd,
> 
> If it's too late, I will add it in a PR for 5.16 in next development window.
> 
> Thanks
> 
>  arch/arm64/boot/dts/synaptics/Makefile      |  1 +
>  arch/arm64/boot/dts/synaptics/as370-rdk.dts | 29 +++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/synaptics/as370-rdk.dts
> 
> diff --git a/arch/arm64/boot/dts/synaptics/Makefile b/arch/arm64/boot/dts/synaptics/Makefile
> index de71ddda6835..c1c4f6c040b3 100644
> --- a/arch/arm64/boot/dts/synaptics/Makefile
> +++ b/arch/arm64/boot/dts/synaptics/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Berlin SoC Family
> +dtb-$(CONFIG_ARCH_BERLIN) += as370-rdk.dtb
>  dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-dmp.dtb
>  dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-stb.dtb
> diff --git a/arch/arm64/boot/dts/synaptics/as370-rdk.dts b/arch/arm64/boot/dts/synaptics/as370-rdk.dts
> new file mode 100644
> index 000000000000..6f5c37c98be6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/as370-rdk.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2018-2021 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "as370.dtsi"
> +
> +/ {
> +	model = "Synaptics AS370 RDK";
> +	compatible = "syna,as370-rdk", "syna,as370";

There is no such binding. You need to update the bindings file (first
patch in the series).


Best regards,
Krzysztof
