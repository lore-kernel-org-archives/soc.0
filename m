Return-Path: <SRS0=zZF4=IK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7417C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 14:06:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DCF664FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Mar 2021 14:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DCF664FFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fmiysLwK1C+b3WNRJRnnw+k1itUgjSUvS1p201p9ng0=; b=JxB5WYfJ58VNaijdcZKtNKVE7
	b16BqT9DBzKctmPtrt+qxhJ/oCNZTIT8rc8gKb4nL7SL3EoXsAIbeJxB0ZoZCL6VgD6kBKXGi+fzJ
	zAAf5LsJgnCsIszecFFUw652DKEFXrJZjfQxWeRTH5RaWTrXAUkB6BnOvmP8/QfzkM9an565bXIf0
	St/Yi0Oy7Z73klAaimwpQSRHKsXc5AKOpI5AUGiEcKu3ZhNhqYQFcfjNWNV8D69cMgwxQjSlgiHn3
	Uju5HcjMSTA2ZaaMXzGKn71LNmaIulpbE89WyBu5maOuHg2xGk/GeuxevjYZfVpqWzKEuYTv/A+oX
	Qnydisbuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKiPp-00BaCw-Bz; Fri, 12 Mar 2021 14:05:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKhCm-00BSHq-No
 for linux-arm-kernel@lists.infradead.org; Fri, 12 Mar 2021 12:49:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A47A264F09;
 Fri, 12 Mar 2021 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615553267;
 bh=awQ6d7P1pAN97VdaNOlxDQLyaL1R4wg5mSfN6uui2Cs=;
 h=Subject:List-Id:To:References:From:Date:In-Reply-To:From;
 b=snYRkE8OdVItCuahvzED4D/CcrPgHCrfl8Tex+db/QhBid/F+FfGc6+ZkwGoMRlsE
 S1ntrBtgjSMyZ2walfpsuK7o43DQiHVsmmZKa+8I2TydDMmNHfJWoF3HwYdMkD1RvN
 947m7YyhTXgfrY1tAOlX6JcvVlzBF0j5DgUG4u9lMPUBBg3EvMdtuXOkStJkTlrF7p
 AZp1UDWUKGRb25ZrkiN6XwcvWl2D2H39lbFzdqF315MATP3i33St98u/5TdtufUabZ
 Bz+BR7YC52HWPkGJvDuYdAfjdUYJgP0pFHyOImgg13BUNgBzO4tdNG1lVRFEva03G/
 nY1cKBXgBXIew==
Subject: Re: [PATCH v3 06/15] clk: socfpga: merge ARCH_SOCFPGA and
 ARCH_STRATIX10
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
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
 <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <5f7b49e2-db29-cc19-9dc1-09bcded43e28@kernel.org>
Date: Fri, 12 Mar 2021 06:47:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311152545.1317581-7-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_124950_362844_AF27DF15 
X-CRM114-Status: GOOD (  16.78  )
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
Message-ID: <20210312124743.orMNl-L-j-cHdKi4LNZWQrroPbbFpYSdQkBkWwtXYNA@z>



On 3/11/21 9:25 AM, Krzysztof Kozlowski wrote:
> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  This the common practice for other platforms.
> Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
> from multiple vendors.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   drivers/clk/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 12e46b12e587..1e29e5ad107a 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -104,10 +104,9 @@ obj-y					+= renesas/
>   obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>   obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> -obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
> +obj-$(CONFIG_ARCH_INTEL_SOCFPGA)	+= socfpga/
>   obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
>   obj-$(CONFIG_ARCH_N5X)			+= socfpga/
> -obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
>   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>   obj-y					+= sprd/
>   obj-$(CONFIG_ARCH_STI)			+= st/
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
