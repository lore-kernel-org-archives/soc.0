Return-Path: <SRS0=oAIR=NF=lists.freedesktop.org=dri-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654B3C4338F
	for <dri-devel@archiver.kernel.org>; Sat, 14 Aug 2021 05:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D73461028
	for <dri-devel@archiver.kernel.org>; Sat, 14 Aug 2021 05:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D73461028
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729286E484;
	Sat, 14 Aug 2021 05:27:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10F06E484
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Aug 2021 05:27:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFC24604D7;
 Sat, 14 Aug 2021 05:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628918842;
 bh=FfRuxcqn1OrFABoLEqpZPW5Ek4gS/Hm5r3EkPT4kRp0=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=JoNUtO/mIMkWMMEm4g6JJ5vQgndQ8gDVSVN1KaHzrVsW4JpBg++YHtHdxDeEDFY8h
 k+VZZSxr2iNous5mpBN9iaEi0WBKk2OEmetHoS2wYdLgsyZ4JUULHYR99KIDuyD/xl
 I7kkq+1ONUV9kTF5d6K1Yc7eux8B3rRDUdqWzcEoknNg4uiY/Zrr0EDOeeak6PX6Xk
 3tAM8jAaAG2JSbyWOxCWR+YDTqipHCcrSR3GVUum5fZXwqraJu+W72KKkNa7Y1IjX2
 6FGhQywTDsSHVZr356ijA1NoqMqs/Cqo+rttPn5IP0mGBb0hRZbaQBBtClSvCxh4P/
 LuIQjZb7CoRpw==
Date: Sat, 14 Aug 2021 13:27:15 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v34 0/3] Mainline imx6 based SKOV boards
Message-ID: <20210814052715.GW30984@dragon>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804043439.11757-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Message-ID: <20210814052715.ivyv8NQWgZIqGVuSrWMF0mYitsy18x6tECPFs-bbgQc@z>

On Wed, Aug 04, 2021 at 06:34:36AM +0200, Oleksij Rempel wrote:
> changes v4:
> - add vref-supply to adc@0
> - split gpio assignment for the mdio node
> 
> changes v3:
> - drop panel bindings patches, it is already in drm-misc-next
> - remove some new lines
> - reorder compatibles at the start of the nodes
> - use lowercase for hex value
> - add enable-active-high to the regulator-vcc-mmc-io and fix MMC voltage
>   configuration.
> 
> changes v2:
> - remove unnecessary newlines.
> - change linux,wakeup to wakeup-source
> - change switch@3 unit-address to @0
> - sort aliases alphabetically
> 
> Mainline imx6 based DTs for SKOV A/S boards
> 
> Oleksij Rempel (2):
>   dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
>   dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards
> 
> Sam Ravnborg (1):
>   ARM: dts: add SKOV imx6q and imx6dl based boards

Applied, thanks!
