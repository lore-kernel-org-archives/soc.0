Return-Path: <SRS0=WxR5=HO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B91EC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Feb 2021 16:27:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9810A64E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Feb 2021 16:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9810A64E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n5S+4d+9PdMniN+ku9cK9wTJFl9tRv5bvGIkoO0zRog=; b=LyceChGUXDfYNSREZwg3N7a+8C
	gprRmLMGKl+yCb9gw5+s7sOWx5+zhodfQCrtlbYV6a+EFg2BfVq2YU0lMbNSsQRAhnXtnJFexw8un
	jzoHzHCabRswSc7qtV1Xj88BVbbAE72zFKtjEjMXl9F/Ny5efT/owoRpc2KRtYxa9jAKoyVr/ihMa
	VYbB3rPjKuwrmr6HfReKtgzFkOJPAH05C0odoVGuYnu6IhZyPETnuOY9k6f2zxx6DmPBbyP80dREC
	Zx5mQQmvAPCeaWo4UZPCZHki5paGmgSub3QNmp4KJ8kO5aesBd5eQtFArodtTNnDBGpKMS9UixC+6
	YhG0joTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAbHV-0001jO-7O; Fri, 12 Feb 2021 16:26:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAbHT-0001ir-Bo
 for linux-arm-kernel@lists.infradead.org; Fri, 12 Feb 2021 16:26:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64F1660202;
 Fri, 12 Feb 2021 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613147213;
 bh=OwGW8enKxldd+NnFAPWb0VZSuZRCA3SF/WgjgHhPiiY=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=SQTDafnT8McoSJ5ZcbYQEDJhip3MkEiOZUcWfhoXXp1zQoRv0mPtxIWkoMdQ3qN+p
 yQM+DR29AtgFIVU3L747LtfIe86KUEjydKOXuwpq0FbyqoZQcHSRP71O83XeBv9jad
 NVM5HVYEJQ8H0EgKcGuaUrFQWRyEe6IlMfTXh5Uot14RlPQQTiM9HbPlt5o0KBy8Z3
 nVuX4636W+cnNZwrK388RxwL07dOR/XDvVF9Ginw4uCQDdZPiBPTxIckkNIgQ3AD0X
 v6+r9Uo57qbabkmO2nqF+EHeqYgMHeJXfgdYXPx8Q5JA0H2SCocXzfdLWGWPCGndf6
 iNaYxEVUTxzaQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 1/2] ARM: dts: aspeed: fix PCA95xx GPIO expander
 properties on Portwell
Date: Fri, 12 Feb 2021 17:26:39 +0100
Message-ID: <20210212162640.66677-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_112655_505346_138EA93C 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210212162639.CFeSgRTRohgACf29CZV5ivWi-ZG5di85hWY7RqlGwkw@z>

The PCA95xx GPIO expander requires GPIO controller properties to operate
properly.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Joel Stanley <joel@jms.id.au>
---

Hi Arnd and Olof,

This is 5-months old patchset which was not picked up by Aspeed
maintainers, so could you take it directly?

Best regards,
Krzysztof


 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
index 4a1ca8f5b6a7..03c161493ffc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -121,6 +121,8 @@ &i2c5 {
 	pca9555@27 {
 		compatible = "nxp,pca9555";
 		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
 };
 
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
