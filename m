Return-Path: <SRS0=CeWI=7N=gmail.com=lukas.bulwahn@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6B6C6FD1D
	for <soc@archiver.kernel.org>; Tue, 21 Mar 2023 03:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FCDAC433EF; Tue, 21 Mar 2023 03:38:15 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71367C433D2
	for <soc@kernel.org>; Tue, 21 Mar 2023 03:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71367C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id w9so54707705edc.3
        for <soc@kernel.org>; Mon, 20 Mar 2023 20:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679369892;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4reHO6m1QrpLcgDFWTCpHMyCc1+fqEZ3eH5LXVHOdU=;
        b=He+Vpp6rzyqI5SGxD/bHXjf60Dgtj9rwsuwB2bcJ4AtceS9KDgbpLsF6H1jYPgxYuG
         fj5SaN3Cd6uX+U2+a3xrNdOqt7U9jQoRvaFE5ZzE+tgBYn6MOLWfSUhHzi7GbplNuJRC
         VxH1lXGWs0Ai7bl9nSUg9DqxfvhYHO5IUkPUofd/xmVVGd3EZFIG5WAHHWP0nJ1SPIpq
         miEomaX2BFFyjEKltK+Mqab/ORjR5+leiHFQ6YrbVTN2uyvbSbYd1UGObUctxu6T8XSt
         SO/pAReFppScBNXSGJF1uGFwOoXTlSBxVlZ8wtmkTFLLGF5NEfN4YvRKXDsugZBMMfYi
         kKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679369892;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4reHO6m1QrpLcgDFWTCpHMyCc1+fqEZ3eH5LXVHOdU=;
        b=zXAy898azhTXGtwkJtHKkFUaz9o+xKxT2nbCumxqeLBtmRg5oFS9W0u6bg2K11BM2D
         pieKhOKOhgqTd9THfEq3yEzn/pExxC5zBHvfAisMiaix/tYJDl9NLM0l55oPUR0KMBtk
         aQ7F1+dZB3GIIyrWHY93xNNNn/4dr2JoBVdzDi8vDAtgQ5kDZyERRlI7k+QVuxNaYPTi
         teh89oPy9cH/VacU8dhCHr3aEa4p96rQURi0gc6IxA/J9tbbMNX/XH8Gtw1K/V31uI/P
         CMqzBIzuj4YyImmz3URG92YqVsApiIB63iMRYE21LCNuLcaFGos+tqNPPeUl/0rYCQrq
         Rf5g==
X-Gm-Message-State: AO0yUKXbxO58x1lSr+X/vWZO3dmP7sZUQMg0a0aMtaPrTlDmgfvVVolO
	jpR62N8x6bO6PAVr8Ztly6c=
X-Google-Smtp-Source: AK7set9i+KRlF5m1WFQ8OYQm5OEPDMoPwdjE/UJygioKJjSR3dYouu5FbnrEbcgt/Qd5COHT4kqmIw==
X-Received: by 2002:a17:907:1def:b0:8b2:d30:e722 with SMTP id og47-20020a1709071def00b008b20d30e722mr1268754ejc.3.1679369892532;
        Mon, 20 Mar 2023 20:38:12 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:6c2c:25d2:96b3:40e6])
        by smtp.gmail.com with ESMTPSA id g25-20020a50d0d9000000b00501c2a9e16dsm2671755edf.74.2023.03.20.20.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 20:38:12 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] ARM: mstar: remove unused config MACH_MERCURY
Date: Tue, 21 Mar 2023 04:38:10 +0100
Message-Id: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit 312b62b6610c ("ARM: mstar: Add machine for MStar/Sigmastar Armv7
SoCs") adds the config MACH_INFINITY and MACH_MERCURY. The MACH_INFINITY
config is used in the gpio-msc313 driver, but the MACH_MERCURY config is
never used to configure anything in the kernel tree.

Remove the unused config MACH_MERCURY.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-mstar/Kconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-mstar/Kconfig b/arch/arm/mach-mstar/Kconfig
index 5dbea7b485af..fa9709f30b46 100644
--- a/arch/arm/mach-mstar/Kconfig
+++ b/arch/arm/mach-mstar/Kconfig
@@ -20,11 +20,4 @@ config MACH_INFINITY
 	help
 	  Support for MStar/Sigmastar infinity IP camera SoCs.
 
-config MACH_MERCURY
-	bool "MStar/Sigmastar mercury SoC support"
-	default ARCH_MSTARV7
-	help
-	  Support for MStar/Sigmastar mercury dash camera SoCs.
-	  Note that older Mercury2 SoCs are ARM9 based and not supported.
-
 endif
-- 
2.17.1

