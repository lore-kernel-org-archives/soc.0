Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B625C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 20:46:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25F9D6108E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 20:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25F9D6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HugjRxRQYVbuIPLGlt1b86lYK4MmrTsG6JzrkzSAJsI=; b=hh1hoon1XxCQcZ
	8Rhxz0HD0dw6bil+Dj0lwZ7UfzPl5paez8Ju2ozvcdAhWooJ5RlM/VbBrNElV3wUv5nXOGiEWVU6J
	blvvznr7dNJ5wSOXzcJynIRfpTi3wbWttOFi2aj6ChdzDMni43/kxqRakfEXDDgLO7T0F5Krwi/2v
	T8l5FrnOX4tMIPFkcWvbJXk6/MCISdGK3ejMK5aaT7VxRmCHJ85/KCMeBNaypLagB19cdfpV/vvGM
	BErR8Kcqdf28tzI0KtfqL5A0lq14CWhAE/mlGYWa+zHs2mtcFWHy/NuqJh5gK2P/Dfov4wOkPpL+t
	wycj8wIpqXGNQmXkvZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGSQX-006du0-K1; Wed, 18 Aug 2021 20:44:45 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGSQR-006dsD-CD
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 20:44:43 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 194AC3F101
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 18 Aug 2021 20:44:38 +0000 (UTC)
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
Received: by mail-ej1-f72.google.com with SMTP id
 kf21-20020a17090776d5b02905af6ad96f02so1341417ejc.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 18 Aug 2021 13:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/RbWNVq+6eK1IK1LMIbc97kV5SfHCBYyyVBgM9fYUc=;
 b=erhtN0RuINs+mHk/h4u3wzp30v/m2++XGISnsCkwHiRLl2DKrbPSitpb3lukKfjOVx
 2R7okW7RMWNzTeNfS69Nc7b6QbEF5+oDYnOQy5Beh81Izq3wTeSzeVhpTX+kLKFa5ou3
 l+lcRBaIrwnGsMriKWACypRtgRM+HupZQgAFwMsWl4lU9ah7sG2sIqc8vdWCAUWQy6Np
 IMEOMkEImoxRqyqqnrGDZbKJYspIBs5d79BCWZ834bZNFMK6rCWfNXPpXyQ2LxWOWmql
 sNQiBfdv7XlUGgMMxRzNaPTDI4WS9Up7FBFx9eYwHcbJsH6M3w5blmo9P9t8D4BPrpTg
 HIyw==
X-Gm-Message-State: AOAM531K4zW3UdLyb0z8uD8R7zemzXZ2v8xaSnwnKwHjwhXlQfN8dxGr
 fFq2keqMPm5T4y86FJU3+eUr5wfxOQaB/GqzMCUeHbtWeOdeNUgKqCla8Q6fD+dQDGDcZKur+fm
 tVLCuwMlbZVYvO34+zK6TVD2spfPwmHOe7z4EFXLOLzqxTMyoAqvo
X-Received: by 2002:a50:d749:: with SMTP id i9mr12432937edj.248.1629319477835; 
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
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Jason Wang <wangborong@cdjrlc.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable "delay"
Date: Wed, 18 Aug 2021 22:44:22 +0200
Message-ID: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_134439_589115_285E1C26 
X-CRM114-Status: GOOD (  13.75  )
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
Message-ID: <20210818204422.zuTXFTFRJd0GUoDz95aBGS6sCrgfDl-yFgZUB1raE4M@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
