Return-Path: <SRS0=X5cN=24=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49989ECAAA1
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 20:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F06DC433D7; Thu, 27 Oct 2022 20:14:19 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D4D1C433C1;
	Thu, 27 Oct 2022 20:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D4D1C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oo9GT-000329-74; Thu, 27 Oct 2022 22:14:09 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: kever.yang@rock-chips.com, Johan Jonker <jbx6244@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com, hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/4] dt-bindings: timer: rockchip: add rockchip,rk3128-timer
Date: Thu, 27 Oct 2022 22:14:08 +0200
Message-ID: <4123966.kQq0lBPeGt@diego>
In-Reply-To: <939d9e2c-4431-5408-5884-12d328b6a4f2@gmail.com>
References: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com> <939d9e2c-4431-5408-5884-12d328b6a4f2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 27. Oktober 2022, 02:52:35 CEST schrieb Johan Jonker:
> Add rockchip,rk3128-timer compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> index dc3bc1e62..b61ed1a43 100644
> --- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> @@ -18,6 +18,7 @@ properties:
>            - enum:
>                - rockchip,rv1108-timer
>                - rockchip,rk3036-timer
> +              - rockchip,rk3128-timer
>                - rockchip,rk3188-timer
>                - rockchip,rk3228-timer
>                - rockchip,rk3229-timer
> --
> 2.20.1
> 
> 




