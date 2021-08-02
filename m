Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B6FC4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:32:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9520360FC1; Mon,  2 Aug 2021 13:32:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F40861029;
	Mon,  2 Aug 2021 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911173;
	bh=O6uto0DlYXqCQqQb66wSlu49Q+/+1O5wXTpmlkHf7qY=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=MwkXUCH3i6xdHYOYGZu26AzBMsYK2pnCZGDkg8D80TLZ4wEqB+Qde6tCNS3ZO7cxT
	 D0rZ7TtdeS0O12PGfOiXncCQ7ULhxAVG6i6ghjeo2NfitYtuOwyeEVtZx7hJpSqXFg
	 aAVoCyYFiNght49QizNf34ddEg5syGGtqsPGzHumlTFN4+P5MPpulRhe7HmZQxI7Z5
	 UKuocgwOm4wTw3fTChUNlxtSaUcZ6PyG//Ty7374FVsKiUm1eXTXzpSbQBvVLIuzx5
	 1CEjwk1q1gHO/kE9caswNSxuESDgJwaAGswXs7XC5764sugNgDWAllsbWqLoagyJdO
	 OjEP+khpISfwA==
From: Arnd Bergmann <arnd@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] [SUBMITTED 20210721] ARM: ixp4xx: fix compile-testing soc drivers
Date: Mon,  2 Aug 2021 15:32:39 +0200
Message-Id: <162791113519.1139989.827524355147954573.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721211412.3537004-1-arnd@kernel.org>
References: <20210721211412.3537004-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 21 Jul 2021 23:13:43 +0200, Arnd Bergmann wrote:
> Randconfig builds on the ixp4xx ethernet driver showed that the qmgr and
> npe drivers are not actually built even when compile testing is enabled:
> 
> ERROR: modpost: "qmgr_stat_empty" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "qmgr_enable_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "qmgr_set_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "__qmgr_request_queue" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "npe_send_recv_message" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "npe_recv_message" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "npe_load_firmware" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "npe_running" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "qmgr_disable_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> ERROR: modpost: "qmgr_stat_below_low_watermark" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] ARM: ixp4xx: fix compile-testing soc drivers
      commit: 7f94b69ece515ac82defa60ef7cba2cf26180216

       Arnd
