Return-Path: <nathan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3A0C433E0
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 18:40:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78B06619C1; Tue, 23 Mar 2021 18:40:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 310AC60200;
	Tue, 23 Mar 2021 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616524802;
	bh=fTYGqJ5MIYPajmgIiHC3Gu5EqdEZZ8uNfGHz6mas7B0=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=nnnxFiILmY6r49KBX1zVSPURiGtSjsu1ZKpVuR6GAcqjk5nGfOr74vavOuJF29FMW
	 C3fqx2OOwM1jsbFVmvF9mVRyAfMKo51xHSLn3ZMWbbN7iAXf58T61ydXZTEHUR4L7j
	 P4EfimmEp4+ipx4Kz1odauH6luPDdF0eM/jHnWovKLSFa0iEtY/UZqGIf6TBlfHu8M
	 N8K9FqO/xIi7BMlmsvhdVGfKMcJ7MMvHTQM01b0mNnV1bj9SrjZb2XV7LK16a99NwH
	 o4HlYIGw7yP2LBuPQAZ3w3Mmu7xeTmgKCaayPYDHh2oOpBVUpfo/vZBnwPBxpQCB10
	 tk8hMgD1YIp/Q==
Date: Tue, 23 Mar 2021 11:39:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: mvebu: avoid clang -Wtautological-constant warning
Message-ID: <20210323183957.cgku3mhmcn53aut4@archlinux-ax161>
References: <20210323131952.2835509-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323131952.2835509-1-arnd@kernel.org>

On Tue, Mar 23, 2021 at 02:19:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang warns about the comparison when using a 32-bit phys_addr_t:
> 
> drivers/bus/mvebu-mbus.c:621:17: error: result of comparison of constant 4294967296 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                 if (reg_start >= 0x100000000ULL)
> 
> Add a cast to shut up the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/bus/mvebu-mbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
> index dd9e7343a5e3..ea0424922de7 100644
> --- a/drivers/bus/mvebu-mbus.c
> +++ b/drivers/bus/mvebu-mbus.c
> @@ -618,7 +618,7 @@ mvebu_mbus_find_bridge_hole(uint64_t *start, uint64_t *end)
>  		 * This part of the memory is above 4 GB, so we don't
>  		 * care for the MBus bridge hole.
>  		 */
> -		if (reg_start >= 0x100000000ULL)
> +		if ((u64)reg_start >= 0x100000000ULL)
>  			continue;
>  
>  		/*
> -- 
> 2.29.2
> 
