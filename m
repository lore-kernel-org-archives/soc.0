Return-Path: <SRS0=wsnO=LT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE666C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B6216143D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B6216143D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7laXku885PkfmNDA79clzVNymtIBmM2ceEq8XUpn6Zc=; b=O6MfE+K0onHicj
	2KojYdluSahSxf4KOi3e2S+hfwQBpn/mswgEREp0mhz+DrNwGwxUC+eobDY9FlU89fDAqpKyPFCGg
	waCpO9SaKdFXoifHAsv3QP/ptB+Y24ZvM+hvZT5Bc7UCGx/t2ngpdwTWjHrumsHx/fCQ8e06PSOQP
	2XbX+ItU0NXbinwOjYf/kDeVLwwJ6B4dV+FZIsFl67MQmryLeNWc9Muh2US1l59WQv8xK22SiawLO
	Vm48VXWQvB9HYR7DDKBMx0+41nNCOzMnmOzfrgWRiHbzEMFNHOEfKF7TDRYSZktufrlv/mOsCLcJ7
	tF4w1PiAn5bFJBo7+fMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwj9k-000zqq-Iv; Fri, 25 Jun 2021 10:33:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwiUM-000mAT-39
 for linux-arm-kernel@lists.infradead.org; Fri, 25 Jun 2021 09:51:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id l8so1137408wry.13
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 25 Jun 2021 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i3RskP7ABczDPV/xayjgJz+jTz8nS+XbtsVOlwA5TU0=;
 b=OcddEErbfOY6ExeISiSk7YFKrdvt8iiNzITQZIQpXEkMFnsJBVqW6omdPQrj+MI4t+
 RQxMHVEsgRlByVTOZLNnx8ReJ5cL6+GL4mfOd29Q6fKLvHTOoJGy/JtTc+kjoUaErCMY
 MbpC6MfUnN93kmPSghr5n0mdemefm14+Hke2HLaB5JxDQSO9JVYY1SD3M792mgnld594
 /oR2Wxdaq2z2oRKgO5NCU08fOKj5PIjCwFb/a8SX0aeOH8dr2VoNRXbUvdaspjq93OFt
 Gs7R5u9rjXb1Yjvs8rUHbtg6qvYUaTD8GqGlbB9g2wpu8fjfIXCjju4FMm+HT8HZEMNy
 oLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i3RskP7ABczDPV/xayjgJz+jTz8nS+XbtsVOlwA5TU0=;
 b=gEz0YXn/hQQT890fC33zrrd4lWweOZ+8T+HiVpGz41SfFzFFR8skoCjFgL+qSrTNr9
 hcOznYKjx2x9OS/jnxJW+S6PywH+p02kKzEP5wWcR+vdfqUmUAPP2CjMbxxE+RuZIi40
 D0HVh57Jlga2ZaqneRLHDMIMWA/i3KbLPxU+WbojoK/7S9dnnEK9qAMzn/pGduBWb1oz
 ONI0P7mL2fX56CIMPCYGXoqj33RlgqFuU/tjlpDqkpOCd9+vapkaMjpF2SJ72nGRjz9N
 hGvVZ5Rc9SPTsAFM25QuQ1sQJQXWbvksIMGqICRjDyIzH8oKaRGcMqgzqutJ/pJ8QQdP
 xy9g==
X-Gm-Message-State: AOAM532Q43kwbEr2W0RysFDbAF+1wp4dyEUY1YbEZfDStpDF5AEPlQ2v
 l2DRjVhOLCVYoLyS1vD71w53gpGXaho=
X-Google-Smtp-Source: ABdhPJyS2uk3MmSY2uN1krFSfu+xoBlyO0DZF7uSh/HopQ+aQVgpEfA/mvIw5qtHdIqKnhxkRiipWw==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr10104727wru.380.1624614664376; 
 Fri, 25 Jun 2021 02:51:04 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id t11sm5628277wrz.7.2021.06.25.02.51.03
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 25 Jun 2021 02:51:03 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Matthew Hagan <mnhagan88@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/4] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Fri, 25 Jun 2021 10:49:51 +0100
Message-ID: <20210625095000.3358973-5-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210625095000.3358973-1-mnhagan88@gmail.com>
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_025106_228268_2CDF127C 
X-CRM114-Status: GOOD (  10.71  )
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
Message-ID: <20210625094951.og0Huk6dP1CTJTmYz80m7uEuaki8XvYEbc87cmen4Uc@z>

Add bindings for the Meraki MX64/MX65 series.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
index 78dfa315f3d0..7d184ba7d180 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
@@ -62,6 +62,12 @@ properties:
           - enum:
               - brcm,bcm958625hr
               - brcm,bcm958625k
+              - meraki,mx64
+              - meraki,mx64-a0
+              - meraki,mx64w
+              - meraki,mx64w-a0
+              - meraki,mx65
+              - meraki,mx65w
           - const: brcm,bcm58625
           - const: brcm,nsp
 
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
