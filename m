Return-Path: <SRS0=AN+G=JO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D04C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Apr 2021 01:13:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A2F606A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Apr 2021 01:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A2F606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lrl3eQz2jxzkADQYhdvXF37G+S93tO9DwoDgRJTr1qs=; b=BmYdkeXKV2msmwntw0AZaEPl7D
	7G0wGu0QfE8Pz5wqsbE+gHnijgClef2FYb/jlDA1sK+eQnBBk7cGRek0Frt6aJ4TrsxeTHQovZXwh
	bQ+hiUv85fgjnHRQi3vBOnca5GcD+2N974EfQ3itiUraV0SkzthRM7+KWLqQg+s+9NdK3P4PdwhIU
	fZxYt/yXoELfW85/YyAwQggkYB3HW98i1eGaeJ7e/aqf1mq1BclW5Y6qWTnxvig2XmkKX4nG9u079
	r/V+MM647SO6ffrjSbi1v0WfHo/vKCghlyuQn6wpLXmdP0n34lQgmwkS7Pp8sU+CVlR/o7NRjg7H3
	4Ynd5+XQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZUt-003vyP-PP; Sat, 17 Apr 2021 01:11:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUm-003vwA-0z
 for linux-arm-kernel@desiato.infradead.org; Sat, 17 Apr 2021 01:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=oFRDKw0dH3PiLiKz6mJo37/a7HDsMiEOCgW3zJ4ySpQ=; b=en7Fv5RYTCJFuaXmeTbULchAgP
 bDbQDD9u27OJ7Yxt3qAZ8wVZIm6wnlWN2P0V0pTYjHm1f8wQRnXCwqnhZDKBIJjeznBYaoZlc61tN
 w4TodjSAXTAbyQhs7/7QtXQ9Gc67VloPUpxN14oMk+dUOcgAzf7p6a8W5OfvKnOAja1bbHa1+eBLM
 Dj/aekMN6GaB50K6cMOXPkBnKGHyQXnD0dVOzRBDg30S4NAh2lk9lSmXOuZBC5bmXmaIuxqiWEghf
 xsR/6Ancw1keh9WzULKZDEmj6W6MaJtfXnUN2ZqxfT0w9SqXhJQxBv9tgofUiHXnxxqedPfrq/vqI
 s/5e9Rnw==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUh-009p0s-O2
 for linux-arm-kernel@lists.infradead.org; Sat, 17 Apr 2021 01:11:33 +0000
Received: by mail-pg1-x536.google.com with SMTP id p2so4842046pgh.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 16 Apr 2021 18:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oFRDKw0dH3PiLiKz6mJo37/a7HDsMiEOCgW3zJ4ySpQ=;
 b=CI/YrdY4BoPfvyDsXCUQr0YtgGQc6ApLTyncG1WvbL5A5F7lcNkgKzLo81sUCQ4TWt
 s/k26P9BKA9G+gkJPeYNc3rQDO981jPCULKxeAWhle4cSa5LqtlFdg5GkxYx9AZsvXPJ
 xCUG6kNm+KDXKVuJYLG0YfNxTJsS9UjO7skVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oFRDKw0dH3PiLiKz6mJo37/a7HDsMiEOCgW3zJ4ySpQ=;
 b=s8zTbgy1bk15gS0B7NtS81hsSuyVNu5XSrzBCSzbp2HokSGLcsaHZaGOxNp3l9xtc7
 fqCZrUN/a1KJQoqPfgsTOJpJxn/bfibGdQcBiTe/B+aKkZeEB6LvimFfGzs4WUf9ZdfD
 zcuFNhLo0QPSGOoIWKgMeysduSTN+FCHq+eUSkl41qArucQdTW57efobBae3nshMgCGP
 upO0Ug8MS8zGzc5jx33pUfQKAw85v9TBOjeNvqqPWuN0KmdF0Zs7v8PMPPxEXAwkAMcI
 Y4JNeCs2hMUfSoaCkzvM3Wi60RvgDrMdDLhYm2jP8/pRo+F2EbOmvyEvPSxZ8JrLi5xK
 HcKA==
X-Gm-Message-State: AOAM532zP4x4x+UzJ/cyw47hZksfAclIzkSXQJBEXK8IJBrLgvN2YWr+
 WM6WqfiBKfDTPgA2uaLHYt2CPw==
X-Google-Smtp-Source: ABdhPJxqmXvxD4LBQIPax7OSnpomD/4jNcX4OFrGrMf0MgZTSCaSU8ragurZcjW6leHMWAKc/4BGXA==
X-Received: by 2002:a65:5b85:: with SMTP id i5mr1424835pgr.269.1618621890046; 
 Fri, 16 Apr 2021 18:11:30 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id x17sm2181515pjr.0.2021.04.16.18.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 18:11:29 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, olof@lixom.net, arnd@kernel.org
Cc: w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/3] ARM: mstar: Add initial support for M5Stack UnitV2
Date: Sat, 17 Apr 2021 10:10:12 +0900
Message-ID: <20210417011015.2105280-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181131_910909_CC0BFB53 
X-CRM114-Status: GOOD (  10.87  )
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
Message-ID: <20210417011012.24vUTcTzONSyQY2xbTwp4qZIVIBj8K9t2WOP3vYF5QA@z>

This series adds basic support for the soon to be released M5Stack
UnitV2 based on the SigmaStar SSD202D.

With the rest of the commits in my tree the SPI NAND, ethernet, USB etc
should work so the UnitV2 should be fully usable with a mainline-ish
kernel.

Hopefully this will encourage someone else to help with cleaning
up and pushing the commits for these SoCs.

Link: https://m5stack-store.myshopify.com/products/unitv2-ai-camera-gc2145

Daniel Palmer (3):
  dt-bindings: vendor-prefixes: Add vendor prefix for M5Stack
  dt-bindings: arm: mstar: Add compatible for M5Stack UnitV2
  ARM: dts: mstar: Add a dts for M5Stack UnitV2

 .../devicetree/bindings/arm/mstar/mstar.yaml  |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/mstar-infinity2m-ssd202d-unitv2.dts   | 25 +++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts

-- 
2.31.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
