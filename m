Return-Path: <SRS0=gJAr=HJ=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BB8C433DB
	for <soc@archiver.kernel.org>; Sun,  7 Feb 2021 08:05:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 92EAE64E8F; Sun,  7 Feb 2021 08:05:17 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE6D64E02;
	Sun,  7 Feb 2021 08:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE6D64E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DE2DE41DF4;
	Sun,  7 Feb 2021 08:05:09 +0000 (UTC)
Subject: Re: [PATCH 04/18] arm64: Kconfig: Introduce CONFIG_ARCH_APPLE
To: Marc Zyngier <maz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-5-marcan@marcan.st> <87k0rll4i8.wl-maz@kernel.org>
From: Hector Martin 'marcan' <marcan@marcan.st>
Message-ID: <6eabfdb7-826d-a07e-33a9-3f1e75039272@marcan.st>
Date: Sun, 7 Feb 2021 17:05:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87k0rll4i8.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 06/02/2021 22.17, Marc Zyngier wrote:
>> +config ARCH_APPLE
>> +	bool "Apple Silicon SoC family"
>> +	select GENERIC_IRQ_CHIP
> 
> nit: This is better selected by the interrupt controller that relies
> on the generic irqchip infrastructure.

Ack, changed for v2.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
