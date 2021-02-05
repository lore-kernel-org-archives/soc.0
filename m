Return-Path: <SRS0=V1Ej=HH=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F099C433DB
	for <soc@archiver.kernel.org>; Fri,  5 Feb 2021 11:35:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F339D64FCC; Fri,  5 Feb 2021 11:35:14 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D1AB64FC9;
	Fri,  5 Feb 2021 11:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D1AB64FC9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3107A41F5F;
	Fri,  5 Feb 2021 11:35:05 +0000 (UTC)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 robh@kernel.org, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, Alexander Graf <graf@amazon.com>,
 Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>
References: <20210204203951.52105-1-marcan@marcan.st>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 00/18] Apple M1 SoC platform bring-up
Message-ID: <d7802d11-ce90-5645-1636-7f75a7a0694f@marcan.st>
Date: Fri, 5 Feb 2021 20:35:03 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 05/02/2021 05.39, Hector Martin wrote:
> This series brings up initial support for the Apple M1 SoC, used in the
> 2020 Mac Mini, MacBook Pro, and MacBook Air models.

Forgot to CC: a few folks involved in the previous related thread, 
sorry! Adding them here, hope everyone got the series via the MLs.

v2 will be CCed to everyone else too.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
