Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AD6C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 09:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2099F235F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 09:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2099F235F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i+JlckrhTmhyHg7qM3U3yQA4FZJJnJqHQhp/t/yu+vk=; b=tP4Acr4EC5aTILENJjaXmJZRl
	oQg48OAyPUfpNyL3JPTDLcSAK76zqBeZt5DYk5J4keCZWSLj/5MkmIEtYe0z/dgu+UByV3rpSmsom
	8B2pzFspi38yoU+kSXBX0sG50/vs9sfVXnpeQKOw08t3pnGqO9fmxpVwZynJeRkYxAh3rMEEr0bHa
	M+2eqiX9pG7WBCcEmu6PdMQcFxALqxqQKEZ4Gd5RHXpMClZ8iSD0Zg/bTvqMAfDmtTc1dBuZq6F+8
	/2zN9OemYjLvUaw5I2wLP5RBhn7DTLSPhgGU6PJDmZ5DgBuED6lm3SRvoNCYFV/jGUBbcz9Rlpw0q
	iN5xFY6pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Lgo-0005xf-HW; Fri, 15 Jan 2021 09:46:42 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0LgZ-0005t9-9R
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 09:46:29 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id GxmN240034C55Sk01xmNVd; Fri, 15 Jan 2021 10:46:22 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l0LgT-003iyK-KM; Fri, 15 Jan 2021 10:46:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l0LgT-009nD6-6R; Fri, 15 Jan 2021 10:46:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 2/2] Renesas DT binding updates for v5.12
Date: Fri, 15 Jan 2021 10:46:10 +0100
Message-ID: <20210115094610.2334058-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115094610.2334058-1-geert+renesas@glider.be>
References: <20210115094610.2334058-1-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_044627_441206_C9FE98E6 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115094610.9HwEKyJQ08bK0joMa9YGn3zXumbYkA0AeuWn8eL6EPk@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.12-tag1

for you to fetch changes up to 0d2a7e15d7912aa27dd3366f75d181b5141ca9a2:

  dt-bindings: arm: renesas: Add Beacon RZ/G2N and RZ/G2H boards (2020-12-28 10:46:08 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.12

  - Document suport for the Beacon EmbeddedWorks RZ/G2N and RZ/H kits.

----------------------------------------------------------------
Adam Ford (1):
      dt-bindings: arm: renesas: Add Beacon RZ/G2N and RZ/G2H boards

 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
