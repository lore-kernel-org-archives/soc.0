Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC7BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 10:25:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 935E260F14
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 10:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 935E260F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edhNq/EwMR15+iWFH5P1DyrneuRhOYU4gLzUkxUnh9Y=; b=McxRZIaovpESxM
	pOa+zL4OsQifgXGwgBp/18Na4aei4256+fZcekKnig5DgeqJ6mJ5Sz/XxH/6H5QVb2BODPxpU/jSF
	vxizxk9EKKtJ+raHtY3D5u1FEEU/DD8wRnx6hDtWq+Go/eTs2MpANKEYKOpsnV1SApx0SKAZe8KLk
	H0uslu4rEJxGp32T29XE2vxjdNxnxcEobkb3Q+eBnJSfupZxDhxtJJp6maqJ6m/tTbjTBdq3EGLZ5
	k1OAn90vFIvzCa9juoLRCEl6iVxM13UhQ5brxxHxXFmSz80c/DAzXSi2SOualZVz1m30sI2diLtuz
	C8cKmA7NA4SGaGKx+7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEUL2-00CQuw-K8; Fri, 13 Aug 2021 10:22:56 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEUKz-00CQtm-12
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 10:22:54 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b151:f011:b544:c545])
 by albert.telenet-ops.be with bizsmtp
 id gyNq2500K1MlFFN06yNq7W; Fri, 13 Aug 2021 12:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mEUKw-002Wov-FB; Fri, 13 Aug 2021 12:22:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mEUKv-007SUy-NJ; Fri, 13 Aug 2021 12:22:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas driver updates for v5.15 (take two)
Date: Fri, 13 Aug 2021 12:22:36 +0200
Message-ID: <cover.1628849625.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628849621.git.geert+renesas@glider.be>
References: <cover.1628849621.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_032253_247224_8C6B8106 
X-CRM114-Status: UNSURE (   5.79  )
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
Message-ID: <20210813102236.wEH-2ax19IkNTwRinQq45xwJCqBt7QPNWmCl7e-8718@z>

The following changes since commit bfe6b5590ce6cab81b3ee51b4541bd1d0b18b3b2:

  soc: renesas: Identify R-Car H3e-2G and M3e-2G (2021-07-27 09:27:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.15-tag2

for you to fetch changes up to 148bcca9ad0488d623aa36b21ac152bb056a1ae4:

  soc: renesas: Prefer memcpy() over strcpy() (2021-08-12 12:36:57 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.15 (take two)

  - Prefer memcpy() over strcpy().

----------------------------------------------------------------
Len Baker (1):
      soc: renesas: Prefer memcpy() over strcpy()

 drivers/soc/renesas/r8a779a0-sysc.c | 6 ++++--
 drivers/soc/renesas/rcar-sysc.c     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
