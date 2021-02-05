Return-Path: <SRS0=V1Ej=HH=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABACDC433DB
	for <soc@archiver.kernel.org>; Fri,  5 Feb 2021 09:45:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 72ADE64FB9; Fri,  5 Feb 2021 09:45:27 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3490864FB4;
	Fri,  5 Feb 2021 09:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3490864FB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id BAE04419B4;
	Fri,  5 Feb 2021 09:45:21 +0000 (UTC)
Subject: Re: [PATCH 15/18] irqchip/apple-aic: Add support for the Apple
 Interrupt Controller
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210204203951.52105-16-marcan@marcan.st>
 <202102051046.OZkKg9aB-lkp@intel.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Message-ID: <3f169c3a-ac50-e9f7-e9ea-84c954af0daa@marcan.st>
Date: Fri, 5 Feb 2021 18:45:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <202102051046.OZkKg9aB-lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

On 05/02/2021 11.27, kernel test robot wrote:
> config: arc-allyesconfig (attached as .config)

This is never going to build on !ARM64 since it uses ARM64 registers, so 
removing COMPILE_TEST for v2.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
