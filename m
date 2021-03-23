Return-Path: <nathan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65995C433DB
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 18:24:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 394BB619BF; Tue, 23 Mar 2021 18:24:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CDE7619C0;
	Tue, 23 Mar 2021 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616523882;
	bh=yVgQe6EwyyXBtcqdp7748Z1Ucvxh+NMzcFOW+YA9nIY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ncRSA4f2cvzdHhN8USFjuK1LcUaVQEuzibTevQLmQPg0MnvL9W+H7bacc68W+m7yF
	 CNeN+6H6tM5zNwTd7WhLzddAkk1t9GP5VkMWbwtlm75Iy+/DmkjHjvofylZ7hUv33Y
	 54n7y0ho2jgGty8nD9lxAewllWp1ciL8XgOe7Yk3SEFyplrUIG2E8XKlho7QnhE2nC
	 4vodELeU69x+8OIgQ4QfgawCFa5OYA/ANjmhfRrLKDXJ4X0kymxiwhVPCUyFkr86U4
	 cQSlOnLyJeKKc25SnuQZL3TSI4jHW6XJ+n9NRuLmiyPRqRkm2Cfc46/qeSjcqwOu0k
	 nmF6M1Ec6LZFQ==
Date: Tue, 23 Mar 2021 11:24:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Robin Murphy <robin.murphy@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Maxime Ripard <maxime@cerno.tech>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: keystone: fix integer overflow warning
Message-ID: <20210323182436.5uxkjtgee3eoldvo@archlinux-ax161>
References: <20210323131814.2751750-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323131814.2751750-1-arnd@kernel.org>

On Tue, Mar 23, 2021 at 02:18:05PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about an impossible condition when building with 32-bit
> phys_addr_t:
> 
> arch/arm/mach-keystone/keystone.c:79:16: error: result of comparison of constant 51539607551 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>             mem_end   > KEYSTONE_HIGH_PHYS_END) {
>             ~~~~~~~   ^ ~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-keystone/keystone.c:78:16: error: result of comparison of constant 34359738368 with expression of type 'phys_addr_t' (aka 'unsigned int') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (mem_start < KEYSTONE_HIGH_PHYS_START ||
>             ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Change the temporary variable to a fixed-size u64 to avoid the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-keystone/keystone.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
> index cd711bfc591f..2c647bdf8d25 100644
> --- a/arch/arm/mach-keystone/keystone.c
> +++ b/arch/arm/mach-keystone/keystone.c
> @@ -65,7 +65,7 @@ static void __init keystone_init(void)
>  static long long __init keystone_pv_fixup(void)
>  {
>  	long long offset;
> -	phys_addr_t mem_start, mem_end;
> +	u64 mem_start, mem_end;
>  
>  	mem_start = memblock_start_of_DRAM();
>  	mem_end = memblock_end_of_DRAM();
> @@ -78,7 +78,7 @@ static long long __init keystone_pv_fixup(void)
>  	if (mem_start < KEYSTONE_HIGH_PHYS_START ||
>  	    mem_end   > KEYSTONE_HIGH_PHYS_END) {
>  		pr_crit("Invalid address space for memory (%08llx-%08llx)\n",
> -		        (u64)mem_start, (u64)mem_end);
> +		        mem_start, mem_end);
>  		return 0;
>  	}
>  
> -- 
> 2.29.2
> 
