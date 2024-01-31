Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A5DC47258
	for <soc@archiver.kernel.org>; Wed, 31 Jan 2024 15:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B538C43394; Wed, 31 Jan 2024 15:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3173C433F1;
	Wed, 31 Jan 2024 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706715693;
	bh=3qc1rD4OFMv152sahNdXzftZFYLPE8J6IdJzNl7A+Ds=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=FRtAQL4P2fhakKD2lJx59bZVG04GXx7y4JYKjGa+TfPz19YHtsNCYxdYxO2R/4cia
	 htqqKdIcuJ4VgdOENNbO4VDzCy3QNTuAAgSNWR0F56Qf4gIDusNFeUDRn1wQCCSsc/
	 tKrMQf3JkJYbv1lPvfRD3ECUcjr+aFr3RMdznjYszREWAJ3N31k/FJ+q3Iclhu9Qw8
	 aFltwZXEhhgSEBRWhGF1kC4N/rsqr28rXjRUsrCQ7Ohw+gONEC5Xk/GuskxqXocWUs
	 Gv83hNk5WwjGn0HXBvlbWsY+IJm5mWX3HntsBE07tD75eZTAmvtjDuWqvZe8Wj9MG1
	 rYiJHBtzdJtYw==
Date: Wed, 31 Jan 2024 09:41:30 -0600
From: Rob Herring <robh@kernel.org>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
List-Id: <soc.lore.kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, frowand.list@gmail.com,
	vgupta@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
	guoren@kernel.org, monstr@monstr.eu, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, dinguyen@kernel.org, chenhuacai@kernel.org,
	tsbogend@alpha.franken.de, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	mpe@ellerman.id.au, ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	chris@zankel.net, jcmvbkbc@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH 14/46] sh: reserved_mem: Implement the new processing
 order for reserved memory
Message-ID: <20240131154130.GA1336725-robh@kernel.org>
References: <20240126235425.12233-1-quic_obabatun@quicinc.com>
 <20240126235425.12233-15-quic_obabatun@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126235425.12233-15-quic_obabatun@quicinc.com>

On Fri, Jan 26, 2024 at 03:53:53PM -0800, Oreoluwa Babatunde wrote:
> Call early_fdt_scan_reserved_mem() in place of
> early_init_fdt_scan_reserved_mem() to carry out the first stage of the
> reserved memory processing only.
> 
> The early_fdt_scan_reserved_mem() function is used to scan through the
> DT and mark all the reserved memory regions as reserved or nomap as
> needed, as well as allocate the memory required by the
> dynamically-placed
> reserved memory regions.
> 
> The second stage of the reserved memory processing is done by
> fdt_init_reserved_mem(). This function is used to store the information
> of the statically-placed reserved memory nodes in the reserved_mem
> array as well as call the region specific initialization function on all
> the stored reserved memory regions.
> 
> The call to fdt_init_reserved_mem() is placed right after
> early_fdt_scan_reserved_mem() because memblock allocated memory should
> already be writable at this point.
> 
> Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
> ---
>  arch/sh/boards/of-generic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/sh/boards/of-generic.c b/arch/sh/boards/of-generic.c
> index f7f3e618e85b..7bec409f077c 100644
> --- a/arch/sh/boards/of-generic.c
> +++ b/arch/sh/boards/of-generic.c
> @@ -8,6 +8,7 @@
>  #include <linux/of.h>
>  #include <linux/of_clk.h>
>  #include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/clocksource.h>
>  #include <linux/irqchip.h>
>  #include <asm/machvec.h>
> @@ -110,7 +111,8 @@ static int noopi(void)
>  static void __init sh_of_mem_reserve(void)
>  {
>  	early_init_fdt_reserve_self();
> -	early_init_fdt_scan_reserved_mem();
> +	early_fdt_scan_reserved_mem();
> +	fdt_init_reserved_mem();

Looking at the sh code, there's an existing problem with the order of
init. This is called from paging_init() and is done after unflattening
and copying the DT. That means the kernel could freely allocate memory
for the DT in a reserved region.

Rob
