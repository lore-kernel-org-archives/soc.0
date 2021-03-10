Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767CEC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 15:55:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C1A464EE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 15:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C1A464EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7MD21RmQPmVGRtUsY5VMHEFoIpsqwGw6Onk+aVW0pjk=; b=OhgebIWgSBtwfuJOePS4VriC5
	Fx2GyhW2f8X8NrezyEff9B3gr+pqGWx3NczlAcsjY3XW6Epv4fH9L4j26rVz+WfeUa0+bhwVnQSk9
	jT8AV6zCHjBnx+e4Rn/rmBW2Saicxie56OPjX9+SvioAL8dGS0+TKHTXQBih37rGF9UQEX8b8EuN8
	4K+yhuosKMnoKb5dqUwZ8d53jlkA8fIYKQOJK02IEeI9+eqzEAdNx1vWb/8pRMSz8hCsVNC078Np1
	1F9h0GHFSLDgnArB4ujSlodyBpVWlq4uPi/kDcOb5lQtPgh8JTJCFPrJ1RGOdFJVWN+JQlQKlFPAQ
	v3ckgnpMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK1AI-0079bP-JI; Wed, 10 Mar 2021 15:54:26 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK1AE-0079b5-9x
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 15:54:24 +0000
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lK1AD-0004nO-Cs
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 15:54:21 +0000
Received: by mail-wm1-f72.google.com with SMTP id m17so1216624wml.3
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 07:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=14FPz1l6aS2SCug92QhFgOtMYZ2KTboq6wLTNYV4gRU=;
 b=BQ0V1rYnWX/e/LTMeVPJS3p83qC3wgzlQkwL/BsESMALwgfz+IHt3H8UrIj6RfLQFO
 2ys1hc0xpY6fhhco+WL6AChyb+jmPhmHkaa06g3y7BfvEKykg4f4ngILHpXq5tp3OAWd
 ASjqbVY4MhrcMOpLV4S7GpSR+r7fQhnAp8ukFgc8PTIc5cfvd0p2+FmlIGJjNJIe8XpR
 ii6zISB+Anj2mEIHT3VQ4I15EYcd+XzGj9KkyL7WbbFNmu5p1WZn6NxY/vOf9OikR3AN
 iBn1sKxh723OidCHJvcXG++QW70vWxxRmSvR5C9/cQj002CBFIj9WqfuzIAyLep6DtaY
 +sag==
X-Gm-Message-State: AOAM530+GL7v9LFIsRRM3RT5kdN9T39GrZJR/HTsrO/YPjMiNj8qAthd
 4LOhZOymJ+Ea44QY6V0qdH1z9VxaATIkMRDWanycRMAv1wSq46GAlsWwHHn5m3o+UA8pGu63FjQ
 WoAleP8OuDEJJuIQCi5qNDlDjz9NjfLND4La8xDYM1Ydstdv0TmAq
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr4060597wmc.9.1615391660978;
 Wed, 10 Mar 2021 07:54:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYVlIoIwJAU38MnjUazA5nQqK16xaytYspMDuXR9nuYZruHOq/jCZGaK71U4tP9AymiD6NlQ==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr4060585wmc.9.1615391660799;
 Wed, 10 Mar 2021 07:54:20 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id n4sm9584462wmq.40.2021.03.10.07.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 07:54:20 -0800 (PST)
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Message-ID: <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
Date: Wed, 10 Mar 2021 16:54:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_155422_500287_81051FE3 
X-CRM114-Status: GOOD (  27.43  )
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
Message-ID: <20210310155419.pfKhhO3OKm_ATYzWQh2m3Lenci7i2OK9NzjCLC32ZXE@z>

On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
> On 10/03/2021 16:39, Arnd Bergmann wrote:
>> On Wed, Mar 10, 2021 at 4:06 PM Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>> On 10/03/2021 15:45, Tom Rix wrote:
>>>> On 3/10/21 1:45 AM, Lee Jones wrote:
>>>
>>> Many other architectures do not have vendor prefix (TEGRA, EXYNOS,
>>> ZYNQMP etc). I would call it the same as in ARMv7 - ARCH_SOCFPGA - but
>>> the Altera EDAC driver depends on these symbols to be different.
>>> Anyway, I don't mind using something else for the name.
>>
>> I agree the name SOCFPGA is confusing, since it is really a class of
>> device that is made by multiple manufacturers rather than a brand name,
>> but renaming that now would be equally confusing. If the Intel folks
>> could suggest a better name that describes all products in the platform
>> and is less ambiguous, we could rename it to that. I think ARCH_ALTERA
>> would make sense, but I don't know if that is a name that is getting
>> phased out. (We once renamed the Marvell Orion platform to ARCH_MVEBU,
>> but shortly afterwards, Marvell renamed their embedded business unit (EBU)
>> and the name has no longer made sense since).
> 
> I wait then for some ideas from Dinh (or anyone else).
> 
>>
>> Regardless of what name we end up with, I do think we should have the
>> same name for 32-bit and 64-bit and instead fix the edac driver to do
>> runtime detection based on the compatible string.
> 
> I can rename ARCH_SOCFPGA on 32-bit ARM as well, however converting edac
> driver from #ifdef ARCH_SOCFPGA64 to proper compatible string will be
> too much for me: I am not able to test it.
> 
> This edac Altera driver is very weird... it uses the same compatible
> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
> have two. It's quite a new code (2019 from Intel), not some ancient
> legacy, so it should never have been accepted...

Oh, it's not that horrible as it sounds. They actually have different
compatibles for edac driver with these differences (e.g. in interrupts).
They just do not use them and instead check for the basic (common?)
compatible and architecture... Anyway without testing I am not the
person to fix the edac driver.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
