Return-Path: <SRS0=N3Ev=5A=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DB0C4708E
	for <soc@archiver.kernel.org>; Tue,  3 Jan 2023 21:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C91FC433EF; Tue,  3 Jan 2023 21:25:40 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BE62C433F2
	for <soc@kernel.org>; Tue,  3 Jan 2023 21:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BE62C433F2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f177.google.com with SMTP id 17so34043744pll.0
        for <soc@kernel.org>; Tue, 03 Jan 2023 13:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUKV8XtdR9Wi29R6eAEUNYjmfBZwpc26xLflVPTdF70=;
        b=hmzLco5GkMI78m65rJOjtshDE9OHs4WUD+ZoV6soHzsge2ezP/QV71N7ohi4JjzpDS
         y3UOikUsRzLX6ubOwcdbnZjV0HuLQQChjawrybAiNFhEojD3bbj/e2SIdBh4GEQDydVa
         K5jcW2K0wGVIlRbXlhfY4PpLhs3xMCrfXx+a8W9bi2em7OVAgdWaC2xe1WCSzi0p+N4M
         XhCVIMVP9KkjmyHvmKYV/euzUPRLIBTxSnMkWUFsqArFVwkGR3VhrUtUB+XLKYwEFKnZ
         cmtUL0biyXB4rkAvbBTyTph9RAIMs6qWzc+d7PI6SzEOnJ11+LBK0ZHnQNW6TzMf3WN0
         Q/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUKV8XtdR9Wi29R6eAEUNYjmfBZwpc26xLflVPTdF70=;
        b=lIRBk7yvsgkLUyfLgMVLmF0HM+PT9DV/dkfSMM2YlP3U0JpfQ+oY0geGRw+5O/4g+Y
         IaKd+K68AziEsD/D7vQOqxgeVOd8Ei+HKMY/VCecOQZT+MB55hPhcbYfqvLLRLFOqVQb
         yJ/2YOgd37WpUB9lv2JOZu5nmZAA0Rg9vUk/uvuHIwFhxRdFbtJ5NorIF0oAPDSlb6ld
         tXRt4fFF/YvtbUnFnJxcljT6QrCZbR082LgIyfR/aoeCgOePB1SboODfqOiPU344Po0T
         y6D//R+VO51amFhUBSQbg6917fwCzV3OcttIhfPcmBN/GHoLRJadd7cbl/Gj7WXOxtE2
         BM6A==
X-Gm-Message-State: AFqh2kqtw6ABcUnqxR810TDbzT/1s+O4CfUoY9Zv23PQYWrJuUIgPkzl
	njLBa39KIEe+B57t1dk6Yzu7aA==
X-Google-Smtp-Source: AMrXdXtSvMcBjakJm9BjhwFaZ8Ms1gtQxe0RsBhSPiFjUg//ODcQyEurfazTSl5cYA2O7TD2fHDrqA==
X-Received: by 2002:a17:90a:558c:b0:226:1189:ad3e with SMTP id c12-20020a17090a558c00b002261189ad3emr25556131pji.27.1672781137514;
        Tue, 03 Jan 2023 13:25:37 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id y11-20020a634b0b000000b00477a442d450sm1734161pga.16.2023.01.03.13.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 13:25:36 -0800 (PST)
