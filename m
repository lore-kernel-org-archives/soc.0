Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36572C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 13:24:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13F82224D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 13:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0wDa7kqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C13F82224D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7+020qi7x2N8gZGQfoCz/eqb8EBuN/LWDKE9GneJm8o=; b=0wDa7kqalcK4HBW3ZKBSOB31G
	rCVVqWgFAodNV23dYXgRCAdPo3RwCLWSIGE0yPAsG84xD71HP8v9s4J7GoWuKKbAZxueA+XR+DnH5
	UAt2QRVWc+vBunbGj+ozKSMLShyK5EwZMQnG5vy5dIBA0QUcfayjhPqUSYYAA8xu5EPIkTYcucN1E
	sYUzZr+I+K5jTcKR8+LA6VDpxFzZpu2nd0shIg1L4ETcChSABRa/A43a5cmOeu3RI50UPCKAKZeNX
	O92p5UfP8aCaZn05xMZeshhty+TQ4mRpCakfJ3ld050eImSbUBMYFRQD+UBoG4uwddNXVD/Wf3fIx
	KTnIgPfww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kidiA-0002LG-8h; Fri, 27 Nov 2020 13:22:54 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kidhT-00021Q-FI
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 13:22:16 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by baptiste.telenet-ops.be with bizsmtp
 id xRN32300f4C55Sk01RN37D; Fri, 27 Nov 2020 14:22:06 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kidhL-0065FQ-Fe; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kidhL-000K9v-2I; Fri, 27 Nov 2020 14:22:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 3/3] Renesas driver updates for v5.11 (take two)
Date: Fri, 27 Nov 2020 14:21:55 +0100
Message-ID: <20201127132155.77418-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
References: <20201127132155.77418-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_082212_325930_F2FE739A 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127132155.Femu0T-XooSE9TM5ftE8He8eexIv67qe8okT0RA_XN8@z>

The following changes since commit cf25d802e029c31efac8bdc979236927f37183bd:

  soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains() (2020-10-26 10:00:14 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.11-tag2

for you to fetch changes up to 8b6bed678428b6df66741cb0956e076d579e3891:

  soc: renesas: rmobile-sysc: Stop using __raw_*() I/O accessors (2020-11-27 14:09:37 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.11 (take two)

  - Stop using __raw_*() I/O accessors.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: rmobile-sysc: Stop using __raw_*() I/O accessors

 drivers/soc/renesas/rmobile-sysc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
