Return-Path: <SRS0=vM1f=3O=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB66C433FE
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 19:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23C49C433B5; Mon, 14 Nov 2022 19:45:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EC37C433D6
	for <soc@kernel.org>; Mon, 14 Nov 2022 19:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3EC37C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pj1-f46.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso11746513pjc.2
        for <soc@kernel.org>; Mon, 14 Nov 2022 11:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yrDwPwm83Gsd8MHtP5CTPBx61olTD3WwjbzbhCn5CU=;
        b=bmpJHazTG2M58Com07n6mhACwU8N4zkHdpZ1uT5MKUhjJgviuO0pNnQ66Y0z8CGvIK
         pmQTe5FG5dMMafxXK7YZACoLCqiG/Db6I9ID0t9ZGnjn+XZDFkS28vs4Sg2QfDqpe0sM
         td4IpNxcooPmOB3VwKukzQOd5OflrE8y7fLPzIfvNNCCuKB+sWLFJOJ7B3ZBonCRnEsQ
         dLRT+HzMk63o+34AEpk7ZYzBouOqmse0ALpLSMyyvGuePWqrPbIL25UeTQabs8QT3N82
         9gjdt34Jm1PS/0DqPEs1HNd9hnQDia57JqbAyGDU8yA6IdM1vM7lv3LDhYvQcOpfw+wM
         U61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yrDwPwm83Gsd8MHtP5CTPBx61olTD3WwjbzbhCn5CU=;
        b=AhNtrZEluBxRaAFaqW4v8XECqEtGt9aR8U1XKczjKET4/ROMAO3BXSovWR2e0qgGo1
         0Y9lb+lXCtr+8HZOQMJ5/Z4ipbf0dLeUcUSDvMsH8whmXS4/qB5vCCT8mcChK4UkPxZB
         ufDtQ0+951CE5vJIdtlhUXglgNsI1OdisC+En+68GpCRts/Vm6uA9Q2izKy7ltbirGwq
         CuH8gVLl2ebz8V9qevQKi1kIpoif9NODfiKjVYBY6ZzGBtwEwMO5U/jcHePBmAmmB58F
         tzuSk8E8+rR9yFjKxaqNz+Kh29O4nWP5ZyM0fRn1UoK9u5BUjM7txXGCZI1ngaZOxGxs
         aYrg==
X-Gm-Message-State: ANoB5pnhvN6k8Ow18CN3+wM8SABzNxgxAFJJ+h+irii+7cgKTpDztkLk
	5cVB7cZUs73XEpm/DkgjMbUTEA==
X-Google-Smtp-Source: AA0mqf55AAw7qDrbDesrQK7sJCvApOkyqnD+kAhD+9HMAXoCAlL5/GcCPeh4vOxFf6nB7tetNaAUKA==
X-Received: by 2002:a17:90a:af92:b0:212:e307:b59f with SMTP id w18-20020a17090aaf9200b00212e307b59fmr15390020pjq.208.1668455097479;
        Mon, 14 Nov 2022 11:44:57 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id mp14-20020a17090b190e00b0020ae09e9724sm6841941pjb.53.2022.11.14.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:44:56 -0800 (PST)
Date: Mon, 14 Nov 2022 11:44:56 -0800 (PST)
X-Google-Original-Date: Mon, 14 Nov 2022 11:44:52 PST (-0800)
Subject:     Re: [PATCH v1 1/4] MAINTAINERS: add entries for misc. RISC-V SoC drivers and devicetrees
In-Reply-To: <20221109212219.1598355-2-conor@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: kernel@esmil.dk, Arnd Bergmann <arnd@arndb.de>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, nicolas.ferre@microchip.com, soc@kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-d094b0d1-e4cc-451f-81a7-266805b22105@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 09 Nov 2022 13:22:17 PST (-0800), Conor Dooley wrote:
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
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> Link: https://lore.kernel.org/linux-riscv/mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 046ff06ff97f..b88ced1ff72c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13627,6 +13627,12 @@ S:	Supported
>  F:	drivers/misc/atmel-ssc.c
>  F:	include/linux/atmel-ssc.h
>
> +MICROCHIP SOC DRIVERS
> +M:	Conor Dooley <conor@kernel.org>
> +S:	Supported
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	drivers/soc/microchip/
> +
>  MICROCHIP USB251XB DRIVER
>  M:	Richard Leitner <richard.leitner@skidata.com>
>  L:	linux-usb@vger.kernel.org
> @@ -17749,12 +17755,21 @@ F:	drivers/mailbox/mailbox-mpfs.c
>  F:	drivers/pci/controller/pcie-microchip-host.c
>  F:	drivers/reset/reset-mpfs.c
>  F:	drivers/rtc/rtc-mpfs.c
> -F:	drivers/soc/microchip/
> +F:	drivers/soc/microchip/mpfs-sys-controller.c
>  F:	drivers/spi/spi-microchip-core-qspi.c
>  F:	drivers/spi/spi-microchip-core.c
>  F:	drivers/usb/musb/mpfs.c
>  F:	include/soc/microchip/mpfs.h
>
> +RISC-V MISC SOC SUPPORT
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	Documentation/devicetree/bindings/riscv/
> +F:	arch/riscv/boot/dts/
> +
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
> @@ -18781,7 +18796,6 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> -T:	git https://github.com/sifive/riscv-linux.git
>  N:	sifive
>  K:	[^@]sifive
>
> @@ -18800,6 +18814,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>  F:	drivers/dma/sf-pdma/
>
> +SIFIVE SOC DRIVERS
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	drivers/soc/sifive/
> +
>  SILEAD TOUCHSCREEN DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	linux-input@vger.kernel.org

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!
