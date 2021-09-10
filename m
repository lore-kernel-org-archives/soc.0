Return-Path: <SRS0=1+dv=OA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22027C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Sep 2021 19:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC4E16101A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Sep 2021 19:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC4E16101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnuhsJReuuBeA7KO8MU8PAdGanTVIhtUMIVsDw5BER8=; b=Xftc84c9dOxKt7
	RAdIwFiryl95q/jiaG6kqjBkp+T9oM1R41bfqlhQDXWSS6NN4sBsT+GC2EaRHKLGurx3TK4yT1Lht
	D7ojckIZ/GPQiK/1MogmfuGiYquvVhUInYmLqI+5cyTNyyHdC8Q0aUbRrHcb3VkJ2uCrgyxz9EDwT
	MlrbUMACrdnn+MM+fkgkfNioBVzxwMM5y1ovD5LvH47RDF4n3XCuG/KeiBOQN3cuZUIeArQrqNe75
	lpCgAOerhQNR1ToeUw7CECQts+w2BoGtyg+2mYa8G2SEw0XWdZvPtw0rnWk5GxRuAG2s9pprPQGi+
	IVMG/lI7IcPvzNQNkixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOlog-00DVVb-T2; Fri, 10 Sep 2021 19:04:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOloQ-00DVNx-KV
 for linux-arm-kernel@lists.infradead.org; Fri, 10 Sep 2021 19:03:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id d6so4005833wrc.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 10 Sep 2021 12:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSna1bEaXtn8m7SSEUg3SHS/YUvgM9x34Z5EWR+22QI=;
 b=qdMQkcOMFEYeenP2UwasQiTiy8VmD3c1HUKLM7J/cUCaTaFWDnvpt4zhxpntp5S2q7
 0sbagO37+h8fm9IeszfwDuMPGFYP/f7YRhVZIS2zsOjMikNBQd39+BSuuZFc62FsI0Dn
 wO8Pcx+LP+rxvioAT1jQtJq4btd9DAn4qplze1MFOxwUf8uDgvHPO5UlvGjZhWsM725w
 ZLktSyr++t066WlY7KH3O6xY27k36rJd7WYn7VOhSRkwbVt44lgv0utKk2wDnMu1LSrm
 AEe4A/sixVEl97WNl6K2fXVfSwa/mcAlhEm5EaA24K5Ec8K6ARViHgt8NXjAdkvxof4A
 DRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSna1bEaXtn8m7SSEUg3SHS/YUvgM9x34Z5EWR+22QI=;
 b=T1XHPMHtlsUETKS/OyWu/JDNNxrokWCsEioI7BzZii5OPouXx3iz82mHjfXshT4Ira
 3F4vUswdxBqiYDT1EaSiMJMlfCrECQPE8sUdZSHwRhbySCV0abyqD9mWJz3UmitPlgHI
 EDrl8kdpTZJMQMhOEgpOLBHSwAwyooWf9dg5Q5V6qZp7SH/0BEiAwGUztLOpPkv1b8I2
 a8TpQWClIXpB+StWRmrF/q3WH1yjeAqfduoH05xlXf7dImZl/wzBVTF/5iseUF8zopjy
 pkUm1XqpgV5Y861XCNG7Cd1rPJ7ecAC2nFXgKRmr7+WEAiYoL0kxrnJh48BYz7J0fm+4
 8IAg==
X-Gm-Message-State: AOAM530vV/tQBmCV4x8oQVqxwtOv1LN4VQpRLDMq97q5WlrHsaxV90qw
 K4CyhGDqeWpfEpD9dOHsMiw=
X-Google-Smtp-Source: ABdhPJz5rIXeHcTGNtG6rhjzryeNOoNfS/iDrkj3d5W/OlUnPzP2McfiAHb+seXjC26tv5NXeJ67Uw==
X-Received: by 2002:a5d:534c:: with SMTP id t12mr11508236wrv.219.1631300623991; 
 Fri, 10 Sep 2021 12:03:43 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
 by smtp.gmail.com with ESMTPSA id h18sm5547228wrb.33.2021.09.10.12.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:03:43 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>, Romain Perier <romain.perier@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: mstar: Mark timer with arm,
 cpu-registers-not-fw-configured
Date: Fri, 10 Sep 2021 21:03:19 +0200
Message-ID: <20210910190322.27058-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910190322.27058-1-romain.perier@gmail.com>
References: <20210910190322.27058-1-romain.perier@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_120346_711812_03CCCACF 
X-CRM114-Status: GOOD (  11.71  )
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
Message-ID: <20210910190319.-W3JSWMF-ViH0xEBABZu9QxYXYsqAMCcnUzaQOuA0VA@z>

The vendor u-boot does not configure the arch timer correctly on
MStar, let Linux do it.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 2273295e140f..982dba9d28eb 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -39,6 +39,7 @@ arch_timer {
 		 * u-boot is broken
 		 */
 		clock-frequency = <6000000>;
+		arm,cpu-registers-not-fw-configured;
 	};
 
 	pmu: pmu {
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
