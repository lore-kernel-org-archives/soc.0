Return-Path: <SRS0=BJGb=3O=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC2AC4332F
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 08:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E1B6C433D6; Mon, 14 Nov 2022 08:59:44 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8982C433C1;
	Mon, 14 Nov 2022 08:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8982C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668416382; x=1699952382;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4ZUDBICbMDZqlh25FYQGX210sivr3l1viVzgWGRSaEA=;
  b=Vh8FBmBWD5ntPTxeUJjbs3Fuu9Eck5y+Xgfy4tWzL9FtGp8Ss+xawpdC
   NuuBlxDJISEeDqaou9hvddKrjCXlT+rfoV9Any73QtaQEnXfnlYx1d+y+
   pviKt0Wdi7kzLFWtK4Nqjvx7W9u+uFcm+EYunvx4E0bYa8HgszviHMKxM
   8Fg+Os+VKq8fjQgsA/jskkuHPXjWaarP2q27+V6hYniPVRdygl0en+0iI
   9aMt/Ls8wzFhEmORA3flmNN1rcVwE0zxIu9HcNAT+MBwR+1nDqt3CgrPN
   lJ2Wrx/KDWadU4WfmcgC1gpTMfh97CavAKd7dLceBo4LvJSswkb6H3mku
   g==;
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="199668596"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Nov 2022 01:59:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 14 Nov 2022 01:59:41 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 01:59:39 -0700
Message-ID: <4be97a62-4749-c3a3-5401-6e440c24c3f4@microchip.com>
Date: Mon, 14 Nov 2022 09:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/4] MAINTAINERS: add entries for misc. RISC-V SoC
 drivers and devicetrees
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <soc@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
References: <20221109212219.1598355-1-conor@kernel.org>
 <20221109212219.1598355-2-conor@kernel.org>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20221109212219.1598355-2-conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2022 at 22:22, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Following some discussion both on & off list, I have volunteered to take
> over maintaining the miscellaneous RISC-V devicetrees & soc drivers from
> Palmer to ease his load.
> 
> So far only SiFive and Microchip have stuff in drivers/soc. For the
> former, a SiFive entry exists with a dead GitHub repo - so remove that
> to avoid confusion since the patches for drivers/soc & devicetrees will
> be routed via my tree & other drivers go through their subsystem trees.
> The Microchip directory only contains a RISC-V driver for now, but is
> likely to contain drivers for other archs in the future. To that end,
> change the PolarFire SoC entry to specifically mention the RISC-V driver
> & the new directory level entry does not mention an architecture.
> 
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Conor, best regards,
   Nicolas

> CC: Palmer Dabbelt <palmer@dabbelt.com>
> Link: https://lore.kernel.org/linux-riscv/mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   MAINTAINERS | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 046ff06ff97f..b88ced1ff72c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13627,6 +13627,12 @@ S:     Supported
>   F:     drivers/misc/atmel-ssc.c
>   F:     include/linux/atmel-ssc.h
> 
> +MICROCHIP SOC DRIVERS
> +M:     Conor Dooley <conor@kernel.org>
> +S:     Supported
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     drivers/soc/microchip/
> +
>   MICROCHIP USB251XB DRIVER
>   M:     Richard Leitner <richard.leitner@skidata.com>
>   L:     linux-usb@vger.kernel.org
> @@ -17749,12 +17755,21 @@ F:    drivers/mailbox/mailbox-mpfs.c
>   F:     drivers/pci/controller/pcie-microchip-host.c
>   F:     drivers/reset/reset-mpfs.c
>   F:     drivers/rtc/rtc-mpfs.c
> -F:     drivers/soc/microchip/
> +F:     drivers/soc/microchip/mpfs-sys-controller.c
>   F:     drivers/spi/spi-microchip-core-qspi.c
>   F:     drivers/spi/spi-microchip-core.c
>   F:     drivers/usb/musb/mpfs.c
>   F:     include/soc/microchip/mpfs.h
> 
> +RISC-V MISC SOC SUPPORT
> +M:     Conor Dooley <conor@kernel.org>
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +Q:     https://patchwork.kernel.org/project/linux-riscv/list/
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     Documentation/devicetree/bindings/riscv/
> +F:     arch/riscv/boot/dts/
> +
>   RNBD BLOCK DRIVERS
>   M:     Md. Haris Iqbal <haris.iqbal@ionos.com>
>   M:     Jack Wang <jinpu.wang@ionos.com>
> @@ -18781,7 +18796,6 @@ M:      Palmer Dabbelt <palmer@dabbelt.com>
>   M:     Paul Walmsley <paul.walmsley@sifive.com>
>   L:     linux-riscv@lists.infradead.org
>   S:     Supported
> -T:     git https://github.com/sifive/riscv-linux.git
>   N:     sifive
>   K:     [^@]sifive
> 
> @@ -18800,6 +18814,13 @@ S:     Maintained
>   F:     Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>   F:     drivers/dma/sf-pdma/
> 
> +SIFIVE SOC DRIVERS
> +M:     Conor Dooley <conor@kernel.org>
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     drivers/soc/sifive/
> +
>   SILEAD TOUCHSCREEN DRIVER
>   M:     Hans de Goede <hdegoede@redhat.com>
>   L:     linux-input@vger.kernel.org
> --
> 2.37.2
> 

-- 
Nicolas Ferre

