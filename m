Return-Path: <SRS0=ELH+=HK=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FD1C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 23:17:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A87E364EA1; Mon,  8 Feb 2021 23:17:13 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 290C864E75;
	Mon,  8 Feb 2021 23:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 290C864E75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 562004207F;
	Mon,  8 Feb 2021 23:17:06 +0000 (UTC)
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
 <20210208102730.p4nhsl35oowsklv2@kozik-lap>
 <20210208173215.GA1567700@robh.at.kernel.org>
 <20210208181248.tbgffdwghlseawic@kozik-lap>
From: Hector Martin <marcan@marcan.st>
Message-ID: <0cbe3536-2415-a2a4-75e6-0e1c6deffd42@marcan.st>
Date: Tue, 9 Feb 2021 08:17:03 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208181248.tbgffdwghlseawic@kozik-lap>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 09/02/2021 03.12, Krzysztof Kozlowski wrote:
> Mentioned grep brings only one result:
> arch/powerpc/platforms/powermac/pic.c:   * cases where the APPL,interrupts property is completely

You want to grep for 'AAPL', not 'APPL' :-)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
