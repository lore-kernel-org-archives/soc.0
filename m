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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D487C63798
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 13:24:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF3FF22253
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 13:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U1BE9YMV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF3FF22253
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HEtpsuPuNBW2+tcNE9y7PVTVlwsU7qvXoFS1hbefADo=; b=U1BE9YMVVdDv3wl143ELR7DLC
	T29x2GYYpqQWlsMpYHwaZJTPqaAWarFqzLecXvl3lmDTPcaABRNXXbhloIkBybtsla12VQQE9eSaY
	1uICzOb5Loj2R7pEb6zCZKDhCIcLjidJtS1Ol9URv9qbKSvn0vtR5UyQMCYHBdJECStsTkRL4T+tA
	LkwYBL62uj80oO5hAaKBQRaoAgIqX6A6sx8mSEMZ/k19bM6OVz6cQBX8h6de9qhB+8wSxcr9fcFsk
	Lv1IFfydDxcEb36wdzByiw6zIWtvvNrFYiGMmFZu/6TOmi5hUk2tv45PtGSrtxRm7HtWz1lP+6bge
	HjoiV4mhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kidiQ-0002Te-Hd; Fri, 27 Nov 2020 13:23:10 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kidhT-0001zp-Dl
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 13:22:17 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id xRN32300D4C55Sk01RN3kC; Fri, 27 Nov 2020 14:22:04 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kidhL-0065FO-Cl; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kidhL-000K9l-0z; Fri, 27 Nov 2020 14:22:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 1/3] Renesas ARM DT updates for v5.11 (take two)
Date: Fri, 27 Nov 2020 14:21:53 +0100
Message-ID: <20201127132155.77418-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
References: <20201127132155.77418-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_082212_360979_7415EBE8 
X-CRM114-Status: UNSURE (   7.54  )
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
Message-ID: <20201127132153.IgZXwu4qYCpPuhgZqy5zhYqSnLRvySvo_TCWKkEEUSw@z>

The following changes since commit 43bba65761952f58e850d918ee43b648427609bb:

  arm64: dts: renesas: hihope-rev4: Add a comment explaining switch SW2404 (2020-11-10 09:29:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.11-tag2

for you to fetch changes up to 0f80b9b8126cf3e352aa6b270ed24c9cd9a6272b:

  arm64: dts: renesas: r8a77951: Add PCIe EP nodes (2020-11-27 09:07:06 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.11 (take two)

  - PCIe endpoint support for the R-Car H3 ES2.0+ SoC.

----------------------------------------------------------------
Yuya Hamamachi (1):
      arm64: dts: renesas: r8a77951: Add PCIe EP nodes

 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
