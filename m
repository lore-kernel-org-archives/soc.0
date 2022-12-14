Return-Path: <SRS0=zzY2=4M=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6BAC001B2
	for <soc@archiver.kernel.org>; Wed, 14 Dec 2022 14:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A55FFC433D2; Wed, 14 Dec 2022 14:27:12 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58964C433F2;
	Wed, 14 Dec 2022 14:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58964C433F2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p5Sis-00050J-MP; Wed, 14 Dec 2022 15:27:02 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>,
	kever.yang@rock-chips.com
List-Id: <soc.lore.kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hjc@rock-chips.com,
	zhangqing@rock-chips.com,
	krzysztof.kozlowski+dt@linaro.org,
	philipp.tomsich@vrull.eu,
	soc@kernel.org,
	tglx@linutronix.de,
	daniel.lezcano@linaro.org,
	arnd@arndb.de,
	linux-rockchip@lists.infradead.org,
	sjg@chromium.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v2 0/4] Add basic Rockchip rk3128 DT support
Date: Wed, 14 Dec 2022 15:26:59 +0100
Message-Id: <167102796007.2796496.11503501153122031880.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <e83964fe-ad87-0905-4586-e235757c6b2b@gmail.com>
References: <e83964fe-ad87-0905-4586-e235757c6b2b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 28 Oct 2022 16:39:04 +0200, Johan Jonker wrote:
> Add basic Rockchip rk3128 DT support.
> 
> Features:
>   Quad-core ARM Cortex-A7MP Core processor
>   Clock & reset unit
>   Power management unit
>   Interrupt controller
>   DMAC
>   6x 64 bits Timers
>   4x PWMs
>   1x 32 bits watchdog
> 
> [...]

Applied for 6.3, thanks!

[1/4] dt-bindings: arm: rockchip: Add Rockchip RK3128 Evaluation board
      commit: a1392d5ac60864a3682c447fe62392eb56e9d93b
[3/4] ARM: dts: rockchip: add rk3128.dtsi
      commit: 9ef609cbdbf7a45599b0c9c21e9e7d2ae625896f
[4/4] ARM: dts: rockchip: add rk3128-evb.dts
      commit: 7232dafab89ac23b570d0adb3402164719fcbe3d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
