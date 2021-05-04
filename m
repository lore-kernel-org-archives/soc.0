Return-Path: <SRS0=y0KU=J7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756ECC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:37:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E809A613C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E809A613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ftprlujrx3RJyZd0QDWjOW/VTY8U46kLCBtpwZvxZB0=; b=YItMJubGhXyNUF5/UqReQtWjP3
	OCHD29Vn6c76701oE27E8rzPiXNax5K9l96c/2uwXATbtKtZisbCICFkVJPZP4ue9FIXFoqlA/ob2
	LL6TT8xxWm2UDAKrAywXDFkbMtE2GGr5lK0+gi+zOjwAhcK3BnQgeleS69gv0Y82mW7GNeT62RTWD
	MF/QMOs7WZGIF4pTmCs4NLwy4vcal30Ng85Xc/iPLBgARytlx3mOJzIop0MSEdAPVLmRk8ZwHlVXp
	JNzNRXRzXDQbvqlQqbJLP5eg6sMNK9ArgBhALGeZqHw//Z7qUaqnjgSng4uJGEjKBDHvDWtQ0C1hM
	cpfca/zw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le0pC-00GuAG-GU; Tue, 04 May 2021 19:35:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p6-00Gu9S-5P
 for linux-arm-kernel@desiato.infradead.org; Tue, 04 May 2021 19:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=/wlkno7pRty5OfZRb8J5gIbUcerkat2d/Bw1XsvXcxA=; b=Of2UBH4KwV4nNn58+dlsifjAcR
 9/Q3Idum8k8IoWNLtx+Vq7JWSlHl6+xgrTuiQxHtXp4rGrXk4Eufe10csO5ZEoGOTZR2YWIQ3Ae+J
 OGH73HPeU9wxeeI75cxLJOEycEdXgLcmCIN405F5V70qj0smxjoeJAmw8tTTCNITx2n2aK5MoGvB6
 +uym7oZzjxUYjpnUC24r90pq06GRh6mgZfRxZpqevl1ld5M8TxkdazGZgYgCiPHLw/N9Pue0e8py/
 4GI6WArX36p4IIdbI2CnWvsJE1B4BI9x66qBL/XCiqHLvNB3sphumK5PQDMCkj+co8/C+diGmrFlB
 Vz5BOhFw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p2-004DmG-Qm
 for linux-arm-kernel@lists.infradead.org; Tue, 04 May 2021 19:35:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l14so10641620wrx.5
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 04 May 2021 12:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wlkno7pRty5OfZRb8J5gIbUcerkat2d/Bw1XsvXcxA=;
 b=cQwuhcRbcCqXF84od/9QObdaYeQP08k05+eaYKRXsWjfB8+uK8p0Rew0weWkCYskXA
 XzJPK2gWVgMfQu81aw7g1F1FHwOtP3iU8hguoWKm1B2zpiIt7kAxrA5UHLZYaBxk9zri
 DUO5XmmmZ1drzcHgZhgOVFXZAXJ3MDqPUrsp2qoatan9C8w8qk81YqOOuNkvGWf8eNtq
 f8gU/gXLdCurvwLOqLHQVU5Z91fWQAaZHsgv67KDPM90OyZBdSQN0QmIGCLoeUHRc5Cz
 HV3I7445/U9WHR8/VUINZHiG8nk0q53HEI+sL4Me54akckuGl2dbb3+ijnefVdPaQ/YF
 hISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wlkno7pRty5OfZRb8J5gIbUcerkat2d/Bw1XsvXcxA=;
 b=GNjdH6/z0Q7g6IA8zqDRP6UjK1ubq5omvc0GoUN73IHt49BG/Yg+SPjqQdkZB5CgQA
 emiTW3ulyIKKJxXa3FwDTSa1Ztz/0efrI2Oe144PCZD/UIqariL9qstFOvZQbgYDpoLs
 33y1KtTXeAUVJgDABx1iPMLEk9lrqT6LTA51j1I1up/T0ExLeO4pz+AcIO4elCYSBSvQ
 1qam0z81Qkg6Ekj4zs8vc6/PZ1572VgtrfKT0g3VQthZ2IGe4RSlyY787isPfzd8MRW5
 gcmpUiQj4fA8vE+Eg6GfP7WAQqpwj8grX8UHW4tLqzB5d9O6e7Ce4ilBsJ02ddo7sYoq
 5AnQ==
X-Gm-Message-State: AOAM532P1MqGZ/6mv/9Oj6ihqweAq8scVGLY+SnvCxe5092OgGk0awca
 drBwf+tD3t8xDDU+C035hXNdAA==
X-Google-Smtp-Source: ABdhPJyRqQn35aDMtuJzXmdCWQFefsfXBopf6kCEyTozbNmoBqhTRobePV2+CeNp53C7ihebxE0Leg==
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr10179868wrm.236.1620156903866; 
 Tue, 04 May 2021 12:35:03 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 12:35:03 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, kaloz@openwrt.org, khalasa@piap.pl, linusw@kernel.org,
 linux@armlinux.org.uk, olof@lixom.net, robh+dt@kernel.org, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/5] ixp4xx: add welltech-epbx100
Date: Tue,  4 May 2021 19:34:52 +0000
Message-ID: <20210504193457.4008384-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_123508_889343_A9598DB9 
X-CRM114-Status: GOOD (  11.59  )
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
Message-ID: <20210504193452.1TvImZ-rOg85djVRenKKn7OjqQil1iweTd1sNLblXHA@z>

The welltech epbx100 is a small IP PBX board.
It ship an Intel IXDPG425 Network Gateway Reference (IXP42X 533MHz) SoC.
Original image ran an old 2.4.31 but upgrading to recent kernel was
easy.
It misses a working network interfaces but its current state is
sufficient to work on my interest, its crypto device.

More information on the board could be found on http://kernel.montjoie.ovh/welltech-epbx100.html

Corentin Labbe (5):
  ARM: ixp4xx_defconfig: add CONFIG_SERIAL_OF_PLATFORM
  ARM: ixp4xx_defconfig: add MTD_PHYSMAP
  dt-bindings: add vendor prefix for welltech
  dt-bindings: arm: intel-ixp4xx: add welltech,epbx100
  ARM: dts: add intel-ixp42x-welltech-epbx100

 .../devicetree/bindings/arm/intel-ixp4xx.yaml |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/intel-ixp42x-welltech-epbx100.dts     | 76 +++++++++++++++++++
 arch/arm/configs/ixp4xx_defconfig             |  3 +
 5 files changed, 83 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts

-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
