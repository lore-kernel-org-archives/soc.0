Return-Path: <SRS0=pvkH=TX=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6D3C433EF
	for <soc@archiver.kernel.org>; Sat, 12 Mar 2022 18:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 615E6C340EE; Sat, 12 Mar 2022 18:06:22 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8426C340EB
	for <soc@kernel.org>; Sat, 12 Mar 2022 18:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8426C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id s11so10632961pfu.13
        for <soc@kernel.org>; Sat, 12 Mar 2022 10:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvNq+45Cgx0F9RlJNbV6eVIGlsmW+8HM1hn3gRVvPWk=;
        b=BdFHcOFjPNbp1ClgSl4cyaGkb5MGKSVWZdY+OtHHZfGHtXKxN28jZZxVPQtkBFiS06
         GZEUZR1GSzIdkVQsh83Bixkp1BHYgQ6ZGzl/tIytqspcbY48Kf8UwKgCPmEHFn3pI97n
         REiy22FPkON3FN0ck3/jcmt9VssS8fG/wH4NA9Duxpsk5Itm5EgH2Pvq6MhkNLc4HG8J
         8rwHl/9WEGKrsvw02JwZ5GtUPV08BFaJ6/xMBbqobumoBuR8rox2TaDALeattwmyita9
         7opxYp+bS+wauBOBa0m8kurcBLW5yaFusZ8PhrG67B8Ei7bc/yZClni0yL9C4gPhlthM
         IxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvNq+45Cgx0F9RlJNbV6eVIGlsmW+8HM1hn3gRVvPWk=;
        b=NDHo4pI83kV0Cv70v1yeegKrOF7rcYwdsMtTH06GglKjoMEYmnnElSLiGM7zstmo5l
         FNbJWLHZ9RuadFScQhj/URqfmca9SqEVzCC1yJfuin/CG8Ofs0gT2EZWCJTx6RAlGmiW
         rlwr2POY1nRhYbktpWSe9xu7fMNfz25O3yErsB2TkmscolfwnVvP3hxlJZBs65sBDE2w
         12LXoAk+s78AKqeW+/BswjUSrkxsi/5K62BRGCNu6lUDZHmwrz39cWw6e6LOdHfpWJVM
         TsD+xcy/sMg0Lw5+iXrggkVDw8NtbEpjwSuNEo16u1cjonxcMG6KlXvXJJd1oGMU0vj8
         mSDA==
X-Gm-Message-State: AOAM5319LWLK3JXdtJXKmhNIHrtbdiThWv1oUrecnApJ3sAdeMw8PDk6
	ThTVLsb3paPjqj3l44uky3uYFR/DhuQ=
X-Google-Smtp-Source: ABdhPJxyh0A25Tmu6u5SH/ooAqZ5mdXki0nzOSIzCUFbTtXvAoNYNvhzqX1hQjol5DBouIIcS5LXqg==
X-Received: by 2002:a05:6a00:2444:b0:4f7:73bb:7582 with SMTP id d4-20020a056a00244400b004f773bb7582mr14509995pfj.39.1647108380870;
        Sat, 12 Mar 2022 10:06:20 -0800 (PST)
Received: from localhost.localdomain ([122.161.53.68])
        by smtp.gmail.com with ESMTPSA id z72-20020a627e4b000000b004f70cbcb06esm14017951pfc.49.2022.03.12.10.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 10:06:20 -0800 (PST)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] More DT fixes for arm,pl022
Date: Sat, 12 Mar 2022 23:36:13 +0530
Message-Id: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per spi pl022 binding, spear and lpc18 platform require fix in dma
properties to resolve dtbs_check warning.

Patch 1(spear): just reorder entries to resolve warning.
Patch 2(lpc): require reorder of dma pairs, and also within pairs.
In general, dmas follow below convention:
<rx,tx> = <x+1,x>
Keeping this mind, I updated entries for dma pairs.

This patchset is based on
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git, arm/dt

Kuldeep Singh (2):
  ARM: dts: spear13xx: Update SPI dma properties
  ARM: dts: lpc18xx: Update SPI dma properties

 arch/arm/boot/dts/lpc18xx.dtsi   | 19 +++++++------------
 arch/arm/boot/dts/spear13xx.dtsi |  5 ++---
 2 files changed, 9 insertions(+), 15 deletions(-)

-- 
2.25.1

