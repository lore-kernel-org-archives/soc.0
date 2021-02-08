Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCDDC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 23:23:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CC3E864E82; Mon,  8 Feb 2021 23:23:55 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B94664E75;
	Mon,  8 Feb 2021 23:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B94664E75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 66B1B4207F;
	Mon,  8 Feb 2021 23:23:50 +0000 (UTC)
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st>
 <20210208105451.yumjjunjeyrglfnw@kozik-lap>
 <11d36c47-45c6-03ee-2d08-6692b5d0e241@marcan.st>
 <20210208183721.4gc7vyfgtpk7nch3@kozik-lap>
From: Hector Martin <marcan@marcan.st>
Message-ID: <d9ab5faa-5c04-00a2-a560-ff01f14afcc6@marcan.st>
Date: Tue, 9 Feb 2021 08:23:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208183721.4gc7vyfgtpk7nch3@kozik-lap>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 09/02/2021 03.37, Krzysztof Kozlowski wrote:
> Looking at Greg's comment, we can get rid of the PORT_ stuff entirely.
> First of all, PORT_S3C2410 == PORT_S3C2412, so this define is not
> accurate.
> 
> This leaves us with three types (s3c2400, s3c2440, s3c6410 and Apple).
> The s3c2440 could be removed with adding a new "ucon_mask" field to
> s3c24xx_serial_drv_data.
> 
> This would end with s3c24xx, s3c6410 and Apple - quite nice choice.

Works for me :)

> You're right. This one would have to be improved before your change.
> Instead of replacing specific op calls in startup, I think it's better
> to have entirely separate ops instance for each variant:
> 
> static const struct uart_ops s3c24xx_serial_ops;
> static const struct uart_ops s3c64xx_serial_ops;
> static const struct uart_ops s5l_serial_ops;
> 
> This allows to add a "const", since uart_port takes such const pointer.
> 
> Still during s3c24xx_serial_probe() correct ops would have to be
> assigned, but at least all ops are easily visible.

Roger, will do this for v2.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
