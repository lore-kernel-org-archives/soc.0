Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F95C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3678361435
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3678361435
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K71ACj29QG3cwxAxIdTyr0r4bnmc+vzJGPGeQITKnS4=; b=JCwp+QJZ2AXt8Kgh9H4ke8UOu
	W6lXU8o0enbJydeqdOvzh+9iCvwcLsNzp3UYH+pOpwUQx9GOr243thyVnF0ZRNOKh7ymXg7onaWes
	8beWiHie44ibJN+47Azh8Jb4A/pch7REHqJkunwCCHmnY9jQ5dsgLkc3riG0JEwpubh+ifNKyoowq
	1I0/eMDA1p49Y1xft1Ig2uoL/TylqVM7mcVWK/rpwrZhpzoz1heemnITfSuTj7eZB/CH78PuFl0aG
	J0VGnwQs1lfEEK4pbWvaN3EN2zdFOw0f7tEBK/TSofK3hWQpit6bO/zhHCC1QdatMHT8r15jLfkH5
	OKPLpQoWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZJmB-00FAyE-1M; Wed, 21 Apr 2021 20:48:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZJm5-00FAxn-1y
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 20:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ZcLsBjs232xzROZWNF7eNdAdRnsVNUUu8DByMHzzzYs=; b=lB/tsu+8EO5gHdCV5ohqJD+Cti
 FRp6PZa1THpLLrGxhnflYl3+w/gpNe74yDOGdEmdeldY7b46/kBJ0byhsiW7PR4DP0ASrh6DRT0vB
 3jA12G5jXV5dfbWq4uk/A6iFWjDEsHJn1vfzjvkQFXOpK7Tlu7+QCzRrty6xyiUrs50UIVH+sCs3i
 2lXFzL5vGqtRr3JwLwXCTFrNkSbi5XK+lb3tPV2/8sghVXEZyFxTBTE0weM4XIAp41aqxRZCYouOy
 ZyLI01dosNORxAEPofA7ejesQsB1+cBlU+ir/IfGxeXEE7DgtwBTJPCkU/006AwlGC/SjbCLiTl5U
 4U6fB5jQ==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZJm0-00DBNa-45
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 20:48:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id p67so25074313pfp.10
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 13:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZcLsBjs232xzROZWNF7eNdAdRnsVNUUu8DByMHzzzYs=;
 b=1wiz+IiGd8sEyoR7tY/fGbyjK2U1GJih82pZmwHXIGGtC0uNSaVxz+cpg5k7G0k87W
 JkVboK/054G7oDUihu9grUiCFJtG2yH/+itCNzGCcGWAHQRQWNE0bmZyJe21DacuIRZi
 /dDQk8fPn0EtaQzXPzVGLkSg9cWM0TxqvCb8Pxid9pxdcKqD3eOw/8njesusKlsJgCYX
 Xugu8cc87loO5sV9UsjzINDGIDKTgVOroMQK0EpunSSJbzzpdG+kPtHZfPFVoEaw+ZSz
 8TDqurm/y2zCYs2o60NDSlWBjfQOoRY7mfx0vnnuq/GXW8HtkA0VxMQU+4/r5m2T8nfC
 yg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZcLsBjs232xzROZWNF7eNdAdRnsVNUUu8DByMHzzzYs=;
 b=csh2hcjfAFoMUuJHooQcsDZkqdwYuAGOur7KsDoo0MRgkVGzlDZwsTgWrzG55yNTny
 ipkN39NxpdYcajdikv8NfnviYbio8/pMA844e4KdoddLwSM3k8oewwJT2JJArZUlkDgA
 6T2I7fHvhyKXk6Qsmd/67UrjeMsaoyTATZu/4c4Iuhs00Yaxw2gCR3SzNcw8psop12j0
 JUt9Yc+8ztsSh8k65BAyViiL2zW9Xpf7hLupnKBMyALTFI3/5rpcJwqeuyEKHrhxkEcZ
 bytQQwHovq5fcykCS3Ow+twnUXSWFnZboRDINdNWjjEh51HLFmC2m9pF8zUzuoaYCXQO
 qsKw==
X-Gm-Message-State: AOAM533eTfZR7FXwF2Igw3qlqx5IjXEuthp4UqmZEdRdylvtsL9V2thX
 I2G3bT68vSmm7ejlzT9vCR6bnXVLon+4v+O9
X-Google-Smtp-Source: ABdhPJyNHGWzLI1G0h0A3vWf4PKsfJdlfnz9vMId5uRCK39tGOWetX0geaAMqkihFnQFKBQmxcgxRA==
X-Received: by 2002:a63:9e02:: with SMTP id s2mr62538pgd.134.1619038115274;
 Wed, 21 Apr 2021 13:48:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b25sm177079pfd.7.2021.04.21.13.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 13:48:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: mali-bifrost: add dma-coherent
Date: Wed, 21 Apr 2021 13:48:33 -0700
Message-ID: <20210421204833.18523-2-khilman@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210421204833.18523-1-khilman@baylibre.com>
References: <20210421204833.18523-1-khilman@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_134836_177837_8F157B7B 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421204833.sxFJAgFJAkC3HPAkskcE1EPHdUscTPm94HqciJt7DSM@z>

Add optional dma-coherent property to binding doc.

Found by 'make dtbs_check' on arm64/amlogic DT files.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..894ba217ab32 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -69,6 +69,8 @@ properties:
 
       where voltage is in V, frequency is in MHz.
 
+  dma-coherent: true
+
 required:
   - compatible
   - reg
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
