Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA47C83012
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3EF207FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YLg20CV9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="s+sQYh9u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3EF207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8vC8k4iF42wQJga5SIWiefJIU+7QRzE78d9XLjt5CMY=; b=YLg20CV9LwOLB8Dh8CGyt/mCw
	B4cDoSBMl8Mc7Agb3dLZw73anDZnuYyivtPqW1P51H1VIHQ0Yv2QwNr1DNYZAMCx/a3fkq7xrsz6H
	PwDuuVaw8XE55tfPLjoHdaI05l1RIiXaCjjWzp+sulh0n8X/ujRstbphHwf+//13rf6dkyW2rAkMQ
	IBP/GVdud/x4ZdFyYTxd3eoOqdb6qeEgPU7xq7IuDYvBo8R+O5EOvsvCz1QX3hqhieVnZJRSsOI4S
	IhS42YOwagqCYOlwNuQrEXs28soPy3lUmI2qONxq66rxSS0DsiSgqYFOS+eCx2Gaefyw0qCjBKFln
	7Hp4UrmtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5wj-00070D-2T; Tue, 01 Dec 2020 13:43:57 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wc-0006wP-1g
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:43:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id f17so1221017pge.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Dt1UKiHvns/wxXXTVZSOMf0MQOF2uaj5QHuWAWvMyQ=;
 b=s+sQYh9u4PNPxijEivUJmC+SmfbhXD8FTmrOqhu9dToUrWo5DfciQQJdy4IbfxcQ8O
 AvhBgVMH/tidGkmkSpJtKl6wamNJiCATDJRvLEaPd6mdat4f0wIX9IBlLAlYf+iT6TbR
 9+uWSA6ucNTLiF3WfGTsnnNF3hWW8jRU5yLmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Dt1UKiHvns/wxXXTVZSOMf0MQOF2uaj5QHuWAWvMyQ=;
 b=JnLtQpSB5WYYumYogr8s1Z7wYNFQOeqFq20iKyMz2rAToqs9BAt7IB+r6jhP0Cl0Iv
 C/EF77ypN6upk8gyzCP/zkr/43fgnJJx4nvjpoC9Ig/CH9qtuxSRq530wY8dFc4UEAHr
 MB3MC6+wWmfMd4MrqZwwLRpRfEsqWIv+tRpG1ool6wBIjDsnSc44rUYo96yksAKwnI1g
 bDGZY8Dy37Vw61qwq2IixThkzE988skQPWSa7gfweWQHCAVXOwIkQL+p2h4N4pmXHMiL
 pFrx0ywQIQDMhRvOi3IRCBrwni1x5dMMu8dSbFbJKlAHl94LRgflNBvtKcCtTUsiyHpz
 g8DQ==
X-Gm-Message-State: AOAM533/iQNWDvocStIkUa6ZepM3U5vXxvqhCZ3fBwcXSC4OM2OXN/Kz
 t2S1B34CLbuSEK4IvoVCYzn+MQ==
X-Google-Smtp-Source: ABdhPJz6Fbr0orPaVYv9paiSOtvGm5Y86cBYdh70h4VRs2mpXlZ7xEcjl96/rs7H5GIcwZsfby+XCQ==
X-Received: by 2002:a65:620c:: with SMTP id d12mr706840pgv.220.1606830223429; 
 Tue, 01 Dec 2020 05:43:43 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:42 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/10] dt-bindings: vendor-prefixes: Add honestar vendor
 prefix
Date: Tue,  1 Dec 2020 22:43:22 +0900
Message-ID: <20201201134330.3037007-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084350_127535_13B17865 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: robh@kernel.org, arnd@arndb.de, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201134322.YAbsKi2NmpWdDdP17diddFdUUNDub5Fu6sxaQe1ZDYY@z>

Add prefix for Honestar Technologies Co., Ltd.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a6cf2cef6f89 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -451,6 +451,8 @@ patternProperties:
     description: Holt Integrated Circuits, Inc.
   "^honeywell,.*":
     description: Honeywell
+  "^honestar,.*":
+    description: Honestar Technologies Co., Ltd.
   "^hoperun,.*":
     description: Jiangsu HopeRun Software Co., Ltd.
   "^hp,.*":
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
