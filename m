Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE92C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 11:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B076A61352
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 11:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B076A61352
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3dFxGVtPxAKE7GundA3lh7B4Dc/FHmAOr2E9qULFqCg=; b=c7Bl88mVl01y9W
	97NFqfI3TFoxQEqirkagMH4A0dkT0tI8gItdYfaNEm/UMgUOc62pD5ko9yvS+/HNjsioxlDTUwFsa
	neLqjdLta4uTZiEMQUTG8WP17iV9IHjLcWB4bw05vknXLre0/cJleDvmYiGJ8vv0s+zQ3BsDWmJcZ
	yNM6k4Y5dHqAuPMMveoKqtYd2h+IN0MXn2TEopqQXQtRuvOB62YPHSemJg4JpLiKdPoge/mBUsBbR
	6MCPXgMIHGfr54U7Cw0HXvQAU3h5QglLYWeWpmryPtkEjw+I9U0J/unEY3pNe+BkBHo4OJHeU8pnE
	UD64QzTM7cfRQgTdP2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcQM4-00FBfs-L6; Mon, 18 Oct 2021 10:58:58 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPxW-00F2ST-Mf
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 10:33:36 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e3so40174005wrc.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 18 Oct 2021 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=moJQ78F9oXsWwcjsOjRc3VK50C8FMLYVsh1+aqFOWVI=;
 b=SGbLdHaCHPafWnkcsKJrt8C7uSJJKjuE1s0WSZxitXueyV10vheKPI1GlKLjamhR/h
 mzJe7a7FXuugyTVhDzqGFD5GuQghM67V3ISQDyrU8nPg/cQiSrXe3J66oFyhkHih/NF0
 BdCrNdo5R+hFb42+dri9MqiCvzR/dhNPv8Q+J4EMAb8qm7RRslzt4ax60VC8rcXsi9ge
 MC/DGjcXXBt3mjSLfYrF2HDt9weYL8Rh2SeZVHeczTZ9PyR4Si7FmCJgZGUwxVUGCVe9
 nyiMg/NnHmrPgQSEx1pL2fXo2x/kqd4BbGTYkSfhDE3Sx5hBcAx/dLpadpjASFYPGjp8
 Ku5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=moJQ78F9oXsWwcjsOjRc3VK50C8FMLYVsh1+aqFOWVI=;
 b=ctMjgANcPIeLYmsPQJy+hmvSiVagLoHv1BNbnHeIC9GADx2Chbb+74vmTHWi1CJ8/D
 qVhJzXXZGco3MntNlJyLPfbhjJIfPgbucunxVr8Er4tqdJCBdArrfEpxbhubHc7fvTqp
 oAZhTnWaFZUfe8RipLOoe+lbLRituiqPLQTw2Huk+l6XvYoWxNmuj1HLKNowjblUxD6/
 td720awc5ZttrFYY8x9vhlF8aqTWnLgrmU0hKGYqMqw3eTFAsIkcOCDQswopcIFMSZTu
 psCQ3MJJn63kVjm2QDHvbREc9dM7g4GyMdy5jMG9rbK0oNiUt5RRTQRREPDxvhTNi+K3
 7TfA==
X-Gm-Message-State: AOAM533Jw/xBxTHg70HrQP//q2LiHjNDYi/VKR5Cb/lIJubZ5QR62M7i
 oaeUXsdbOCPlAPCvOOeW4v4=
X-Google-Smtp-Source: ABdhPJx+JeHhyFTrMDRiVtMFDM8Kd4upVKRwte0zT1MHPBh7pH9grloOuAgxFRGNtd41Is/2nY1F8g==
X-Received: by 2002:a5d:6888:: with SMTP id h8mr16880082wru.395.1634553212482; 
 Mon, 18 Oct 2021 03:33:32 -0700 (PDT)
Received: from localhost.localdomain ([195.245.16.219])
 by smtp.gmail.com with ESMTPSA id o8sm19062252wme.38.2021.10.18.03.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:33:31 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: [PATCH v3 0/2] arm: ep93xx: CCF conversion
Date: Mon, 18 Oct 2021 12:31:03 +0200
Message-ID: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_033334_788508_C185C190 
X-CRM114-Status: GOOD (  11.04  )
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
Message-ID: <20211018103103.vYIZMUgLYCR-FxPzGirys02ZiJo1uMXSMnPRB7aOnIw@z>

This series series of patches converts ep93xx to Common Clock Framework.

It consists of preparation patches to use clk_prepare_enable where it is
needed, instead of clk_enable used in ep93xx drivers prior to CCF and
a patch converting mach-ep93xx/clock.c to CCF.

Link: https://lore.kernel.org/patchwork/cover/1445563/
Link: https://lore.kernel.org/patchwork/patch/1435884/

v2->v3:
Rebased the series onto v5.15-rc5
v1->v2:
- added SoB

Alexander Sverdlin (1):
  ASoC: cirrus: i2s: Prepare clock before using it

Nikita Shubin (1):
  ep93xx: clock: convert in-place to COMMON_CLK

 arch/arm/Kconfig              |   2 +-
 arch/arm/mach-ep93xx/clock.c  | 975 +++++++++++++++++++---------------
 arch/arm/mach-ep93xx/core.c   |   2 +-
 arch/arm/mach-ep93xx/soc.h    |  42 +-
 sound/soc/cirrus/ep93xx-i2s.c |  12 +-
 5 files changed, 587 insertions(+), 446 deletions(-)

-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
