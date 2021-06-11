Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047C7C48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 09:49:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6351613DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 09:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6351613DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kLB9JRp08Jwoqtnu9NHBqMoUomh985IQbrtu/tN3isc=; b=RAksO8ooTTnKTs
	sVwMfuHrTBo57m4PkDa5fcbmZEgdEsYStT3bfnJ250LTGPwcESc/qv5fOSygRpjgE9qoJQE9i/X9k
	6fHTIULVP85LIt4Wy+UlQz0ksAOLQMSBjt4yVpAiNRQEzDjsNSHqBE0JL1vNY01MUDdKunz7gdYwV
	Nad4s59Eo6yzvLthNnyX4/GlsWdI89Salp/cCtBcl3Mxo4ldNiWPv1N1H9lOkCKTPzek58EcmN42A
	Mi+P5hhUMByc1FPpmrk8h9jowBy1nSuzX5+1e0Er2Hoz1rT/n7n87ztM63v6YeFdjDfNHK0qdOucE
	ErFNs18fK4ABw2q/+HJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrdl8-004Zyw-CJ; Fri, 11 Jun 2021 09:47:26 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrdl2-004ZiB-Sh
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 09:47:23 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
 by xavier.telenet-ops.be with bizsmtp
 id FlnD2500a25eH3q01lnDK6; Fri, 11 Jun 2021 11:47:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lrdkv-00FcQL-I0; Fri, 11 Jun 2021 11:47:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lrdku-00CZqj-NI; Fri, 11 Jun 2021 11:47:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas ARM SoC updates for v5.14 (take two)
Date: Fri, 11 Jun 2021 11:47:00 +0200
Message-ID: <cover.1623403793.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_024721_092351_5FE4386C 
X-CRM114-Status: GOOD (  14.52  )
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
Message-ID: <20210611094700.qZ1qg7FFx4-mIZR3NyWmGJhD_U3BII7pvzEVIK-3hvw@z>

	Hi soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.14.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.14 (take two)

    - Enable support for the new RZ/G2L SoC variants in the arm64
      defconfig.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.14 (take two)

    - External interrupt (INTC-EX) support for the R-Car M3-W+ SoC,
    - Initial support for the new RZ/G2L SoC on the RZ/G2L SMARC EVK
      board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.14

    - Initial support for the new RZ/G2L SoC variants.

  [GIT PULL 4/4] Renesas DT binding updates for v5.14

    - Document support for the new RZ/G2L, RZ/G2LC, and RZ/G2UL SoCs,
    - Document support for the new RZ/G2L SMARC EVK board.

Note that the new Renesas RZ/G2L DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.14 (take two)" (for clk),
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.14 (take two)" (for
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
