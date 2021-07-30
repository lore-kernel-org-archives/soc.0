Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10478C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 13:21:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA8960EFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 13:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDA8960EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fXIH7vrxYwZkjxrxT1SaFJSuddOyZ8Vyu3WEEIXozrM=; b=JzppwmJ+FNi3W5
	F098Ny9llKOiB+siJRWy2bjtscsA9eUxLcjDjYpdwor9LVYgbUpmcrITwgAehWRuZceoyMI8XOYiy
	Bz5F/QvWW0xyCoABlWIhAd2h9bMKHIM8XuAYf4sNuaQMKhNJGdkpezHL6ISOnozIMuQnhPJDdn4eH
	8j8uQ3/bGF7ph0AeBgjRnonMuRRTJuWzug66xEXAHcs3udohUDvt0t9Rr7dhkvdANHXhWKbUc8m+5
	5DcYwfSG5Q6Wf2ITGyHzJL0UHnmzyTblIVTvHK62xwWr6j10AOawx3II/eVbB2lPclDN9GFjOEUdN
	ed4vX3rHmWJI3ifWi0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9SQL-008klI-DE; Fri, 30 Jul 2021 13:19:37 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9SPw-008khb-Ip
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 13:19:15 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:69f0:c617:e432:6919])
 by baptiste.telenet-ops.be with bizsmtp
 id bRK62500C2oLRg901RK65H; Fri, 30 Jul 2021 15:19:06 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m9SPp-002GQp-VU; Fri, 30 Jul 2021 15:19:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m9SPp-00HJro-FB; Fri, 30 Jul 2021 15:19:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v5.15
Date: Fri, 30 Jul 2021 15:18:53 +0200
Message-ID: <cover.1627650695.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_061912_800314_38442BAF 
X-CRM114-Status: GOOD (  15.60  )
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
Message-ID: <20210730131853.vFQeDGO7C-5uvkh7uTNCbxiEqzWDuF2wt1uZsIG9m5w@z>

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.15.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM DT updates for v5.15

    - Switches support for the Draak and Ebisu development boards,
    - I2C support on RZ/G2L,
    - I2C EEPROM support on the Ebisu development board,
    - Sound support for the R-Car D3 SoC and the Draak development board,
    - Support for the new R-Car H3e-2G and M3e-2G SoCs on the Salvator-XS
      and ULCB development boards,
    - IOMMU support for DMAC, EtherAVB, and SDHI on the R-Car M3-W+ SoC,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/3] Renesas driver updates for v5.15

    - Initial support for the new R-Car H3e-2G and M3e-2G SoCs.

  [GIT PULL 3/3] Renesas DT binding updates for v5.15

    - Document support for the new R-Car H3e-2G and M3e-2G SoCs and
      boards.

Note that the first part is based on v5.14-rc2, as older versions do
not include renesas-fixes-for-v5.14-tag1.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
