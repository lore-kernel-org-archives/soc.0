Return-Path: <SRS0=alyK=O4=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F371EC433F5
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 14:07:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CB80461029; Fri,  8 Oct 2021 14:07:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A428760273
	for <soc@kernel.org>; Fri,  8 Oct 2021 14:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A428760273
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f52.google.com with SMTP id x27so40002204lfu.5
        for <soc@kernel.org>; Fri, 08 Oct 2021 07:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LM8exXLD+iGuyAMHH60gDe9grHMgI1JcUjlMPF2x57k=;
        b=wAIKT/OncDDU+q8mVwqj4X35J7BFH8ELaEOdEzvEv3W0NbgxVugDsVUMEqKlohkPKh
         RHzCsflFbWooMg9e6f282ohA9VC2MXriO+a79584q6Y+Hsbg+LwkLCo583NxX2I+xrGF
         f52GTnVmhZW4vTU61p8cgoQfZN/fyyVHMOb7kLd8v0EnUNlIsDpSCvd7/rFWH/yW96hF
         1VRWSKb3GnOblia+mjfXcQea+CozHQWm09MW7oL71UIZfXFmbbK5iSl5sbJswwZjl5bX
         BJq8loVlSMGzLdsuPaOm6QbCrRBSfWeQl47EjIQv2cOimOxP3jocea3XP5BS/icLE6oy
         kLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LM8exXLD+iGuyAMHH60gDe9grHMgI1JcUjlMPF2x57k=;
        b=NxA+E0Mj3PfP1QmoLRDaGna7bQA146B8C08IM5oPzMN6dYi3QMOY46nIbpHCZ8+jXp
         tNRwwCkh6OFwH+AL/hbbNu1bQiEHadE2Yo3aEhujEFJCe50njJDwX9Z2kesEznb3pFTI
         iuaB5GzE6qQKgEjNRxNDkDgDb/rj+g4PIKuUwLt6YrlcvRNU9tqMT4Ga/ae/4QKVUSCw
         j2wSkOlydEU4VssV4R44jr3YTctYiVhPsmhNAiPKP4KmMX1ByVujUxFBdjKMqGF+oTNB
         W1rJoGoQSuAAxD44ujb6lzah/M4BEuHykUd+LPGQmCDrmst2ULLz47Kifa4xoWaKCchS
         cWpA==
X-Gm-Message-State: AOAM533+Hig7tgRZja1AJBtIko960kt/f6j7zz292p3+m4O8xTfWZhaS
	JY/3h0sLj2L3MXIpYU7Bqtfu0w==
X-Google-Smtp-Source: ABdhPJwqlRgCQh8TR4LXiGYJmEDK2IdsjYET0MnbpUDaPuZrXzxm09QRxDQ4ZXpaCtyZC1PRrAa1yw==
X-Received: by 2002:a05:6512:23a9:: with SMTP id c41mr7918952lfv.298.1633702077040;
        Fri, 08 Oct 2021 07:07:57 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id j23sm252667lfm.139.2021.10.08.07.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 07:07:56 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	dinguyen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@semihalf.com,
	mw@semihalf.com,
	ka@semihalf.com,
	tn@semihalf.com,
	jam@semihalf.com,
	amstan@google.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v3 0/1] Add support for the Mercury+ AA1 module
Date: Fri,  8 Oct 2021 16:07:34 +0200
Message-Id: <20211008140735.3290892-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following patches add support for the Mercury+ AA1 with an
Arria 10 SoCFPGA.

The reset controller patch was added into Philipp Zabel's tree:
https://git.pengutronix.de/cgit/pza/linux/commit/?h=reset/fixes

The i2c bus numbering property was replaced by aliases in the
devicetree.

Paweł Anikiel (1):
  dts: socfpga: Add Mercury+ AA1 devicetree

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 112 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts

-- 
2.25.1

