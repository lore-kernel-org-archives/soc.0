Return-Path: <SRS0=Uajl=HF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B111C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 19:24:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0AF64F5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 19:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A0AF64F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AeH8LH7Mgdc0/U+8G8zK57qeRS9iGABSUa8NqmijYnk=; b=ZuzSj4sYPUscUsuAOFFr1qJ/dx
	cz96Z0+3aXc2d3h8k5FXsynB6Me7kHWRMMJRRQpRil7XlzcHFaQ1V5gpto0w/8eLl3M8E92SIvo8m
	BD3S8o6zpUHeVbR4DBEzgpVL2zJlkjIJsTmRfROQAr8E1hFCRpG6XnslnduUgzgUuYVODFFhpDzEA
	LUAK2nDQoeOJBl5o2wWAKcY2cPRr+8DsggKNgsNFANge5uPr06numEZu1Fgx4bwQaN54MjgEw1Aom
	0+G5ouqN+tR7F+CeR9THrX/u24XYBsYPQhLCBX52iGwdOgmPEiK8v0zbsNKIKEcjneeGS2VVaLRrq
	uOxCFiWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7NkB-0000Y9-Cm; Wed, 03 Feb 2021 19:23:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Nk8-0000XK-6p
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Feb 2021 19:23:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id c12so537831wrc.7
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 11:23:11 -0800 (PST)
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
 b=ST6FjIXekczRoE86QK2fg1g52j20TIheWE8+1mfHSaqz24sGNM4uBwAjF50IW9dWQd
 b29zuzGQs5Zk4znlrWmDDjxW8M63NFeu9Q8rXj9l2bjTG3cwhBvzGMBvs8suY/AGD6Ow
 2y9oi2vyp0t5WfzFCzyDKKG/TuSKBjeWMON1n/hCyDJebyBCHrYPDJTZczUi7mQjBTBs
 3AyUf92fQZLN5OlvxNL0/gKrF/bUKxjzRe7bWM3dUcPnCh+ynECzxXYIafGnYi/TNTt/
 EEO8K9E04ZaVU3bHkftZ5ix4auHOGZUBJ9iAyeQ0aX7thWSJjETi0mRpYfHJtLyZZH29
 eMrg==
X-Gm-Message-State: AOAM531x8+kIQ+iTe1jjrHWhtW/TCNNNPXPij/hazosSghpc3HCaq/BH
 I44mETzTvmqJvtxVsdzA7i7p9A==
X-Google-Smtp-Source: ABdhPJy8CGtZ16/mDr+58wE3ZKP2To71/ZtPrB1m22ndaDhNJ2TQOozN1O8erSAT3BcNYBrgA6eCyg==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr5421879wru.106.1612380190918; 
 Wed, 03 Feb 2021 11:23:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o124sm3920806wmb.5.2021.02.03.11.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:23:09 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] ARM: multi_v7_defconfig: amlogic updtes for v5.12
Date: Wed, 03 Feb 2021 11:23:07 -0800
Message-ID: <7hsg6d2bxg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142312_334082_A288BBA3 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210203192307.oE-XR1SXWhRhqJbznYvH8SyNDhUugrWDacasQhl-FN4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
