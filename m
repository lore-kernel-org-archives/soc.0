Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81ABEC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 07:10:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E066365007
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 07:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E066365007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MMN8j6GhSG+CIKZ8R7PKb3sL5VBZ9RVdgbi0Qqz+Z8o=; b=X62gmhPkMWzHSVMaxho1Iz6dn
	qCOXd2lkpAd7XDgPBU4We11eVqsllcJZelD1Q+EycOl571MPS2si2PW2eETi/bclqdDmhtvIpbTJe
	+101KqTPR45DedQzdipgjtJq1R13epDHdnhXNl8xeg+7ZwD14z1IwJHtlm6c7+WO7QkGs+s4nwsRd
	tSOg/3z8oiZfI2lerUS4ReVKdNEPy1TBITlOV2d+TU9ZY28+JKHbQmyj+XfEt7aPL7LdpIX4lbbdR
	FkkZZs7969lyp+I+u3vYbOCaRd/fZZiZ0wkQzDh0QD2lLW8AY3rRbv8B3aa0mSc9uORTPAJRD2RQa
	K+yNm9hyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKFRI-008aE5-1t; Thu, 11 Mar 2021 07:08:56 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKFRD-008aD2-7R
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 07:08:53 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKFRC-0001hs-7J
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 07:08:50 +0000
Received: by mail-wr1-f71.google.com with SMTP id z17so9076879wrv.23
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 23:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zgH3nywQ4QyohOt2SMlSyPyC9OdZbO8xrqdRqBr6msM=;
 b=ryCdFsOc9Yu2XFmYxLbGKnNqCpX9EODbZ5gQaCxFn/unSKACiSERQu8Hhkw/UfH5Eh
 aR24tKCo84Cj9VG3XmeokrQwMwfa7mAtJicss3xhqNdwuMclxJ+IEzpMIp4Yn4L3xwB7
 D6I3As4XYA/hpG8SMnT26jkQCRzba8nEn35TUwhbth1v+5gGygdxiPQmBjb776/SDLlq
 awOHJFDF5vWbon5M0/MpprKKmU+r9cEC/9GyTqLLXJj43E1F0/mKu+b/W1jIiG3A+Pok
 0LrfkEwCRi5/TA26l++KhM8Dik+CfTepFTJS0/m8O28+2ujxU4m7o6k8RIDFDfKugcGn
 xZaA==
X-Gm-Message-State: AOAM533w9cbgHnhWlABkcAgTcFwu1m2S1akMWkkoU6IhXzN2M784mcdz
 Ob7pvXCRuYUbplPQojUcY77vk78VfLEDWsckaD9uyEL0H/Dktv5+ts9tM6uk7bA/Lg6yf0pPyQp
 6nrMn1qC4S4hTAOXvQC0Kf5VSD8pmA0pD9XiP+mhT7RgvDpn0rM+A
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr6850389wmc.65.1615446529670; 
 Wed, 10 Mar 2021 23:08:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFSUTjS1JFmjO0hMPLkEAzm/KPuXrtY7IKz/mXB9yfWR7YE3pRWw0tap7L6t6boQLro+3hFQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr6850370wmc.65.1615446529545; 
 Wed, 10 Mar 2021 23:08:49 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id a6sm2515137wmm.0.2021.03.10.23.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 23:08:49 -0800 (PST)
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
 Networking <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
 <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
 <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
 <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
Date: Thu, 11 Mar 2021 08:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_070851_325083_C4932DDC 
X-CRM114-Status: GOOD (  19.96  )
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
Message-ID: <20210311070847._6eFbhnY_VNtaUhWIvB0AwLm7Zwu3yncn7hSh2sSZVg@z>

On 10/03/2021 17:42, Arnd Bergmann wrote:
> On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
>>> This edac Altera driver is very weird... it uses the same compatible
>>> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
>>> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
>>> have two. It's quite a new code (2019 from Intel), not some ancient
>>> legacy, so it should never have been accepted...
>>
>> Oh, it's not that horrible as it sounds. They actually have different
>> compatibles for edac driver with these differences (e.g. in interrupts).
>> They just do not use them and instead check for the basic (common?)
>> compatible and architecture... Anyway without testing I am not the
>> person to fix the edac driver.
> 
> Ok, This should be fixed properly as you describe, but as a quick hack
> it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
> instead of CONFIG_ARCH_STRATIX10 during the rename of the config
> symbol.

This would work. The trouble with renaming ARCH_SOCFPGA into
ARCH_INTEL_SOCFPGA is that still SOCFPGA will appear in many other
Kconfig symbols or even directory paths.

Let me use ARCH_INTEL_SOCFPGA for 64bit here and renaming of 32bit a
little bit later.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
