Return-Path: <SRS0=bLPC=HN=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B493BC10DC1
	for <soc@archiver.kernel.org>; Sat,  2 Dec 2023 00:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FA2AC433CB; Sat,  2 Dec 2023 00:44:24 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1339C433C7
	for <soc@kernel.org>; Sat,  2 Dec 2023 00:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1339C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id B91A737943D
	for <soc@kernel.org>; Sat,  2 Dec 2023 00:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wxrRGCbEVmbR for <soc@kernel.org>;
	Sat,  2 Dec 2023 01:45:57 +0100 (CET)
Received: from werkpc.localnet (87-101-2-254.dsl.cambrium.nl [87.101.2.254])
	by mail.rnplus.nl (Postfix) with ESMTPSA id B90863793AD;
	Sat,  2 Dec 2023 01:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1701477956; bh=yRBPEQxU6QTn7AumN8CC7LcN7WuQwY78yyLiGx2740g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=0W7GSsCGwYC8FMG7Ils5SuWyAqyZJGF8bDINj62Wqb53kV2eBh6mstVrI+f4phf/I
	 6FdLKR168fsp2mZBV1EVnedjh6vFwfmvY2DxrSpFNCbAI8h0q9V3+9AREQe7M4IlYx
	 BYCR+gz0WJ2UOmyxJgVaMMPUQBUSTZuGEyDbk2Xg=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
 renze@rnplus.nl
Subject: Re: [PATCH v3 0/2] ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
Date: Sat, 02 Dec 2023 01:44:17 +0100
Message-ID: <12332130.O9o76ZdvQC@werkpc>
In-Reply-To: <20231202003908.3635695-1-renze@rnplus.nl>
References: <20231202003908.3635695-1-renze@rnplus.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello again,

A small addition to my cover letter for v3 of the patch:

I forgot to mention in the changelog from v2 to v3 that I also modified the 
tachometer configuration to correctly map the tachometer inputs to the fan 
headers on the board.

Greetings,
Renze Nicolai

On Saturday, December 2, 2023 1:38:43 AM CET you wrote:
> Hello,
> 
> These patches add a device-tree (and a bindings update) for the
> Aspeed BMC on the ASRock X570D4U, so that it can be added as a
> supported OpenBMC platform.
> 
> Changes since v2:
>   - Renamed leds to led-0 and led-1 to match
> Documentation/devicetree/bindings/leds/leds-gpio.yaml - Added aliasses and
> labels for the i2c-mux on i2c bus 4
>   - Added the missing blank line between the ehci1 and uhci nodes
> 
> Greetings,
> Renze Nicolai
> 
> Renze Nicolai (2):
>   dt-bindings: arm: aspeed: add Asrock X570D4U board
>   ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
> 
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 377 ++++++++++++++++++
>  3 files changed, 379 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts




