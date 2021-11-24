Return-Path: <SRS0=HRIu=QL=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE304C433EF
	for <soc@archiver.kernel.org>; Wed, 24 Nov 2021 08:51:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9C2A760FE7; Wed, 24 Nov 2021 08:51:06 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 354B060F5D
	for <soc@kernel.org>; Wed, 24 Nov 2021 08:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 354B060F5D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C6F913F1B1
	for <soc@kernel.org>; Wed, 24 Nov 2021 08:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637743864;
	bh=IXinLogaH0u1DX/MAjR5ojuUpkEsw0tpGb+3hWRZxcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=gSGI6t3lrPvjAqsba21ctCa6NDJ3r903oeZ8MIBJ1eTOfsohYRR63D5pj0P4XbYer
	 BssX9aCkCPvc5DLG82BSZQyVSEf1bzMnyg9x42q5tUFkHGIqfANhZjQzsY53s87eI0
	 jQBWPZthlP680IIH+zBbtbsfIpZc5iN8CX8X7CVE2DmqnZeobsOtG/ceXnzulPBA8z
	 VIDFbhKnG2KkczWNddazvQtN/uhg2KecaD48Ha/xOS1MZ9+gfTVfNzb5qgtUxXekL9
	 ih1dKEivWOjzpoIkyVvNHYBawukJXL6XfS/weHfUo4kDO1rmX8ZOhTyuymSdunhd+n
	 4z7xY45WpOYhw==
Received: by mail-lj1-f198.google.com with SMTP id g19-20020a2eb5d3000000b00219f21cb32bso573918ljn.7
        for <soc@kernel.org>; Wed, 24 Nov 2021 00:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IXinLogaH0u1DX/MAjR5ojuUpkEsw0tpGb+3hWRZxcw=;
        b=lT+0nziqozKjBOXhbTzQYJnr6OQSnP3D7fcv7PcueRf0afHBailhJtohHbzYERguH4
         q9tdvhDGFQgX/0RlqpGnoVS4yZVx+KYXQLqJgplUAE43IWfZ/MS6ptK5n8tVLP4YW8Xq
         KARDRX3vKJGLX7GZ3I0LKsZc/6bqisVUVcNQkY+4inN4N1W1bAy8yw+Qtcsk7Fv/2o8C
         g7ojsmha7tgPCxAShckvHqaPH3tdiFidiNYJpyjXtJFJuikJFSz/HZKXSWVfQnXmkXEv
         wkt9Us7pfu5JUP1T1/0gr2xUewWz17LOnwNHRkzqfVTs+pmaSW+24R9ExNWl8wc/f7+J
         U4eg==
X-Gm-Message-State: AOAM533OMW6kJ8Urv0LoClVlMrnzM6c0Ecr770VkKUJxHTJXsIJP4J/X
	JO9Ue7OF0J4cWe7etDcIXb44Pt3BeduoQg6MnUgeVPZHc8BngF5tVV7C/pfLvlJQVmSInawFPSn
	29wf2ZL36e0kheFe0n/N4sVY=
X-Received: by 2002:a19:5018:: with SMTP id e24mr12493284lfb.294.1637743864225;
        Wed, 24 Nov 2021 00:51:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXEk834OYNTakbq2t8yQJPiO44BP83bvEbOwY0t0xKku5DDVL6muuc/Ul3tDSO2G0drp+3Sg==
X-Received: by 2002:a19:5018:: with SMTP id e24mr12493261lfb.294.1637743864029;
        Wed, 24 Nov 2021 00:51:04 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id t12sm1742952ljg.63.2021.11.24.00.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:51:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] memory: mtk-smi: Fix a null dereference for the ostd
Date: Wed, 24 Nov 2021 09:50:42 +0100
Message-Id: <20211124085042.9649-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211124085042.9649-1-krzysztof.kozlowski@canonical.com>
References: <20211124085042.9649-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yong Wu <yong.wu@mediatek.com>

We add the ostd setting for mt8195. It introduces a KE for the
previous SoC which doesn't have ostd setting. This is the log:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000080
...
pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
lr : mtk_smi_larb_resume+0x54/0x98
...
Call trace:
 mtk_smi_larb_config_port_gen2_general+0x64/0x130
 pm_generic_runtime_resume+0x2c/0x48
 __genpd_runtime_resume+0x30/0xa8
 genpd_runtime_resume+0x94/0x2c8
 __rpm_callback+0x44/0x150
 rpm_callback+0x6c/0x78
 rpm_resume+0x310/0x558
 __pm_runtime_resume+0x3c/0x88

In the code: larbostd = larb->larb_gen->ostd[larb->larbid],
if "larb->larb_gen->ostd" is null, the "larbostd" is the offset(e.g.
0x80 above), it's also a valid value, then accessing "larbostd[i]" in the
"for" loop will cause the KE above. To avoid this issue, initialize
"larbostd" to NULL when the SoC doesn't have ostd setting.

Fixes: fe6dd2a4017d ("memory: mtk-smi: mt8195: Add initial setting for smi-larb")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Link: https://lore.kernel.org/r/20211108082429.15080-1-yong.wu@mediatek.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/memory/mtk-smi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index b883dcc0bbfa..e201e5976f34 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -241,7 +241,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 	u32 reg, flags_general = larb->larb_gen->flags_general;
-	const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];
+	const u8 *larbostd = larb->larb_gen->ostd ? larb->larb_gen->ostd[larb->larbid] : NULL;
 	int i;
 
 	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
-- 
2.32.0

