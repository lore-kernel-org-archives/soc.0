Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27294C77B71
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11FEAC433EF; Sat, 15 Apr 2023 10:43:33 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38FE6C433D2
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38FE6C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-50489d1af35so5682748a12.3
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555410; x=1684147410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JY3jsR/xgkB17cBH5xBif+/bYELKytDPMGjtCShK30=;
        b=rrCnD2MJDWFKfYhL7x6nQnOh+YMKDuJI9rtquhzI+vLy8lcLiIW6BnVDdMIgT9ZGdS
         4br3TNxPAMwdnqae60DiBJkB/ehAtzVa/IsiKJFRzupmu6LA+mApQJg7YnfZCLzmECiL
         dyRl0mQXmPat6dmp2WMr5QIkCWnH7SrLfvBiKn/bknOM/O8OazYf3stnK5C/gx71gkx2
         YcWAf75XPGDbC5b0WI1ZVfypjCzs1ZgAI1eJgTYXzZduZYaS8QuZQv5Zj46D1VawW4fr
         UeqjJDXn6AUzXXnXZ3U+2c6biextlhNru2xr2kTrDmwPXEer8lYNF/Br7j7Y2l0IiSu4
         +2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555410; x=1684147410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JY3jsR/xgkB17cBH5xBif+/bYELKytDPMGjtCShK30=;
        b=WAwezN+NSMbddaPZI5hgFzCf6FGpr6hBSZTTRiJr8MagaO+BYyCDYq6zl07FLjyU3+
         167atDf2pWndsxF3WJl7nYUkJ6G+rLX/RmDu3pRzRTBnMWPFsGqMFGF8tejBGEiRtFRN
         OWSzcFZvknuT01GODMXo61lC8blbPLKrCQCxKsADXNhwnELhBjClAnU+PzYK0buD7vXZ
         VCTT6Z126Aj2oRVUXvajNKERumqCl29hJQ0v7AEa6Q/9oRLHj1ATNXqpW507QyhAK5mN
         OozdvfIGLVCkPkjzmNp1RDolmO8xBENG5MHy6xtsvwpj81w5W/cB4J1C/u5COqUHo+Ku
         F31g==
X-Gm-Message-State: AAQBX9cLXnMuIj5g1jVH2Rzow5kC6SinQZp2XBJowq9BCr43c9sqoosC
	cqbnYoqFvU6JwzRQJb0xacLOLg==
X-Google-Smtp-Source: AKy350ZATVXui9h9cXaUtzFUPITgQBvaiO//1uAf1DShc4vcU9QHEaLogN577tZwy6t7lyOCjeea1Q==
X-Received: by 2002:a05:6402:1486:b0:4fd:29a1:6a58 with SMTP id e6-20020a056402148600b004fd29a16a58mr9791328edv.19.1681555410463;
        Sat, 15 Apr 2023 03:43:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/15] w1: omap-hdq: add SPDX tag
Date: Sat, 15 Apr 2023 12:43:02 +0200
Message-Id: <20230415104304.104134-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace GPLv2 license text with SPDX and drop unnecessary file name in
comment to fix checkpatch warnings:

  WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
  WARNING: It's generally not useful to have the filename in the file

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/omap_hdq.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index ae3e504cd543..826207c24bd0 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -1,12 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/w1/masters/omap_hdq.c
- *
  * Copyright (C) 2007,2012 Texas Instruments, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- *
  */
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.34.1

