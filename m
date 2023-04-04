Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91887C6FD1D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77A7FC433D2; Tue,  4 Apr 2023 08:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A0DC433EF;
	Tue,  4 Apr 2023 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680596652;
	bh=7vKCr/wx0D/pzTc4HtD4pB/VjmT6FF2fybgVyJGND3w=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=X/VmBgVLTL/6OlmX+DDX269i2Mufj2DETYS6+3ifyrKm5OpVjNd/3siwGG2uL6ofo
	 sdyLd55QreOaZHhBSOAykIti3xRWus3jvPfL8RqLXRhyMMQfQ/gm01E/cjcllmtpUI
	 9Mzpbd73kDAQe28bt3RLSQ2L2Tz5l4g8jcu9pJcuekxAQTf16+F/pCBc77jmQ6v0Ij
	 U3RwHJLaZ4hql0OzNE3xgJy+kPdghtKXBCJFmMcp8/zF2g89zZWeEsZ+ZFSUjC86o5
	 T3BrDQLMM9HKmOZ2nO8i4Qfm3F9KS5FaJBO8RimVA+ZoRx9+5jhQLf0oR4DKgQGr2K
	 rT+JfxB8qPNmQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Bartosz Golaszewski" <brgl@bgdev.pl>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Linus Walleij" <linus.walleij@linaro.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 0/3] p54spi devicetree conversion
Date: Tue,  4 Apr 2023 10:23:58 +0200
Message-Id: <20230404082401.1087835-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

I now revisited the earlier submission, hopefully addressing
all of the feedback correctly. This is still untested, but if
everyone is happy, it could still make it into v6.4.

Patch 3 touches both driver and platform parts, and can't
easily be split up without breaking bisectability, so I think
it's easiest to merge it through the soc tree, with Christian's
Ack.

Tony, I see you already sent a set of pull requests, let me know
if you want to pick up these patches for a future round (6.4
or 6.5), or if I should just apply them on top.

Link: https://lore.kernel.org/all/20230314163201.955689-1-arnd@kernel.org/
---
Changes in v2:

 - split into three patches
 - reverse polarity of power(down) gpio
 - clean up binding

Arnd Bergmann (3):
  dt-bindings: net: add st,stlc45xx
  ARM: dts: omap2: add stlc4560 spi-wireless node
  p54spi: convert to devicetree

 .../bindings/net/wireless/st,stlc45xx.yaml    | 58 +++++++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/omap2.dtsi                  |  4 ++
 arch/arm/boot/dts/omap2420-n8x0-common.dtsi   | 12 ++++
 arch/arm/mach-omap2/board-n8x0.c              | 18 -----
 drivers/net/wireless/intersil/p54/p54spi.c    | 71 +++++++------------
 drivers/net/wireless/intersil/p54/p54spi.h    |  3 +
 7 files changed, 104 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml

-- 
2.39.2

Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>
Cc: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Benoît Cousson" <bcousson@baylibre.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>,
Cc: "David S. Miller" <davem@davemloft.net>
Cc: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Eric Dumazet" <edumazet@google.com>
Cc: "Felipe Balbi" <balbi@kernel.org>
Cc: "Jakub Kicinski" <kuba@kernel.org>
Cc: "Johannes Berg" <johannes@sipsolutions.net>
Cc: "Kalle Valo <kvalo@kernel.org>"
Cc: "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Paolo Abeni" <pabeni@redhat.com>
Cc: "Rob Herring" <robh+dt@kernel.org>
Cc: "Tony Lindgren" <tony@atomide.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-omap@vger.kernel.org


