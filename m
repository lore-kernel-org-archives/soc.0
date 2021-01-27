Return-Path: <SRS0=JtRh=G6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB719C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Jan 2021 18:19:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5501664D9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Jan 2021 18:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5501664D9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Fg29eKLAyvbknrbP2lu0Q2Z015g/Nnp+R4ot6UptpY=; b=FACATECMuO+aqYCmjFg72Iwn2z
	/0qyLukOPeJbbpHRMnyu0BzdRgYivJ/6kX9v+SiaoCs0/Wjx3WGJJzNtpUiCcLzE/NVj4h6RFre2R
	TyC0pzYW2y5PNpAleHXPscnIUwhGztQgRtLmpYFGy1ALbaXdZEE5wXeHVBzF0sKXb2nSFSbzxpnpz
	Bmhs2fzItstw8HrBiIIVfn4MwHk3h0X5Opqt0teaGepLFYVaznzwdx7A/qFjVLToDmHKlLtavutwj
	1NjuDvkYEK98A5NyMhEvocsppZTeUNjplnWvwufuKtFgGP1zlbdzgD2+fXrx1Wla9nQnkPryqiQjx
	W6ndVWow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4pNp-0000YP-W0; Wed, 27 Jan 2021 18:17:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4pNj-0000U0-Ss
 for linux-arm-kernel@lists.infradead.org; Wed, 27 Jan 2021 18:17:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id 7so2934435wrz.0
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 27 Jan 2021 10:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1oeGqh4Jrc94bfT+wFZwebaOgOsWZ3ivDgAIGGVunNM=;
 b=tlpEpfncF8mm3OaZ0/rdNUCvL05RxWQu8Yhctk4X9w0Pkf7M6/8oSqqmSPRSOJKYtU
 rijgrrhMHiH6XHwEt2bI+T48OxqgiTLn5KfBPFRmZL7K3l2GMVGfLzsNFQRHDh9xtmma
 t72o6IimVpuTUI3ft1dYul/vtUsBf9OH3a3r448EKwNwFkVWlxlDXbamNnijQZgNyzBd
 JsiS8piEd+SjhM0FiWTPOG7R30qOFAYENHyB1kbKd/AO5nXaYwgGQaLNN/CS4dEZ3fSB
 FE+xB9MOtvb4k1u14wzF7ricBJWYVNwOD4hBgutrHPrgB7XLE7hHycQT6HhcjedscbbL
 /YDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=1oeGqh4Jrc94bfT+wFZwebaOgOsWZ3ivDgAIGGVunNM=;
 b=g0wSVOs+qFWTkLYSAPmX96g5WxVgXRF1/uuK0q78tD+2+pGeyh3LnXn7J1e0egxt9g
 1Ji67evHygpaOKsHYfuGUipRgMx1J+vUMQG/XJX6jWawlGS6mWFxRDtm44X2EVFKUjqH
 GXNfmAaLfXMpbOI5MC80fngx0Jum1NrOh9nwwKKXhP+BPYgIGUQ/Wm3M0P1pcD7K2L1Y
 jXtUJ47TPcsz51Iz7URRzX+uggJdBrbuDS0pnboMDWzmBNzDYhhCkAIcOn/gzugEtjZu
 o/BHMxTX9Vh91UT+IMDgTz1VaM4OkxRKXDsSHxogn+azr7xogtSnmgwbU/bCYPjY/I4d
 tblg==
X-Gm-Message-State: AOAM532ErxNx0zHG04qkHSGLrzUjH9ynsbJY88Z4d1z32ve9ZCHZPY04
 yZYsLZzqivJOa0z2vesOoGWaCw==
X-Google-Smtp-Source: ABdhPJyWER0YZAkUDZj791YwNslilcokXiTQNNsCISEi95mcteENqItETLxcJ3yyUvOTjJiAS10QNw==
X-Received: by 2002:adf:f303:: with SMTP id i3mr12341050wro.60.1611771450328; 
 Wed, 27 Jan 2021 10:17:30 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r16sm3950631wrx.36.2021.01.27.10.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 10:17:29 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 3)
Date: Wed, 27 Jan 2021 10:17:27 -0800
Message-ID: <7hk0ryi6rs.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_131732_021439_FCE69440 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210127181727.VNqEew_QxLrBkapmxcmwLQbagh4A-zMB3F02VxECv5k@z>

Arnd, Olof,

Sorry for all the one-off fixes this round, but here's one more fix for
v5.11-rc.

Kevin



The following changes since commit 19f6fe976a61f9afc289b062b7ef67f99b72e7b9:

  Revert "arm64: dts: amlogic: add missing ethernet reset ID" (2021-01-26 08:02:35 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes-3

for you to fetch changes up to daf12bee07b9e2f38216f58aca7ac4e4e66a7146:

  arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4 (2021-01-27 10:08:23 -0800)

----------------------------------------------------------------
arm64: dts: amlogic fixes for v5.11-rc (round 3)
- fix reboot issue on odroid C4

----------------------------------------------------------------
Marek Szyprowski (1):
      arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4

 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
