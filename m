Return-Path: <SRS0=5UrE=IR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93440C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Mar 2021 08:53:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3563764E20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Mar 2021 08:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3563764E20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CsZtFHDZ7pgNJg/DlAbrPdL44cUUR2aSJcUI/WhjJwo=; b=iuwoEeZfS5STroU/iGPQqU+ob
	Pb2Nw6R7CKvGen+Kl9AotYqdRO3xldW2cZOlO+7shwEU5WnIQuD8tFGaN01HG2gafe4E0YcBx77tl
	K9vv+4KkyDoHmn0877b2yL5ynmgzO7+UvDLFw32UIJX8lQjC6Ek5khf3t0XOR62nH6ZlEZq/7Ttdh
	tZLIANQ7S7EyRE05Xa+Z2y4K1As273tMr18/F7Tms/JtchUJEDRAeO4J+WyQnaiGo1W+MI5ZuzFIL
	+g5B8MmF/PNZdTo9kf6+G33rlrIGJF6jnPJ5z0eZf1eLUw3ZJtKx0C+sPNdqaTnatHzuR8tCcOOf4
	CiCIJxoUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNArX-006u5e-Eq; Fri, 19 Mar 2021 08:52:07 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNArM-006u48-EG
 for linux-arm-kernel@lists.infradead.org; Fri, 19 Mar 2021 08:51:58 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
 by andre.telenet-ops.be with bizsmtp
 id i8rw240013CXdgx018rwd5; Fri, 19 Mar 2021 09:51:56 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lNArL-008kg4-JK; Fri, 19 Mar 2021 09:51:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lNArK-00BMyF-TP; Fri, 19 Mar 2021 09:51:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas driver updates for v5.13
Date: Fri, 19 Mar 2021 09:51:46 +0100
Message-ID: <20210319085146.2709844-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319085146.2709844-1-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_085156_635315_7D1855B6 
X-CRM114-Status: UNSURE (   6.99  )
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
Message-ID: <20210319085146.YgCcQS4mEJ7vIgs3EdyZ1I_xOO0IsIs4fJpwHwO6-LY@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.13-tag1

for you to fetch changes up to 1d9ffbc6b185561c65a5a599562dbb6c5d66e7d1:

  soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added (2021-03-08 10:25:00 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.13

  - Prepare rmobile-sysc for fw_devlink=on,
  - A minor cleanup.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: rmobile-sysc: Remove unneeded platform includes
      soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added

 drivers/soc/renesas/rmobile-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
