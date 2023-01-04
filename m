Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A67AC4332F
	for <soc@archiver.kernel.org>; Wed,  4 Jan 2023 09:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFDA7C433F0; Wed,  4 Jan 2023 09:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC297C433D2;
	Wed,  4 Jan 2023 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672826238;
	bh=nn4+G9YSkrL4uki7DFfbSpQY7XWkWI7/WUJbCvL0pIQ=;
	h=Date:From:To:List-Id:CC:Subject:In-Reply-To:References:From;
	b=PBUi/t5ZbzZMPnMtBTmgOinuQHcD+Sw2nd/7Xs6xM9Z+FvIpIFmQfn0RnoiomteWa
	 Qdz61HxasUj+Yl24KoX3MN0c7+FNN9WEtoo31H24ddfeXcaAF7axFW6ovdCRoDCdeQ
	 2XigMFpNwE7jfnjir8p9y5V9BIX9RW55TRVdIpoKuDuSXPuOO9V7gi+LWqTWB9MQ8L
	 GTLO2qSkb95djwjLw3VlKyYxiiHXli5kGUHG65c3bywTleN8tQmhA6CVrUx/jLsrC2
	 oZ7Mh0QN+qPmsvn4BouHbPWYSjZRfmtZiEfIZf0HczI7qnWc1w1UDb0NobEFzgtJES
	 E4mrYoofh4wgQ==
Date: Wed, 04 Jan 2023 09:57:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>, arnd@arndb.de, palmer@dabbelt.com,
 prabhakar.csengg@gmail.com
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, apatel@ventanamicro.com, atishp@rivosinc.com,
 biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, hch@infradead.org, heiko@sntech.de, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 magnus.damm@gmail.com, nathan@kernel.org, paul.walmsley@sifive.com,
 philipp.tomsich@vrull.eu, prabhakar.mahadev-lad.rj@bp.renesas.com,
 robh+dt@kernel.org, samuel@sholland.org, soc@kernel.org,
 Daire McNamara <daire.mcnamara@microchip.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v5=2E1_9/9=5D_=5BDON=27T_APPLY=5D_cache=3A_si?= =?US-ASCII?Q?five-ccache=3A_add_cache_flushing_capability?=
User-Agent: K-9 Mail for Android
In-Reply-To: <6ef122f6-12fa-777f-b4e7-a02531380391@codethink.co.uk>
References: <Y62nOqzyuUKqYDpq@spud> <20230103210400.3500626-10-conor@kernel.org> <6ef122f6-12fa-777f-b4e7-a02531380391@codethink.co.uk>
Message-ID: <298CA44E-DF97-4790-9CB1-F3ACD43E71FF@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4 January 2023 09:45:30 GMT, Ben Dooks <ben=2Edooks@codethink=2Eco=2Euk=
> wrote:
>On 03/01/2023 21:04, Conor Dooley wrote:
>> From: Daire McNamara <daire=2Emcnamara@microchip=2Ecom>
>>=20
>> SiFive L2 cache controller can flush L2 cache=2E Expose this capability=
 via
>> driver=2E
>>=20
>> Signed-off-by: Daire McNamara <daire=2Emcnamara@microchip=2Ecom>
>> [Conor: rebase on top of move to cache subsystem]
>> Signed-off-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>
>> ---
>> This commit needs more work, and a way to enable it from errata=2E I've
>> not gone and done this as PolarFire SoC has archid etc all set to zero=
=2E
>> So we need to go figure out a workaround for this, before adding in
>> errata enabling code for this=2E I've included it here as a second user=
 of
>> the cache management stuff, since what's currently upstream for the
>> ccache driver does not do any cache management=2E
>
>I think errata isn't the right word here, it's more of a system requireme=
nt for anything that isn't coherent=2E All the SiFive systems
>I have are coherent so won't need this=2E

That's the mechanism we currently have for turning this stuff on=2E
This patch is going away anyway for an actual submission, so we can debate=
 this sort of thing when it shows up for real=2E
This patch does certainly seem to be distracting from the main point, whic=
h was supposed to be the interface to arch/riscv=2E


