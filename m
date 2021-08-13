Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59971C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 10:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2099C6109D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 10:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2099C6109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EcGKPt/Mse5QSD70Y0UT9Un9oIAkCN9twNG3t6jDH2o=; b=VFDOijXMUgpXRt
	Qex0eatMeX+1LyrnjWdC/6Pp6FNqeG/enakgT9eGGjj9N/66XD7+R6riP1cjO6UKvcgCqy55QzrPA
	yMPUYpfRqo7wglScZyttsraAg+PJ7DeqooKWngX28Qt+sg9dtPJD/Z6fEcfuJDXa5/NlWpaNAoBkf
	YtTeh9Nr518gfYbxEO2Jt85AuPThIfAwll2sn3MCIdaTP4dJz7xPAnVDfPSHoJlFPvCyzHv1eogix
	jAo/XO/v7k9cBSEiu0lf3aHEGf1VFS6E5SFuxJZ9S5Se+0UIh4cBLqfvwnd6rJTpwQPqlsw1As/j9
	sPlCBSHTBeIjt463B6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEULO-00CQwh-1F; Fri, 13 Aug 2021 10:23:18 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEUKz-00CQtY-14
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 10:22:56 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b151:f011:b544:c545])
 by albert.telenet-ops.be with bizsmtp
 id gyNo2500B1MlFFN06yNo76; Fri, 13 Aug 2021 12:22:48 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mEUKu-002Wod-0H; Fri, 13 Aug 2021 12:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mEUKt-007SUX-G4; Fri, 13 Aug 2021 12:22:47 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v5.15 (take two)
Date: Fri, 13 Aug 2021 12:22:34 +0200
Message-ID: <cover.1628849621.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_032253_284978_2A0831AC 
X-CRM114-Status: GOOD (  14.29  )
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
Message-ID: <20210813102234.-zoua9Jqi4NFIwin8AAH4PjS6WCiU4V-mRBH7L9BFA8@z>

	Hi soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.15.

It consists of two parts:

  [GIT PULL 1/2] Renesas ARM DT updates for v5.15 (take two)

    - Pin control, ADC, and CANFD support for the RZ/G2L SoC,
    - Add interrupt-names properties to the Renesas RZ/A and RZ/G2L I2C
      Bus Interface.

  [GIT PULL 2/2] Renesas driver updates for v5.15 (take two)

    - Prefer memcpy() over strcpy().

Note that the first part includes another update (append-only) to the
Renesas RZ/G2L DT Binding Definitions, which are shared by driver and DT
source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.15" (for clk),
  - "[GIT PULL 1/2] Renesas ARM DT updates for v5.15 (take two)" (for
    soc).

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
