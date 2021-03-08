Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900B0C4332B
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:09:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 58A4B65240; Mon,  8 Mar 2021 17:09:58 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BAF65239
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2BAF65239
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOG-0003HZ-L8
	for soc@kernel.org; Mon, 08 Mar 2021 17:09:56 +0000
Received: by mail-wr1-f70.google.com with SMTP id e13so5096872wrg.4
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:09:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ukC0JfJdbz8UciMbMC02R4iISKuzu012voJzqN/ruB0=;
        b=Uf2yPA/CKp7vieqhiJGmCjLmUdrHhBCC2PsuxjJrTvcwnuZifc9iyVAPKKydWsqOKf
         Sa913v1gsjydf4EHZaKo9SQY3cAFjhxKwi36MwBLWpealBcVLjKAYGeA/RUBLWzuUfyu
         EjzqGfrYbNxprOlKnKp+swOo3eS37EGfUEV505DVNOJzIYy4GbHeEeN2QtYQvisUUH2m
         OJ9zkIunOtJtsfpy/4HLTBt//RY7Mh+eyHOwqGOdQazXH+1jlZclCQn2c6LCvl4rOkIh
         PIZhhz4BKqd96jGJ3YwzIjuClF2Zk21jjwz9ZEjpoR7ZvnbFddk3S9E33AbiOstLYVZ5
         8mqQ==
X-Gm-Message-State: AOAM532ytzyXoYCrRq7BHOgjepCrleHiLO1inRRF0faJ02KRn8b8rdiO
	yLfQywqYSbWQ2EXKrfQjNNHGngXtA2zEgm/Q7hN2v0v5E/6rcSSe6dUbhcMbDUoUthWadff5uSl
	0TWfw8icwp6A61TVv3AWzg4I=
X-Received: by 2002:a1c:9a48:: with SMTP id c69mr22783952wme.157.1615223396321;
        Mon, 08 Mar 2021 09:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxg1tzEzl6V9B1Py+afG08QLfhRYQSYMhg4CheqNajHRwteoMi2lzjfEhuUWx8liPV8o2DNDw==
X-Received: by 2002:a1c:9a48:: with SMTP id c69mr22783934wme.157.1615223396161;
        Mon, 08 Mar 2021 09:09:56 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:09:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND 2nd PATCH 01/10] dt-bindings: arm: intel,keembay: limit the dtschema to root node
Date: Mon,  8 Mar 2021 18:09:36 +0100
Message-Id: <20210308170945.161468-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

The check for the board compatible should be limited only to the root
node.  Any other nodes with such compatible are not part of this schema
and should not match.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 Documentation/devicetree/bindings/arm/intel,keembay.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/intel,keembay.yaml b/Documentation/devicetree/bindings/arm/intel,keembay.yaml
index 69cd30872928..107e686ab207 100644
--- a/Documentation/devicetree/bindings/arm/intel,keembay.yaml
+++ b/Documentation/devicetree/bindings/arm/intel,keembay.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 
 properties:
+  $nodename:
+    const: '/'
   compatible:
     items:
       - enum:
-- 
2.25.1

