Return-Path: <SRS0=hN7X=XU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A638FC43334
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 22:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D83DC3411E; Fri, 15 Jul 2022 22:17:57 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD2CDC34115
	for <soc@kernel.org>; Fri, 15 Jul 2022 22:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD2CDC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id c3so4845713pfb.13
        for <soc@kernel.org>; Fri, 15 Jul 2022 15:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=shgtDJajBST2wuzUZR1xcZGCs1ODhpS/VT+YQTPA2ak=;
        b=eqP3cGJ50ftpVu/OQWAmX3mNX+yooJNwt9owlfyozoXqC+ptPcOZFb23PwMuNd0ir8
         +YQzM41UP6z4Owjh03I/Cm7m8IybHPH+Ewz6EpWMAZWmkSOcNkrPNA3C5tECDaGDCY9w
         7je1xxiW082h7wEwF/1DA27igW3lZmo1WF9xIIu0nHIZeT4JHTn17EFVddB8BL7+V0Q1
         ODvgUFNhVj1QU8H2NYn+7lnsZ/v4IbgaMEy+4kBb1KdA4B/AS+qcurT4n7fVvlgvCGOU
         nBeUAQ6jDcQQI4ZG1QDidZqUgTwRNTEBSDIAgM7je1peaB5fUq+p9at86/cj21oVkq4F
         y+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=shgtDJajBST2wuzUZR1xcZGCs1ODhpS/VT+YQTPA2ak=;
        b=2V9zLlcEuqg+ZTYSpGA5y45SLb22yDwz5cuytwkXa9GMgjHFLagICJYsjb8hB6iry9
         +WOblw4GUGNkKudIAfD7z7Iu/lCKFCEl5hCqYCWH7c++55yNGe/Il7HXvqKhs0DqfiaG
         FvrjIJOalOqnDcHBhmhdfEzvSNHw5iLoG7n8IGMn73f1zl4LnsIdTQDEKL2aMg+4FIAa
         ZWYW1XfXzxUOJz+BwU4BUouQsLIhein0tRYRrMLhVbd+zPDkYqu3KUOYd44+4NCj3A0v
         jkmrNpUe7WwYuryUoZkSIllMGTJLN9xw7r7SXSe7jKnWpDsyb44SMyCZq5tgDICI8AK+
         uM7w==
X-Gm-Message-State: AJIora99q2QC4yvCQgCb2YgBct3fsuT0yIt9K576QGuxvDbfgwA8z5oF
	iz7YD4O5qPJcsXznwkHKr9w3lgbEJYI=
X-Google-Smtp-Source: AGRyM1vvsvYzdVYrGn3A039iJz768EPYZFHjguht6POGqBIzQR2djleAUBFQNKOZwhN3raWa4aizCA==
X-Received: by 2002:a63:481a:0:b0:411:7951:cbcd with SMTP id v26-20020a63481a000000b004117951cbcdmr14044392pga.66.1657923475895;
        Fri, 15 Jul 2022 15:17:55 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id w63-20020a623042000000b0052ab8646500sm4391123pfw.56.2022.07.15.15.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 15:17:55 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/3] Broadcom ARM SoC changes for 5.20 part 2
Date: Fri, 15 Jul 2022 15:16:39 -0700
Message-Id: <20220715221642.297536-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnd, Olof,

We had some late changes that are non functional except the addition of
the Asus GT-AX6000 DTS file. Some clarification of the BCA acronym and a
preparatory step to remove ARCH_BCM4908 in favor of ARCH_BCMBCA.

Thanks!
-- 
2.25.1

