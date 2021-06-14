Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D9FC2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 19:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F50611BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 19:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F50611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FL24O9bCRBaevznoiqPK71S8K90t2qH655yfrZVviCY=; b=hPsElmTyddqAM4
	+goGB7jtqtIUQjMU1/533NpuRerVnVhR7aVlRn3eaRKcPyLDA5AylQtjytQyDRC4IdwUCQl0VyrYl
	g7K39AODxboK/LjgueruoaGcigbJPlf+txKNwSA3oGjbzaMKe9gJ2wuaxGNkZfkIBA8Txm7ZYCgjw
	0TU9/pq5GFdamynjumHelb8FyLo0kP2GCi3OAjv3qyYmJYonoJAXSVxPt02j1idr83MKiI4IqBTFv
	hqEmkP2ta/Y/a+00EHGIfTolbguPPo4rdqKK1Qh9qvI+3iNfPEx2i7bOz5W+hquTTvWb65sF/bLN7
	SUSZFID4jruTko0YVNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lssLC-00Ft4j-5M; Mon, 14 Jun 2021 19:33:46 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lssKj-00Fsy2-QE
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 19:33:19 +0000
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lssKi-0000AM-7x
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 19:33:16 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 z16-20020aa7d4100000b029038feb83da57so20775595edq.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Jun 2021 12:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qoNs0rkeMMUPf/jH63Pbn4GEa6xEussm8RBcM0JZAj0=;
 b=L7XY0skTS9ILUYCsV2qUxbjkmml4Om8fG1P6t9nhV4D5bLRMHI2wGJb6Vp5QvT3J+6
 E4hUT7Bit13/EZYqILOgI+HwtuUxBIrLaBGd5/WMciuydH93z6xEKlPCyQzfG3ddnnpi
 Qn97ptTkKHUTEzmkkIOGrmg9reApd1i5qFP8Oyb3VCqAmKTHfAUsCulhd/8JDiqty4zo
 iStyoyXzb6UJJ1/w0BXfwl0LfB6XeXa1t5qylhBIB8L+V3dJevudbjIVUAR6ozRBpSTk
 1jA8PLMtFeUpVIo9KohP6XdEZTwEhyC6Oy59h4moTy6np1Liff1xAYazM+q73kSAW7w3
 AAvA==
X-Gm-Message-State: AOAM533wgceE/PkUYlpxCf7xIrlD9I4w38blbenFqFzBobAxYynv5vR/
 JVOvp39M8M+c5Leokxyk5osZSuab3w7x4sWS+m3T+Ds1SThbZZT1xmKpgknCqFhgPD0Ey711k53
 pQosUeUKk97CEztqYwT6hOC3SYH1paDOAe6sRCB6/oqyd9BnMCYCB
X-Received: by 2002:aa7:c818:: with SMTP id a24mr19448642edt.53.1623699196022; 
 Mon, 14 Jun 2021 12:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq1B8upiBsEetFmAjSMtxkDRFzyHcPey+4IkR631CQiOXVzgOKDik6rb85uCWnTOZsFAP0FQ==
X-Received: by 2002:aa7:c818:: with SMTP id a24mr19448632edt.53.1623699195929; 
 Mon, 14 Jun 2021 12:33:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:33:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM/arm64: defconfig: samsung: pull for v5.14
Date: Mon, 14 Jun 2021 21:33:09 +0200
Message-ID: <20210614193309.20248-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
References: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_123317_904040_D6819B0A 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210614193309.qT_zx69scpKAZlTIR9S9AvIgPbexqarT9crgLte2myM@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.14

for you to fetch changes up to 38f61ef1a0cefb4e3b37c3e7b16c0f68df34a3dc:

  ARM: exynos_defconfig: restore framebuffer support (2021-06-11 12:54:33 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v5.14

1. Enable Exynos Universal Flash Storage (UFS) driver for Exynos7 arm64
   boards.
2. Restore framebuffer support in exynos_defconfig.

----------------------------------------------------------------
Alim Akhtar (1):
      arm64: defconfig: Enable Exynos UFS driver

Marek Szyprowski (1):
      ARM: exynos_defconfig: restore framebuffer support

 arch/arm/configs/exynos_defconfig | 1 +
 arch/arm64/configs/defconfig      | 2 ++
 2 files changed, 3 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
