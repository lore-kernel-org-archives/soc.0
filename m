Return-Path: <SRS0=stTo=OV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C72BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Oct 2021 09:45:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D610D619EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Oct 2021 09:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D610D619EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZmJKA6RYEFk9NRCYud9fPFbVspfWArikNAtgTxGrXs=; b=dGGJKRvkbhl5PQ
	W+tnHHUcqfgmprGuHnksWdhg1Nliajt3WTlAAoDX+ic1kDOnUdeVH4ZacP0SBqsymhvNWbIiNUtIY
	Xvi0dx4eb9T4YFFHKVpCvCvNVz0kCd/+UGRCN20KAVtT7LcYOEOjf6oiHAFfo9TgLpEOzhkWV6ByF
	nBJyECnELf+nb3Ery69YUygUwDqIectcMh0J86qjhZX06+jQ5qgJupET2eyzDAhyACG3KdnssaonW
	a3yp/tWBERBaM8A3hlcQNZDjcJ/IBVfs7UjPsq6MHtldXU52nOT87TUNy00LoLm1IJXc+1cUK61cx
	sY5M/umJ5wXvR52i2EgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWF4u-00HI8W-PV; Fri, 01 Oct 2021 09:43:40 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF4D-00HHxl-Uj
 for linux-arm-kernel@lists.infradead.org; Fri, 01 Oct 2021 09:43:00 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
 by albert.telenet-ops.be with bizsmtp
 id 0Zir2600h1ZoSwU06Zisk3; Fri, 01 Oct 2021 11:42:52 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mWF46-000zIm-H7; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mWF46-00BE6V-0K; Fri, 01 Oct 2021 11:42:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.16
Date: Fri,  1 Oct 2021 11:42:46 +0200
Message-ID: <cover.1633081158.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633081144.git.geert+renesas@glider.be>
References: <cover.1633081144.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024258_181702_A8BA5945 
X-CRM114-Status: UNSURE (   6.12  )
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
Message-ID: <20211001094246.MC4mYV8kR4_CS4EEm4WL7zkz6Z3RPtygaa6JQLFPnhU@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.16-tag1

for you to fetch changes up to e43eada9ac08941a98cad96eba9f3801b13e4f0b:

  dt-bindings: arm: renesas: Document more R-Car Gen3e Socs and boards (2021-09-13 10:54:41 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.16

  - Document support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
    H3Ne SoCs and boards.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: arm: renesas: Document more R-Car Gen3e Socs and boards

 Documentation/devicetree/bindings/arm/renesas.yaml | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
