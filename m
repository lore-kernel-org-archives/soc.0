Return-Path: <SRS0=nmYo=BT=lwn.net=corbet@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433E6C7EE23
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 13:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06AF0C4339B; Tue, 30 May 2023 13:02:39 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D2D0C433EF;
	Tue, 30 May 2023 13:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D2D0C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 165FD5CC;
	Tue, 30 May 2023 13:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 165FD5CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1685451751; bh=3SGbXGOQNzzGuMtucvkj8QS43S18mpeT+xTTD9gRr68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fQLTe/EMkViY19r/dHDcNbZ14XWOlj9BKD73/NwQgPP+qgOQzu6QiIkelbQwXpj3S
	 H1beUZwWf1ho4h4uRVjJ6ByOHdtCN9zXw+WmuLl8WBA7qTwHe4kUiotqquVeJJmfJX
	 +6Eq/Be3Uxp3vxuzEYYd5StIRsHOfYjbwhu9CU0hAEi6OCbPC4vNAJd0n2j//aOhte
	 cI9FdwrwqPvCXBna/YB7M8kToLOgzWlRA6FBDlaopMDy016wrDP6gmrSaxsaFfqPXh
	 vDf7F3ME9XEFq3oRXMEHBBhQ1RO/pAtlagOuf2LQnfbwYtxtZnhwN6rSYNP7cZhSMk
	 2YGJDg55H+4ug==
From: Jonathan Corbet <corbet@lwn.net>
List-Id: <soc.lore.kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org
Cc: conor@kernel.org, conor.dooley@microchip.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 olof@lixom.net, palmer@dabbelt.com, robh+dt@kernel.org, arnd@arndb.de
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
In-Reply-To: <20230530-multiple-whooping-ee5706fceb67@wendy>
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
Date: Tue, 30 May 2023 07:02:26 -0600
Message-ID: <87bki23rbx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain

Conor Dooley <conor.dooley@microchip.com> writes:

> Arnd suggested that adding a maintainer handbook for the SoC "subsystem"
> would be helpful in trying to bring on board maintainers for the various
> new platforms cropping up in RISC-V land.
>
> Add a document briefly describing the role of the SoC subsystem and some
> basic advice for (new) platform maintainers.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - add Krzysztof's suggested method for avoiding inter-branch
>   dependencies
> - explicitly mention that tags should be signed
> - link to the devicetree abi document, rather than trying to explain it
>   here & reword that whole section
> - fix some typos, capitalisation & unify bullet style
>
> The devicetree abi doc feels quite out of date at this point, and could
> probably do with a spring clean - but it also feels like hallowed ground
> on which one should tread lightly, so I won't go near that til Rob is
> back.

So, this is a nit, but worth considering...

>  Documentation/devicetree/bindings/ABI.rst     |   2 +
>  .../devicetree/bindings/writing-schema.rst    |   2 +
>  .../process/maintainer-handbooks.rst          |   3 +-
>  Documentation/process/maintainer-soc.rst      | 178 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  5 files changed, 185 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/process/maintainer-soc.rst
>
> diff --git a/Documentation/devicetree/bindings/ABI.rst b/Documentation/devicetree/bindings/ABI.rst
> index a885713cf184..93ec82f78ae5 100644
> --- a/Documentation/devicetree/bindings/ABI.rst
> +++ b/Documentation/devicetree/bindings/ABI.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> +.. _devicetree-abi:

Somehow we've developed this habit of putting labels at the top of each
file; I really think that they just add clutter and are best left out.
Without the label, this reference:

> +Perhaps one of the most important things to highlight is that dt-bindings
> +document the ABI between the devicetree and the kernel. Please see
> +:ref:`devicetree-abi` more information on the ABI.

...can just be written as "Please see
Documentation/devicetree/bindings/ABI.rst".  The cross-reference link
will be generated as expected, and readers of the plain-text docs don't
have to go grepping to find the reference.

Thanks,

jon
