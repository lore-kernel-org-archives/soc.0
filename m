Return-Path: <SRS0=AMt0=NF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E0CC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Aug 2021 05:28:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3226F60F14
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Aug 2021 05:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3226F60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2O3oY0wcQceRk/x7ujc2OZG2B5dzFMvd1MHLtIddN00=; b=t2iRKt48XIrBXV
	B3kzyiJM65RAMEizumzr45/tlMixAfrBlwgolCC9DuPne37NBlCCRFCdTDEIz1HJD56RVBfXxr6O/
	Dc6raVKwhUy1DnuBfya6fYqX2P5pLxJr45Uqr2qvpO4TL4FDKtX2tfSFqJ6D8dDsDd59eDI9J4Ccv
	6QLOt+++zXpLRe+/TpX5mFsGAJRGzpVjQ03Eczl4Odps7HaIUq2mlG+coQ02KX1NXr38TDZBd+FMU
	xRTZi0VvDeEHmgM+QFdCMHAgu92bLYpT3b5X0xLenBxk/iULnfW7pSf1n+4pP/iF5iKoeF6cO8UyY
	jvmIHq9GzIhb3mU/fTvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEmCc-00Dt9K-DE; Sat, 14 Aug 2021 05:27:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEmCY-00Dt8m-T4
 for linux-arm-kernel@lists.infradead.org; Sat, 14 Aug 2021 05:27:24 +0000
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
Content-Disposition: inline
In-Reply-To: <20210804043439.11757-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_222722_999540_B429CF0C 
X-CRM114-Status: GOOD (  11.14  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210814052715.oI9tmQJ_26FTLBY1oRDqbjoY9aJoJQCcu5IrtiQnflc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
