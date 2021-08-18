Return-Path: <SRS0=V8Yz=NJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26A7C4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 20:44:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B081C61101; Wed, 18 Aug 2021 20:44:39 +0000 (UTC)
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D90061100
	for <soc@kernel.org>; Wed, 18 Aug 2021 20:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D90061100
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1E29D412AE
	for <soc@kernel.org>; Wed, 18 Aug 2021 20:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629319478;
	bh=w/RbWNVq+6eK1IK1LMIbc97kV5SfHCBYyyVBgM9fYUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=qNLWBLXlYXs6NOwRt7SAuypw46XqdPYepDPl/6NcT0sTvhnCBeRRJZl6ypFewI8I4
	 VvU4lc/81nIgs7A79GEyAj1J8O9ofMyZHYSEOgQNByEGsP52Xaz2hn2kJ81+e3foWe
	 CLsc/kGgA+9F7FdCdp1BPLTMuENy30gSdhgwlcTwzz62ctEQNafd9r2Dlzv+EYCo9p
	 3vkEtsHyeSP7WL3npvqo20+Q9spMEoCunABbslRwIKo8yblvsP5QOuE2+r/fzQ1nqL
	 wqG4LQZZ0Rvm9dWiQVOGgWHpWKD6C7tBSVlZ3q0fzn6Xcs9NrsJ8XLnv1IjwNDNFTs
	 XwPD7HdHPQKQw==
Received: by mail-ed1-f70.google.com with SMTP id m16-20020a056402511000b003bead176527so1670053edd.10
        for <soc@kernel.org>; Wed, 18 Aug 2021 13:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w/RbWNVq+6eK1IK1LMIbc97kV5SfHCBYyyVBgM9fYUc=;
        b=sz1KnQIBKrDS+Fc8LaT9uu5D+pUGEo6BV1oZI85ln2rHGkPUcc5hQODYtISg1g7YpR
         FVSgN6z6nIby06ApNZJTsEm4F4tVzroJ/pwdzE1T66oYIkM2hK/6yxcMhs6ZI6Aay7la
         Z+uyD3E1JUavVJ/UtZS5pvZ6XosWuN1NQUS98hHReOGE1DFvu/sYxtoerw/WNo3bnqr2
         TGZ47Fi59ZH12mEjsuQMpC/YrpYZVLkhbJwRzwxhBKx6Qv4Q8VnCw5OxEbLBhxfgSOSC
         lAwnfocvcedfzHjFqXLyW/5+l1oiV3b1sSdW4usLjisErrCK4cmMktoEJZSzAc2Cwqa0
         3dbQ==
X-Gm-Message-State: AOAM532RQIZTOUlY4otDXWRiNcU10fIyOdbSZEduQysw6Gx/NB0wAimA
	f8l6ZpjeHoo6pVPJzLeOSX/X85NjtGnrUX2v6/dg9vj+t8rZoZZkQVoO11wDTBw663MdukF+kiC
	lE/Ffo1Sz967ipdcT42uFIQw=
X-Received: by 2002:a50:d749:: with SMTP id i9mr12432940edj.248.1629319477835;
        Wed, 18 Aug 2021 13:44:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjqxRCuuOtlEqf7OA30Ywtxe0S0ibN48o7NzGEO8v0ICIqx5eRtOtCcHicPX3MQxUZo4bEDw==
X-Received: by 2002:a50:d749:: with SMTP id i9mr12432928edj.248.1629319477667;
        Wed, 18 Aug 2021 13:44:37 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id j11sm341372ejy.112.2021.08.18.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:44:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Jason Wang <wangborong@cdjrlc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable "delay"
Date: Wed, 18 Aug 2021 22:44:22 +0200
Message-Id: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Wang <wangborong@cdjrlc.com>

"delay" variable on line 79 can be deleted by returning "0" on line 88.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
Link: https://lore.kernel.org/r/20210624055627.22295-1-wangborong@cdjrlc.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---

Hi Arnd and Olof,

I have just one patch for Samsung ARM mach/soc, so sending this
directly.

Best regards,
Krzysztof


 arch/arm/mach-s3c/mach-gta02.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
index aec8b451c016..418939ce0fc3 100644
--- a/arch/arm/mach-s3c/mach-gta02.c
+++ b/arch/arm/mach-s3c/mach-gta02.c
@@ -79,13 +79,12 @@ static struct pcf50633 *gta02_pcf;
 
 static long gta02_panic_blink(int state)
 {
-	long delay = 0;
 	char led;
 
 	led = (state) ? 1 : 0;
 	gpio_direction_output(GTA02_GPIO_AUX_LED, led);
 
-	return delay;
+	return 0;
 }
 
 
-- 
2.30.2

