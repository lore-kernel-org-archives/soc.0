Return-Path: <SRS0=pZgq=FQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF079C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Dec 2020 01:24:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A211020DD4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Dec 2020 01:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A211020DD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y/tPWC2UX/4Azp/5PfmKRJfuXBUgap2RGXAanNDLrGY=; b=Rg3nvGGBwleOMyPgkViNc40l++
	CpsMaRPOfC7lGU+1yX9XSJK6Uba87lh/TAnglTzaGVNqdw+mpMov7iCIIm/Vnrw60qjzjVcHbDtmE
	2P5xPzyubneDlIaGStY7/3+P3e7iyxzqZoPYlq/BjQf7lgcijVK4wTF1l07YmZ8NJmMTSA1wb3THM
	MpLv9K0LuD+wF9Y1LDwd1/B1yesMesZrIwDvGk/0JWQutuecn3NKs5IUia26OeCCb0ctv9XPVY5nQ
	wbRuHOYXXFqOea8bKXOyZc58zUuIvvKEcpw2ZThFJBDSyCk52NyG24tWPl/tq4Jf1DbIXfnR8hDR4
	c3FAdP8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kntd3-0003NW-GK; Sat, 12 Dec 2020 01:23:21 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kntd0-0003Ln-G7
 for linux-arm-kernel@lists.infradead.org; Sat, 12 Dec 2020 01:23:19 +0000
Received: by mail-pl1-x643.google.com with SMTP id u4so5487862plr.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Dec 2020 17:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBtSCo2aiVK+Pe61Pe1iCNpVRoVlE9vowQAOup0zUVo=;
 b=dYSqgqy5cEveG6dzM6glJgQcweYN29Jm+7P3TivHfgKnveCQwCxxrnWF2dKcStcQpJ
 3+oEJsl6Sq5GkXwsmx03Xjlu+yrt4/+pPZiv/LSMfL+BDxmwWGKQx4/jWqS8fgJupmQ/
 w9cAUX4Jbd3eo+7K5KTIy4Q0MKjyvVzZ7nXs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBtSCo2aiVK+Pe61Pe1iCNpVRoVlE9vowQAOup0zUVo=;
 b=VLn4uRUraIiFwBUT7sWWJtjiUx2ycLZ0D4E8LDvTRJFoKXIfUDQVM7opBhN3zMns/b
 4dA72VxrTKUoKWFdIpRVik8iqwUVdjlssJyM+bS/Oh5qI8/zWdkCRy9LxULqbbqGswIb
 aG5K9DHUv2f89tDEFY6Z/Nnfz5qBeiZMaIxM9xaPcu214OrFRpZhywfpndHuDnixqXAu
 XELEwlnvBY/vgl47Q1EYYVwEiccbSl01roCDwRcv97rvIl5leejPeFVX+GfoPJ5zqCwV
 anmX8RsWDKWZ6DfeV6YS02mMrXwFKKcFANHu9XvTPHDk+rLuWmPZTFjL0sGMiV7nlVPc
 P4Ew==
X-Gm-Message-State: AOAM532qNZCpBqbmV9HMzNovUezb444A7Ev+CaFutySvR/OlBphV+Ozy
 GPb6RLtbUEv2uOq/leBxRKdcyw==
X-Google-Smtp-Source: ABdhPJy0Omx3Bd/nYZtQzkm1h7saxbiLpbRzdG7yoONL2juuSNDiJMIvVeh0TdIIKVu6urt97ZoSww==
X-Received: by 2002:a17:90a:ead1:: with SMTP id
 ev17mr15819352pjb.51.1607736193819; 
 Fri, 11 Dec 2020 17:23:13 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id c2sm11623071pfa.59.2020.12.11.17.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 17:23:13 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arnd@arndb.de
Subject: [PATCH] dt-bindings: vendor-prefixes: Fix misordering introduced by
 honestar prefix
Date: Sat, 12 Dec 2020 10:22:53 +0900
Message-ID: <20201212012253.373074-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_202318_795867_E28D0708 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: devicetree@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201212012253.s1KZGvmlI351v98hCgqr7Q0BGFUM-IFAEHrV1PoC1g0@z>

The prefix for honestar should come before honeywell.

Fixes: 43181b5d8072 ("dt-bindings: vendor-prefixes: Add honestar vendor prefix")
Link: https://lore.kernel.org/linux-arm-kernel/CAFr9PXmwOEuHHA-kDeL1YS8bWvovrt43MXxyy1J+hGbXwPUFSA@mail.gmail.com/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a6cf2cef6f89..5f9bb0c152af 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -449,10 +449,10 @@ patternProperties:
     description: Hitex Development Tools
   "^holt,.*":
     description: Holt Integrated Circuits, Inc.
-  "^honeywell,.*":
-    description: Honeywell
   "^honestar,.*":
     description: Honestar Technologies Co., Ltd.
+  "^honeywell,.*":
+    description: Honeywell
   "^hoperun,.*":
     description: Jiangsu HopeRun Software Co., Ltd.
   "^hp,.*":
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
