Return-Path: <SRS0=DILq=LF=bootlin.com=miquel.raynal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6126EC48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 18:44:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2E95661285; Fri, 11 Jun 2021 18:44:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037F661002;
	Fri, 11 Jun 2021 18:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037F661002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=miquel.raynal@bootlin.com
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EF4E01BF207;
	Fri, 11 Jun 2021 18:43:50 +0000 (UTC)
Date: Fri, 11 Jun 2021 20:43:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, linux-mtd@lists.infradead.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [GIT PULL 2/2] memory: pl353-smc for v5.14
Message-ID: <20210611204325.192ad206@xps13>
In-Reply-To: <20210611140659.61980-2-krzysztof.kozlowski@canonical.com>
References: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
	<20210611140659.61980-2-krzysztof.kozlowski@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Fri,
11 Jun 2021 16:06:59 +0200:

> Hi,
>=20
> Dedicated branch for pl353-smc driver changes.

Thanks for the branch, I'll include it and add the last NAND patches on
top of it.

Thanks,
Miqu=C3=A8l
