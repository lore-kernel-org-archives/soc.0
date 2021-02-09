Return-Path: <SRS0=VmVe=HL=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49079C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 00:32:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0028264EB8; Tue,  9 Feb 2021 00:32:53 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9240B64EA1;
	Tue,  9 Feb 2021 00:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9240B64EA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcan@marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 5BE0441F47;
	Tue,  9 Feb 2021 00:32:47 +0000 (UTC)
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208121325.owjjd7nfbdanszny@kozik-lap>
 <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
 <f98dc238-6742-455e-3f76-e86ae4c0c838@marcan.st>
 <20210208175847.GB1567700@robh.at.kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <cace3b98-b102-ffb7-2fa1-1fa896160774@marcan.st>
Date: Tue, 9 Feb 2021 09:32:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208175847.GB1567700@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit

On 09/02/2021 02.58, Rob Herring wrote:
> I'll also highlight there's a DT only tree[1] available to import DT
> related parts to other projects. It's generated from the kernel tree.
> Probably an overkill to copying at this point though.
> 
> Rob
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/

This actually brings up something else: do we want (eventually) *all* 
Apple boards using these SoCs to have up-to-date devicetrees in the 
Linux kernel tree? Obviously not every device supported by mainline has 
proper ones in, but I don't know if that's expected or something to be 
avoided.

If this is intended to be kept in sync and be fully comprehensive, I 
might as well start planning out our longer term DT maintenance strategy 
around that (which might involve using that tree in our bootloader).

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