>> ---
>>   drivers/cache/sifive_ccache=2Ec | 45 ++++++++++++++++++++++++++++++++=
+++
>>   1 file changed, 45 insertions(+)
>>=20
>> diff --git a/drivers/cache/sifive_ccache=2Ec b/drivers/cache/sifive_cca=
che=2Ec
>> index 47e7d6557f85=2E=2E3c00f205bace 100644
>> --- a/drivers/cache/sifive_ccache=2Ec
>> +++ b/drivers/cache/sifive_ccache=2Ec
>> @@ -9,12 +9,14 @@
>>   #define pr_fmt(fmt) "CCACHE: " fmt
>>     #include <linux/debugfs=2Eh>
>> +#include <linux/dma-direction=2Eh>
>>   #include <linux/interrupt=2Eh>
>>   #include <linux/of_irq=2Eh>
>>   #include <linux/of_address=2Eh>
>>   #include <linux/device=2Eh>
>>   #include <linux/bitfield=2Eh>
>>   #include <asm/cacheinfo=2Eh>
>> +#include <asm/cacheflush=2Eh>
>>   #include <cache/sifive_ccache=2Eh>
>>     #define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
>> @@ -42,11 +44,15 @@
>>   #define SIFIVE_CCACHE_WAYENABLE 0x08
>>   #define SIFIVE_CCACHE_ECCINJECTERR 0x40
>>   +#define SIFIVE_CCACHE_FLUSH64 0x200
>> +#define SIFIVE_CCACHE_FLUSH32 0x240
>> +
>>   #define SIFIVE_CCACHE_MAX_ECCINTR 4
>>     static void __iomem *ccache_base;
>>   static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
>>   static struct riscv_cacheinfo_ops ccache_cache_ops;
>> +static struct riscv_cache_maint_ops ccache_cmos;
>>   static int level;
>>     enum {
>> @@ -205,6 +211,42 @@ static irqreturn_t ccache_int_handler(int irq, voi=
d *device)
>>   	return IRQ_HANDLED;
>>   }
>>   +static void sifive_ccache_dma_wback_inv(void* vaddr, unsigned long s=
ize)
>> +{
>> +	void * __iomem flush =3D ccache_base + SIFIVE_CCACHE_FLUSH64;
>> +	phys_addr_t start =3D virt_to_phys(vaddr);
>> +	phys_addr_t aligned_start =3D start & ~0x3f;
>> +	u64 addr;
>> +	u64 end;
>> +	u64 aligned_end;
>> +
>> +	size +=3D start - aligned_start;
>> +	end =3D start + size;
>> +	aligned_end =3D end +=3D 0x3f;
>
>I think you meant + 0x3f here=2E There is an align macro in the kernel
>headers, and I'm not sure by inspection if you'd miss the last line
>with this code=2E
>
>> +	aligned_end &=3D ~0x3f;
>> +
>> +	for (addr =3D aligned_start; addr < aligned_end; addr +=3D 64)
>> +		writeq(addr, flush);
>> +}
>
>The p550 manual states that the zero device flush method is quicker for
>any large area flush=2E However not sure what that level is and whether i=
t
>is worth dealing with here? If so we need to have the L3 zero are mapped=
=2E
>
>> +
>> +static void sifive_ccache_cmo(unsigned int cache_size, void *vaddr, si=
ze_t size,
>> +			      int dir, int ops)
>> +{
>
>technically dir should have been of type "enum dma_data_direction"
>
>> +	switch (dir) {
>> +	case DMA_TO_DEVICE:
>> +		sifive_ccache_dma_wback_inv(vaddr, size);
>> +		break;
>> +	case DMA_FROM_DEVICE:
>> +		sifive_ccache_dma_wback_inv(vaddr, size);
>> +		break;
>> +	case DMA_BIDIRECTIONAL:
>> +		sifive_ccache_dma_wback_inv(vaddr, size);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>
>I'm not sure why you'd bother checking the dir here, the cache can
>only be flushed (I hope DMA_FROM_DEVICE is done /before/ the DMA op)=2E
>
>You could have saved yourself an include if just ignoring dir=2E
>
>> +
>>   static int __init sifive_ccache_init(void)
>>   {
>>   	struct device_node *np;
>> @@ -254,6 +296,9 @@ static int __init sifive_ccache_init(void)
>>   	ccache_cache_ops=2Eget_priv_group =3D ccache_get_priv_group;
>>   	riscv_set_cacheinfo_ops(&ccache_cache_ops);
>>   +	ccache_cmos=2Ecmo_patchfunc =3D sifive_ccache_cmo;
>> +	riscv_set_cache_maint_ops(&ccache_cmos);
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   	setup_sifive_debug();
>>   #endif
>
