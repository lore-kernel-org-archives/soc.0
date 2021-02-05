Return-Path: <SRS0=2nFo=HH=linaro.org=manivannan.sadhasivam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0AEC433E0
	for <soc@archiver.kernel.org>; Fri,  5 Feb 2021 05:07:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6785264E24; Fri,  5 Feb 2021 05:07:50 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F8F64F4A
	for <soc@kernel.org>; Fri,  5 Feb 2021 05:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43F8F64F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=manivannan.sadhasivam@linaro.org
Received: by mail-pj1-f48.google.com with SMTP id e9so3143955pjj.0
        for <soc@kernel.org>; Thu, 04 Feb 2021 21:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wf0juDHA/3lpSdIxB8nbo3LDBFkQ1WETHuILicgkGJc=;
        b=tdEOQJYQ+Iyo4yAwI4JeW32fRXN13vO5fcBlyzgz+i0Q7pvIB58kMNeDm6JThQgiFO
         OejP59cSh7gr42rxym8aalm9PoImQDytJTX262p2TwxlzOkcRVmOuYl6DD/9vSYEhQ6h
         Xy0BDnHy5Zvbh9OJPKJvNUym7+oHfSH4vn52yvfkDZhkA7vRR3GDDRsZd0ZUlLTb9uGG
         o5sfCK0QgrkxQhxcjqgam5Cji8P0YDxusrv0jdSxW/4AEaySdz6NkX2CnUAuv8DVfpX0
         Ty/Q8Hzzi08W8H5Jk1YLUdWZHLKHh7gFYQxCFGkn9grdOS5emCw3UcmxrOxmjNaKz61E
         yL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wf0juDHA/3lpSdIxB8nbo3LDBFkQ1WETHuILicgkGJc=;
        b=MQY2j7qxDo6on80k1Hn6sLE3pIcBhs9Bx7yP0Qi7RRHdZLHdOPk57bNzq0knKYG1of
         kOkZzBAkqZ6146O3MrRNSImZKAl88bxCAUCl5HAO8VDEdlJVwMGybWJUbAMxWIVtpit3
         OZuhBJIyKzskBKsAIQhEDwwyL8yE9aX1xv9SFicKJISClwpTjExqnXloX2CjA4SaE/Ah
         0lwSdlOXSBVRTdbTGXlYc5EkZAxrGjfLLiVsaJSMuCTdu6Ob5JF5FDdXF97sarBg33ia
         v9QF5MK4TGFz5dq1BYJkupDSf2uWFKOHSHKNBaCKX/h4hnnrPb+NDBfWGfX3WwBV5859
         L8XQ==
X-Gm-Message-State: AOAM5313hs/XF5Gg7bB7tKySSDJSkv0aIg1xDfgjCHlxUxhEEMuKp7dY
	Lhcvny10izZDL5mhQvyJey7ryREcbN0x
X-Google-Smtp-Source: ABdhPJzEQFrLBNzYi8/ohr+RUMZsZTJkwoYe+LJX8VsApet9yXDa1O+r3QxR2W3R+rVYAw0JBfDA8A==
X-Received: by 2002:a17:90b:250:: with SMTP id fz16mr2402406pjb.227.1612501669497;
        Thu, 04 Feb 2021 21:07:49 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
        by smtp.gmail.com with ESMTPSA id 15sm184842pfx.172.2021.02.04.21.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 21:07:48 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: olof@lixom.net,
	arnd@arndb.de,
	afaerber@suse.de,
	linux-actions@lists.infradead.org,
	thomas.liau@actions-semi.com,
	cristian.ciocaltea@gmail.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Add linux-actions ML for Actions Semi Arch
Date: Fri,  5 Feb 2021 10:37:22 +0530
Message-Id: <20210205050722.8313-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Add the linux-actions mailing list for the Actions Semi architecture.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Hi Arnd, Olof,

Sending this patch directly as I don't have more of this kind for a PR.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 546aa66428c9..74a6eaae7b31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1512,6 +1512,7 @@ ARM/ACTIONS SEMI ARCHITECTURE
 M:	Andreas Färber <afaerber@suse.de>
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/actions.yaml
 F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
-- 
2.25.1

