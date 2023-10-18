Return-Path: <SRS0=KKNx=GA=sifive.com=samuel.holland@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6EECDB474
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 02:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8566C433C9; Wed, 18 Oct 2023 02:36:27 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBFE9C433C8
	for <soc@kernel.org>; Wed, 18 Oct 2023 02:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBFE9C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-458289fb60bso632584137.0
        for <soc@kernel.org>; Tue, 17 Oct 2023 19:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697596586; x=1698201386; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1hQUSC6F9AFhvyb/xCilKIC0FwjPecefxnGiwvigfQo=;
        b=K3XqgxBM6FGXw8wE5FKVIrCtLTKXMpL0xvxqUQ5d6JlbQ5goNJzRF62+eVaE58Mml1
         LPI8xYcMFP9W2nW0xtFipWkkV2/LPmZLpLnIqmx+eUE+ZOKPAjvczyzmzsuYia6r5x43
         YQxU/i12VufS0k6SehuBgE15ac8B3hJpcAjvVhAZWexr7HdUByx/+UDQyG4TBCai2zor
         xx5RWZ2hrmyPF5PSoKgpnXxKaLwyO/RfoGa5fLVvBxwvcXO6wie+i3i4FR5qRSxpu2X0
         isY0Bt3gM36qaiM0hRL0AKK43+8erOdqgz9HmFFHDCeHWaIWMghFvvRS5jY6slY/j6PQ
         X6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697596586; x=1698201386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hQUSC6F9AFhvyb/xCilKIC0FwjPecefxnGiwvigfQo=;
        b=ZpqKEPG1ol2aPt967nBIr2TCaATqiTj59kXqgS16u8Bkh6J9/cio+eyhxXS+LwO5Tt
         EOyp3anyl7j2v7sw5/i3FdO+l36stWioxJG1N8wg/IA+gVEKtkceHwzfnxieR6HU6PjW
         5s2BwgRqyrPzN/WGQoQnr284Mn4+exH7E3gWd0KVHX2FcrQ6mjQmoNHbuDX0KiPvZ/v5
         KrXHE5a4yfc3efrxEQmLr0A+MPf5G23dp50vbzK47i2UIJqSS6O0gCVgn4rQPgOVj/gj
         85tnWw1SwySDPa0VdK8JgJZzE/kjvzkbCE+RWL2ji+AJJ8QWESeCqF0HdLwaAGHC50KE
         oogA==
X-Gm-Message-State: AOJu0YzgsuAR/CZNxaJUB1dOXATBH5ojepX6MM4fv/CLdx9k5e57sX5F
	4vZqRyo1j9r7ETXLGnOkOyQT3g==
X-Google-Smtp-Source: AGHT+IGB3G4DPZs6jCzWa2l4tyot1REVVzMZ1DTbbM5dTMuW4mJZGqL+sHBYO3aIbBTBJypIWm04PA==
X-Received: by 2002:a67:c10b:0:b0:452:82ff:e76 with SMTP id d11-20020a67c10b000000b0045282ff0e76mr4377909vsj.13.1697596585740;
        Tue, 17 Oct 2023 19:36:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:95cc:ccc5:95bc:7d2c? ([2600:1700:2000:b002:95cc:ccc5:95bc:7d2c])
        by smtp.gmail.com with ESMTPSA id t6-20020a0cf986000000b00641899958efsm1017131qvn.130.2023.10.17.19.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 19:36:25 -0700 (PDT)
Message-ID: <39aef189-4eca-44aa-8877-9fcf547f3282@sifive.com>
Date: Tue, 17 Oct 2023 21:36:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from
 RISCV_ISA_ZICBOM
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231017135926.1240101-1-hch@lst.de>
 <20231017135926.1240101-3-hch@lst.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231017135926.1240101-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-10-17 8:59 AM, Christoph Hellwig wrote:
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0ac0b538379718..9c48fecc671918 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
> -	select DMA_DIRECT_REMAP if MMU

This breaks ERRATA_THEAD_CMO, which also needs a `select DMA_DIRECT_REMAP`:

riscv64-unknown-linux-gnu-ld: kernel/dma/direct.o: in function `.L131':
direct.c:(.text+0x42a): undefined reference to `arch_dma_alloc'
riscv64-unknown-linux-gnu-ld: kernel/dma/direct.o: in function `.L192':
direct.c:(.text+0x592): undefined reference to `arch_dma_free'

>  config RISCV_NONSTANDARD_CACHE_OPS
>  	bool
> @@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	select RISCV_DMA_NONCOHERENT
> +	select DMA_DIRECT_REMAP
>  	help
>  	   Adds support to dynamically detect the presence of the ZICBOM
>  	   extension (Cache Block Management Operations) and enable its

