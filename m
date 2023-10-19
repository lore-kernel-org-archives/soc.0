Return-Path: <SRS0=dpSX=GB=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC14CDB465
	for <soc@archiver.kernel.org>; Thu, 19 Oct 2023 11:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1EA4C433CA; Thu, 19 Oct 2023 11:30:06 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BE61C433C8;
	Thu, 19 Oct 2023 11:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3BE61C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e861907.versanet.de ([94.134.25.7] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qtRE1-0003Dq-9D; Thu, 19 Oct 2023 13:30:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] Rockchip driver changes for 6.7
Date: Thu, 19 Oct 2023 13:30:00 +0200
Message-ID: <2171043.Icojqenx9y@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Arnd, Kevin, Olof,

I still see the driver pull request pending in the soc patchwork,
so opted to replace the tag with this one.

The only difference is the addition of one new compatible for the
rk3588's pmugrf.

Please pull
Thanks
Heiko


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.7-rockchip-drivers1

for you to fetch changes up to 3bd1c0c62bad8ea7f9cc6662e754f77ec8baa46e:

  dt-bindings: soc: rockchip: grf: add rockchip,rk3588-pmugrf (2023-10-19 1=
0:52:13 +0200)

=2D---------------------------------------------------------------
Converting the io-domain driver to the new remove callback
and addition of the rk3588 pmugrf compatible to the binding.

=2D---------------------------------------------------------------
Sascha Hauer (1):
      dt-bindings: soc: rockchip: grf: add rockchip,rk3588-pmugrf

Uwe Kleine-K=F6nig (1):
      soc/rockchip: io-domain: Convert to platform remove callback returnin=
g void

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 drivers/soc/rockchip/io-domain.c                        | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)



