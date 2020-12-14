Return-Path: <SRS0=HHLn=FS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8D0C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 22:36:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA9A22507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 22:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA9A22507
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G0DrbpnktDJGDR/3mQJ86h/H66oKmoCJKRDeeCDVvs4=; b=iXxjMjrvgdmWsO/CMcJ1SIDpuB
	LSzTRd7DfPZR3ROeGleSzVn4TrlmAlZvaJ3DqYb++7n9qvVZiKoXzazRVv7Rs1yZgG5uSrQf/vkWc
	k+xiwDK2KT3C0L3dWO8Mkz8gh1mPY/CysZjPBSzX7nlNKh01NWLmybMTbkuH4yO/0rrS/BfvYvf2w
	esl56jaTSv/DZK2HGeeNYfWjf3dYRmIkPOFqwpRPZF1hzk3JNFd1hiV5qtxTii5kXdjo2HUJkvzSy
	0gZUAyJWxNqm76pa2v0vKH8B9Q+4jM2WX9a2NAvYwVCjkHakwReQwysyrA16bwPR+7lYRwk8XDMY/
	X2pCbExQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kowQD-0006zf-Fc; Mon, 14 Dec 2020 22:34:25 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kowQA-0006zM-7X
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Dec 2020 22:34:23 +0000
Received: by mail-lf1-x141.google.com with SMTP id a12so34342678lfl.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Dec 2020 14:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjPRCaFVWCdnn8mYG/NgP5hckqyQZLYagjkTOv6AH+8=;
 b=V0OF3VO9JvUWUPkBwWm6izGfSiPnbJcZY7ehsOFCZhl7Ak7yD7X67p9jDf18BlB+AK
 RZ8u48LJeIX2FyYadZaFOQn4E2bOzyX0a2t0dWaEYVbJjBJQxfZJUKAJfUwlJpNV80l0
 vP1e9iqTBF3uuY1jG1avhzvlAuLgXQrjMImxP22ophQ2viALF5efqvcZ7dKO4BGsx09n
 ZK/3FMv+koCSIiTt7Ox6P7XqILaCbIBB2I+s6i6nK9pUdJWf2JaG1XG6GrAE3+qbQ8cN
 qSchtFxj16+6orZFgc+tVgVJte6IPPFoElHs87ypO32xBJ6SR8aZv9taVIJLoWtl7hVb
 7X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjPRCaFVWCdnn8mYG/NgP5hckqyQZLYagjkTOv6AH+8=;
 b=MS96DdG/e4dwma5tR72+bVFlgq+psZ92kLdj6mNyIonrYNqrPoK6b+sPWb9V2cJalg
 6UDrkc6MHKhRbv4Eepin2p/CS8xQx3IpXaCW+scuY4gsBhIidSbVD1AzFClV2jiXB2z3
 Obt1P3qs6cAF+kFxqcEPHOBrIdRnDmN3ivcQRo3bSn8upBGVNMapxN6toq/7eK8RUgbC
 kFrfMmF6gUHS7yfKLH9ccmr0sET/qVhFgq7TSQpkDXpxO3WDNIWsOMkoKQVxEX+sI9FK
 i26dZoOdLBaXD1a1bD8N7btkcIQLBLc/ALRf4OzIZcHZD5SS4PmxkwQm/X7elmVZhmIm
 j90g==
X-Gm-Message-State: AOAM533qdUpGQGqb0+I4kIlOcPOfnMUraae+bldN5ZC7G/ZUHvU9KFTp
 CAPKV8SYUZBL1bz86MsNuLjBMw==
X-Google-Smtp-Source: ABdhPJxLgf69N3lYnZ/m5cqOfohxF2Nq7HVjQMQUi10x9lJxyiyhfNtiuJ+VDuE2EsH6D8OUXf4IYA==
X-Received: by 2002:a2e:b00c:: with SMTP id y12mr11024356ljk.85.1607985260460; 
 Mon, 14 Dec 2020 14:34:20 -0800 (PST)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id w9sm543421lfl.168.2020.12.14.14.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:34:19 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [PATCH] ARM: dts: ux500/golden: Set display max brightness
Date: Mon, 14 Dec 2020 23:34:13 +0100
Message-ID: <20201214223413.253893-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_173422_606011_448EE8BC 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201214223413.eoiPXx1QFirOnVyRUkU4U8BsaBLNtNF5VeBFWxQjhA8@z>

A too high brightness by default (default is max) makes the
screen go blank. Set this to 15 as in the Vendor tree.

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: this is a plain regression fix, please apply
it directly for fixes.
---
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
index 939360c05713..73b09a49c55a 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
@@ -326,6 +326,7 @@ dsi@a0351000 {
 				panel@0 {
 					compatible = "samsung,s6e63m0";
 					reg = <0>;
+					max-brightness = <15>;
 					vdd3-supply = <&panel_reg_3v0>;
 					vci-supply = <&panel_reg_1v8>;
 					reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
