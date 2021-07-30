Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786DBC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 13:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A32060041
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 13:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A32060041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0mwBjuJCgGrYHuhGkxOU+0drTOAPRs6S+IBOrg4rIE=; b=hBuu1VJoCUCBF/
	bJIZ2UOEj58k5lbfLM2xJuyqC1GVGZ/c1fmV5y7m/eT8QPTxhPfesfBOEQXhJpISwS3ZFzaRczlCy
	/FPNECGdaxtnqwNnXG3YfdVr9iTk3pslCoSku0eyIuHgvDubVbxOCfcDkXKbqSPSGLYVWMK+Agwcc
	c1tLk10kvUobMYBBqIY/MdiqUoWSOQ/7mh01TauHUi2UquSUwsn+gEcbB3KRUcF+L256AzVTxKKQA
	RMEKovAY9tJ60CWRHAxxso34y7/LmKGR5HrilGwL4xdwPSS7/DLNv531kLkYGi98XuhIyHRdpT3d0
	e9FFemRqHK6Mac0b6b/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9SQ0-008kjq-Pk; Fri, 30 Jul 2021 13:19:16 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9SPw-008kha-63
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 13:19:15 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:69f0:c617:e432:6919])
 by baptiste.telenet-ops.be with bizsmtp
 id bRK62500B2oLRg901RK65G; Fri, 30 Jul 2021 15:19:06 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m9SPp-002GQs-Vp; Fri, 30 Jul 2021 15:19:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m9SPp-00HJs6-Ho; Fri, 30 Jul 2021 15:19:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DT binding updates for v5.15
Date: Fri, 30 Jul 2021 15:18:56 +0200
Message-ID: <cover.1627650706.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627650695.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_061912_410075_DA014512 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210730131856.xrwt2jo3JZgMpHfPS3tUysPLpziny6hETCYckuLv-K0@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.15-tag1

for you to fetch changes up to 3e82868e8523d5426f76866863704b02adacac3e:

  dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and boards (2021-07-27 09:26:16 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.15

  - Document support for the new R-Car H3e-2G and M3e-2G SoCs and
    boards.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and boards

 Documentation/devicetree/bindings/arm/renesas.yaml | 50 +++++++++++++++++-----
 1 file changed, 39 insertions(+), 11 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
