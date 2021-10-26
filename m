Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BE3C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:49:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE71061039
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE71061039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0YCxg32A09XE/OkNrMSmlS+1Dq68WtLr8RLFDm79QY=; b=i9eMvzYBaJL7nQ
	aNjq/DtxDpPjX9n+NyXb6vsMeChNtVX9BhpFwq0pGqbULjyLTluMNAHI58H0V32h0aGMJQtdMYksd
	Z0L0lvUIOOZYGJqNaZWb2OKAIhBpDQm/oHoLq01xlHiTxxYzJazy9BV0Dlo/AtZfUIeHpJmwiwcDS
	C9AI2qHVJD4800Zu4Ph0qNSfU+wBTYo3xV+RrwWV6VrmJrrXMxQUIldn+Yrv0j0X4HJrQs3LSSKCt
	2tCZrMjLLck9LH1hOXqSLK2kSsxx5vK9K8YShpwI8KPBmRtBFx5OqRaHBntQGw2BXxbz9On6fW4m0
	oh1ZnQRY/f7KvY6dNpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfJ3g-001M2e-IL; Tue, 26 Oct 2021 09:47:52 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfJ3A-001Lw6-S3
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 09:47:22 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C18D03FFF8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635241638;
 bh=OvY8h6gQ2XLx4TLJDVhHrNnjSYAKrKTXm/TLCkBAtZY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=wI1nCkVman52HH2v1+0Emxk/6vzLjKGPxoeFUcVc0QAidcsoWq86SQmRO2nSFPMoC
 UUgnubYsL8fKfJSD3Tni59Dt9HdtlfX/W1vbeARDPo/EAX2zoO/BsWbmcGhUOkdayZ
 6drcbjdnnYSOZNRKzTV2RzN5awIjkk3rRQ21v5VADvWEHkiTQgAh/patX0POoz6MDb
 6ZGdfnj5ZVpVp/Q3TBsNO/HvLxFaEyfLsZPVGxxVACmLcddmfw/14nbmoWtG3mLXwY
 DRHyuQatrWhNTrF4LpgVKRFNdIkjaZj+zq5PLBHf7hA87Z4Ikr662TTPWTZlPtK27f
 Kqubm05c9ifYA==
Received: by mail-lj1-f197.google.com with SMTP id
 w9-20020a2e9989000000b00210af61ebbdso4098928lji.2
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 02:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OvY8h6gQ2XLx4TLJDVhHrNnjSYAKrKTXm/TLCkBAtZY=;
 b=iukFLJ21jZMRlTEn9lZX8ZlZIwl/s7fL70hWhR5fpct5RTx+TuXaAGtKLbDzAeXS71
 ebOb9p/6boA1Zx4eUMVbyH3KnP3G/imp6gYZTJG5AL2n/fUB9bfqZgyRhzP+1cmba8tB
 TCecJOQPhJBXol/AW89IBoLoyCKjxOquucHHIZOt3ve0adrcMfGQgto/Vihoqzp8JCen
 94S2aq1Vbb6uL8N0zbQYIWVIjgpzeuw9g8ksAbXOV1Ltt1egQ6Z0rq9RIo7aKikK7U0f
 HIlg3I7FaSaIEGX988OzCqnzK7KIopDsWiLkVzm0natBJSyIxLvK8DCiDd3EshSkDE7R
 ab3w==
X-Gm-Message-State: AOAM5337yUmLIKpGmzHf4Vl5qzyyA65WPqch5raAZPcn7KpPPiHa2EM5
 82gN9/IQkAWViw2sTGFUip6hm50PxUQQVtGUjmdYs6V+WrEl4RD9LqLNhu4qAWo1zElMtSRSE7U
 /ZlUxz7yI+Mbsp3qhi/Z/XJ7F90JChDy9jI9d8nzrTbVnEg4c6QK8
X-Received: by 2002:a05:6512:15a9:: with SMTP id
 bp41mr10418006lfb.552.1635241637423; 
 Tue, 26 Oct 2021 02:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW5YMz5Q07ZGmdN2Jxfc2u5ScIopNPNG6mpx68Wmg7E4kYJBAnPU+zL0heH2Y7f+IctqKkog==
X-Received: by 2002:a05:6512:15a9:: with SMTP id
 bp41mr10417987lfb.552.1635241637269; 
 Tue, 26 Oct 2021 02:47:17 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 v17sm113794lfo.167.2021.10.26.02.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: samsung: s3c for v5.16
Date: Tue, 26 Oct 2021 11:47:09 +0200
Message-ID: <20211026094709.75692-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_024721_075630_D4FFB540 
X-CRM114-Status: GOOD (  10.28  )
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
Message-ID: <20211026094709.dukRvN3BlAotus3qSM20lC1EWXg2fQTY2Zd0rRtzibQ@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.16

for you to fetch changes up to aa519471715ce73034ffaa52fc85681de31c1acf:

  ARM: s3c: Use strscpy to replace strlcpy (2021-09-20 10:13:47 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.16

A minor fix for theoretical issue when handling IRQ setup code errors in
S3C24xx and a cleanup for S3C64xx.

----------------------------------------------------------------
Jackie Liu (1):
      ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()

Jason Wang (1):
      ARM: s3c: Use strscpy to replace strlcpy

 arch/arm/mach-s3c/irq-s3c24xx.c   | 22 ++++++++++++++++++----
 arch/arm/mach-s3c/mach-mini6410.c |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
