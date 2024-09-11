Return-Path: <SRS0=RFA2=QJ=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29F9EE021B
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 08:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9195AC4CEC6; Wed, 11 Sep 2024 08:36:16 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99C21C4CEC5
	for <soc@kernel.org>; Wed, 11 Sep 2024 08:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99C21C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso1272276a12.0
        for <soc@kernel.org>; Wed, 11 Sep 2024 01:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726043774; x=1726648574; darn=kernel.org;
        h=user-agent:mime-version:message-id:to:subject:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LouJsSJFMu0q8G1K6vFkT339gK2lxlhmAL+K7VBDr/k=;
        b=c9HhqJiUAB4keabYoCfBEEW3uHghaTyN6cJdSUSF7G/fVFJ4BWZso/M7GEXlZ4TEoa
         aszM/6nMj54SXAcsRSbUNw1UcR43tziBMe4J548INzzQHWV9OaW3lr73yAou/zHu4xct
         terRM+ymrydef5rMXOcTDRaykPkbc5VNTU9SXmHYSa9BTH+M9OsO6iZwleTrhLxKQMQk
         gS32iw142mIQv/FaCPRIPd7uppf7Zz5R+evZJqI1EozkYao8ZhuEFM0aMOYoDomH1LPO
         DCWxQWQrncpWH/WtoqIhyo+1VsOIQN/Q7dAS5AhUIhFzS1CklkdHTQbwcHyO549wX3Fd
         JHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726043774; x=1726648574;
        h=user-agent:mime-version:message-id:to:subject:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LouJsSJFMu0q8G1K6vFkT339gK2lxlhmAL+K7VBDr/k=;
        b=u/E/U6vUA0//Wjo2z5O5A4VmAZGdBL9ULzNoAaZUFmeqvEdAu9hAEexnuyJRs+lBnG
         W1oPJHwXYcf78/vhgX47oEZyNzGGy9A/B2CdQcA2VtVpYi+z+kZh8QDohya3DIjvNyQD
         2cEzgdVl1TYm6ixZ8C0/Ef4ka/5UvDtEg4dVAd9fD+lUGGn8J37p9VqXdiVSkZculKeY
         ZO23KDBYrjYnX2e/za/p/OmS7WQhqeJ00Z294qfHLcbMOL2yLeaVeN4ablqB/amT0Q1c
         b8B5MASocyqo3+l8c2xOab90iZsuf7PRs9GfGnsp1GUDO/oISLChWH6pWiG1HB0uOdLc
         Fo7g==
X-Gm-Message-State: AOJu0YyC7odnmi4mCaDsMPN9tyOv74le7TfEARIkbveace4hXurR1560
	OsutF0/7RRwsJy272/M6+4njSmjj6Sedpir9zDv3xlFu7BD/7W7ji5tLgQ==
X-Google-Smtp-Source: AGHT+IEGv6jot6/9Pdy72pJWB2hEsFNg55zcLsQVKb0TWJuWWACwh+hi5Y4xirQYqJMjmVFD7AY9sg==
X-Received: by 2002:a50:cbca:0:b0:5c2:5c89:d24a with SMTP id 4fb4d7f45d1cf-5c40160251fmr5882546a12.12.1726043773640;
        Wed, 11 Sep 2024 01:36:13 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd8b126sm5200191a12.85.2024.09.11.01.36.13
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:36:13 -0700 (PDT)
From: Dan Carpenter <alexander.sverdlin@gmail.com>
X-Google-Original-From: Dan Carpenter <dan.carpenter@linaro.org>
Date: Wed, 11 Sep 2024 10:39:15 +0300
Subject: [PATCH] ep93xx: clock: Fix off by one in ep93xx_div_recalc_rate()
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Message-ID: <1caf01ad4c0a8069535813c26c7f0b8ea011155e.camel@linaro.org>
MIME-Version: 1.0
User-Agent: Evolution 3.52.4 

The psc->div[] array has psc->num_div elements.  These values come from
when we call clk_hw_register_div().  It's adc_divisors and
ARRAY_SIZE(adc_divisors)) and so on.  So this condition needs to be >=
instead of > to prevent an out of bounds read.

Fixes: 9645ccc7bd7a ("ep93xx: clock: convert in-place to COMMON_CLK")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Reviewed-by: Nikita Shubin <nikita.shubin@maquefel.me>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

---
 arch/arm/mach-ep93xx/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ep93xx/clock.c b/arch/arm/mach-ep93xx/clock.c
index 85a496ddc619..e9f72a529b50 100644
--- a/arch/arm/mach-ep93xx/clock.c
+++ b/arch/arm/mach-ep93xx/clock.c
@@ -359,7 +359,7 @@ static unsigned long ep93xx_div_recalc_rate(struct clk_hw *hw,
 	u32 val = __raw_readl(psc->reg);
 	u8 index = (val & psc->mask) >> psc->shift;
 
-	if (index > psc->num_div)
+	if (index >= psc->num_div)
 		return 0;
 
 	return DIV_ROUND_UP_ULL(parent_rate, psc->div[index]);
-- 
2.46.0
