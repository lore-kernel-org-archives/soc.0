Return-Path: <SRS0=etRg=I4=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2C5C433C1
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 18:40:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4B16F619E5; Tue, 30 Mar 2021 18:40:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF82961968;
	Tue, 30 Mar 2021 18:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF82961968
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pl1-f176.google.com with SMTP id w11so6624497ply.6;
        Tue, 30 Mar 2021 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H3Xg6pVdKFcLHkDnuynv+KrzACQdL7Z+QfspHhlmM7o=;
        b=t0IZ1UcOUonTShG95R7idEdFtvN6FmBLIOe6k8Jlsg3HkuHiY6smRWgd5uiou1rlOq
         kypxQMKkcTuS7w4fRID25BEDKryOLfYEmUFjGo2oJVvhENCCPdCzEIxhbDQGnRvj2yq5
         t75uwNsacilOe/AKuXMIgX1KrkUzx9XMWN7dW49lFE9GJhPhfU/VRTgDtgtioOkbWtW5
         I0H7a3JMPyTKXRXG46u5Cpgb3c3YjiWqlQLqPUxdIE9gZjdKh7RZEGeTPR7GY4Z7PhoW
         cNsm2H/8KEkQZajPst5re/lk6ViRe8RTC+/8YT8tjAiBFZMdZ7W2UyUzjSLMTzejHw2o
         JwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H3Xg6pVdKFcLHkDnuynv+KrzACQdL7Z+QfspHhlmM7o=;
        b=oahbV2kq658kwDzDrlbEKkBXykHuW20JdnN5z4FANSsmOOZLyuHBVQCsdEWzImDuRF
         XCvFjkmpmVEOD2iCQIumUDHq98tUkhb4m/IKZX/poKShF9Lx/qj+ssXqgjUbZgSGfbck
         Q0AlEYaTQM6GiP+l9fGvQ8YId1u+C1vkMgKIo6pdDTw92q6RwfWzwKGTp3/q6lsFGynu
         sMtORyERHEH+vqmqa6B+K/p8Pzx8bEdNlxchBS9EgjE7mG8TvuojpyeJJBijvLpxbe0Z
         F1JewxX8TKV0EIGvrYD5puDFIhW+pbaBeKEOkmuY3QqrVAWVfNPKublh9MAbEENhXtBG
         Hx9Q==
X-Gm-Message-State: AOAM532ViSzcBuY/dNMsyVs89sndXnJ8GEWMdQOa575yna5poa1D9HLs
	Kj+c04l7DZLAtU/CMn65KsB5F2ydI8Q=
X-Google-Smtp-Source: ABdhPJyokzrIZazmQ0BY78LLblAdzpZhyC/+dZc80/RYigA2kXH+fmyaB+L9azwZo22SIz3pEZF4hA==
X-Received: by 2002:a17:90a:8b97:: with SMTP id z23mr662960pjn.1.1617129613930;
        Tue, 30 Mar 2021 11:40:13 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id gm9sm3307696pjb.13.2021.03.30.11.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:40:13 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.13
Date: Tue, 30 Mar 2021 11:40:05 -0700
Message-Id: <20210330184006.1451315-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330184006.1451315-1-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/devicetre-arm64

for you to fetch changes up to 9f01f5cdb548352418b34ce77db02a560fe2913b:

  arm64: dts: broadcom: bcm4908: add Ethernet MAC addr (2021-03-29 11:44:31 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 5.13, please pull the following:

- Rafal continues to add support for the 4908 SoCs and describes the USB
  PHY, firmware flash partitions and Ethernet switch and Ethernet
  controller. He also adds support for the TP-Link Archer C2300 V1
  router and upates the Netgear R8000P and Asus GT-AC5300 routers network
  ports description.

----------------------------------------------------------------
Rafał Miłecki (11):
      arm64: dts: broadcom: bcm4908: describe USB PHY
      arm64: dts: broadcom: bcm4908: describe Ethernet controller
      arm64: dts: broadcom: bcm4908: describe Netgear R8000P switch
      arm64: dts: broadcom: bcm4908: add remaining Netgear R8000P LEDs
      arm64: dts: broadcom: bcm4908: describe firmware partitions
      arm64: dts: broadcom: bcm4908: fix switch parent node name
      dt-bindings: arm: bcm: document TP-Link Archer C2300 binding
      arm64: dts: broadcom: bcm4908: add TP-Link Archer C2300 V1
      arm64: dts: broadcom: bcm4908: set Asus GT-AC5300 port 7 PHY mode
      arm64: dts: broadcom: bcm4908: add Ethernet TX irq
      arm64: dts: broadcom: bcm4908: add Ethernet MAC addr

 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  |   1 +
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |   1 +
 .../broadcom/bcm4908/bcm4906-netgear-r8000p.dts    | 107 +++++++++++-
 .../bcm4908/bcm4906-tplink-archer-c2300-v1.dts     | 182 +++++++++++++++++++++
 .../broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts    |  44 ++++-
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  |  47 +++++-
 6 files changed, 375 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-tplink-archer-c2300-v1.dts
