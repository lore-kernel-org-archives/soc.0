Return-Path: <SRS0=dpSX=GB=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7F0CDB483
	for <soc@archiver.kernel.org>; Thu, 19 Oct 2023 11:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7430DC433CA; Thu, 19 Oct 2023 11:30:39 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCE4CC433C8;
	Thu, 19 Oct 2023 11:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DCE4CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e861907.versanet.de ([94.134.25.7] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qtREZ-0003E9-Ni; Thu, 19 Oct 2023 13:30:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip driver changes for 6.7
Date: Thu, 19 Oct 2023 13:30:34 +0200
Message-ID: <2435081.jE0xQCEvom@phil>
In-Reply-To: <2578684.Lt9SDvczpP@phil>
References: <2578684.Lt9SDvczpP@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 16. Oktober 2023, 23:23:50 CEST schrieb Heiko Stuebner:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d=
1d:
>=20
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.7-rockchip-drivers1

I've updated the tag and sent a v2 pull request separately.

Thanks
Heiko

> for you to fetch changes up to 20bd1191830478cfdc9be766a735923c5fbe5350:
>=20
>   soc/rockchip: io-domain: Convert to platform remove callback returning =
void (2023-10-02 00:56:13 +0200)
>=20
> ----------------------------------------------------------------
> Converting the io-domain driver to the new remove callback.
>=20
> ----------------------------------------------------------------
> Uwe Kleine-K=F6nig (1):
>       soc/rockchip: io-domain: Convert to platform remove callback return=
ing void
>=20
>  drivers/soc/rockchip/io-domain.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20




