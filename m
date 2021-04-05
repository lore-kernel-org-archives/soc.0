Return-Path: <SRS0=c12J=JC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E82C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F27610F7
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F27610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rgom4mjerCFBdPlOQdAfMR+Us6PV9/+HUjlWHz/NNIU=; b=X2jBh/akYbndJiGMFx3+ozjNII
	QpsAACyYJ8FIKl6sazxlHGZo0I4hlsbDoTrY4oThBI6CxbJBLfklptxsF6kVgqSk0Ju42Gm+iB9Mq
	R7oBm8KKDLzMqBzktowvspgJg+INgSpzc6Qtp7LBS0ekUZQqz1R+p7xxsT2hziUXx7kfTm1rpSGYF
	029Gc5xtSdbFcaPTr+a1b/HpgusnU0weR5b9/FIYnc7WaSanzCPuCfDSyH+/JhfB/n0AXrk3VszKb
	Yzlr2j1bNVZonAb2GlIMRrGtCkV9RljH6qk9yj70qmdoMOXh3pBXpWf60gb/bF/bb7aKqEEMF6/Hq
	Qh9PO7Aw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTY1Q-000qcf-EX; Mon, 05 Apr 2021 22:48:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTY1A-000qZO-F7
 for linux-amlogic@lists.infradead.org; Mon, 05 Apr 2021 22:48:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id b9so4296094wrs.1
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Apr 2021 15:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=xWE2bWe6MeibC3WAG0QRM+W3rbg9QKme8vyFRrD/y+Q=;
 b=E8huiKDTHZ9HKAeH9wTPI/1XKl0BL12GfWUsBhT7u1d6/K4dvclSp74mbon6dlLIcn
 dKI3iz7+TQD4MsqFEzFSoSj+2Nxm5YNo7aEydSYWxogguDguu/o5IiUy1Cq+Wgg3vFj3
 St/QPUNP/svzt6KFuw6bZtOuRcNE3Vo6hnb4ujC3piggRQmhC8Vcw+cW7Xp5O9F3NrfY
 iErjnI9qDNV4+LcDWyU3ZJL8ACNygBeRnhry2vc0uaECy7dd1PdlV7navFfoOOXhTtG3
 hsJyG053Q7m25DQeqExZ43nNQf5PSg5cqoCzFEUAjMc/opgd5TJjskH+teqDX00Mm/KN
 /j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=xWE2bWe6MeibC3WAG0QRM+W3rbg9QKme8vyFRrD/y+Q=;
 b=hQkZd4gxdFZZJgIaAxHbC6NJJ5z/1z9vte8BZ1wd8SmLbDTxMOFtd0tnmYN6cQ26BD
 M4/YO0Nr6+eB9eouDgL9dQUOFNf0mUmzjJXaPLLne+S10PNjH7TJRPgMMihoi6bW2L0/
 foZDyf32tT5SmNkmMO5bzwYMHMy2jsd9PMPN+k/Vc17GJ/TjsoDPyAiDvTPrF5xxOZt2
 SVaRZWMT97VDtnv/LDlF7DoHHdK6FdXH3U4Jd64CEoXWH4zWQkrOKAtoakw0tHCd6jfN
 o8koNZCEEnajGRV33A+b9/kCAUfc+S88wg/wJoU33rkwVVKw2JSJogJ8FPewrQf7YfQv
 8hjQ==
X-Gm-Message-State: AOAM532HGwhdnEQrH304orQGST2oVgvGYuXy7PS+pqd09zQjKNWVbwNC
 kmQWh1ceW6E7E3UjKfcnypfP2w==
X-Google-Smtp-Source: ABdhPJycRLaoaFaMGHePU6xVulEfdOLfIaRvTc2DlrDXyeW+ducssmiYN038kyRSy6w4QGsbLusPmQ==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr7498wrc.168.1617662901564;
 Mon, 05 Apr 2021 15:48:21 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w7sm3038723wru.74.2021.04.05.15.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 15:48:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.13
Date: Mon, 05 Apr 2021 15:48:18 -0700
Message-ID: <7h5z10mjpp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_234824_680848_2B3FFDA4 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210405224818.GGC8BUUjDnjeVhIKLskb0otkL8S04O64iQnUyWfPJBs@z>

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 727d93ed3ba67307a82c3ac5ebc7e335265e8b9e:

  arm64: dts: meson: add initial device-tree for MeCool KIII Pro (2021-04-05 15:35:39 -0700)

----------------------------------------------------------------
arm64: dts: amlogic updates for v5.13
- new boards: MeCool KII & KIII, Minix NEO U9-H
- used fixed index for MMC devices

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: amlogic: Assign a fixed index to mmc devices

Christian Hewitt (5):
      dt-bindings: arm: amlogic: add support for the Minix NEO U9-H
      arm64: dts: meson: add initial device-tree for Minix NEO U9-H
      dt-bindings: arm: amlogic: add MeCool KII/KIII Pro bindings
      arm64: dts: meson: add initial device-tree for MeCool KII Pro
      arm64: dts: meson: add initial device-tree for MeCool KIII Pro

 Documentation/devicetree/bindings/arm/amlogic.yaml             |   3 +++
 arch/arm64/boot/dts/amlogic/Makefile                           |   3 +++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi              |   6 +++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                      |   6 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts      | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts        | 120 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 337 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
