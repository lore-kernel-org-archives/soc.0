Return-Path: <SRS0=ZThx=H2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759ABC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Feb 2021 10:54:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 116FF64EC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Feb 2021 10:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 116FF64EC9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pascalroeleven.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ZB1VjRXez2TSCFeM4/ADhooqHiWgFSki07YcxuzDqY=; b=FmYpy9QtQ+gVs0Wkj3yGnSk1Tx
	o+ueFATCFFKahc8U8XB7pzfPGegmzi0yqBX/wbCAkKVzrJAsw+qkvHHNuukUSxsdaAExF6b3YcWYE
	eH4gwkjdDn6xsnRPOFeua0mujWVsCEGtjN4xCkMfUeUCfEHfhI38Izwm1qs0Sb4iEa3+ET83J+3BZ
	kujMqab0qqHTtfyT8m92hjhMuNJphd2TQYpoTaYQ4hSHRc070h6465dJcjiUj+IB+N9hp7iOKmlQR
	+OMwlXc7ukuQB7XS300IsN5JEdIw0akGkLZHdjtTlMXV6O9tUY0sFS5JrDd+ZiYvjJRfiNr7Hg2Bs
	f5/4nV/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lErnN-0001uK-Jn; Wed, 24 Feb 2021 10:53:29 +0000
Received: from pmg02-out1.zxcs.nl ([185.104.30.241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lErnH-0001rk-2t
 for linux-arm-kernel@lists.infradead.org; Wed, 24 Feb 2021 10:53:24 +0000
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
 by pmg02.zxcs.nl (ZXCS) with ESMTP id 11E50836CF;
 Wed, 24 Feb 2021 11:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LieaRHuE7NqSgW/06u6/oNTdLnEXxyMsmUNcQJgFjTQ=; b=NJL7ObititnNGhi/HImSRY3BEF
 0+wXpSj/DqIjUVb9gyw7aMtIcWggNPb3JMvv7m2+1wKYzi29Y3dCivsTAO8Aw723ZfldChvZCAmaq
 tLxsgTFP4AGsCuxOTWbDc0BXh8DvGsMf2j1e4OaKe63/MiRpRuRvyhWDyjQnmHCK2qrlTxDaPRI8G
 MkZ8wuBSKCosnn7Q4gBj8kYo6Np8JcpsAgnL1TIM0skvZueYqD93npCDD6nZ9pqevu+akZp9p1aeM
 9f2+zGwrragMWMkLlOy7zzcMKLKMUKeaZ80R1k9o2xjzbCsczOTIaAX6JRrx4hSVeRsgHGbwvt72K
 VoRtydIQ==;
From: Pascal Roeleven <dev@pascalroeleven.nl>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Icenowy Zheng <icenowy@aosc.io>, Martin Cerveny <m.cerveny@computer.org>,
 Corentin Labbe <clabbe@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] Add support for Topwise A721 tablet
Date: Wed, 24 Feb 2021 11:52:38 +0100
Message-ID: <20210224105240.47754-1-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-AuthUser: dev@pascalroeleven.nl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_055323_293285_E31968A0 
X-CRM114-Status: GOOD (  14.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-sunxi@googlegroups.com, Pascal Roeleven <dev@pascalroeleven.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210224105238.xTbYuCLNZWV_nm97oHF0AThIT1BDycHMQTVUnUibjyQ@z>

On request I'm resending the last two patches from the Topwise A721 tablet
series from a year ago as they weren't picked up. The other patches are
already merged, so I didn't resend them.

Changes from v4:
* Reorder nodes alphabetically

Changes from v3:
* Fix DT validation warnings
* Remove leftover labels

Changes from v2:
* Collected acked-by.

Original cover letter:

This series add support for the Topwise A721 tablet and it's display.
It is an old tablet (around 2012) but it might be useful as reference
as the devicetree is pretty complete.

Changes from v1:
* Split into multiple patches
* dt-binding: use yaml instead of txt
* dt-binding: add Topwise A721 to sunxi.yaml
* dt-binding: add Topwise to vendor-prefixes
* drm: Add bus_format, bus_flags and connector_type
* dts: Use SPDX license identifier instead of boilerplate license text
* dts: Remove pinctrl leftovers

Pascal Roeleven (2):
  dt-bindings: arm: Add Topwise A721
  ARM: dts: sun4i: Add support for Topwise A721 tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts  | 242 ++++++++++++++++++
 3 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts

-- 
2.27.0



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
