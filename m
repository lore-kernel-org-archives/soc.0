Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B24AC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 09:51:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A67E264E09
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 09:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A67E264E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o6aDk8vpftvgAjS9+ekjagYCBZPLVmAvYEU2C8O+esY=; b=J3PqObuWsuwchAdGKIqjDKdotw
	J1uzOFSFNq6j31a6QlfgHAlnwqjCAiHbD708PrcJ1CsP987oiz/xxNj9RvTTBqPKJZKp0nYB8zLbE
	Bn2N41ihneNTmFjppMDVWi3XqdoaOhHePdsEkY2kaFWtCPFlPfeqZtydQ6qyU6F2nNgfIYKMnU48i
	ErkpTj0s0m7qrih/Oaui/b+GCp8lLuN4/8hfwpzYyezuAMv8OrnMh3JqR9kK6PM7y5GI2DHonN0Em
	CGbYtmJhTaSHh/xm16AC++kQHHAa2TmdgeeQ8RBorb5AHJ2t1+5f0MlKhyZH3+YlNB98qcKaqR/v0
	F0uezckw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QQQ-0003K2-Ps; Fri, 29 Jan 2021 09:50:46 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QQN-0003He-1u
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 09:50:44 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id NZqf2400C4C55Sk01ZqfW0; Fri, 29 Jan 2021 10:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l5QQI-001YQP-O9; Fri, 29 Jan 2021 10:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l5PlP-00Ai0w-CM; Fri, 29 Jan 2021 10:08:23 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 0/2] Renesas ARM SoC updates for v5.12 (take two)
Date: Fri, 29 Jan 2021 10:08:13 +0100
Message-ID: <20210129090815.2552425-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_045043_279943_2A067CAF 
X-CRM114-Status: UNSURE (   7.47  )
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
Message-ID: <20210129090813.gGjMSI3weZX3tnpTcKhs1o5PZ_n0AckwrfYYKET_CRo@z>

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.12.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM DT updates for v5.12 (take two)

    - Increase support (SPI, I2C, Ethernet, Serial, MMC) for the R-Car V3U
      SoC on the Renesas Falcon board,
    - Disable SD functions for plain eMMC,
    - A minor fix.

  [GIT PULL 2/2] Renesas driver updates for v5.12

    - Miscellaneous fixes and improvements.

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
