Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC54DC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 23:22:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B015164E99; Mon,  8 Feb 2021 23:22:30 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04AF264E31;
	Mon,  8 Feb 2021 23:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04AF264E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 0E26B4207F;
	Mon,  8 Feb 2021 23:22:23 +0000 (UTC)
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <73116feaa00de9173d1f2c35ce16e08f@kernel.org>
 <7adf8ede-f7ff-7c62-d0fd-9ab4eaf25741@marcan.st> <YCFq3DqOzv4//6Vw@kroah.com>
From: Hector Martin <marcan@marcan.st>
Message-ID: <88ed59d8-e18b-c04c-c164-6b15b7c3e390@marcan.st>
Date: Tue, 9 Feb 2021 08:22:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCFq3DqOzv4//6Vw@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 09/02/2021 01.46, Greg Kroah-Hartman wrote:
> I HATE adding new PORT_ types, as I am almost positive no one uses them,
> but as they are in the uapi files, we can't delete them.
> 
> So, just use an existing one, why do you want a new one?  If you don't
> have a userspace tool that requires it, don't bother.
> 
> Just use PORT_8250 and be done with it.  I should force all new drivers
> to use that as well :)

Krzysztof: given this, I think it would be fair to add an enum to the 
driver to keep track of the actual hardware type (grouped into probably 
just 3, S3C24XX, S3C6400, APPLE), get rid of any code in there that 
cares about the uapi-visible port type (other than setting it correctly 
for those that do exist, to maintain current behavior), and just make 
everything else use PORT_8250 for that?

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
