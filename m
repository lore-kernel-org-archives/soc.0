Return-Path: <SRS0=GqV7=PN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C00C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 05:49:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29EC60F92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 05:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D29EC60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YeGCfuUCIEq0JPx1RkF0Q11k/n7jm5BKLnflRy4Mg6Q=; b=XWhRKDxXDkf4O9
	3c4eiHLnA9a8cqvyrpv93hC3rcw5Os3EiZVnCUlTWM1Ps6a0Nk/hbiLNB/j/YLTQv+WCIGDHk2AoR
	JJuQangdy1m+b/pjczem6MrUYCTyAtCkL7CblQbWfL90mogQHxJmxUoD2IvCklPIRVglYAYiD0afj
	57tLJ2yjt91qCgH2UYXFnKDdc9MUMBjTNKMe5PSZ5CLEETtXC6gUMe74v3s+fIbO5K5VBN+AfYdaS
	nX6VSpuhko+//aUm3I5dg42uWzzdLbid44TaYx6EaP+hiONc8zjTixP99u6Xd4Q4Hje6QkUMnKrgM
	r7YMvT94NDjKIEBCrLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mesqK-00FKa0-5U; Mon, 25 Oct 2021 05:48:20 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mesqG-00FKZ0-6U
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Oct 2021 05:48:17 +0000
Received: by mail-pj1-x1034.google.com with SMTP id om14so7379167pjb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 22:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=l36kjfGLF//meBamxVhbUTif+pfSlZI2ztZUtc7k04cB1Eka267Z8/tFZANP8Cl3gl
 GAII5CGLblbQ6lMM8YSr8eEge4yHejUJVisVcP7p8HU3T+xAwFfxNpWM/JDcZbmB5+DM
 ZaPHAeVr9RnkvDA3AJZ7+TG5nrheRHALhwQUq37ALB8pyZZYLWmKovg+grUQBYw4PCBC
 blNnmJrm4jw9691wpyeXvswyjJ1xxG7NdLnB7V+yz/7sAQvLbcdtGhuFq57DYGrQklel
 FC+rp9N8RrFdcCUrHQQyYn/B8cZyyy2wmKXHf1/L644pXBePjSyuiL3wfxtjh7+Z1O+8
 puOA==
X-Gm-Message-State: AOAM533g8B0dI+EQ5Tjh4vEBScuoIFQKLGIrghuz4Wgc7jYpOerNlj5H
 kw6gjgdrn2w4mHBgYb5YmamFUA==
X-Google-Smtp-Source: ABdhPJwqCp8pBmFqg+NNI6j0i5FSyNi/eBtYMF6i6nH+g93AxNg1zuts/cMVuZ8kd2i7U4r9zWl9hQ==
X-Received: by 2002:a17:90a:dc0c:: with SMTP id
 i12mr16540094pjv.60.1635140894787; 
 Sun, 24 Oct 2021 22:48:14 -0700 (PDT)
Received: from localhost ([106.201.113.61])
 by smtp.gmail.com with ESMTPSA id z6sm1111844pjr.35.2021.10.24.22.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 22:48:14 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: SPEAr: Update MAINTAINERS entries
Date: Mon, 25 Oct 2021 11:18:10 +0530
Message-ID: <b3e7584fb5fe7402065f54f13954c9eca9c47bb7.1635140757.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_224816_292999_312EC1E7 
X-CRM114-Status: GOOD (  10.01  )
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
Message-ID: <20211025054810.P3y_B-mV2EWtw1OmW5HJpE-8EEatw6gcnKVqiG7FJAc@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
