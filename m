Return-Path: <SRS0=stTo=OV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F83C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Oct 2021 09:46:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24079613A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Oct 2021 09:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24079613A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7BHh5Lmpa870NJ3Kz1sS0sEW/WpH9oFqyOTF4bBDog4=; b=gJOl+I0T0x7aG6
	neUyyMeJ6/puRBk04ovIaI6+kGyrbsCF3t26v+SSSQy9rF8IF4dmAssi4HNhnHZGt8x0n0STunIjk
	oaJtXVbZjM5jinMj9Krf9puBJxlcCqKxYWDZSHjXc504/LuW23pj4jDooqqrvBqQMwo81IPKv6X4p
	TP0xgpKTQZraWlzE79QeznP5+d9h/wWmxlGB0QnfdovYkfJG9eP5sLG9S+qicPeeg9R+WI25orU/u
	phfEAUOzK8iiaKsUAyWyRVKaNSS4RaXKtWgR4NKScDT1B+Z2wLAXSkSmhGQxUwcfURAOlOHwQEbQW
	tt6TAarpaK/4cUvsIXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWF5E-00HIFX-Ic; Fri, 01 Oct 2021 09:44:01 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF4H-00HHxX-Qc
 for linux-arm-kernel@lists.infradead.org; Fri, 01 Oct 2021 09:43:03 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
 by laurent.telenet-ops.be with bizsmtp
 id 0Zj12600B1ZoSwU01Zj1mE; Fri, 01 Oct 2021 11:43:01 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mWF46-000zIi-QA; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mWF45-00BE66-Sw; Fri, 01 Oct 2021 11:42:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.16
Date: Fri,  1 Oct 2021 11:42:42 +0200
Message-ID: <cover.1633081144.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024302_032912_897A5D17 
X-CRM114-Status: GOOD (  15.95  )
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
Message-ID: <20211001094242.otJ50j2ONBu0zzBAg55f3n8BPpEYnJgpSNO_CE9DTHY@z>

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.15.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.16

    - Enable built-in (I2C, DMAC, USB PHY control) and modular (audio,
      ADC) build of drivers for the RZ/G2L SoC and SMARC EVK board,
    - Enable modular build of the Renesas TPU PWM driver for the R-Car
      V3U SoC.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.16

    - I2C EEPROM support on the RZA2MEVB development board,
    - DMA, USB2.0, and audio support for the RZ/G2L SoC,
    - USB2.0, I2C, audio, ADC, and CANFD support for the RZ/G2L SMARC EVK
      development board,
    - Support for more R-Car Gen3e SoCs (H3e, M3e, M3Ne(-2G), D3e, E3e,
      H3Ne),
    - PWM support for the R-Car M3-W+ and V3U SoCs,
    - IPMMU support for SDHI on the R-Car V3U SoC,
    - Switches support for the Falcon development board,
    - Improve Ethernet PHY descriptions to fix reset handling after kexec,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.16

    - Initial support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
      H3Ne SoCs.

  [GIT PULL 4/4] Renesas DT binding updates for v5.16

    - Document support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
      H3Ne SoCs and boards.

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
