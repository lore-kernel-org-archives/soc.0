Return-Path: <SRS0=mcdX=EQ=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C1C83F2B
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 05:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0CBEC433C7; Thu, 31 Aug 2023 05:54:35 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AA3AC433C8;
	Thu, 31 Aug 2023 05:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AA3AC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a4bcf8a97so290240b3a.1;
        Wed, 30 Aug 2023 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693461274; x=1694066074; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=Z4+dzvHpv7CY+yYckFqhMXfBqC7VSx/1V9fVAWzbE5yoqTWtjnayWz513bBkQ7bvrH
         hzZt7tvjdKRVmxaFhvEZWbnsj7LQ1yCKdza1geXynS298vw7hFL1IcuGesKtw2ITPlnl
         O1iG/40Epde7P5bRSybundqvcEakgrOmCQpWNqFkPvdBF/UVl1FjjU4wNYAzN1meg1mf
         8kEAUqlEIM5+6PhAbU588dt7vhMJnnKL6O66wjZP0QuI1fpIyIiKyBUrzBlcVr2MhITe
         QIoqWNZnOqq1zAlc3xQij8t+q0j7dJsQmdw3LfVkPOriVzCPHe688wLQ3ZONfDuAPtl0
         Hffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693461274; x=1694066074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7qrHrxv+tQmHkxgkfHoWgymD/z9+utSjFBhVwcl5B4=;
        b=e7nMvHQu0dOB++kv1rzPqwpKkRE7lpu7RfYNwso+KiQyb/2GhQHxm7A2XB55XOjbsG
         TjktbuG/trRYli6RYfmw2DwsFqkhqrYVFO038pjVDPLQ4rXZbS9/e8fBMGf0AolSwLHf
         LBJn+CKN2QXcVWzoIdqmVGd/B2w3pWauKAQMkddG0Y3ufmUO5irAClFFPJA4KNaY9YNB
         iBfdVaOtPK54GkiIKyoSSOzCmxto+l1R7lZRRnnfnGJr3ZsEYdhX8krST5X/wRqnpbJv
         cCdANkibSzie/Gc9NW2ZKxh+sOoVEIHy3K+PuMQ0jU8BRpOR6OEpFYTyZSbdh8ug7Tw7
         35Ig==
X-Gm-Message-State: AOJu0YwtT7JOiTul6kj0n9AGJrTzsmmwWsVVyOnUIKqDj4CXCY0lmBRr
	3x2+wmdo1W5cP8pXLggzqUA=
X-Google-Smtp-Source: AGHT+IFUGw1M1uBQkEgMOfIGdbWWIHSByC6slXUncszykg8B6jLlpF0bDlkZIpaxT4SYXakGVB8QaQ==
X-Received: by 2002:a05:6a00:218d:b0:68b:daa9:7bf2 with SMTP id h13-20020a056a00218d00b0068bdaa97bf2mr4727872pfi.7.1693461274468;
        Wed, 30 Aug 2023 22:54:34 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78256000000b0068c97a4eb0fsm506731pfn.210.2023.08.30.22.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 22:54:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
List-Id: <soc.lore.kernel.org>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: cosmo.chou@quantatw.com,
	potin.lai@quantatw.com,
	daniel-hsu@quantatw.com,
	Peter Yin <peteryin.openbmc@gmail.com>
Subject: [PATCH v5 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Date: Thu, 31 Aug 2023 13:50:29 +0800
Message-Id: <20230831055030.3958798-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Meta Minerva.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 6b0a6683ccae..3b93bae4f43a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,minerva-bmc
               - facebook,yosemite4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
-- 
2.25.1

