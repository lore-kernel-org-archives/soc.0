Return-Path: <SRS0=byvG=NC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B496C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Aug 2021 09:30:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D1960FC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Aug 2021 09:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3D1960FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kqy9oi132Oa9yM2C4Th2EK8zD3dGeU5as3HUagOR1F8=; b=xqSxz4Qcd3b3Ld
	jKkZAEtoYy0aJgoygux4arEa9WWP8kStXs4TC4886joq/etF/mGphx9eWxcTPsFujuVlnXvzspBSl
	29WRJ0UAutY3oCgDQDu6Br/n8BJsRwu9qilJolNTRQvyPxisnruwJhNsq3z34NaCH7G2Iet1PTMNq
	0G6BRbWvQXaUS+UJBg4wLGdkMCbtS+JEnU55KK7hGSuv97KpkJlDBZHmUDmixErnN/frHOQqITpgY
	g8fZfF1bt6UxRIb2yWwgDP2ZYVccpWmYzkVISb8he7xArvoWapJN+Y0CtqJxuUGG7zdTcZGHIsG9A
	/PO7GUtaoExYeCBsb71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkWH-006II6-FW; Wed, 11 Aug 2021 09:27:30 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDk2O-00698I-Ds
 for linux-arm-kernel@lists.infradead.org; Wed, 11 Aug 2021 08:56:38 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id CF3393F345
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 11 Aug 2021 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628672194;
 bh=AkfNVRo7hHf9V8Un9aQjkE6FARkV1KO6bGOPkL8pwsg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=id8JtcjH3xJFhY+hcsRjXJkV21xaGm30LVc8zvQvR6rT8FdqfQY/viIcmmA5wVMXt
 NwM9NpGOaZsy2oU3Iv97v7PDo1feZ0ouPacw7QEQFOHQl+Cln2JN77jfacEzvbloTP
 PfD0ZoMttc2oBd10tHuA+n0CW3mJ5cnxRn1hjoKB2/jE6Ioi3uTE4WrQ+2mGRcp/YX
 WpIItxI5gyImZSh0XAIY1bNZZa/+C2YskHSchSdu3Ty0iSM/4Cm9KhaTIlAIfhWgyB
 2rkVKLbUBEnx3LbiTldX18litXjk35i3p2YPATiRmXbkAUnMlNNk6tJHzWk9NLbh9k
 +F3OAO7W9FZKA==
Received: by mail-ed1-f70.google.com with SMTP id
 b25-20020a05640202d9b02903be7281a80cso896386edx.3
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkfNVRo7hHf9V8Un9aQjkE6FARkV1KO6bGOPkL8pwsg=;
 b=flwBdEldqNSZrh+kLILBK9ZYstoGJsXvFcVrcxbeIHFbfAM2QBpGQDKqyFyqZh9AcP
 Az0ltZAj2mxKtgLiSW1HT1G1IiDYbyqUzsIDCi7BkcK8yzigT8Iji/5qaucwJOElaW74
 TIa+AveS9kgsYXfalICUWgfG8HW8ckeCzNmYq1OAvWDBBiRs1MeAdoXlXU8uJy6M31H6
 87S5Z7GKv2COsH2Giv0dyo+qGe56tgYP31w+b5hansXIOUtz1AycP5+vaLwaK4W1GCdK
 ZNksVWQcmWfIUA5LhqnDuq47d63YHZ1uNYr58KnwieDPOQerZFXEcUqEEFJv0AOPBS5m
 8k0Q==
X-Gm-Message-State: AOAM5327yTsJav7uXE9GXluBvSX+TCkYMRUuw+CDZFlvvdEGNVmBYXMO
 75dQZneFfWWlNSfB0WzKHIGx1ov0C7UiKOQvx4Lp+39MxWbGlOu33jdrOaGvatsb+cEi44dOp3i
 NXhSprs+a/Q1nSJ69AJ8eKYkzydd90fOMt7HtvrLqm9O0eh0wPFQE
X-Received: by 2002:a05:6402:d49:: with SMTP id
 ec9mr10099882edb.333.1628672194555; 
 Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLaINYImBffGAxkeivDUKOJNEzYPQrtsNvBTAbFcoUG0Xlm7TBEfwmQhiR9WGSnXf07gHdDg==
X-Received: by 2002:a05:6402:d49:: with SMTP id
 ec9mr10099869edb.333.1628672194408; 
 Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id x4sm7834003ejb.106.2021.08.11.01.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 01:56:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: samsung: DT for v5.15
Date: Wed, 11 Aug 2021 10:51:27 +0200
Message-ID: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_015636_755723_1A015B64 
X-CRM114-Status: UNSURE (   9.17  )
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
Message-ID: <20210811085127.wvsKt4-C39h8_wC7CKCWVrKu0OQ1maG9OMSiKBcIDPM@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.15

for you to fetch changes up to 6cad6db75231a18f25dc7d610d5a0683160ac545:

  ARM: dts: exynos: add CPU topology to Exynos5422 (2021-08-05 09:24:04 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.15

Add CPU topology to all Exynos DTSI files.

----------------------------------------------------------------
Krzysztof Kozlowski (7):
      ARM: dts: exynos: add CPU topology to Exynos3250
      ARM: dts: exynos: add CPU topology to Exynos4210
      ARM: dts: exynos: add CPU topology to Exynos4412
      ARM: dts: exynos: add CPU topology to Exynos5250
      ARM: dts: exynos: add CPU topology to Exynos5260
      ARM: dts: exynos: add CPU topology to Exynos5420
      ARM: dts: exynos: add CPU topology to Exynos5422

 arch/arm/boot/dts/exynos3250.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos4210.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos4412.dtsi      | 17 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi      | 11 ++++++++++
 arch/arm/boot/dts/exynos5260.dtsi      | 38 ++++++++++++++++++++++++++++------
 arch/arm/boot/dts/exynos5420-cpus.dtsi | 32 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-cpus.dtsi | 32 ++++++++++++++++++++++++++++
 7 files changed, 146 insertions(+), 6 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
