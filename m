Return-Path: <SRS0=KgY5=FQ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE7BC433FE
	for <soc@archiver.kernel.org>; Sat, 12 Dec 2020 01:23:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79BBD2343E; Sat, 12 Dec 2020 01:23:15 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C86EC23406
	for <soc@kernel.org>; Sat, 12 Dec 2020 01:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C86EC23406
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pl1-f196.google.com with SMTP id 4so5504891plk.5
        for <soc@kernel.org>; Fri, 11 Dec 2020 17:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBtSCo2aiVK+Pe61Pe1iCNpVRoVlE9vowQAOup0zUVo=;
        b=dYSqgqy5cEveG6dzM6glJgQcweYN29Jm+7P3TivHfgKnveCQwCxxrnWF2dKcStcQpJ
         3+oEJsl6Sq5GkXwsmx03Xjlu+yrt4/+pPZiv/LSMfL+BDxmwWGKQx4/jWqS8fgJupmQ/
         w9cAUX4Jbd3eo+7K5KTIy4Q0MKjyvVzZ7nXs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBtSCo2aiVK+Pe61Pe1iCNpVRoVlE9vowQAOup0zUVo=;
        b=Di/6nBZURrgJ+lydwsFCvVmUGNvgkTmbrZDCDKK5q+SHB2tXOxv06optZHlRKxMpGw
         1K0ygCivag+z6e6LL4qUzKEagi0aTvjRcJoSVB/NadBhpKMFm2kCt2Km5e0zb4ErLyMo
         SCHj+QwRH6EIeF4mFIyv7gu5YAVdWyvKkfmlnqnnwRZyFiJqWHbsoAEJNsJT5QxzUUO1
         85C0E1gPeqjv675i2vR/t1vg4uprlPxHqpaZ0Z+6bTc8l0m4+culSSXLwTB37bsdd4Sw
         CCoecY3Hxj9SjGzWDvQkuKH9gUE/eliqUB1ToPUUyVBsQmEtYbpU+LDS2TJNxMCZeyY1
         ugPw==
X-Gm-Message-State: AOAM533y3PE06hxGHdeIR5xINXthsavElIViIqBvVnxCtOx8nCpD83mr
	MfhyXaMBTKDPEJw6QrRemHqSAeKMwwSRuQ==
X-Google-Smtp-Source: ABdhPJy0Omx3Bd/nYZtQzkm1h7saxbiLpbRzdG7yoONL2juuSNDiJMIvVeh0TdIIKVu6urt97ZoSww==
X-Received: by 2002:a17:90a:ead1:: with SMTP id ev17mr15819352pjb.51.1607736193819;
        Fri, 11 Dec 2020 17:23:13 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id c2sm11623071pfa.59.2020.12.11.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 17:23:13 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arnd@arndb.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] dt-bindings: vendor-prefixes: Fix misordering introduced by honestar prefix
Date: Sat, 12 Dec 2020 10:22:53 +0900
Message-Id: <20201212012253.373074-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prefix for honestar should come before honeywell.

Fixes: 43181b5d8072 ("dt-bindings: vendor-prefixes: Add honestar vendor prefix")
Link: https://lore.kernel.org/linux-arm-kernel/CAFr9PXmwOEuHHA-kDeL1YS8bWvovrt43MXxyy1J+hGbXwPUFSA@mail.gmail.com/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a6cf2cef6f89..5f9bb0c152af 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -449,10 +449,10 @@ patternProperties:
     description: Hitex Development Tools
   "^holt,.*":
     description: Holt Integrated Circuits, Inc.
-  "^honeywell,.*":
-    description: Honeywell
   "^honestar,.*":
     description: Honestar Technologies Co., Ltd.
+  "^honeywell,.*":
+    description: Honeywell
   "^hoperun,.*":
     description: Jiangsu HopeRun Software Co., Ltd.
   "^hp,.*":
-- 
2.29.2

