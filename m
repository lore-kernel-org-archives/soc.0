Return-Path: <SRS0=AN+G=JO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61FBC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Apr 2021 01:13:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0F860233
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Apr 2021 01:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C0F860233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wKZp1Kp3DtLNJdUYaTxT31H8ZzHMSkt/oMhMwUgIS+0=; b=S8nC6VbM4/SMXK9V584JW6sZR
	je+1glsYGoPddxM2DrRYKsy1qCfvdM7MvDaYwQ/3/PTkzONwW1On4OIIavHUQsF6wxXjcw2cnyagp
	JJSN30STfaK053gzsddOtxH4OdPtfg+NSKuyGEPv7NxW0qkDclvbzTiquwttk85VJsZdlN1A320TC
	idKKKZ1RrfTdM1S7scWeIsgo+zrz8inUlW4cYdEeqM5h84Hdvl5wM644dnP5K/WyFbSKEXJWIe5PP
	wy8lc1OBTAUjC4XEF4xttZQhlMMhZKfggT0EMzNABqiI1gWE5QYoj016MFKoioxd9M7dNpii/koX7
	b0meN3UXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZVK-003w4V-5d; Sat, 17 Apr 2021 01:12:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUp-003vxC-Oi
 for linux-arm-kernel@desiato.infradead.org; Sat, 17 Apr 2021 01:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4iQwcrP76XND1KpyIIjDX5F1DM/jpRSnMhRHiRWy9PM=; b=JNQxbZXo+m2w8QENibvT7t7uRt
 68tqG24rlA42fJFO/XtRDJLUyr9lnpd44cybKBBKc9Lr8M3N0bV7cGhqDPQhrrFLdKEHN5c2P8vUC
 dnxZShteNy3IS6nKsEZDQhiPHboqt0acsVEHQ21W/j8prDgp8yWQ+WvvDGDISm0av1AmtUREs1xC7
 bxgUDKRCTKfKr54fDwJegie7+a1lUVBIHUtT/L4hlJP14QuRDjDScnILhdldWqJMS4I4+anRGFWlo
 SAhLKAF8sDC4CXBvmA4F9Dc/01KDTD6fcPX6yD54PH7FCRDaR/K0eFtGwZr9pDnOmJINDefwnHE0r
 luVVaj3A==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUl-009p1d-H3
 for linux-arm-kernel@lists.infradead.org; Sat, 17 Apr 2021 01:11:38 +0000
Received: by mail-pl1-x631.google.com with SMTP id p16so10895456plf.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 16 Apr 2021 18:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iQwcrP76XND1KpyIIjDX5F1DM/jpRSnMhRHiRWy9PM=;
 b=RCfCbgPnnkU94wcgcgHR1NXnnA4O47bVddkwHUrbhp1OGyytop/9Ytgb+d03pVihIO
 siRltm4AWh7ojfhzZe/um38LkQ512SoRFO7wfiU9N6HvaoXdJ6YLagv4LzfDYZ5/uNww
 UkeZI0VdMDb/ERgJDSwqgD6vy6UCdf0AtcD5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iQwcrP76XND1KpyIIjDX5F1DM/jpRSnMhRHiRWy9PM=;
 b=RmyNZY/j/71RVxQMJPBZyl+kd4BGzYP6jxzupQGzD8m9+mPolSsjW117QATknGfFJB
 OKR4HYufyxfTCKe8XP/9iQOKMsjfBsw8r9NU/VgC1Vq5YUIiezE2t44G5AVXSt/A21sI
 lmgCnecX0Nf2t8Ga9N3P+DyeEppzf5sXNVD/CyNtMwAEB+YW1l2ruSU7yRzeet+cV0kE
 HzsvLmrehv8rjXXkgaamUokc4j7pEdeAeCoe9wvv+rUCsr19LN1EPfTsnEBVEs19kI8V
 cZZJOzmxlS4qGRw7vxExfSew7/3MvKLLH0Mujxm9g4xI27wGJBys56yX/8vNScAXdHJ6
 MphA==
X-Gm-Message-State: AOAM5323WaAjOPxUfi4biFZC42ZEwt21FrfiK8DXt1QovJLaIDu9o/Fw
 uIM75HZhvgAPIqlDNlRp/ERmQjijPkweqQ==
X-Google-Smtp-Source: ABdhPJw84Vzs9qhqrr0aOVygyyA7rFMa7bvZYva6opSQkrgMOLDfLuoVbDm5vcw5kvXuoQ/h7sIZ3A==
X-Received: by 2002:a17:90a:db87:: with SMTP id
 h7mr12533861pjv.36.1618621894873; 
 Fri, 16 Apr 2021 18:11:34 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id x17sm2181515pjr.0.2021.04.16.18.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 18:11:34 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, olof@lixom.net, arnd@kernel.org
Cc: w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/3] dt-bindings: arm: mstar: Add compatible for M5Stack UnitV2
Date: Sat, 17 Apr 2021 10:10:14 +0900
Message-ID: <20210417011015.2105280-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210417011015.2105280-1-daniel@0x0f.com>
References: <20210417011015.2105280-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181135_584413_B1F01E07 
X-CRM114-Status: UNSURE (   9.83  )
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
Message-ID: <20210417011014.bstwdTxfbm9qn5I7GA0-H5FKBtiRPBXhFg5CYyFxmX8@z>

Add a compatible for the M5Stack UnitV2 that is based on the
SigmaStar SSD202D (inifinity2m).

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/arm/mstar/mstar.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
index 61d08c473eb8..a316eef1b728 100644
--- a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
@@ -24,6 +24,7 @@ properties:
         items:
           - enum:
               - honestar,ssd201htv2 # Honestar SSD201_HT_V2 devkit
+              - m5stack,unitv2 # M5Stack UnitV2
           - const: mstar,infinity2m
 
       - description: infinity3 boards
-- 
2.31.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
