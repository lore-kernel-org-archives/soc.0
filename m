Return-Path: <SRS0=WPFH=4C=schmorgal.com=doug@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A092BC4332F
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 00:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 514A0C433B5; Sun,  4 Dec 2022 00:51:56 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2ADD4C433C1
	for <soc@kernel.org>; Sun,  4 Dec 2022 00:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2ADD4C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schmorgal.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=schmorgal.com
Received: by mail-pg1-f169.google.com with SMTP id h193so7433808pgc.10
        for <soc@kernel.org>; Sat, 03 Dec 2022 16:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAIdxB/uhWaqluy9p1yExqxU/j3lY8YtbD1rShEtynw=;
        b=cKMxtbJnpIJEqPHXyzAbx2pJ5Ikfa8MkbHc9Jm0g8oe9tiIw7/3lE+FufaAtWhDSYa
         5huOrqN2dzcWyMfWIao7Oi/6tu3OLdn5WlEreeS4YsvxwunaKVDgMJFVe7zNi9AdqBWB
         VkhcWF+myAhT6w3OthUYkb9Bzpf/RuNmB2ofg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAIdxB/uhWaqluy9p1yExqxU/j3lY8YtbD1rShEtynw=;
        b=spwTqj2DzuvVPp4mP7we3qC8gW+OiEgCqD+Gat8uWFOFUR2JXGfbibpwFfL7mQs7UP
         iuZ7vKnUrI2t38LoPFpSnMZH9UJSSCMeOv0y9D95/Rr6Slmx3cxRcyqWl/m6fa1TN3N7
         tRjxfJFw9/AuePy11Wt0dVCHfajOP/kcOGTB+zZkVYSiswwz6jIRbFye48UkaV1u5suB
         5ELZG0vDW2KlHcXElRWKGtRT7BfOH+CL3X2FT4m9hRMuvRDE+BJfpX09Ex9nT28kStOl
         bGN4I01mxve3PmYu6Ae+EETlpL+CDvh30XKdOJSpikEqv+1gy6T1P/556Q02wxTVZ5cm
         3Wxw==
X-Gm-Message-State: ANoB5pnJgEjh5JRX5IF4Q0ORiJ2Uka6K+1MXhw/jODje3V/+vRzRobMN
	rVYkEz/9g7h4IRVTXzlxu6Mg3A==
X-Google-Smtp-Source: AA0mqf4Kt49GMYnoKU8LCS8WR0zqHaeAoF29MwClPOxS6l1UBCVn1hOk6L+c8RK/tabnPMtMqc+/QQ==
X-Received: by 2002:a63:f346:0:b0:477:b53d:19 with SMTP id t6-20020a63f346000000b00477b53d0019mr46174630pgj.166.1670115114419;
        Sat, 03 Dec 2022 16:51:54 -0800 (PST)
Received: from doug-ryzen-5700G.. ([192.183.212.197])
        by smtp.gmail.com with ESMTPSA id 24-20020a631358000000b004393f60db36sm6058977pgt.32.2022.12.03.16.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 16:51:53 -0800 (PST)
From: Doug Brown <doug@schmorgal.com>
To: Russell King <linux@armlinux.org.uk>,
	Lubomir Rintel <lkundrak@v3.sk>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Doug Brown <doug@schmorgal.com>
Subject: [PATCH 0/2] ARM: mmp: PXA168 timer fixes
Date: Sat,  3 Dec 2022 16:51:15 -0800
Message-Id: <20221204005117.53452-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains a couple of bug fixes for the PXA168 timer. The
clock wasn't assigned in pxa168.dtsi which eventually resulted in a hang
at every boot after the clock was disabled. Also, the timer read
function wasn't waiting long enough to capture the new timer value,
which resulted in erroneous high CPU usage percent being reported with
CONFIG_NO_HZ_IDLE=y.

I don't have any other MMP systems to test with, but I suspect the timer
read delay problem also affected them. For example, the OLPC XO-4 kernel
disabled CONFIG_NO_HZ due to incorrect high CPU usage reporting:

http://dev.laptop.org/git/olpc-kernel/commit?h=arm-3.5&id=5bd2520f8f51fc44911ec7a86b84f41a1f3e384c

CCing soc@kernel.org because I didn't receive any responses when I
submitted these last time and was hoping these fixes could get merged.

Doug Brown (2):
  ARM: dts: pxa168: add timer reset and clock
  ARM: mmp: fix timer_read delay

 arch/arm/boot/dts/pxa168.dtsi |  2 ++
 arch/arm/mach-mmp/time.c      | 11 +++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.34.1

