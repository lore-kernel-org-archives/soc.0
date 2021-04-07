Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2917C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 07:01:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B977610C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 07:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B977610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=96KpH8r/jqBVLJDcPXKUWP8ghbsMxZhn8p3JIjoMoxo=; b=XOzbzMx+Lvemy7T0BDsq+W97g
	1DbCFDya+B4adk6mRMbB11/uRpEF7nYez9I8e4t/FlatzamtEse6UytsfYa8XV4sS4hhgWM3M/YCi
	XyCiQ31gle1fySzT3dRdreRNCkAsD7OXksTjOEZR8WqrrmoD30kSXM+ZFv3XYMTREI57raqUHK4CT
	bF33ij05u/NTTLBdBDAGeIOKVqKBCjbo9cAH0okzkomKo+Ks+CG+90+7v9MvpxTL46d7BjcQINZ+q
	2fl04oPLaV4McjrPdhtr407+i/0domtU/yBYQhjM3OuuyV4rlua3TU1B0HVQYLAAigD0UUJqixMmS
	rl2+mIgxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU29K-004Gn3-Uk; Wed, 07 Apr 2021 06:58:51 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU29D-004Gld-2S
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 06:58:45 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lU29A-0000eh-6U
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 06:58:40 +0000
Received: by mail-wr1-f72.google.com with SMTP id b6so11217958wrq.22
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 06 Apr 2021 23:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGp9cCtQeuvZ4dDU3lNFYxtK3g+aG0STXiLOrxikwkU=;
 b=qjX9bKXoiNSjCKKcrGPEwQHoAEOGMzjxsWJzp/8eYujqttR038AvWcigCJTo2I26xA
 aHoN/39vaPbxQ0ZvgjuS3kQLJBSyaceHN3ATHlG8CVfKGvc1Brn3O/qUnUJ8Nudv8iBD
 HNA4RyGRsc0udjEDMT2C/UBjqyJ7Olxwt7N1A81F6+IMkzBf0zdSCv2G6jjh9OLX152V
 8tqysKrQsfMePWszXZLf9dReBtJMz+IdYqhI6BeeFpzplm/vowkm6F0BRn+SRRdZdKWR
 F/tEFdtJ5ya0O+cXbro2BNKt/FtjhFYAGXIenta9UAjJ91oRHt5f3FP1rD1+5aPKHNtA
 4f8A==
X-Gm-Message-State: AOAM532Wfcj00WpzbXzQMm0dnQL7YHQW7P9JUPqMrT7rpTPUTRcmbdrh
 GOVccDfCxlEuCocmXYSadLEFseLmrzd6NIaEqibZUEo//HiJtFwXkhFbrcaQztKKu/Jfl2eogNl
 oEyaMdSOORWEuLveUOkh3GX+pwH5Ep993ZfUhTIsG9VmPrxzwCgpI
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr2459253wrh.258.1617778719957; 
 Tue, 06 Apr 2021 23:58:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2chc2TVWpQSi3GSuDDxdkbpVm4TczJXiGWLWQEGOjPsmLj4qrqZWc1VSc39QEy+uL9LpD7A==
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr2459243wrh.258.1617778719852; 
 Tue, 06 Apr 2021 23:58:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id c16sm2410506wrx.46.2021.04.06.23.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 23:58:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/3] arm64: dts: exynos: Pull for v5.13
Date: Wed,  7 Apr 2021 08:58:27 +0200
Message-ID: <20210407065828.7213-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_075843_533437_BBEBD2FE 
X-CRM114-Status: UNSURE (   9.91  )
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
Message-ID: <20210407065827.C8mjtmwWhajOAubEkYZxNgR8BGyXiBrEGdxYvRUeQ-Y@z>

From: Krzysztof Kozlowski <krzk@kernel.org>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.13

for you to fetch changes up to 7d2636e9d6dd884ae2ec6127f29963d4da0dfe6e:

  arm64: dts: exynos: white-space cleanups (2021-03-19 11:34:55 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.13

Two cleanups in DTS without expected impact.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: exynos: re-order Slim SSS clocks to match dtschema
      arm64: dts: exynos: white-space cleanups

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
