Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2ED5C433B4
	for <soc@archiver.kernel.org>; Tue,  6 Apr 2021 18:17:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 50E2C613D2; Tue,  6 Apr 2021 18:17:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3280613B3;
	Tue,  6 Apr 2021 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617733038;
	bh=X67a8xpcXCjUsAjr8KVYSZbvffOYc8116pHyl/kzd3I=;
	h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
	b=tWksv+jOi7RVLiGI5AobiRwmqX3uc9vSCQ9xIHWR8NbnIv47jYgv7VrKFj69ftRez
	 ZAUEcxE7XUkmjfs257DQLGsdlS+ONHj7MSfCJKDooj0nOA/DSS++gM1u5Q4QilNXio
	 KpT+8JXGuD4srZhP8UazvKsJg4iKGsDExe5N2tsfIwBBvGP2ddDhnNGPR60H3b5hMi
	 qd452TTf8+CG+EPaRE2hzpiU3/rJsVWfB+w5BWAYHddyQIXb37mfiZi6mV0G9QvcdC
	 qLgrZnCb/HvoFpd4prMT2+KgaL1Kw02xIaxpm/yUnAGoQxQaUMnmBXNV2EjPy+Q0gb
	 IhUqBZuNy7TUg==
Subject: Re: [PATCH v3 01/15] clk: socfpga: allow building N5X clocks with
 ARCH_N5X
List-Id: <soc.lore.kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski
 <kuba@kernel.org>, James Morse <james.morse@arm.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Moritz Fischer <mdf@kernel.org>,
 Olof Johansson <olof@lixom.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Robert Richter <rric@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Tom Rix <trix@redhat.com>,
 Tony Luck <tony.luck@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-edac@vger.kernel.org,
 "lin ux-fpga"@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, soc@kernel.org
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
 <161724074854.2260335.2479133227977254546@swboyd.mtv.corp.google.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <c4998896-0339-d03d-0902-ea4725f7688c@kernel.org>
Date: Tue, 6 Apr 2021 13:17:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161724074854.2260335.2479133227977254546@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/31/21 8:32 PM, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2021-03-11 07:25:31)
>> The Intel's eASIC N5X (ARCH_N5X) architecture shares a lot with Agilex
>> (ARCH_AGILEX) so it uses the same socfpga_agilex.dtsi, with minor
>> changes.  Also the clock drivers are the same.
>>
>> However the clock drivers won't be build without ARCH_AGILEX.  One could
>> assume that ARCH_N5X simply depends on ARCH_AGILEX but this was not
>> modeled in Kconfig.  In current stage the ARCH_N5X is simply
>> unbootable.
>>
>> Add a separate Kconfig entry for clocks used by both ARCH_N5X and
>> ARCH_AGILEX so the necessary objects will be built if either of them is
>> selected.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> FYI, Dinh sent some patches to change socfpga code to use clk_hw so it
> may conflict.
> 

I just checked, no conflicts.

Thanks
Dinh
