Return-Path: <SRS0=BEuJ=FX=public-files.de=frank-w@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F173E95A91
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 13:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4222C433C7; Mon,  9 Oct 2023 13:34:05 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1720C433C9;
	Mon,  9 Oct 2023 13:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1720C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=public-files.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1696858422; x=1697463222; i=frank-w@public-files.de;
 bh=ytxZPHe6tFONDf+5l4xYRtY+76c88p10P1MBcS5kg14=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EwF2aOmzUfyYGAJ5PWznBQYEWjrJxre/BRBPGX7odNzHyDZ3G9B8dVLwCWzEVi/E6EiqdEoe7AS
 cHlVLuql82R0MKYtCIC+Nht3j+dy9F6j8yQEDChceoBQ06IXNOLLHXFUjG/reJ4uyh5uDlbgSLSVN
 8QT5RbgaRRYchsLBBTAbZZbgyhlalHIPF2agOVps2agSBSNOPmHR2N2nIUdxstIdzWp8nXuYIuO3+
 BXtm4pe+RsXlgPq+pH/NIuhsIcFM9R+WEcQTs4REgNQ8pA6h4kk6EuZXSgZjVt8YZT76WA015go6Q
 Oazy3S8IwME8iP43GnGAgot0ReQCN2SlGtZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.151.237] ([217.61.151.237]) by web-mail.gmx.net
 (3c-app-gmx-bap21.server.lan [172.19.172.91]) (via HTTP); Mon, 9 Oct 2023
 15:33:42 +0200
MIME-Version: 1.0
Message-ID: <trinity-67cbdf3b-6a3b-4f29-ae8b-c54e46378faa-1696858422016@3c-app-gmx-bap21>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Macpaul Lin
 <macpaul.lin@mediatek.com>, =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?=
 <nfraprado@collabora.com>
Subject: Aw: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
Content-Type: text/plain; charset=UTF-8
Date: Mon, 9 Oct 2023 15:33:42 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
References: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:lCSM5Yw7IuQWy0+3+hYqGhefVjjNqGDemGoIw4ciA/4hYeXLF9rLLC2+AyhFfJPVWtaUs
 ZsPa9j9RFR6r6wdffw6HgAc6sApX93yqUMBMC0oLzyDLkw1wzbfKbJXzsflbyuNqRARTtcb8iU5P
 URfR/nn+RLIfi8d0Xc6Xrq+o9BU+GqunFYMFwAbKkR0UGN6e+dl0wmaa4QfshDNAJW6+YUFvySjy
 EKvzDiPKFXlFK0HTXr+RzSFJNoqoWkaPHyAamBhc/fe73k9ISpIrU9QJH0P61hk81LyRO+mnFT0n
 fw=
UI-OutboundReport: notjunk:1;M01:P0:9UK90TlX0Xw=;1ZZJMwoEE1VoDa2+Ey/wwivrRD1
 zhoM4igZ6ao5vEv4g23K+Q/eZ8atUnDr6hggbjfw63hsEvrKeo7ldt89YW43W8XtGSaJMUoxR
 AoV6b42VX2ggNl2IIcY1Pfu73eBGbgVrd5fYsvwfjIkAhLJ0RMd6cX6p1BXKsSkDYghSz/eNv
 uhpgknbOEU+mbbsBCOJIq81qP8D2mV6WwO04eIGLj2ng10PUu2i6xAG0StlcIhedOJz+iaApy
 gEYCbwVfXLagGV7K2SrhnS8XeSY2jaK5oCIFwVae38A/Dp0Zrqg0gK92g6s3u/vzSEMIlPbqI
 oEJYB6uRr6lfFI/EAi+xeeDCfm0PZpIr1teqaHoQiKl4nFF9yAf58ZEDUQgEWre47w01rPE1Z
 8Z/EVQCuOjDt1Xs5ybCm7kGNXt85roRBh40QS9/B2uD8/LTKqVSZO1bVFo4ztbZnC2ng/krZt
 USWdx6aDkHDccLbOXQmiSTKKGMJWGQe3Xn4S21wbFee7dNidmQy6p3Y9fHl6W4XGOaUyriR67
 4tI7TN/bwIDVRKXtFxj/Zv2tvpy84beLXlKCe3wM0i2UVP6XBmvNvJIppFsHfU3yRTuusS+GQ
 ScJMgLpoLWiMszmGwM8dHe1VVCkdcMSLB4INudvcJmpG9f6rT0wEjpHNS+rSB2+n2sW7dsZ/5
 vdOtCji+6xUemzh+3Ruk3hKW5wB0RYsJzAFBJT79fVuA7Kbd4kSgC1we016bNGUapTEToLMzO
 2wtEdlRNWRxhQMyvdR7or8wlOykNmhXMcE5PQ1BzCyM11+B0ml5hima67vzmqY1cuNRIaimYM
 4r6I/V0SY36wsZYF0tRkZ4Qg==

Hi,

do you have these 2 series still in view?

https://patchwork.kernel.org/project/linux-mediatek/list/?series=761293
https://patchwork.kernel.org/project/linux-mediatek/list/?series=777712

regards Frank
