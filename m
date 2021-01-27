Return-Path: <SRS0=O9cP=G6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DB0C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 18:17:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D92E464DA8
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 18:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D92E464DA8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G5A4PgxGjZIJlooDINzRF1jTpxt1o83O4V7xmLxS8DI=; b=NWSf4CRW1LwTCJFbmP/DELhHPt
	s6teZMCea+FukzQWC3v8YbLWJvnCFzGOOYSev1Zb2PoyvRhudpU4nRzEsgj6NAVpHWwt7d3f1blS0
	Yws1l7QgipVTx/fG07g4Rdp9Z1XJQhlzUeybqXUYeAaFh3UIPhuCzmVuIASQs3NEpUI6LjZTjJSvK
	cpl1Vzt6aY1qz8jXAZldwP4ZqEn0rDK7BjsM5g+SCbDOxTNBR2KMkcGY0kzqxUcpb93K8NdAgabTH
	/SBrz6/UiDMUOZ8uwLhkyNIhqVb+qI3ipuwQf3mtsuAkhw5nQqlYW1Ihi28cAAAMycS5WRNenFpUc
	Ww2se5Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4pNt-0000Yq-1E; Wed, 27 Jan 2021 18:17:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4pNj-0000Tz-Su
 for linux-amlogic@lists.infradead.org; Wed, 27 Jan 2021 18:17:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id c12so2911847wrc.7
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Jan 2021 10:17:31 -0800 (PST)
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
 b=EdCKcDrokl3LTXLkgkFJfY+ANjJ1OeWxfLIE68kj2+ngi4lCJHWEBVF8qPxK271xvC
 zzt2871gFDxfiZ8UWarhgV5zUeigzTCKcRzSg6UZ1kILr6bqNZRhixDWBSPPzwK0FAdy
 Ne5BvIilZ03aqLHr04sPelAe69mVSsXKSkN6+Bqm7SYnI/k1VoXLHikKzz3s/97vuvIo
 xfvSEJjKi1l27u7XnojQHOBjkisc2VWz8IEgbq3PjI5/ABf/vpPxZY/mGuZbUvASXteZ
 g2bofBQxZSUPtbLMDd+AmsJMxYhL+NXconQGO1vZoSvMfOCVIGP+VBQafbchsJqnJ7kW
 eE8A==
X-Gm-Message-State: AOAM531dDbo7N4OCChgICg8i+DLszZtlXz+I6HYjG02qLixjrfhmiNia
 ue049BDnEOrfDjQW2osNILGaEg==
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
X-CRM114-CacheID: sfid-20210127_131732_018210_24ED6DBA 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210127181727.XaixNyTYImsDn-1DEoo2ojIzqRMhL52R5hzWw57Umrs@z>

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
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
