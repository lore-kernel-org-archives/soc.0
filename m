Return-Path: <SRS0=vXQJ=ZY=gmail.com=aladyshev22@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676C3ECAAD8
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 21:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C05EC433D6; Wed, 21 Sep 2022 21:10:09 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FFA8C433D7;
	Wed, 21 Sep 2022 21:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FFA8C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id j16so11360341lfg.1;
        Wed, 21 Sep 2022 14:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4M75LCnR7HEj9mQ8XBusERBnMSMu8fybz1DwQ5l1ydQ=;
        b=eTmgdq+0jDw0IWy1m7/i0AfInQwqI8gB0H6o7pPnGf/9thckvHt9AJGM5oOF9+ooLH
         ymGByAeUfbx/gFUaD9mvGcIASKGLPI/Mi5XLV91zm9FpqOuzxORpPFb6HD+PqBtJ0CML
         4ZuhYmA6xL8IZQKn/KI+a5Ab2nm5I78rwrBQYhaQ4MnVs10nA/aAYGZx0d2YUxhkbWvV
         kqvwndgFbiVT6BQIil4Wc2G7vQBMxEVff0hiwypMGxJBM42OZyBUUwwxqhT70fCnwylI
         173RuB2WwV165RRSKufhRR0IlvJRhMhA1f50Wzh9xnHWbvz0RQiOUufFJUmK6n8pLIQQ
         2FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4M75LCnR7HEj9mQ8XBusERBnMSMu8fybz1DwQ5l1ydQ=;
        b=xndiYNcr9nqmSJeNYgl+Vw594L1Ub59zm+zpWZXpXCKPOyXpTLxZRzKgunrcROVlxc
         P9bx3ptH1niQnJXwYXB38lLFetiKo4Oo2fT0V4oQclmIgNN5IMOgpbLcEof5F+GZti+A
         mOnict0DBmyNirL8OCqjDK3i3Yr24pVw1Lr4MQHzA1UUgoBYGJ7VWU+0/5wq8uc1LYAE
         NFGKMAnpU+t/Fs4F2SSyYiOQAER8ZQGlTvtSSy/G5dB6kFhGfVQR3Jeu5yTi3ZBf9kSR
         QDWVLk2tS5ZgZaz7g4MPNPFiKCYy4oTHiVLTPC/+NGgfgBXGZH/XydPTELmjdSM44fxm
         PkKg==
X-Gm-Message-State: ACrzQf0Ytl5AnFd7wq0amcYD1qrpOZcaxR1WWtU7U6Ssuol3H86en4Ip
	LWZBg9xuyQjNNdXJCplXlkT5vFOOQ3y8PQ==
X-Google-Smtp-Source: AMsMyM7BZS78FaEFgZwq10AX/72c6ZZ+GlyiViqqj3ES8IRwPmODSH7j3C4TQWbLzmZqbP8lk6RdmA==
X-Received: by 2002:a05:6512:613:b0:497:a8a6:464e with SMTP id b19-20020a056512061300b00497a8a6464emr6689lfe.604.1663794606483;
        Wed, 21 Sep 2022 14:10:06 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-46-242-10-176.ip.moscow.rt.ru. [46.242.10.176])
        by smtp.gmail.com with ESMTPSA id z18-20020a19f712000000b0049adbc24b99sm599260lfe.24.2022.09.21.14.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:10:06 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>,
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
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: document AMD DaytonaX
Date: Thu, 22 Sep 2022 00:09:46 +0300
Message-Id: <20220921210950.10568-2-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921210950.10568-1-aladyshev22@gmail.com>
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document AMD DaytonaX board compatible.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1895ce9de461..cb9bc65df82a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -29,6 +29,7 @@ properties:
       - description: AST2500 based boards
         items:
           - enum:
+              - amd,daytonax-bmc
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - aspeed,ast2500-evb
-- 
2.25.1

