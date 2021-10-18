Return-Path: <SRS0=ouft=PG=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D196C433EF
	for <soc@archiver.kernel.org>; Mon, 18 Oct 2021 10:33:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 287E46103B; Mon, 18 Oct 2021 10:33:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F331760FDC;
	Mon, 18 Oct 2021 10:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F331760FDC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id y3so40586643wrl.1;
        Mon, 18 Oct 2021 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
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
        b=40//1dgOcMmZoNHoyp5etj7fa/7wpwP6KxC/rwEnE1y+QQIZKOdNyPYrIxj4mecJwQ
         cgKSAuKX2yGEhi2SIWTG5xZ9nRShvx9uMfkygcEZDD0/4xJeqmsOOcpGS49aouB5VAoG
         4vc9m5TLH0HopBYuT85ayCcbISYngDz+1UFu1Yj9eH1/fxkNOKWGjAEwFbosexdSPf7s
         tpqgfJkFIHmHvBRWxVIR+aC7sIUIYhgnCnxtub2ijDM/oSMMZkKuqdoON7A/Q10pnkBl
         1L281gIRJQ33z67GtGmyZ1RyiCHuProgBFwq+Fl8OyiU2kKF0/r6stW1xZDIg4IBqohl
         xd1w==
X-Gm-Message-State: AOAM532ErPrf7KcDHJigQg5dd6jsbm3jjbMMQIyppH8b9gAZdIXRKUnC
	vMRy/zEC/zD0g4j/FpDPwpiAtcUyF2c=
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
	Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v3 0/2] arm: ep93xx: CCF conversion
Date: Mon, 18 Oct 2021 12:31:03 +0200
Message-Id: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

