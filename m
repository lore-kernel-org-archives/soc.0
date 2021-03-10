Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88A4C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 14:47:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7769664EF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 14:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7769664EF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wKf39xr8IdEW0BY006mmG5Vel9ehiNCEuqkaJEXzoko=; b=RuRQM+dCBuyaT2Uu6IcDbR/G9
	fJ5PPonF8229vUWoZFKOAI/oUzR4Bi+Pe7zE21VY2RfZ1iJNVh4ZAGhQERUWr5eE8/VnQbwUxEUsQ
	8m46HcQuww2YkgMMUFbvnCHE0yZVh2zzX7hQhZq09nWgSEnjp0AYLDGswm+71XHwxZwbvZvb5wTrI
	PoXeppxuqbUsixsl4P48E2ZiZWv/g4LimiSAlsp9Z3ta09r9G6ql5vcFP6Y4xP3I8q0QulTkrodol
	1afz8nntdMaO045fWBwF4zsfChCHg06uASQ4USnMdedPOYPr7iC9nx+4hX8z3/iPifPFcQc8LDyyx
	sm7b3o/VA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK06D-0072rS-35; Wed, 10 Mar 2021 14:46:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK066-0072q9-18
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 14:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615387559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qe7vnreao5ThhJBhWOb2yAQo6akg/BiUCkUWjObNy9A=;
 b=jAQEJb0XW/eBEz+KnlZaNF1G8qQYLiWlKJ/yjS2yJC17t9GJJK8qIa7nWSijsQjMlR2Is1
 +HfoTiSWHZfMLWctwkjF/pOo33Jq7FuM1pCoCfYPY6Sk8uZv/dCygPi8mxgqI08ELaZSkY
 fa5vmZwVVK0TSi5I4GO9nK2Zl98tr78=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-hkrDcx8rOJ6pX9_PBhEYyw-1; Wed, 10 Mar 2021 09:45:55 -0500
X-MC-Unique: hkrDcx8rOJ6pX9_PBhEYyw-1
Received: by mail-qk1-f197.google.com with SMTP id h20so12907680qkj.18
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 06:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Qe7vnreao5ThhJBhWOb2yAQo6akg/BiUCkUWjObNy9A=;
 b=unCc7ufguI2KXo0CUaPXErxQdR916bCFEEteSXH7EGAO+Ilsw5tl4oKcboCQ7cYpcZ
 lU1rDmwpK6ZjRxx/yE/O2Mq26iTQMCsOo3O4/2Z81AF+AbWohrbTjfIlBWx4RvCt2N+A
 sfZF9fKIsLESlBALUoFwvt4bmSi8svLEh5ZRKbfVl1GSLPNnAme7qP6IOgGu6LHzsB/g
 q9RFd1XGoaG9F5t8S2asDujdGJM5UwaaDwsm8N23g8VzTddJ1CF7UbTRIkLKJVZ/LC5Q
 jy7ezBXuT7pwMnhLVAL+JNy0eieFdYy1Mnjn3oUxMqdjbqJyu2WCMotdxPO2g+Wak7ze
 1uLQ==
X-Gm-Message-State: AOAM531gEDa6tZbIUEmt3SXAC2NcMoLqa2r2JOIcK550je1706LWQDWB
 ze2ueYk5ke0Dw6h4iOy5QRakTWP+EOXohwHrwUSNqAw9OoW4LPdBMR9WOqzpV8fP/+QuzvQ6Hc6
 xgtWCNtXOKTsrT9HhIFyEZWztR+nbw/X4JRc=
X-Received: by 2002:a0c:8ec7:: with SMTP id y7mr3256302qvb.9.1615387555274;
 Wed, 10 Mar 2021 06:45:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlNoVM9BzWQNjpadCXVlfERPTQuROOGObYqvdAhHPCzlyHzhNVdnm6DSobOhCibwSlI7/4+g==
X-Received: by 2002:a0c:8ec7:: with SMTP id y7mr3256274qvb.9.1615387555052;
 Wed, 10 Mar 2021 06:45:55 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id d2sm12859520qkk.42.2021.03.10.06.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 06:45:54 -0800 (PST)
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
To: Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
From: Tom Rix <trix@redhat.com>
Message-ID: <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
Date: Wed, 10 Mar 2021 06:45:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310094527.GA701493@dell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_144602_219117_2BE0032F 
X-CRM114-Status: GOOD (  14.39  )
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
Message-ID: <20210310144550.1NqIn-r6hklDBT3Q9hcaicu4IRD4k5Z_JRAx9t0dQs0@z>


On 3/10/21 1:45 AM, Lee Jones wrote:
> On Wed, 10 Mar 2021, Krzysztof Kozlowski wrote:
>
>> Prepare for merging Stratix 10, Agilex and N5X into one arm64
>> architecture by first renaming the ARCH_STRATIX10 into ARCH_SOCFPGA64.
>>
>> The existing ARCH_SOCFPGA (in ARMv7) Kconfig symbol cannot be used
>> because altera_edac driver builds differently between them (with
>> ifdefs).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  arch/arm64/Kconfig.platforms                |  7 ++++---
>>  arch/arm64/boot/dts/altera/Makefile         |  2 +-
>>  arch/arm64/configs/defconfig                |  2 +-
>>  drivers/clk/Makefile                        |  2 +-
>>  drivers/clk/socfpga/Kconfig                 |  4 ++--
>>  drivers/edac/Kconfig                        |  2 +-
>>  drivers/edac/altera_edac.c                  | 10 +++++-----
>>  drivers/firmware/Kconfig                    |  2 +-
>>  drivers/fpga/Kconfig                        |  2 +-
>>  drivers/mfd/Kconfig                         |  2 +-
> If it's okay with everyone else, it'll be okay with me:
>
> Acked-by: Lee Jones <lee.jones@linaro.org>

I think the name is too broad, from the description in the config

+	bool "Intel's SoCFPGA ARMv8 Families"

A better name would be ARCH_INTEL_SOCFPGA64

So other vendors like Xilinx could do their own thing.

Tom

>
>>  drivers/net/ethernet/stmicro/stmmac/Kconfig |  4 ++--
>>  drivers/reset/Kconfig                       |  2 +-
>>  12 files changed, 21 insertions(+), 20 deletions(-)


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
