Return-Path: <SRS0=ACqz=M6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709CBC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Aug 2021 23:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F4161050
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Aug 2021 23:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26F4161050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQA00z4dsmsCjQ5aT5Ey5m9Z30w4v7qhKFWu9c2rjzQ=; b=IOuAKSAYrcR1Ri
	9YuHe4KEsep/nmtV20KL5mmIWeMK8lZ17GG+aN7FfnL0Ymq3Pw3pNFMIyKoWhwuovTcmRAG7vC2H6
	o/cqrNYFX80fZJfDXFEQO/8uVAYgRm0llNBg4ewhdAg1gG/8v4sg6uVWt/bNHFcIyD5hQ7O/7YElb
	PypEOGQ+dlDXvEeItOD4/vGWkyQ7vlygVturV7Alqrq89l1tk/JDlr/a41rv0hxXSlApGanpgdi6g
	1OoCw155tCYdxHyJDkmkSMSnsKc1ErMMnwCdg6QocAp/F7l5F+4uf3O/oYrDFM5+dA+BTAWkzzLnz
	dswgcLuMGGikNrN1lkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCVKm-00FHFr-9I; Sat, 07 Aug 2021 23:02:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCVKi-00FHEv-Tx
 for linux-arm-kernel@lists.infradead.org; Sat, 07 Aug 2021 23:02:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id b6so9581377lff.10
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 07 Aug 2021 16:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jlAaQFyXghmyzPJGW+GcQ9q9eakvQgsmdsfCvHm6fzw=;
 b=Wf6blrWiOJQpM23q0ZXVW/fSQGdONjouqHmvjtMIErDceCRB7geeaP+28xljiz7VU5
 r10LpZVmvWx+eV6AlSLSak4koy6GP9rJNwcJt6tIXjMqlnkKCnmZSiFRTpDzpSI40xf+
 7MRW/hbjPqkiutQmJgAxLgxdE2W/r6TKF9AVWPuceIbwrncZQqLwrRUjnlaoyVL0Gxsk
 XZrp5kn3RLjba/sRM5IpnVQ2pVP2GbCkdIcRMbdvx5Ugps4vq8Khf/eG8oXZVHqJWhwY
 FgKeeeTlWAk5UbNdBf2niv9AzOwGk4GbDdwKfgRF2jrazf8k7xv0+v9ELEZAp6LO07Rn
 BW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jlAaQFyXghmyzPJGW+GcQ9q9eakvQgsmdsfCvHm6fzw=;
 b=D6T+w/KIR7a9beNgtPD9/hsuoZQoMHFSmHG77YbrfJqmyZ0rDNJTYlDoR7RZeqzdFp
 f2/T5WocZGPnNUXRUbWFR3s/+iayVJRn2WbkdSXO27ZMpW1feXta1EfsHWacU/DbVk2p
 deyHnNmDr/8xTX4apnubyG4F9imr+vi7tudzpKxeVe1zy2dRUlmWAuRM2sUZIoKwyaep
 u8aB1iPGuly7JcYmZ3IaWkCHutu+bppuxeOi/pU1TPnPeVIIUpTGVD/SrGRkMhtkHNnr
 QFj3kJnLPP+26HJPFx0qLV/vFDh2Mu5qYLo+1fA4HGvSMj5UgiTqLDhx4wZCHPlCol0S
 y1Pg==
X-Gm-Message-State: AOAM532HdcdsaPb8i4VP0jjnfPt6UeIsJmh57hwIfkF2w5ZkgQgLycGa
 O4v7EXBlbMbr2U6wP8LzLWSHdA==
X-Google-Smtp-Source: ABdhPJyz10pFQqbxKs6fdRlk9g46fPS0tET1pzRZJeXmO2SDOoUq8WI3p22O7YQLRffCwH0LPA6xWQ==
X-Received: by 2002:a05:6512:239e:: with SMTP id
 c30mr10204798lfv.417.1628377338778; 
 Sat, 07 Aug 2021 16:02:18 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id w6sm1100906ljw.8.2021.08.07.16.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 16:02:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] bus: ixp4xx: return on error in ixp4xx_exp_probe()
Date: Sun,  8 Aug 2021 01:00:16 +0200
Message-ID: <20210807230016.3607666-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_160225_136703_935002C0 
X-CRM114-Status: GOOD (  14.99  )
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
Message-ID: <20210807230016.MDo3HooltUgSHng8u3kL22LIoB10HkBPRj_daUvWBk4@z>

From: Dan Carpenter <dan.carpenter@oracle.com>

This code was intended to return an error code if regmap_read() fails
but the return statement was missing.

Fixes: 1c953bda90ca ("bus: ixp4xx: Add a driver for IXP4xx expansion bus")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this to the same branch where the
bus changes in the pull request "ixp4xx-drivers-arm-soc-v5.15-1"
was pulled in.
---
 drivers/bus/intel-ixp4xx-eb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/intel-ixp4xx-eb.c b/drivers/bus/intel-ixp4xx-eb.c
index 9acd00da413c..a4388440aca7 100644
--- a/drivers/bus/intel-ixp4xx-eb.c
+++ b/drivers/bus/intel-ixp4xx-eb.c
@@ -369,7 +369,7 @@ static int ixp4xx_exp_probe(struct platform_device *pdev)
 	/* We check that the regmap work only on first read */
 	ret = regmap_read(eb->rmap, IXP4XX_EXP_CNFG0, &val);
 	if (ret)
-		dev_err_probe(dev, ret, "cannot read regmap\n");
+		return dev_err_probe(dev, ret, "cannot read regmap\n");
 	if (val & IXP4XX_EXP_CNFG0_MEM_MAP)
 		eb->bus_base = IXP4XX_EXP_BOOT_BASE;
 	else
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
