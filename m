Return-Path: <SRS0=KKNx=GA=sifive.com=samuel.holland@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C6ACDB47E
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 18:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D038C433C7; Wed, 18 Oct 2023 18:42:32 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3903EC433C8
	for <soc@kernel.org>; Wed, 18 Oct 2023 18:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3903EC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7789a4c01ddso24509185a.1
        for <soc@kernel.org>; Wed, 18 Oct 2023 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697654550; x=1698259350; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GR7iCsfOqmk/YsQYs6hEpnqdo1XSKWN5VF8toyppFfQ=;
        b=F3EZLXboZo52Je7he+/kwKtPd94xFYVgYH3i5rqL6hmXLL244ipymxirlhLFzrzrjj
         9VkBYdqwj+oXs2V2QKh80r6SXAPr3A/pL5S8bUVolYjdzMlLn6Toz1kYDNyoLPLE2j1R
         7ioVzC6D0S0VXbi/5+dGFiR+RseMtHmUHJa9p1Ml8U9lH30l7YJjK8J8XuoG6ct/uKcp
         4A4idbQ/wC//SZmBGF6agc5rQvKEY2S2AxhutEgH4vsIHJPMXaeygAV55MbasPr4J+P9
         u/6D6cxT+aPBc7EJcaigkxmkmc3mzkMTJb8gDAM/NbMMZeRSKvRJveDy3c7fR1lzQ8WP
         u6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697654550; x=1698259350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GR7iCsfOqmk/YsQYs6hEpnqdo1XSKWN5VF8toyppFfQ=;
        b=G0uEecCUjGzJ4IRr1TfDnwS4XaLHS9nR3DhKJlPPqX6moxdsFmwMWpLgl4/yZ1Jbg6
         tZRYvzNFeVYiCGD6/qmq05d57bVPDlamDJF3Dt/+a793hrV0PTRv610eVrFkYxcNfZUU
         Y3/2ylIPiZM6+zM1fdJZW7+ZVYkduMflaNrwEO2O6AV6ny1eGZnlPpBXG+OpNWv9JqvD
         1i1jMuBrZsv8soPn+cQKshRYIfFzsZvd0x3J08AiGYmE6/oyi8vjqLahFAa9irf8Vtei
         XIfwTfLjc3EbY+TA/eGVcUci8iH2LDGtAwM96FHcThQRUYXkdOgbMl7VGo9VurLmiqoS
         rwIA==
X-Gm-Message-State: AOJu0YwHkvPFWMTymslxQ1UqizRk5IBJubYycNJ8sTQkI3wehUhZ/wKa
	TCXraF08v6IHs6uVlj4J3xe7lg==
X-Google-Smtp-Source: AGHT+IE7GOtHup87DBOstRNLEfBKDd2I9bFSv9NbERsSCQhVnQubPTor0+HCepugXoTa4Xc/jeyWaA==
X-Received: by 2002:a05:620a:4147:b0:777:2aeb:7dfa with SMTP id k7-20020a05620a414700b007772aeb7dfamr29123qko.38.1697654549991;
        Wed, 18 Oct 2023 11:42:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:f59c:efa7:80ec:8da0? ([2600:1700:2000:b002:f59c:efa7:80ec:8da0])
        by smtp.gmail.com with ESMTPSA id qp13-20020a05620a388d00b007770d47c621sm159647qkn.66.2023.10.18.11.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 11:42:29 -0700 (PDT)
Message-ID: <f5b854a2-befb-4649-a448-c1cf95e6ea2b@sifive.com>
Date: Wed, 18 Oct 2023 13:42:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from
 RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
List-Id: <soc.lore.kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20231018052654.50074-1-hch@lst.de>
 <20231018052654.50074-3-hch@lst.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231018052654.50074-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-10-18 12:26 AM, Christoph Hellwig wrote:
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig        | 2 +-
>  arch/riscv/Kconfig.errata | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Tested-by: Samuel Holland <samuel.holland@sifive.com>

