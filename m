Return-Path: <SRS0=0ZpT=GX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67DEC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842DF2343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842DF2343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O0S7gogBNQlQkhdZlRJbBEdf6S3Yi0DpyK7AIXnBUV8=; b=XFN7FR/cajswtnSTsWqint0KQ8
	uvc4tUz4Y/na5X8bHJPPGU84RLtlyyHAseL9ca1UVidiCpmv24Bgjv6qCZvMDsKVDybABgVQW10mN
	fSx7btrRdtbK9Ue+un7L80zdZu3QgzHg1tP4ai96FNge0IWFCis8I+vGobVLD9062AsuEHC4xQ2Xf
	guibKes3/N81E6czaZ518iG+OFYhSwIHCMLxxyC/CTCSIKZEvUboPMpofod6Cx1xQi/epV3aYwyvP
	rzBfbpsHvW0ldOjQbVOYGfqxudtkDnU0oYPFZXwW1doKxX5Fp4mP50/MlZoRpHpr9BsTUzzunDPLc
	fHWWIdFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2JLW-0006j2-8r; Wed, 20 Jan 2021 19:40:50 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2JLR-0006hU-Hw
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Jan 2021 19:40:46 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 68A3822727;
 Wed, 20 Jan 2021 20:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611171644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tlKQp8qtg7ZoARKjR0krCyCtHtuqS8eLJSkS8h5Iy+Q=;
 b=Hkmt4GpEE9/lMp95snLoV+wwqAyxIEbTWRW0zi6nwA+ZcjVqGKufBoel3qAQJd/qWrNZRQ
 csZv1jkZB1/uttJKjXEPLGk6VJK8Yf6AYMNl6TJ+OnTZqpysmQ/imYQdfjWwjtxbzzKjVX
 H223mRARsbIL8lqGNkZeAvN9nc0yCJ8=
From: Michael Walle <michael@walle.cc>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] add Ebang EBAZ4205 support
Date: Wed, 20 Jan 2021 20:40:30 +0100
Message-ID: <20210120194033.26970-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_144045_815779_C9A12DD0 
X-CRM114-Status: GOOD (  12.19  )
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
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>,
 Michal Simek <michal.simek@xilinx.com>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210120194030.5K5xOfGSGw04I-NW5Xn7Xltf4snY64J8cA0G6fqueYk@z>

Add support for the Ebang EBAZ4205 board. This board was once used as a
control board for a bitcoin mining device. Nowawdays it is sold as a cheap
Zynq-7000 eval board.

Michael Walle (3):
  dt-bindings: add ebang vendor prefix
  dt-bindings: arm: add Ebang EBAZ4205 board
  ARM: dts: add Ebang EBAZ4205 device tree

 .../devicetree/bindings/arm/xilinx.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/zynq-ebaz4205.dts           | 109 ++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts

-- 
2.20.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
