Return-Path: <SRS0=1rdH=JD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9581DC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 16:18:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA4260FE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 16:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EA4260FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YJYhp/Nw5JSzdi5V8ju57ZhCuiZyxSYF3K/tzpXbu3U=; b=kTiqcf5KIIN/GOtpioRxWHM23
	RDMjk+lDq1uyccg4i7dYo2dykbiSDKTfh6ycGyuThJfqQPH/qUvOnAqJizM1HZQOlqN27Q3tX/tqU
	9prHe36A3Osx4OlLC4zpeI16Z35dXBFfHj5en9LJgp0xwrI5STL8B+uOliAil6mUwSI9mN6RPkEWy
	4LFpVHxnK+H6Lqy6qEnn1brAthYDBBAGMBgTd+FIhg/rJiNrtrphJFI9qhlF9wlKIQh+7L7mcDpzp
	T13GKZsItDiS7Qp97sarkiTS2htIkVhRE94dAy2QWXwruaU1k6kN7dwBWEhEByj2m147C1W15ubQE
	WkxPff/4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lToNQ-002zOo-FO; Tue, 06 Apr 2021 16:16:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lToNK-002zKP-Pl
 for linux-arm-kernel@lists.infradead.org; Tue, 06 Apr 2021 16:16:25 +0000
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_171624_010053_451F2026 
X-CRM114-Status: GOOD (  22.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210406161614.zfhpxGtAwNyPgNkHR8CmsVUVnH57JF1IQnlUqASWig8@z>



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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
