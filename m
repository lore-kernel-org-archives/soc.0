Return-Path: <SRS0=7jOf=OA=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B00C433FE
	for <soc@archiver.kernel.org>; Fri, 10 Sep 2021 19:03:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E17DC61205; Fri, 10 Sep 2021 19:03:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5630611C3;
	Fri, 10 Sep 2021 19:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5630611C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id q26so4017780wrc.7;
        Fri, 10 Sep 2021 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXevfslZuYBVfagltpQRsoEe64TrqKR3SYZSkmxiNRI=;
        b=lCIqFvZwSN+DNqD410N9Zrf203q9a9c12M25Jit2InUObJooZ0K1+AsYKwb9E4P/pd
         HR9r2aB2yFSSGJLdf/aJwHo76xpuqlSY818/cnomgdiIEg7IZkRMb4NcFG2hnRs1IxRk
         yyfBzd8bCmqC0yXhPaixK5ORcgUDvIDi5z4XpjAkdwXCU64NpW7iMEH7NIOmeQ1c8VYQ
         KrpF9dEZS6JFMHUZHt3vh89fh2aF30CqER2S7yoN7HEY5GhoVAE9/lFP6D7/giqY1tpR
         EyBVBJL9uBepI5q/WRZtjaZ8hlA0zqA4YD6VjxCAJ3ykuOTorkE9iYVkoi+lgkGWLBBs
         A9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXevfslZuYBVfagltpQRsoEe64TrqKR3SYZSkmxiNRI=;
        b=OmaMirVtdRMoyFd57kBGahcywfXlgRklJ8flv6Ghc2TWtITH1Tr82t5bVB5kHx5eYw
         cSGQvpWsR0XtZCaSoZz+sl5OTjYTpGtuUcn3btRy1Lw/bNQUWoXuNF+uayzq9IEmAP75
         Fdf3h23VhQwya3zBLoOvvQwl2po/FGCJxsCZikLgVMhIL1ESle1fJyYyVyLi1TzwNz3Z
         ReYH1P1NnNYJYujbAOb2RKnIoDSdsj8Dk064G8GbhKXxreOavZgXiP5h3UtpnaCMOMKn
         ST9AeSSzEIinPtuWMJc9K7BM9hoAoqo1x79Lhi0QtfjEafEmwKOzmAISIcsnQRscuIhp
         bYZg==
X-Gm-Message-State: AOAM530/8QV3cHgEuEdN3eG3JgTDONr8AFZ/EfTX7au+M1szxsaXq8ix
	ek0WSttSTZCJ054xgEitovglXJUOJGE=
X-Google-Smtp-Source: ABdhPJwhaTrECPI7JhVVNrpKyE4W+cRTf2a/tG92fHbQUb8KyGNNWgUi0uiIU71pYg4bp/XTO7ckFQ==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr11159838wrv.369.1631300627378;
        Fri, 10 Sep 2021 12:03:47 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id l124sm4986620wml.8.2021.09.10.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 12:03:46 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	Romain Perier <romain.perier@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers
Date: Fri, 10 Sep 2021 21:03:22 +0200
Message-Id: <20210910190322.27058-5-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910190322.27058-1-romain.perier@gmail.com>
References: <20210910190322.27058-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As proposed by Daniel, I am going to help him to maintain the platform,
so add myself as co-maintainer.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a9a7cbf9456..ad1a0e5a5425 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2231,6 +2231,7 @@ F:	arch/arm/mach-pxa/mioa701.c
 
 ARM/MStar/Sigmastar Armv7 SoC support
 M:	Daniel Palmer <daniel@thingy.jp>
+M:	Romain Perier <romain.perier@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
-- 
2.33.0

