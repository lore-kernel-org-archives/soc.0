Return-Path: <SRS0=NGUK=K7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C16C47082
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jun 2021 16:15:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D7061107
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jun 2021 16:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7D7061107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zxHA5ziamPgCFePQQ4sYgwM9a8j+2QyMk6m3KOJQ5kQ=; b=PLjrTVybSk9djv
	JTQFPwX32RCJcL/KPiM8WTJPx/pCnzHGLeQrhu1wCLBrrDGpaFobOGq+qdNId5vO/py6E1OlpForw
	j64zQkSyGlBe0D9+F/ol/nIR4+QJYaBCJWgOYPauTKEd0lNlTlTvaVqokf9vdaT8btX15WQpQvrqK
	4QF2hglxL3rrL7IMjc/QnsYI6PmNCHDNe7kCMAqYf+bcJy2pOejacqTLtjp5T7ONhiqf2SkxtokC9
	kM3RMYQ+sn5p+c2PH/2pSsU0X4fX8z0iN6TPATjifXgvRp/6mq3HjnTNFppRVkAZrLEcnfc1aBdic
	MRA1gyFktfOfyCfvMbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpYvG-00GmQk-I9; Sat, 05 Jun 2021 16:13:18 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpYvD-00GmPm-0N
 for linux-arm-kernel@lists.infradead.org; Sat, 05 Jun 2021 16:13:16 +0000
Received: by mail-lf1-f41.google.com with SMTP id a2so18711110lfc.9
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 05 Jun 2021 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ESqwAY5hDTv/bxt7Kviu0j+zOztUXmB9vjmY3/+7G3Q=;
 b=WS9fTNdgGH7MgmLZUeyMtpBf/VtEA7StgyEHxY6k4tUbxAIxnWKgvvOSN6zmVQr9sk
 qvPjnWBEPV8uAuP0Lh5iQCiZU3BTrD5n0JBRYTLhTSjeeypw4qvBxGKWD85S/D2wOXoq
 UAqFFpnw+jfG5UBLd9VwSC0jVBzodUVjVAgEMKLSQ4rCl2HxmLzeGWX7JeWDzV3nhOxC
 yeGRYNkj9dkYnD5r9hOtuS/giWG70NhPi8cruCdMV5ZlOTMbd6M5ebAh9VtgKnYSLzZj
 OwHcUOyGlT087F8f76aFqY2OgKixEqpMMzxdKeLlfTzEJL1jEkcyOVVX6BOQvkE6yRqG
 N6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ESqwAY5hDTv/bxt7Kviu0j+zOztUXmB9vjmY3/+7G3Q=;
 b=bYwDq1GvwZRiBnm+r158O/6K9SurVqQxRVFdWCn3C/dpKtZ6oobPt4KVWCRPbK9V64
 HSb2qH8vTDtFwBBN/kedSi4zKDQXkRX1oq2rwVjT5eWSdnWBreEq/h3RMHFzgksKsk23
 D8BvWUud5NB3c4/uHlJdUk5DdldsobWUJBiTLiy2XI17D2E7NZ0MC/eRy0CLAjOceLan
 BRlNshHc3juxSujD3+tJEl4H51cggfKsdftdEUpZmcqAlxaZTJ4CDpuP/497/WwfSLlt
 m7JSMwBsgANu1Ypk/ePvbEZrtnn9YG2yRDd20XnOvAAq14WQ6CZSVVDSeATSKA0nJCy0
 i/Zw==
X-Gm-Message-State: AOAM532s6lk6CJPdf1CYvhN4OHLSUSze4ARTbTzpotJHG+eqwsFc0hie
 Wk7sh1byxLIitsBHyYFSU9JJjQ==
X-Google-Smtp-Source: ABdhPJzY9Tyrxp1quMruefiU5l7OCSQVtmo0a7U/PHE1biT6c0AA4aodJ4Uxuy4tvf8x1JxVuSca8A==
X-Received: by 2002:a05:6512:987:: with SMTP id
 w7mr6213289lft.41.1622909531766; 
 Sat, 05 Jun 2021 09:12:11 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id v9sm1099317ljv.131.2021.06.05.09.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jun 2021 09:12:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] ARM: dts: ixp4xx: Add crypto engine
Date: Sat,  5 Jun 2021 18:10:07 +0200
Message-ID: <20210605161007.3397216-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_091315_072508_6C1B5F40 
X-CRM114-Status: GOOD (  11.25  )
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
Message-ID: <20210605161007.rnqOzi_AUH4sagW5AvflMv9XD2n5SQC-LePB0ZpHaTQ@z>

Add the crypto engine as a child of the NPE.

Cc: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please queue this patch on top of the
other ixp4xx changes sent by pull request.
---
 arch/arm/boot/dts/intel-ixp4xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel-ixp4xx.dtsi
index 528d5dc09cfc..a50427ad05e7 100644
--- a/arch/arm/boot/dts/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel-ixp4xx.dtsi
@@ -113,6 +113,14 @@ timer@c8005000 {
 		npe: npe@c8006000 {
 			compatible = "intel,ixp4xx-network-processing-engine";
 			reg = <0xc8006000 0x1000>, <0xc8007000 0x1000>, <0xc8008000 0x1000>;
+
+			/* NPE-C contains a crypto accelerator */
+			crypto {
+				compatible = "intel,ixp4xx-crypto";
+				intel,npe-handle = <&npe 2>;
+				queue-rx = <&qmgr 30>;
+				queue-txready = <&qmgr 29>;
+			};
 		};
 
 		/* This is known as EthB */
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
