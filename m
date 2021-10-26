Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A66C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:49:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF2560EC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DF2560EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahLVhL9swH683NROPL7wkqYrxl2QkQFEJqU/LpS9D2o=; b=pRfJ8vb+GzE7PH
	d9EGt9HUnx8QpJfMjGDoyP6Y3EwSwteWIZuraa6V1X7dvM5qSptcduweQSGwLf9Tu84gjhlZNMSIT
	5XuEaBURrWYaAFWh2++MssNP9PZlNSrVwuKNO0JBNZvdo5JBxNq5ChIMyGlvRoapId7efCP2/zxSM
	fdrTv2frvkUR070c7y1CxpvM2HzlwDJRxq7OU9Be9MC69DOLoKwu0h4ZHmeBT+qCdgylLanQUQGT8
	pW0nrcCqE9ScmHVdMmVfglFxI8mpOF9r0TmaHZJRe7v30EEMJm9f+IB6eq8BK/wpmdPCjoMwKcQHE
	zOKOW/2e3HM/0mSDy+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfJ3V-001Lzo-2J; Tue, 26 Oct 2021 09:47:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfJ39-001Lvl-Nm
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 09:47:21 +0000
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 27A5D40283
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635241638;
 bh=sbYrCs8J0Q0Rz6cp+rkJ/lhh0zXOz8q9lqlVQx/f+TQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=WDWOOTBOp40P4WUqmfPtWma2G67VefpJK4k6RaeZr2fzAcf5+5U9SYtyS+WJmmaY0
 rtNg/2bNzUlyJGCmvUNNd01C9cSfSOF4zyhF8P89899rAXCfYKcplsMP0H/XHR8nsn
 ZFz8TKDYaw16PWKGXhrzVdHHY+wT7oZfya+tVbJ+nSWNtf3utiwl64PM5DY3LA6Gka
 IR7FDgn/9kuzca+bbR1HdkZW1dbXiUbXxnTuHfU91IqlsUaBUkFfRknU+XOx+joNSt
 WWFlLYTSvW0ZEiB8jT4SZqadaOu2D2xSq/DqFdwHNSdZy6bhqQ2Cp9577MOJgm3X2v
 pwIbqMJtcTqdg==
Received: by mail-lj1-f199.google.com with SMTP id
 f6-20020a2e9e86000000b00211349f9ce3so4086744ljk.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 02:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbYrCs8J0Q0Rz6cp+rkJ/lhh0zXOz8q9lqlVQx/f+TQ=;
 b=AZC7E0SHwL8x+mTabXknWNKqlm+hl3Y1XB93tjR8GqMmMdmbasmcNSWW9pAVA3U50E
 RJ1r22dtyiZ2qL8gq+adICIdUFmCXadNBOV6Atpyq/q278A5vLUBR6+OUk1RNRgWKCtv
 Ojds5c9OHCKdZmGRqyxUW+2h57BrnNryizcBt3DFUyYMC7DJUdCMcbJ6b5KSz4gn5wj1
 1GZ2FxUrkcD9Ulh2W3w1lyy74x/I/fGOYrAG+ylFxBc5G6jyxQWI66rezdT8zE5ChLMD
 KkKYo3eM4AkfcBz7fmAo0rB4q6ZRkpfF2dPayfJFJ59pCx/ZVVfeFvBZ7mzKwRtOSLsj
 b+9A==
X-Gm-Message-State: AOAM5314mvosteIN8odckaCMcERWoFio1faCDdr4t9eKaK3i0l2TDung
 4JnzOshlPGOFK0Ql9G8y1WwEtNw/SS8HocQXA89s+toaGmnMzXujpclTGV6PqQaPNLZJxfco+GN
 yjzmTtfrgYuN/gKOQuvuJ/xPyCQ3z41wR6sya8Lv8vMLSu3WifSvT
X-Received: by 2002:a2e:7304:: with SMTP id o4mr886885ljc.385.1635241636728;
 Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKSsLVNoJZPREVg5VqEAatQtzjWaBPxJNdTK1B4zkn7s0ddrcueJak0ah7O3ADQwivq+qDAQ==
X-Received: by 2002:a2e:7304:: with SMTP id o4mr886837ljc.385.1635241636293;
 Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 v17sm113794lfo.167.2021.10.26.02.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:47:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: samsung: exynos for v5.16
Date: Tue, 26 Oct 2021 11:47:08 +0200
Message-ID: <20211026094709.75692-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_024719_934699_E237C72D 
X-CRM114-Status: GOOD (  11.58  )
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
Message-ID: <20211026094708.L7OlI8fgfF1PCbRw1XOBDqW_0ZtN1uKmg1jdmJrWVhk@z>

Hi,

On top of previous pull.

Best regards,
Krzysztof


The following changes since commit 2b663ae7152f785732d35ce38ad20ad10aca3116:

  arm64: dts: exynos: add minimal support for exynosautov9 sadk board (2021-10-12 14:20:57 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.16-2

for you to fetch changes up to b2f217cc7fbd3e6a097021b8b663328a649ea232:

  arm64: dts: exynos: add chipid node for exynosautov9 SoC (2021-10-26 09:17:42 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.16, part two

1. Add chassis-type property.
2. Add ChipID node to ExynosAutov9 DTSI.

----------------------------------------------------------------
Chanho Park (1):
      arm64: dts: exynos: add chipid node for exynosautov9 SoC

Krzysztof Kozlowski (1):
      arm64: dts: exynos: add 'chassis-type' property

 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts  | 1 +
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts | 1 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 5 +++++
 3 files changed, 7 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
