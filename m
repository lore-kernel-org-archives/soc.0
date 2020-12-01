Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9816FC64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:43:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 59AC020870; Tue,  1 Dec 2020 13:43:45 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760392086A
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:43:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="s+sQYh9u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760392086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f181.google.com with SMTP id k11so1228496pgq.2
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Dt1UKiHvns/wxXXTVZSOMf0MQOF2uaj5QHuWAWvMyQ=;
        b=s+sQYh9u4PNPxijEivUJmC+SmfbhXD8FTmrOqhu9dToUrWo5DfciQQJdy4IbfxcQ8O
         AvhBgVMH/tidGkmkSpJtKl6wamNJiCATDJRvLEaPd6mdat4f0wIX9IBlLAlYf+iT6TbR
         9+uWSA6ucNTLiF3WfGTsnnNF3hWW8jRU5yLmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Dt1UKiHvns/wxXXTVZSOMf0MQOF2uaj5QHuWAWvMyQ=;
        b=ltooze+XfC1Qo9qLiOksKYLhcZtap1YzuftZBxJcqX9jS5JTJnSS1i9qs7HcxMGQRE
         ZMgzsl5sfk4Iq7QNMa8nAi1eFPgMgGZAei/k1vmik8QH3BXlnOh7Ctw9xvHRPgLLqDuA
         xv9Tuchq2eq0FYWJ/WS3TvOSJNAXHCUkEuNXz5puFW2TC1dkPSrtELYBqWS58s+wQNVj
         GK8UrQsZTgvqnkGkwBevSXtMFLHZcYifATXCAMyn12cEeyny91GO+Q7jcMsyjAhDHbNk
         RxWjS9II9OsCQfXVouix1gynFYqvzTUYJV2Ea67LgTVikmocfhTGPLZ0bl8LEtEqrImQ
         Jj/A==
X-Gm-Message-State: AOAM533bBgSKgIl5AiiH2Cmh+n8nQgYpY7RPcnzd38fPTIDBv5AAQuKA
	wYsbqpBBgUdkjob/cjlhcb4hV9PnJO070g==
X-Google-Smtp-Source: ABdhPJz6Fbr0orPaVYv9paiSOtvGm5Y86cBYdh70h4VRs2mpXlZ7xEcjl96/rs7H5GIcwZsfby+XCQ==
X-Received: by 2002:a65:620c:: with SMTP id d12mr706840pgv.220.1606830223429;
        Tue, 01 Dec 2020 05:43:43 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:42 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	olof@lixom.net,
	arnd@arndb.de,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v2 02/10] dt-bindings: vendor-prefixes: Add honestar vendor prefix
Date: Tue,  1 Dec 2020 22:43:22 +0900
Message-Id: <20201201134330.3037007-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add prefix for Honestar Technologies Co., Ltd.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a6cf2cef6f89 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -451,6 +451,8 @@ patternProperties:
     description: Holt Integrated Circuits, Inc.
   "^honeywell,.*":
     description: Honeywell
+  "^honestar,.*":
+    description: Honestar Technologies Co., Ltd.
   "^hoperun,.*":
     description: Jiangsu HopeRun Software Co., Ltd.
   "^hp,.*":
-- 
2.29.2

