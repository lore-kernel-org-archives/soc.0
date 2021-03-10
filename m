Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5CAC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 15:07:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA3AE64F43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 15:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA3AE64F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VjRusOMHjsW3UdKEOdrBjb6qvjdd+S3lIPG11JBG4t4=; b=UOc0EnKA+wVW/l38hbUfKwW5h
	gBaSQn3fXdutV83Eag6mKywmnuD9BmtV/oi2vc92zpJIpbzrsD3UrNZYHlc/Y8Vrx1O1b8dJJuAbl
	dktJk14n3AtGgAYi0+YcrO0pEe2uVZlMGLww0rqQ2UQBeVGOaYD6V4Xc8sS/e5tUiX8xCht4D3dNF
	vj+JeRQyo+ZwcKIRPQhsI5Mc4Q8gZ/P59XGLB5Gl+zMGIrQseSFHKLV74ogpyL/IAoKKMr38ezbZv
	iZVa3HXywqxQcDL4kA8UySNOOP9X19TsB8YrHVEXZv1WHpCZKS2sjWD/70xfLbOL79DwbZeTnnhxC
	zzoC9UiCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK0Ow-0074rf-2U; Wed, 10 Mar 2021 15:05:30 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK0Os-0074rA-6A
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 15:05:28 +0000
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lK0Oq-0000KY-EB
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 15:05:24 +0000
Received: by mail-wr1-f70.google.com with SMTP id e29so8105231wra.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 07:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6O6+tOduwR48d8zZ29bwhvehUqmwn5KZAJpghN9/ZFw=;
 b=LGARVx7E296YonrbhstIE1+uDuFR6bgEFcnciIgoS2jpb7oJk0k4dFcsfQVIgCxW+H
 o/iqDdBbjHlDsAtZ09FeLg/ki6e7yJrdB76aBqg8cjoRWh65Vn7lXntwKhRfxXN7gkPp
 rvgIeq2loWQrVeW4sWUES9jn65OBLGsOvqUx6VbXUP/2HwgAzWckTA+rbs4gHQNglVFl
 Jj84r8jVyQoW+Hdga2eO88qMhja5G4yFwr7ZsOaHYueOxdz+ASwJSuQdgBJtmAv6mFjH
 zoLV8Ezzf7EWUqM2hOBIFNpZxuEjGDaTSr3cV833afASeyIkzrHmI6P6dtozjY1nux8W
 i19w==
X-Gm-Message-State: AOAM532+InbR3wBRvn8XxpwEjwBJDL3ddOD0VEtY1+oqym4gGlOtANoT
 g+Qz4+eMAswl+mCI8K4jwqY63CPd8mwbg0zikEl9OwshZMydIWq1mz+oyQLv3sdmy3/mW11Jz1g
 R0rOYi7xISvOUAgkO/iQ6rsnTnNsEt9R88iu6kqLVT+SUyqMoCV3B
X-Received: by 2002:adf:f303:: with SMTP id i3mr3936180wro.67.1615388721903;
 Wed, 10 Mar 2021 07:05:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGJJurjVb7EYp0bgYqxrECEX4ZhpKbOThOV2/LSr/fZ3VGeNkWRh86xSztb8QWNx4T9B9Jfg==
X-Received: by 2002:adf:f303:: with SMTP id i3mr3936156wro.67.1615388721715;
 Wed, 10 Mar 2021 07:05:21 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id c26sm32188982wrb.87.2021.03.10.07.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 07:05:21 -0800 (PST)
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
To: Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
Date: Wed, 10 Mar 2021 16:05:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_150526_441297_1DF8600F 
X-CRM114-Status: GOOD (  16.36  )
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
Message-ID: <20210310150520.iJ5SORW3RN3GRKMBac590a-mPNraGOewDWgXHUlca94@z>

On 10/03/2021 15:45, Tom Rix wrote:
> 
> On 3/10/21 1:45 AM, Lee Jones wrote:
>> On Wed, 10 Mar 2021, Krzysztof Kozlowski wrote:
>>
>>> Prepare for merging Stratix 10, Agilex and N5X into one arm64
>>> architecture by first renaming the ARCH_STRATIX10 into ARCH_SOCFPGA64.
>>>
>>> The existing ARCH_SOCFPGA (in ARMv7) Kconfig symbol cannot be used
>>> because altera_edac driver builds differently between them (with
>>> ifdefs).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>  arch/arm64/Kconfig.platforms                |  7 ++++---
>>>  arch/arm64/boot/dts/altera/Makefile         |  2 +-
>>>  arch/arm64/configs/defconfig                |  2 +-
>>>  drivers/clk/Makefile                        |  2 +-
>>>  drivers/clk/socfpga/Kconfig                 |  4 ++--
>>>  drivers/edac/Kconfig                        |  2 +-
>>>  drivers/edac/altera_edac.c                  | 10 +++++-----
>>>  drivers/firmware/Kconfig                    |  2 +-
>>>  drivers/fpga/Kconfig                        |  2 +-
>>>  drivers/mfd/Kconfig                         |  2 +-
>> If it's okay with everyone else, it'll be okay with me:
>>
>> Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> I think the name is too broad, from the description in the config
> 
> +	bool "Intel's SoCFPGA ARMv8 Families"
> 
> A better name would be ARCH_INTEL_SOCFPGA64
> 
> So other vendors like Xilinx could do their own thing.

Many other architectures do not have vendor prefix (TEGRA, EXYNOS,
ZYNQMP etc). I would call it the same as in ARMv7 - ARCH_SOCFPGA - but
the Altera EDAC driver depends on these symbols to be different.
Anyway, I don't mind using something else for the name.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
