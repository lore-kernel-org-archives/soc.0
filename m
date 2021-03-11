Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66A4C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 14:52:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0CD64F3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 14:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0CD64F3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=grWBM1hIF2mEdsmqyvAjtHoBKiujGMf8n9qGXzxX+xA=; b=MNWaUsmrTa9qDpQP4Rvzl5UGZ
	cjhfTVRxMDBABhmDxOVlkWnZ2HHCaYgfIWjSOU2Vao1mNOpeyw06CgfmwvVsqBhquf0uBsAEloBXg
	StDN5xUrKTFAHhmLrQhcQS4AaEF7iaNE7U/dvQdbtZpgltPTEqqNoQmqZ57PAbod0HLYA9cY4NBuS
	VHd9xQHfmxqBYookG1JtRbEkdjshR2oFGhwgqSABvOfIQRhqOCJ/Qd3V0iU26A7wio26j9ETLdyM4
	PVD/ADTsrYH6DWAQk8TIH9n2deSKC78jJYpCn/Gs71+D0/bhJSMXswzpQj1S1ux9rGZf8PGRjDGJZ
	fjFv6GjkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKMeD-009N04-PE; Thu, 11 Mar 2021 14:50:45 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKMe6-009MyL-14
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 14:50:42 +0000
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKMe5-0001Wr-0P
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 14:50:37 +0000
Received: by mail-wm1-f71.google.com with SMTP id n22so1609739wmo.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 06:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uKAiLuqa2i9OZl7ygZkPLgKIbolSbL3Tro2Nub/Uk4Y=;
 b=pY+MRFzp9OT9lJNIN0RsHacq4olW5ru4nC4VwtsNRmPp+XvrSs5von5shU//VVzbJt
 5NGirpfgXklThtKMrFnpwok5FK9ZmKTKazQQbOgEulqB+01uVUDvi8Dh1EYD347LAjpt
 neo5I2/pJxd3IIM8lzHEdEneDzQOD5cjNC6823h3zAhvMxSxAx3C52lGOzgJ8RZasv8m
 br1H9GSQ539yZsw2PlFNpmSLTIojFqwE/ejpwkbECphSaWeeDzQusqZXtRZhEASJewRp
 /l24tx90idCWuDfUO0VeGuN+PFSE+fGyS4+UzfevgRUoQCFEjfdUi3WgVsSI0C1FPdNY
 gCeQ==
X-Gm-Message-State: AOAM533WzcfSqZNPTdtz/cetZqACWrbJoU6iI7trtScNb89vEGmUwzJL
 s+DMyy50XFV0BXZGLIoIYyO6DOpyFrgPXukOs1nvBa0vc07fwjLOxMav5hc3KV+1pAO4wGXBjct
 hBeS8WB9hSaY+kAAAbujrLAqldbES8gEKfZSh9jJYnk91EWGgaqSF
X-Received: by 2002:adf:f852:: with SMTP id d18mr9342163wrq.210.1615474236737; 
 Thu, 11 Mar 2021 06:50:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyesJMeh5P/4D8iW/copAeKCALuE0/kYNU8cA4lvJq7myQHewdqjAfZPd2tqbyUu+ezagHw4g==
X-Received: by 2002:adf:f852:: with SMTP id d18mr9342138wrq.210.1615474236553; 
 Thu, 11 Mar 2021 06:50:36 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id 4sm4433053wma.0.2021.03.11.06.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 06:50:36 -0800 (PST)
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
 <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
 <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <30ba7549-c60d-4ee9-3502-b863bca8d3a7@canonical.com>
Date: Thu, 11 Mar 2021 15:50:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a05VkttECKTgonxKCSjJR0W4V1TRrUYMydgUGywbCSCWQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_145038_177085_D6BAAAA8 
X-CRM114-Status: GOOD (  21.47  )
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
Message-ID: <20210311145035.u6aL5LAhYcwe2SKF064eEkbi6T63udhVqeG7_zbI6fw@z>

On 11/03/2021 10:14, Arnd Bergmann wrote:
> On Thu, Mar 11, 2021 at 8:08 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On 10/03/2021 17:42, Arnd Bergmann wrote:
>>> On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
>>>>> This edac Altera driver is very weird... it uses the same compatible
>>>>> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
>>>>> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
>>>>> have two. It's quite a new code (2019 from Intel), not some ancient
>>>>> legacy, so it should never have been accepted...
>>>>
>>>> Oh, it's not that horrible as it sounds. They actually have different
>>>> compatibles for edac driver with these differences (e.g. in interrupts).
>>>> They just do not use them and instead check for the basic (common?)
>>>> compatible and architecture... Anyway without testing I am not the
>>>> person to fix the edac driver.
>>>
>>> Ok, This should be fixed properly as you describe, but as a quick hack
>>> it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
>>> instead of CONFIG_ARCH_STRATIX10 during the rename of the config
>>> symbol.
>>
>> This would work. The trouble with renaming ARCH_SOCFPGA into
>> ARCH_INTEL_SOCFPGA is that still SOCFPGA will appear in many other
>> Kconfig symbols or even directory paths.
>>
>> Let me use ARCH_INTEL_SOCFPGA for 64bit here and renaming of 32bit a
>> little bit later.
> 
> Maybe you can introduce a hidden 'ARCH_INTEL_SOCFPGA' option first
> and select that from both the 32-bit and the 64-bit platforms in the first step.
> 
> That should decouple the cleanups, so you can change the drivers to
> (only) 'depends on ARCH_INTEL_SOCFPGA' before removing the other
> names.

Sure, let me try that. I have a v3 almost ready.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
