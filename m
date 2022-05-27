Return-Path: <SRS0=/f1H=WD=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9E1C433F5
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 18:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 646CDC34113; Fri, 27 May 2022 18:25:42 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79953C385A9;
	Fri, 27 May 2022 18:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79953C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nueeZ-0005Db-QP; Fri, 27 May 2022 20:25:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.19 #2
Date: Fri, 27 May 2022 20:25:39 +0200
Message-ID: <4496518.OBFZWjSADL@phil>
In-Reply-To: <4288609.taCxCBeP46@phil>
References: <4288609.taCxCBeP46@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 17. Mai 2022, 21:36:09 CEST schrieb Heiko Stuebner:
> The following changes since commit bc405bb3eeee4b711830ab569e7f3811b92196ab:
> 
>   arm64: dts: rockchip: enable otg/drd operation of usb_host0_xhci in rk356x (2022-05-11 06:09:55 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts64-2
> 
> for you to fetch changes up to 17c0c5b67353b26a46611cffffd80aadd7215cfa:
> 
>   arm64: rockchip: add clocks property to cru node rk3368 (2022-05-17 21:08:49 +0200)

superseeded by v2.