Date: Tue, 03 Jan 2023 13:25:36 -0800 (PST)
X-Google-Original-Date: Tue, 03 Jan 2023 13:25:31 PST (-0800)
Subject:     Re: [RFC v5.1 9/9] [DON'T APPLY] cache: sifive-ccache: add cache flushing capability
In-Reply-To: <20230103210400.3500626-10-conor@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
  prabhakar.csengg@gmail.com, Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
  aou@eecs.berkeley.edu, apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
  biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, geert@linux-m68k.org, guoren@kernel.org,
  Christoph Hellwig <hch@infradead.org>, heiko@sntech.de, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
  magnus.damm@gmail.com, nathan@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  philipp.tomsich@vrull.eu, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org,
  samuel@sholland.org, soc@kernel.org, daire.mcnamara@microchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-6e6653fa-4efc-49c4-bd70-320c63327c2b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 03 Jan 2023 13:04:01 PST (-0800), Conor Dooley wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
> SiFive L2 cache controller can flush L2 cache. Expose this capability via

Do you have a pointer to the datasheet for whatever L2 controller is in 
the PFSOC?  IIRC whether it's possible to correctly flush the cache is 
kind of subtle, as it depends on what else is floating around the SOC.

> driver.
>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> [Conor: rebase on top of move to cache subsystem]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This commit needs more work, and a way to enable it from errata. I've
> not gone and done this as PolarFire SoC has archid etc all set to zero.
> So we need to go figure out a workaround for this, before adding in
> errata enabling code for this. I've included it here as a second user of
> the cache management stuff, since what's currently upstream for the
> ccache driver does not do any cache management.
> ---
>  drivers/cache/sifive_ccache.c | 45 +++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 47e7d6557f85..3c00f205bace 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -9,12 +9,14 @@
>  #define pr_fmt(fmt) "CCACHE: " fmt
>
>  #include <linux/debugfs.h>
> +#include <linux/dma-direction.h>
>  #include <linux/interrupt.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_address.h>
>  #include <linux/device.h>
>  #include <linux/bitfield.h>
>  #include <asm/cacheinfo.h>
> +#include <asm/cacheflush.h>
>  #include <cache/sifive_ccache.h>
>
>  #define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
> @@ -42,11 +44,15 @@
>  #define SIFIVE_CCACHE_WAYENABLE 0x08
>  #define SIFIVE_CCACHE_ECCINJECTERR 0x40
>
> +#define SIFIVE_CCACHE_FLUSH64 0x200
> +#define SIFIVE_CCACHE_FLUSH32 0x240
> +
>  #define SIFIVE_CCACHE_MAX_ECCINTR 4
>
>  static void __iomem *ccache_base;
>  static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
>  static struct riscv_cacheinfo_ops ccache_cache_ops;
> +static struct riscv_cache_maint_ops ccache_cmos;
>  static int level;
>
>  enum {
> @@ -205,6 +211,42 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>  	return IRQ_HANDLED;
>  }
>
> +static void sifive_ccache_dma_wback_inv(void* vaddr, unsigned long size)
> +{
> +	void * __iomem flush = ccache_base + SIFIVE_CCACHE_FLUSH64;
> +	phys_addr_t start = virt_to_phys(vaddr);
> +	phys_addr_t aligned_start = start & ~0x3f;
> +	u64 addr;
> +	u64 end;
> +	u64 aligned_end;
> +
> +	size += start - aligned_start;
> +	end = start + size;
> +	aligned_end = end += 0x3f;
> +	aligned_end &= ~0x3f;
> +
> +	for (addr = aligned_start; addr < aligned_end; addr += 64)
> +		writeq(addr, flush);
> +}
> +
> +static void sifive_ccache_cmo(unsigned int cache_size, void *vaddr, size_t size,
> +			      int dir, int ops)
> +{
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		sifive_ccache_dma_wback_inv(vaddr, size);
> +		break;
> +	case DMA_FROM_DEVICE:
> +		sifive_ccache_dma_wback_inv(vaddr, size);
> +		break;
> +	case DMA_BIDIRECTIONAL:
> +		sifive_ccache_dma_wback_inv(vaddr, size);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static int __init sifive_ccache_init(void)
>  {
>  	struct device_node *np;
> @@ -254,6 +296,9 @@ static int __init sifive_ccache_init(void)
>  	ccache_cache_ops.get_priv_group = ccache_get_priv_group;
>  	riscv_set_cacheinfo_ops(&ccache_cache_ops);
>
> +	ccache_cmos.cmo_patchfunc = sifive_ccache_cmo;
> +	riscv_set_cache_maint_ops(&ccache_cmos);
> +
>  #ifdef CONFIG_DEBUG_FS
>  	setup_sifive_debug();
>  #endif
