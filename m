Return-Path: <SRS0=1+dv=OA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA5BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Sep 2021 19:07:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095E4611C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Sep 2021 19:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 095E4611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMZ8YeKIPUMS7aybR34olOLTTeD9zYW7hUXB+XRVdEk=; b=we24hiOFXZ30ni
	UkK98DRPehe81iC4QV4oDm5WsXVl54a9S7obKGp6zSwly27nbNCyna8WqsjeAzjCPWySdW0Bl7Q7+
	IKkGI2S34LzQBqY7p8W/6l9POGo5d7I8WQMmzK/COBsS+WGuBjWgGXDhS2zQ+9SHnFcjSy6mpxuoH
	a3NqiitFC3Kc4LlhOLnZmAg7HVgsTaqjd0rlvx8tZD6KlljEDxE9Czvcln6p6wKcWdXx3cuFO04Pu
	rg+gwuw2jCQNYXdhg4SlQlpj08Q4sHkfViUITZEbQ+WiweCh0gQNv1AhGZRFvAEOIqO4gZl+qvj2Q
	a5tg7+sSCVfbT83FyrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOlpK-00DVk2-Vc; Fri, 10 Sep 2021 19:04:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOloS-00DVPh-HK
 for linux-arm-kernel@lists.infradead.org; Fri, 10 Sep 2021 19:03:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id t18so4079290wrb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 10 Sep 2021 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=HHqwKK2aDJtS8456DRbs6KwN4BYDzyvodboKD7L95pviOw6LaqG+W3sA7DE2gx07ty
 /9LOC4X/x4DXQ/97/WnSGy/kSpZB0wKpw4wiWeGdZlUWEN9InbY2bL1HsWQyRz9wtSAJ
 9dK/1jXfDLzjYEcCOGg0xHlRAft9BXpKeQJwcaa0sy4fB3EtFBouPVrQpBCFZu2WKSwa
 mg/lZXZH3Ilhjo/TI59vZmDsL9SF6xtKPr/KFd0x9WDJiV05QP/O7ycD8aikxkUtxEbw
 +lcL56HmkQuAF47y9goi41fr8NH0MGegcBbicIMcKh2gaRA3/YeZB6C2bLaL+UhexwEY
 7Qow==
X-Gm-Message-State: AOAM533nOmW5MnnbsCqbki0VVLE3Z7YDhamn4KoTGb56/yVKxaOUi8Za
 XtUuP0BXC2GW69gBgN6y7Xo=
X-Google-Smtp-Source: ABdhPJwhaTrECPI7JhVVNrpKyE4W+cRTf2a/tG92fHbQUb8KyGNNWgUi0uiIU71pYg4bp/XTO7ckFQ==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr11159838wrv.369.1631300627378; 
 Fri, 10 Sep 2021 12:03:47 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
 by smtp.gmail.com with ESMTPSA id l124sm4986620wml.8.2021.09.10.12.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:03:46 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>, Romain Perier <romain.perier@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC
 maintainers
Date: Fri, 10 Sep 2021 21:03:22 +0200
Message-ID: <20210910190322.27058-5-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910190322.27058-1-romain.perier@gmail.com>
References: <20210910190322.27058-1-romain.perier@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_120348_631969_FCE165FB 
X-CRM114-Status: GOOD (  11.46  )
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
Message-ID: <20210910190322.cLx5d5PXwwjgl_MbuGLEVO8AAmxCkVtVgXIr5kqrZPM@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
