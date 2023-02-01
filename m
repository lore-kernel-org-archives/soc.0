Return-Path: <SRS0=7X9i=55=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4277DC05027
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 04:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C1A7C4339B; Wed,  1 Feb 2023 04:42:09 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E77F8C433EF
	for <soc@kernel.org>; Wed,  1 Feb 2023 04:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E77F8C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id b5so10035852plz.5
        for <soc@kernel.org>; Tue, 31 Jan 2023 20:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OLY0/56VwDeFq1ZitJffXPUetvy2eLlC/+PytyLhzt0=;
        b=YmD+vTG01LRJhTpAWTB2altxwukYJbZr/JycF2LQdeO2p+fv1TmLOTTITgAO/Kc8W3
         jZJpy23gBq1AmAajALWw4j3TRopOoaHfqpIKbIJhVMRvUu0JMUEKkm/NAgsv8McSUebP
         cym5I+PXfTMmdF5/mb4urVLyLmHG4+oeTN0g5isO2WzDLGtCFF+av4jgCXOkBNNw6Z0u
         tss9LWcc/45NBSlwZaokPem0rTScf3OD81b6HrcmdaJ5rzKCyIvFJsAYLf/Ouhuj7N85
         be4RNITJxMfNhEaUv2WHlNoUjf/AF9wZtrZtbqsFOx1LwitipHByy0V9pBu8ajEhL0ut
         UURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLY0/56VwDeFq1ZitJffXPUetvy2eLlC/+PytyLhzt0=;
        b=M0bopFJn9kz9IC6eHyFKrGWA+z5jZVHC4tw1Bmy+DBT7b5AamnTRNhChjNxXo04UXX
         T5CrrDgplRWwDPd05l0XjojnmGBIdlf1eJP5ruqW59ygGvD9AGH8lBe8Lod/17RZYVNC
         EgK2QWlVDChb723GstTRB/9qdm/ti0Es4ipPZtIxNdWDXZvotV4YfBvQ8pJa8OTByDsD
         KNfc4XsJnRRSuWg0SLjMWHopUqcpUhDPbYNHtVBzvQHZKsiqGr5+lTK5Dg7Nak1Jix0j
         3IuC9CB2ccPWl8wprM8MucYk02hG4OJgXCpiGJ8/x1gkhwBOYBkLCwFKlIjZilUmFjJQ
         8irw==
X-Gm-Message-State: AO0yUKXx4Q93uOt7b9/b0r4AI2/p+pA5EdtTnJO7p1Vq+hcSYDREcNNv
	Oktjah/xzqjecFE+1IalF06Q5mnKyzE=
X-Google-Smtp-Source: AK7set9TKs0QJ77vstsWpx3KnoqZcUEuIfNWhVJ3bTdyrg6xMZKwC5hTpjatCrVAbdApWxh0xlP4HQ==
X-Received: by 2002:a17:90b:1809:b0:22c:6230:ef21 with SMTP id lw9-20020a17090b180900b0022c6230ef21mr712055pjb.33.1675226526646;
        Tue, 31 Jan 2023 20:42:06 -0800 (PST)
Received: from voyager.ibm.com (pa49-178-126-220.pa.nsw.optusnet.com.au. [49.178.126.220])
        by smtp.gmail.com with ESMTPSA id h15-20020a17090a054f00b002276ba8fb71sm299403pjf.25.2023.01.31.20.42.04
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 20:42:06 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] ARM: dts: wpcm450: Add nuvoton,shm = <&shm> to FIU node
Date: Wed,  1 Feb 2023 15:11:58 +1030
Message-Id: <20230201044158.962417-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

The Flash Interface Unit (FIU) should have a reference to the Shared
Memory controller (SHM) so that flash access from the host (x86 computer
managed by the WPCM450 BMC) can be blocked during flash access by the
FIU driver.

Fixes: 38abcb0d68767 ("ARM: dts: wpcm450: Add FIU SPI controller node")
Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Link: https://lore.kernel.org/r/20230129112611.1176517-1-j.neuschaefer@gmx.net
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Hi soc maintainers, please queue this as a fix for v6.2 if possible. If
you would prefer not then it's fine to go in for v6.3.

 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
index b637241316bb..fd671c7a1e5d 100644
--- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -480,6 +480,7 @@ fiu: spi-controller@c8000000 {
 			reg = <0xc8000000 0x1000>, <0xc0000000 0x4000000>;
 			reg-names = "control", "memory";
 			clocks = <&clk 0>;
+			nuvoton,shm = <&shm>;
 			status = "disabled";
 		};
 
-- 
2.39.1

