Return-Path: <SRS0=n/Pu=63=gmail.com=tomato1220@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C6AC64EC4
	for <soc@archiver.kernel.org>; Fri,  3 Mar 2023 06:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B714FC433D2; Fri,  3 Mar 2023 06:36:59 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFB79C4339C;
	Fri,  3 Mar 2023 06:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFB79C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id bo22so1537605pjb.4;
        Thu, 02 Mar 2023 22:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVsweOV5Fj7dNrLOlFZRp9kTopvKPiRPfqHp7y5J/DA=;
        b=m8eECwzrQBfNMqoIkcDa+kFKYHUPtYFc4DCR16BTgCK+6eCS1X2gZooW86+1c04cwV
         yBWB5OXlZY978Kzj+33XiRpVG/49YC/JlWbWIfdc0i+28QAGBI6Nby6E5EeQb4O7Q6jL
         i6oC+7wk+TEMfvGZt0eIx+6GpREU+idzWhKFkAiH8A+C2dAoQ4AflFHGB1yMBdanJPYs
         h7gkDR6TmnydZo2OSNezNeVIeZNeO79kYtYb2BWm5VP79iJgeQDoa8vZRQMf7t2VfflX
         GlAT7FZgsnHpv44Gh/LxTQHkYxWYwd4pwjgPjjFbL67ZzHr04XIlYHzeHiDxm5i6pihl
         EDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVsweOV5Fj7dNrLOlFZRp9kTopvKPiRPfqHp7y5J/DA=;
        b=bKCunmopBHj0b+/+hUXitpPSP/M4fVogXmw3ZlBg4djf4NuHR7jFfdoVdPb+OEfQOm
         71IWTEI10jqVGcgDFG4O/FaT0/fgUH8vf9G9eB2890ttNxExXRsgD3U/LGkUjaW6Hac0
         sQq6l+p68/wUDhK3UgdNMWRnH++G7lAwkJuLQUiAfpuw95rl/ZBhEEdMsOBv/XV2ll6V
         4Sq6p1IzeptHQjvBpoZNd2WNqYOpUTanCCN+DXzrullOXiqhN27tNdBc3LsksWrLNGic
         Uf8m+z+k8GqrwcdQRggl7WWcwUchu/dBeMwKhW5izKCm9d/Dr9fN5Z/p2jWlZYfCe+bp
         eW6w==
X-Gm-Message-State: AO0yUKXD52XbarTYBQxfGou2CWpKOACwO3QE7DWaFFbvQ7OiJ0Jh+tP7
	WXXqjHHtjqIzhSjef2v6NaA=
X-Google-Smtp-Source: AK7set9PZFvojaiikRHm2IkFZ4HkcMxqxGOw5ocputE+L4/QnNnEgrR5RGzSmjhJadJ52rbXEqKAnA==
X-Received: by 2002:a17:90b:1b52:b0:237:b64c:6bb3 with SMTP id nv18-20020a17090b1b5200b00237b64c6bb3mr653916pjb.11.1677825418152;
        Thu, 02 Mar 2023 22:36:58 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:36:57 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	fran.hsu@quantatw.com,
	David Wang <davidwang@quantatw.com>
Subject: [PATCH 4/7] ARM: dts: nuvoton: gbs: Remove ethernet aliases
Date: Fri,  3 Mar 2023 14:34:32 +0800
Message-Id: <20230303063435.803097-4-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alias "ethernet" in dts conflicted with systemd v252 naming rules and
caused a rename. Remove the aliases to avoid renaming.

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index a33766e430d7..b27fe12e3962 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -10,7 +10,6 @@ / {
 	compatible = "quanta,gbs-bmc","nuvoton,npcm730";
 
 	aliases {
-		ethernet1 = &gmac0;
 		serial0 = &serial0;
 		serial1 = &serial1;
 		serial2 = &serial2;
-- 
2.25.1

