Return-Path: <SRS0=dkC4=PN=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B730C43219
	for <soc@archiver.kernel.org>; Mon, 25 Oct 2021 05:48:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5BA8D60F92; Mon, 25 Oct 2021 05:48:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B1660F9C
	for <soc@kernel.org>; Mon, 25 Oct 2021 05:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39B1660F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id r5so2564782pls.1
        for <soc@kernel.org>; Sun, 24 Oct 2021 22:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DaO/I7zrGwHii1YXKuL+/vOCr6hZ1FTRa7vDeoKH8TY=;
        b=nnwoeFpgzxqFHurz8uYxp99TJgygpjTD8OAtWOsdL14bZzHXjaDhS4Sva/XJV3lCgJ
         2cU2zmuBNwl1sN7nkEU2lqm7X9T+NjxWI2lMVdb375RgjV4Z7E4DUrwSd/tAIRDFvJzB
         ZBShFXTPJm4Bd006skyzKJhzTeD9Qw4+cLyUfhJMm0Q/fpwdGV5P65vYvJnOlwR3+GBC
         oWQ4jl/PwY4fgZKMt5uxrbPpsWUokbi6FsREY45rnQHMrCpD9cXpwxHGqwsUXzdQavY9
         v9d37BSrRZChBQXnskpOu5VUzyfQzSxy9ZHtEHDlD7dgGEhJoj3+amFiE0lRI4wMGHio
         HzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DaO/I7zrGwHii1YXKuL+/vOCr6hZ1FTRa7vDeoKH8TY=;
        b=CfZNJ1Bf25DDZ+hQB2vsFxziTadiq3NucJUJXZbf5BK/AhOYXUZUokhE7ZByzDWRDH
         cQWY4OHNHsNUOImlQegc4Jg34msaFeV7o0qy7IaeLxOycZ4F0Nj0jz8t9Meo+qcRt1di
         c4dQq00Pi+gMZh2ZH7bm2qvIdUkwOTZLi9AmaHnKbB9h4QGiEeIDT72qfZvuXx6O1JnV
         yEjXjmsYZLQfLcwn1Bf0YR52q3pDO0/SylQiFmxbBoJ3seu4YegWTsqc+1hgwY1HWEJl
         Tt/omcTGp7hu+vayFfx47ZUR9pvZZdsN+wOfpDha93eRDNlJb2mWpuOWHKEL4Ibw+anw
         X5Gg==
X-Gm-Message-State: AOAM532pgf1S91yyVPX50jJFz+7Q55XcZ6a2Y4y1wy1sfYMLTmFS7NEy
	EB/JuLRjz4vq7DIMETniJHnyZz7Bd5x6DQ==
X-Google-Smtp-Source: ABdhPJwqCp8pBmFqg+NNI6j0i5FSyNi/eBtYMF6i6nH+g93AxNg1zuts/cMVuZ8kd2i7U4r9zWl9hQ==
X-Received: by 2002:a17:90a:dc0c:: with SMTP id i12mr16540094pjv.60.1635140894787;
        Sun, 24 Oct 2021 22:48:14 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id z6sm1111844pjr.35.2021.10.24.22.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 22:48:14 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: SPEAr: Update MAINTAINERS entries
Date: Mon, 25 Oct 2021 11:18:10 +0530
Message-Id: <b3e7584fb5fe7402065f54f13954c9eca9c47bb7.1635140757.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This merges few entries for the SPEAr platform as separate entries
aren't really required.

Moreover it adds soc@kernel.org as 'M' entry, to let them be cc'd for
patches, since they only pickup the patches for SPEAr directly due to
very low traffic for the same.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a4a0c2baaf27..bd450d524902 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14858,13 +14858,6 @@ L:	linux-omap@vger.kernel.org
 S:	Maintained
 F:	drivers/pinctrl/pinctrl-single.c
 
-PIN CONTROLLER - ST SPEAR
-M:	Viresh Kumar <vireshk@kernel.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-W:	http://www.st.com/spear
-F:	drivers/pinctrl/spear/
-
 PKTCDVD DRIVER
 M:	linux-block@vger.kernel.org
 S:	Orphan
@@ -17630,21 +17623,17 @@ W:	https://github.com/linux-speakup/speakup
 B:	https://github.com/linux-speakup/speakup/issues
 F:	drivers/accessibility/speakup/
 
-SPEAR CLOCK FRAMEWORK SUPPORT
-M:	Viresh Kumar <vireshk@kernel.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-W:	http://www.st.com/spear
-F:	drivers/clk/spear/
-
-SPEAR PLATFORM SUPPORT
+SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT
 M:	Viresh Kumar <vireshk@kernel.org>
 M:	Shiraz Hashim <shiraz.linux.kernel@gmail.com>
+M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://www.st.com/spear
 F:	arch/arm/boot/dts/spear*
 F:	arch/arm/mach-spear/
+F:	drivers/clk/spear/
+F:	drivers/pinctrl/spear/
 
 SPI NOR SUBSYSTEM
 M:	Tudor Ambarus <tudor.ambarus@microchip.com>
-- 
2.31.1.272.g89b43f80a514

