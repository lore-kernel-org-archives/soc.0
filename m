Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE863C433ED
	for <soc@archiver.kernel.org>; Tue,  6 Apr 2021 16:16:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8AE57613CB; Tue,  6 Apr 2021 16:16:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D02D613BD;
	Tue,  6 Apr 2021 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617725778;
	bh=f33FNwuOiX9RsCyTqxsQy8FT+twXquGLQQ4HL+p2Ttg=;
	h=Subject:To:List-Id:Cc:References:From:Date:In-Reply-To:From;
	b=AAdsq12NS/mQAfxDUrufZq5wM2lbSPXhhgK80GGEM5djvMzDStAtMTMl279qYjsLJ
	 cLaKXBXNnIToLDPALBGSo0i4Q4qOGzRwTsTLX/aWhMlKfP+8QXbiRMU3+AHS9vHIM3
	 +e6KJOS5+61nfhq6k0Mfatwu2jDcItT2s7fQxhkCX8uyOBAu+nb7jZm9Ppi0w6apA0
	 HuyG2F4I1puYsXJIYc0kQfzBCIefqx6gPBAu6FJvECOAic2H+GULrQrpm+VxOin/46
	 c03RT03BgYxJLWvWonG7ecwgMt/TWS4AZGXa61VnFTvTC5OsXhVa8cxwWC2ct2mxDY
	 a++K49LzHYkFg==
Subject: Re: [PATCH v3 08/15] arm64: socfpga: merge Agilex and N5X into
 ARCH_INTEL_SOCFPGA
To: Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-9-krzysztof.kozlowski@canonical.com>
 <20210406160959.GA208060@roeck-us.net>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <62dc6f31-b488-64b6-7a05-0a68a678fdd5@kernel.org>
Date: Tue, 6 Apr 2021 11:16:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406160959.GA208060@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/6/21 11:09 AM, Guenter Roeck wrote:
> On Thu, Mar 11, 2021 at 04:25:38PM +0100, Krzysztof Kozlowski wrote:
>> Agilex, N5X and Stratix 10 share all quite similar arm64 hard cores and
>> SoC-part.  Up to a point that N5X uses the same DTSI as Agilex.  From
>> the Linux kernel point of view these are flavors of the same
>> architecture so there is no need for three top-level arm64
>> architectures.  Simplify this by merging all three architectures into
>> ARCH_INTEL_SOCFPGA and dropping the other ARCH* arm64 Kconfig entries.
>>
>> The side effect is that the INTEL_STRATIX10_SERVICE will now be
>> available for both 32-bit and 64-bit Intel SoCFPGA, even though it is
>> used only for 64-bit.
> 
> Did you try to compile, say, arm:allmodconfig with this patch applied ?
> Because for me that results in:
> 
> In file included from <command-line>:
> drivers/firmware/stratix10-rsu.c: In function 'rsu_status_callback':
> include/linux/compiler_types.h:320:38: error:
> 	call to '__compiletime_assert_177' declared with attribute error:
> 	FIELD_GET: type of reg too small for mask
> 
> and lots of similar errors.
> 

There's a patch to fix this in flight to the arm-soc tree.

Dinh
