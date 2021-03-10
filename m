Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC10C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 15:49:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9A964E86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 15:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E9A964E86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=28ytipka6KXNJ/ow+hq+lzbFTbThxCi8k8erEuGlLoY=; b=PFJfmC0Sr68iKf0foQ1keYZIk
	NExed+BpGK4zXJ3tDmolGhttfolhkRhk1rqLwni80sL1OFJO71QN9yyzXwyEXFB3H6w1jHdQdSZ1X
	pwi1TaswTBmy1Ba2J1mk8bAWEQ8u8iUb8r+U594nXqyr1Xe7GdiJFKRtMCk0iHCRivABe7fT0Zo1f
	1eoes+ASdVq6El5XReyJO9ID0HUpDxb9edd2EAQjOnjtPENOJ7RWUkIjoDho/0Ayp5T/AbGsZoz5H
	wRVfe313hyp034qrDsfijfp1OpKAvf+Mx9Q78K0LuudHqsY9ji6EVllKjkY2OVMMWo71/fpwGrMA9
	kZh/ZTUHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK13r-00798N-Lg; Wed, 10 Mar 2021 15:47:47 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK13o-00797o-5n
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 15:47:45 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lK13n-0004Ib-54
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 15:47:43 +0000
Received: by mail-wr1-f71.google.com with SMTP id e13so8159823wrg.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 07:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yFz6dzZZeHtwfAjkcR+5KOfHHzaYWeftITQqDuozS6s=;
 b=XSiOt4jCEaarzVlUocVLo1WhNRsNtWrBA60yib/T8XeINpdXjDdsJ4aXqrrSsfcCqC
 IphWkKNmmDq1pWYjzQC3zabCI6zd0Rcw4kxKXMrrccr0oISs1tid2t7DnZ9DCoDlkZHm
 naTIPYRbHzaEevJF9ID+CB8eL6RQB5nG2i+ie7qMSmU684eOPGmQKjhgNU6dAgzEUdWH
 8o+Ba4uJAzqVeZH3aN4wGsFAPOZ7ZgvlAt61zQ+JPuOI89swvxgPNnRHfTtD+q6rIE5P
 BH5VyRfHZpirFfl7058hfj9ko8xTijwVJrRs4Kal1n+AO1vfVbHgmaOLXwwQmHPFo7hP
 Ko8A==
X-Gm-Message-State: AOAM530+G21HpuGUkdP1V+pEfWb8xsHu8pFlwvo0I4t1y78HiesMcshU
 1QBQ2+lTkwqlp2FBDLTqAPSkOkvUE9L1viQDLUJkg0GakItjzpPncWUiXWAkr0yDaAiQJEiRxFY
 ZSeJicaioijZfLLIbg/Lb+nlmgoNk29S3d2nBOHoXeAbpIX+1gXZT
X-Received: by 2002:a05:6000:245:: with SMTP id
 m5mr4302687wrz.284.1615391262920; 
 Wed, 10 Mar 2021 07:47:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOKdQu1Zo+KUna4pwaQZuaYLADylFjwZtUs6uPbYZncoy6CBJ+ZAg4yMoz8Ix7vWin+JBTOQ==
X-Received: by 2002:a05:6000:245:: with SMTP id
 m5mr4302666wrz.284.1615391262790; 
 Wed, 10 Mar 2021 07:47:42 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id n6sm30989558wrt.1.2021.03.10.07.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 07:47:42 -0800 (PST)
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
Date: Wed, 10 Mar 2021 16:47:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_154744_286196_9A726B33 
X-CRM114-Status: GOOD (  26.26  )
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
Message-ID: <20210310154741.XVDnW4gUzrwtIQJRzzSKiG5szm7XlcvCyLMZ2sJHI7c@z>

On 10/03/2021 16:39, Arnd Bergmann wrote:
> On Wed, Mar 10, 2021 at 4:06 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On 10/03/2021 15:45, Tom Rix wrote:
>>> On 3/10/21 1:45 AM, Lee Jones wrote:
>>
>> Many other architectures do not have vendor prefix (TEGRA, EXYNOS,
>> ZYNQMP etc). I would call it the same as in ARMv7 - ARCH_SOCFPGA - but
>> the Altera EDAC driver depends on these symbols to be different.
>> Anyway, I don't mind using something else for the name.
> 
> I agree the name SOCFPGA is confusing, since it is really a class of
> device that is made by multiple manufacturers rather than a brand name,
> but renaming that now would be equally confusing. If the Intel folks
> could suggest a better name that describes all products in the platform
> and is less ambiguous, we could rename it to that. I think ARCH_ALTERA
> would make sense, but I don't know if that is a name that is getting
> phased out. (We once renamed the Marvell Orion platform to ARCH_MVEBU,
> but shortly afterwards, Marvell renamed their embedded business unit (EBU)
> and the name has no longer made sense since).

I wait then for some ideas from Dinh (or anyone else).

> 
> Regardless of what name we end up with, I do think we should have the
> same name for 32-bit and 64-bit and instead fix the edac driver to do
> runtime detection based on the compatible string.

I can rename ARCH_SOCFPGA on 32-bit ARM as well, however converting edac
driver from #ifdef ARCH_SOCFPGA64 to proper compatible string will be
too much for me: I am not able to test it.

This edac Altera driver is very weird... it uses the same compatible
differently depending whether this is 32-bit or 64-bit (e.g. Stratix
10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
have two. It's quite a new code (2019 from Intel), not some ancient
legacy, so it should never have been accepted...

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
