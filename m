Return-Path: <SRS0=hDLm=OK=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175E2C433EF
	for <soc@archiver.kernel.org>; Mon, 20 Sep 2021 12:42:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EA97661019; Mon, 20 Sep 2021 12:42:08 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE17760FC1
	for <soc@kernel.org>; Mon, 20 Sep 2021 12:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE17760FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f51.google.com with SMTP id u8so15951924lff.9
        for <soc@kernel.org>; Mon, 20 Sep 2021 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hr7++l5WuIJ3QbTb1muJLIYeQhycvVCwIfK8xwCK0lk=;
        b=nDLfjWYlYoJdQDKQVkel8PQOrJt2sQoW4MYJA3uqAsNj59p9NbFuwlUokwasgQHucu
         7VEjc4T0sqUhLEubj8xk5UHvL+XYRKgmCRaHjAM19BwHP/2fdqokZeTfQwslqKWoUEsV
         i/J0hdUos3p3PEQ84D2/iJ0VMrK5lm8I3sR66ovnlB6NZTjvch6Thb0K53KbPVEryUbb
         85gGt3QdgXVtAaF0e2wtR3HAg0XKdUJsEXkv5Z+JmETfWN1wtWCadYtAtsrqtvHey4BU
         uHiehJK1sg9Eb1puxisTNfq3wEnNDb7cbWNVUix+Z7RFZRZXwEAJEXEzDITXj/OaINZ/
         4FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hr7++l5WuIJ3QbTb1muJLIYeQhycvVCwIfK8xwCK0lk=;
        b=1DOaybgLGAiLQhqVSZ/YfpNGMNEXOu4Ukycrpu95sluiy+jgVIn3zKvZch0AdTjjLt
         VMmIygjaiuMQZh7oFI10+bwKCJT5uKnS6zQAYjnDQAgWmUvbah6DjzXXpM7N7W3l7pw4
         cP5gAucJ5OWaQl9+aiAhv9+rlIEahTu8n8HlxiF1RsQGsqFSr/RmafkbzYaS7W7Kwaso
         vwGMQsPoRoaRd8CwK015qlV7U9vw6Di6qt2nzGk7Yu/HT43LBoatM9eh7rzMULo7NPHW
         PQzhKnPauCQxaupLMD+6jXPFfaE+9hjvTRChdvXv18hlyU993dLDiJ/qJqBxF2ACWcem
         AQ/w==
X-Gm-Message-State: AOAM531eF1TRO5McqafHdj/4EqWxMMxXqRNXkedQa3koidehApC+E+tU
	M2kKs4gbBvC4Svj0EedowxXPTngApWGyByRV
X-Google-Smtp-Source: ABdhPJwoadCgb7r/qWWgGsAlmHH0LQz9izuJ5mTYhJpd9dpLOLSNCUkppvO6+7N7MNxy+hsNTWCTeQ==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr18180477lfr.295.1632141727145;
        Mon, 20 Sep 2021 05:42:07 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:42:06 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	dinguyen@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tn@semihalf.com,
	ka@semihalf.com,
	jam@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 1/3] dt-bindings: mtd: spi-nor: add n25q00 schema
Date: Mon, 20 Sep 2021 14:41:39 +0200
Message-Id: <20210920124141.1166544-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920124141.1166544-1-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add schema for the n25q00 NOR flash memory.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index ed590d7c6e37..efb3c5e05c5a 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -18,7 +18,7 @@ properties:
       - items:
           - pattern: "^((((micron|spansion|st),)?\
               (m25p(40|80|16|32|64|128)|\
-              n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
+              n25q(00|32b|064|128a11|128a13|256a|512a|164k)))|\
               atmel,at25df(321a|641|081a)|\
               everspin,mr25h(10|40|128|256)|\
               (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|\
-- 
2.25.1

