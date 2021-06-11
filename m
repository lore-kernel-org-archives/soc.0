Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7375CC48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 09:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46320613D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 09:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46320613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lI9zoUJDN2QuCEwVYhPYXJ8OL+7N1yyeiDGaXA5ZkG8=; b=fLUmel/qfFhLDj
	IYkdlpXz/M+56U6DAnNGYyxG4fs0dcxGBteZmTTBrZZhqmgdCAW8WIqD0UVstwR/lVMUvkmJIJA4j
	gIPpJ6keXp6hCDY163j6LSDX4Qz6QMtwqpNJqXI0cr4bBaY0vuBjGeMm+HdvG0utqk+LS+WWEB7CO
	x/pjVHm26HBfoSHsvZ3B8pafMli9ckIn79ZRh5hpRXH0tHF/Dm/P42g5kfSGhDhNGKPnwpp4DPQ5P
	CxPkwiCGWETvD+5Ip47DADSSIGvalcNlhv1Pzn9/lISvmPYrfN17mu7zVYSvm9i17wNmPI4rFmsKU
	sh1MGqUDel5p+EGLnhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrdlV-004agd-Qw; Fri, 11 Jun 2021 09:47:49 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrdl3-004ZiA-4C
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 09:47:24 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
 by xavier.telenet-ops.be with bizsmtp
 id FlnE2500M25eH3q01lnEKR; Fri, 11 Jun 2021 11:47:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lrdkv-00FcQP-Pt; Fri, 11 Jun 2021 11:47:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lrdku-00CZr8-Qp; Fri, 11 Jun 2021 11:47:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.14
Date: Fri, 11 Jun 2021 11:47:04 +0200
Message-ID: <cover.1623403802.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623403793.git.geert+renesas@glider.be>
References: <cover.1623403793.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_024721_339687_00B8238E 
X-CRM114-Status: UNSURE (   7.10  )
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
Message-ID: <20210611094704.dEO5WqvAQT8rxk0Rs1pLAG1QkQUwyCdJ8dVIx3gIrVE@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.14-tag1

for you to fetch changes up to 972f67be8929ac095df6a8bbce738b4f39e984cb:

  dt-bindings: power: renesas,rzg2l-sysc: Add DT binding documentation for SYSC controller (2021-06-10 15:26:49 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.14

  - Document support for the new RZ/G2L, RZ/G2LC, and RZ/G2UL SoCs,
  - Document support for the new RZ/G2L SMARC EVK board.

----------------------------------------------------------------
Lad Prabhakar (4):
      dt-bindings: arm: renesas: Document Renesas RZ/G2UL SoC
      dt-bindings: arm: renesas: Document Renesas RZ/G2{L,LC} SoC variants
      dt-bindings: arm: renesas: Document SMARC EVK
      dt-bindings: power: renesas,rzg2l-sysc: Add DT binding documentation for SYSC controller

 Documentation/devicetree/bindings/arm/renesas.yaml | 18 +++++++
 .../bindings/power/renesas,rzg2l-sysc.yaml         | 63 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
