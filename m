Return-Path: <SRS0=Tcyv=NL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B78C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Aug 2021 10:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DAE160EBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Aug 2021 10:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DAE160EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NiA1C7n7Nsb+Gl53K0O6vNd7zH60Q5Cruy8P2n0hm5c=; b=TKhdH9AnuJEV8eGRZ1e/eL0ZPk
	VGlDIouZ0mlKnjJzqPOCn1kOnBHGyoBLO/Ud7d2kvG5EHDGdEEVbHcxrDGJmFl4Uuhk5zdIVr2Flx
	d9z9nsbV4BmUoHhpBK3Yh9w7qIUZ7FzsP5uhh/qN6Yf8GQB+ac0sArChqICGpNwOpYbYMp3NecfO1
	xesbyLuBXaVw36DVUVnL5LnEHtZNgF7FZKXwUxBooN9FQ2KAvfuLKP3INWwOwt5Vx7CJCHXESMxe4
	A3laJ0H512bQxuOsOfxZ/yAE2ApKo0d7jFP7DNQX5BbmzKLcv+pQAi4Tkcfgcgf1P0uyN7NZdP9ON
	AcOp3DBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH1JU-00Absx-Nv; Fri, 20 Aug 2021 09:59:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH1JN-00AbqH-9Z
 for linux-arm-kernel@lists.infradead.org; Fri, 20 Aug 2021 09:59:45 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EFFC03F116
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 20 Aug 2021 09:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629453572;
 bh=Fqy51fE3a7v2PPOBasZTqSafP+I/Fmi5vUbECyoP1RU=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=D0pvCAK4i1pPlL7Z/HKAWvFZ1xykGgUoPjRm6bfVYlLCOz3lwzVpWbaInq6LWEXT8
 9Yw7nsPRb1a7OzU8XHW08I4DB2xZNFBUnJvJdNLKWawCh0PtfF5cf22Wh6PhN2C+z+
 dxK4f7275EcqN5dQmUomlG1thpqcHSHaItdsOOLn6PuNosj1jtusHjSeTC9WjbNLHS
 0AFlPvwVoDwbTXw9udZpMPzPEYzbA/bIH04AhoDzTRcjJATkP4aucHjESPJMSG/Bvr
 CtVEXF39V6kUU5ru7FzZ/bziDJi+RAVi242KZktwU1lB2mzM8VeLhXzzhCVQ/lNBe6
 plI6Y9mksJJow==
Received: by mail-ed1-f71.google.com with SMTP id
 dd25-20020a056402313900b003bed8169691so4315965edb.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 20 Aug 2021 02:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fqy51fE3a7v2PPOBasZTqSafP+I/Fmi5vUbECyoP1RU=;
 b=t79o//eZfCBumHbt50x2XNwDlhE9uXcgAGdt2c399/k7QvFklTSEAjd/mmzZcRiASZ
 K34ZQQ47g8A6BsD5QQY6O9jKqn6+i4YQO75il+d1BopGpC87VJtoCXuyNqNfl0Oi06vP
 x+ZJA2de40DxdlOCEnEoYWGeAe8QoiMNqjYrIhyHy2BoK2Dk7NCMDya1Qi/qMvdTsFNE
 Uv5g3NmXLHqVy04e9cjeODC4ltPPCSZqGu6X1RIhx5iZbv2vZ/xxNZDhPkomys8v0Ko5
 hjdcI7eOk9BI1Hvwnphb+LIZwsjpaDvLOrd6Mrk9IzuFnea+WjxShSvvO6HlkDnnzQLH
 tlng==
X-Gm-Message-State: AOAM532WSz2tDk6ZH03cJC0KK/2Kwbs+bU1sp9LnGF5XIr0iCU0rYLxz
 TJm6Ix0fiLTU/CpaLBO+uvk3snUvicEXILmyXr2hg0HhlsjvR+LX4vvMg+DPDoPR96YBLnawg8s
 DAuhGBKmO+5Ti3X/ZLVv8/9l+zWqBw7L6uTTTjk7b8OUDy9+3D5pA
X-Received: by 2002:a17:906:58c7:: with SMTP id
 e7mr20284615ejs.197.1629453572710; 
 Fri, 20 Aug 2021 02:59:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPjV/AZrUJkSXfk40Y57L9b2qHiK+AgwjeB5DkLOx+R6Ax5Z6uW3MezFtxAx0FwwJ+LibmOQ==
X-Received: by 2002:a17:906:58c7:: with SMTP id
 e7mr20284605ejs.197.1629453572596; 
 Fri, 20 Aug 2021 02:59:32 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id rp6sm1765649ejb.17.2021.08.20.02.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 02:59:32 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: synaptics: add DT for AS370-RDK
List-Id: <soc.lore.kernel.org>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, Rob Herring <robh@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20210820173108.01d5c6de@xhacker.debian>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <29e96ece-8541-a7a2-c6a9-453be6644eed@canonical.com>
Date: Fri, 20 Aug 2021 11:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820173108.01d5c6de@xhacker.debian>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_025941_505638_FF2024EE 
X-CRM114-Status: GOOD (  23.98  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210820095930.XD0_2M84uagbk3eJ2KQwVAU6pAez3pBoIf6_IZi3VFo@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
