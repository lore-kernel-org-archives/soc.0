Return-Path: <SRS0=brLZ=HF=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2957EC433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 19:23:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D0F2164F84; Wed,  3 Feb 2021 19:23:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BB664F7C
	for <soc@kernel.org>; Wed,  3 Feb 2021 19:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0BB664F7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id l12so589363wry.2
        for <soc@kernel.org>; Wed, 03 Feb 2021 11:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=onBVJg9xOta+3KOEfaOsQ3ooUKVCCIVzUkC7fGZngcQ=;
        b=HBGLNOUeNlzI8kk7BD92SpiFMSzTgzwAx42/MoLFrQ0PqymRq1xIrkPdR9g0mk4+Yk
         OZR8VGQVoHn5v/VaLzJGxuxCRV9Cxvwiz4luEQnaOyitVwNLYcqPSdz7Lp1xEge6+BKm
         7/wO4Da6JM+xS203aqdr7HC/JyrqAcGQusyTnAJTJZEbRwiVKjKrznB48rjXcKQzzwRo
         CRpkbgXEMhfvZaeCcZ5OskXXF62HGGMQ0us3vmZ9SF8qFrviOhtcqTETbHVdNq1tEve7
         gfVoStGlzVIv/L/7e8SKGogy0mwNNQxTbGHZvQ7XDRdxuBZatEFMQpZvEF+lJPM+2teo
         bkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=onBVJg9xOta+3KOEfaOsQ3ooUKVCCIVzUkC7fGZngcQ=;
        b=Yk5UKsCtz5UdsZ0PdXgySpd29/oqibx2slWOpkCm5KKDbTXYY3d+CDhEyjtW1EOKQV
         ig+if7SZ90tb2N+V552DtdesXfQhFetAv3UHvyY71YnC3yqoeZJ/ah6BJfLDCw6YBjR0
         E4fB0BWqvA86NPad0v6NqSgc5sFCaRegUd99WN1NzyMmHpyrh1QY87id+/FNfiwpGS8f
         bqnLMsZN1MBb31b9JH3gYkbaADz3qvnNI66tr/ujMRpqVmTsXKSmFBeczsqrj2CU5Sy1
         wnlK35hvl+g5L5WOGEx7191YN+YoCWDouVr2OVLre8VcR+qoYmq77ppDjE+TDBQZyIwi
         DYog==
X-Gm-Message-State: AOAM531AUNTVJjulejQGcis9Rrn6/ZRZP49uukOLBeZ0+ouyRFpnr43B
	1GoXiNjeZ0Ov3WpaB0zks5taLngR/LbbrlJG
X-Google-Smtp-Source: ABdhPJy8CGtZ16/mDr+58wE3ZKP2To71/ZtPrB1m22ndaDhNJ2TQOozN1O8erSAT3BcNYBrgA6eCyg==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr5421879wru.106.1612380190918;
        Wed, 03 Feb 2021 11:23:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id o124sm3920806wmb.5.2021.02.03.11.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 11:23:09 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: multi_v7_defconfig: amlogic updtes for v5.12
Date: Wed, 03 Feb 2021 11:23:07 -0800
Message-ID: <7hsg6d2bxg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc

for you to fetch changes up to 726731566a862fa375de44313f601e49c4d40377:

  ARM: multi_v7_defconfig: Enable support for the ADC thermal sensor (2021-01-25 09:45:45 -0800)

----------------------------------------------------------------
ARM: multi_v7_defconfig: amlogic updtes for v5.12
- enable support for the ADC thermal sensor as module

----------------------------------------------------------------
Martin Blumenstingl (1):
      ARM: multi_v7_defconfig: Enable support for the ADC thermal sensor

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)
