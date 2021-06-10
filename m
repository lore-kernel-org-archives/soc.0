Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A948C47094
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 07:43:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6928A61285
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 07:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6928A61285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pX5K/xuw4ye9xMbDfXpfh5SsfUK903xlx690btf9jA=; b=mHCA1iFLpsDRXV
	vNuJsvDupbu8Gx0R62qOgvijz/99xETN+wZe16kJ6P2QGC5pXTz/hA2iE8csCaBeKxADfppgzCzw3
	PnTKpm4EoK414TSz7trRUWs3SafkJQDvNfrfp2bv+X7XPST/V0HFlmFtyfqIp8/WxRi4Z64M7zcqm
	Cuq8oDn/MthoCnReukh8bYzXFWVeTMAqfM9YCx+SOgNoDaDvsrWY122Duucgjm9Y4JRKMRk7I47Vf
	EZuGUF96B7mE+iwsp35EI7H4iQl9N1LPnHff0QCgA/rT0HgDTh7VcsnE8t76TfmCyvHgg//BmCYCb
	Bg+fja3Dww2tQ8J3cf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrFJa-00HFNe-MD; Thu, 10 Jun 2021 07:41:22 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrFJJ-00HFL3-T0
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 07:41:10 +0000
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrFJI-0001Zz-KZ
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 07:41:04 +0000
Received: by mail-wr1-f70.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so482464wrd.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 00:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKFgI/XB09fK9EatvqSa+BvVfDN0LbVVk60PnCcv8+M=;
 b=ZdLp/aDQlcK2GhvgvGoexg7ObyKd+ILtK+JfWXJcXxq3GU9FtAfq7DzF0aUrRc7ajp
 px/XVvlvjGe2GyHbhqoEoJ4LKhtKGiaE7FVcu/KxCdbZg8CZLADYcvVIcwmh8awNTKh0
 M0t1NKFAFUVF5rP69zKAsF486hEDaJ8I9uS8MnQzzKQrh1qvXJ/U8jSOG5S0kjBrqJ9A
 krefZuotc3+zU6c9yaNtbAD+hPnVoJ6WbibAG8EtmKBswCRCzHjW5O1Dv40D/vcknBLo
 3j6q9eSsjaqmX3bnR3Z4lSiPph6VyDFtHuyEeFsQs2ne1tXV4Edc/RegaGhKyqyvG1VG
 c72Q==
X-Gm-Message-State: AOAM530KAiYXepsM8/CI2tSF0DHm8Jety3KO5RKPHKfZ94semx3E6BV7
 HtIDZRZ7W/l3wEbUTBQiK1Q3CLBB1qgVSNrF1gkweFpLzjmmT9ybuZdYlbWKptp+BxVGvbRa0/p
 673WVw0o4QckuB2Cbuw7UI1O5z5YOBNC9PON184TzDtCRrmP1YhoA
X-Received: by 2002:a5d:6405:: with SMTP id z5mr3739223wru.39.1623310864386;
 Thu, 10 Jun 2021 00:41:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVxKzzDYrUeVcjhdd9+2Z+ibNjojMlpPJWvTPtnCppc/0gdckdpbdXOxJdd1bHuCaxQPU7Jg==
X-Received: by 2002:a5d:6405:: with SMTP id z5mr3739117wru.39.1623310863233;
 Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id k11sm8417229wmj.1.2021.06.10.00.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: samsung: mach/soc for v5.14
Date: Thu, 10 Jun 2021 09:40:55 +0200
Message-ID: <20210610074055.12474-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
References: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_004105_953117_F927F186 
X-CRM114-Status: UNSURE (   9.97  )
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
Message-ID: <20210610074055.r8_2gprR8gHS80v_aGbmdK_iWpk59LkwhgALp0LnZp8@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.14

for you to fetch changes up to a6419e53c779302f8d5dd409eccf5b41ffa184a4:

  MAINTAINERS: Include Samsung PWM in Samsung SoC entry (2021-05-27 11:59:48 -0400)

----------------------------------------------------------------
Samsung mach/soc changes for v5.14

1. Fix: add missing of_node_put.
2. Extend Samsung maintainers entry to cover Samsung PWM driver files,
   because they do not have a dedicated entry.
3. Minor cleanups.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: exynos: add missing of_node_put for loop iteration
      soc: samsung: pmu: drop EXYNOS_CENTRAL_SEQ_OPTION defines
      MAINTAINERS: Include Samsung PWM in Samsung SoC entry

Wan Jiabing (1):
      ARM: s3c: Remove unnecessary break in RX1950

 MAINTAINERS                                 | 3 +++
 arch/arm/mach-exynos/exynos.c               | 2 ++
 arch/arm/mach-s3c/mach-rx1950.c             | 1 -
 include/linux/soc/samsung/exynos-regs-pmu.h | 6 ------
 4 files changed, 5 insertions(+), 7 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
