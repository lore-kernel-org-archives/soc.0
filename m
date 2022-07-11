Return-Path: <SRS0=WXVb=XQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CF9C43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32103C341C8; Mon, 11 Jul 2022 16:45:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58ECFC34115;
	Mon, 11 Jul 2022 16:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58ECFC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id 5so4894194plk.9;
        Mon, 11 Jul 2022 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=05317JMrrhdo6XtxgEF5dijO3IPUTpNXPynUdoR3frI=;
        b=C3jbDDDpLrZ4BFYq+MBjwvKoMLJjQnUcJjfvUNJaytIHC36LpvDNAXuu/iUECWBKs0
         h5bhKynMj3CiiMfTKkzh2Anra0gupl0U8CENU/l2fFeYSeeB4o6HwhvxBpkfxMKSanjf
         0OWqwzhRmqAH+9LzWNYJn6SxI6dt1Ytia0fv+CSCP3+9hwXXOR3cGB0qynuuBYaeX42N
         eHy/nLbA9dx6CA7dwVDxq1Juy33xIWFKD6AUHoGL0gOzbCJOb7qT7LRaHpJHPygR/1lz
         CAJLOylNlIh3rAz12xCzXQKy3COEra59ISLux+vSoE6Cm/lA8Ud1Z6Adid5NM4t5kPB1
         v8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=05317JMrrhdo6XtxgEF5dijO3IPUTpNXPynUdoR3frI=;
        b=eidvYMBUMQJj8MITh1R1UQ55AXIQqdd/HiQioey/gh5bbV3mV6wz7Yt5Ndp/N8bpzy
         gJBAkNMsVgu+VXRUd1fDpWTzF0z3CstQiOnx2g8KqlZuIhgXRJVbYm2iOa3OA+C/xy9E
         uR2TRwxKSu7CGtytG36G3kCNyJ4Lk78SiuzFpCXwmYiiDYyDfT1Zq3fZEZb744tF6eWV
         jhhG6fsH64NY92wwAEY2q3RTaH/hIUXTRRxaKwSNcl5d/eiVtyEYBy5/niDDuWoJpzAg
         tFhoaZPZZYcjEzTfQA9dkJ3NIosKfOep8TiDSRLjhgvXBOY+w38DZc/8QplZvwz1czW5
         zVkw==
X-Gm-Message-State: AJIora83L1+y2LdmwiAFRZc0wMKVpYYNFw8UfA1ZBiZEOqJDU638HEzE
	ZWRn/y7nxiEyV6Dxaz8K9UmoF3MQNbM=
X-Google-Smtp-Source: AGRyM1vdlVePzTGF91HflPIkzwEGTul3EC81BnghmR1tV1poHoGB8QmPckTWJEbh19F0wux3zPi4FQ==
X-Received: by 2002:a17:90a:d714:b0:1ef:b93d:fc4d with SMTP id y20-20020a17090ad71400b001efb93dfc4dmr19013420pju.49.1657557904494;
        Mon, 11 Jul 2022 09:45:04 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0052ab9f1fe45sm4961266pfi.120.2022.07.11.09.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:45:03 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 0/7] Broadcom SoC updates for 5.20
Date: Mon, 11 Jul 2022 09:44:44 -0700
Message-Id: <20220711164451.3542127-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Olof,

The highlights of the pull requests are:

- William and Anand add support for a large number of Broadband Carrier
  Access (BCA) DSL/PON/Wi-Fi router chips under the ARCH_BCMBCA umbrella
  and we expect to see more activity in the future on these chips.

- Peter, Nicolas and Stefan add support for the V3D GPU on the Raspberry
  Pi 4 (BCM2711)

You will meet the following conflict which was identified in linux-next:

https://lore.kernel.org/lkml/20220711095520.4fad4c97@canb.auug.org.au/

which can be resolved by removing arch/arm/mach-bcm/bcm63xx.c

Thanks to these changes having soaked in linux-next for a couple of
weeks, we do not expect other merge conflicts or problems.

Thank you!
-- 
2.25.1

