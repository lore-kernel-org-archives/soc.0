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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A986C433DB
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 18:40:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DDBB5619DD; Tue, 30 Mar 2021 18:40:13 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BDB61968;
	Tue, 30 Mar 2021 18:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6BDB61968
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pl1-f176.google.com with SMTP id g10so6620120plt.8;
        Tue, 30 Mar 2021 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnS1PRqnIWad9K6sQUdO8+C2d50HB1TEH3EOrTdyoTM=;
        b=ERY1OWIe3n9q9Rc58iAruumFsdKYdILEgW50K+So/xh/m76E6nDLLqm9XL3Tmy0z/3
         /JSOXzt2i4MGf1RNnN5DeNeDWMPBx5aj3Cj2SIqA4ieWVN/Q80CSerx8rAe9X1ku/BSV
         jGYjHJICnZCyzhiwNm32ia3Auwk/dCrnlQPuBtyoar5wPyOt53qoutFhGhv4fqWOkVOh
         ImADgyU2p+D9oda6EJ5WJqnoyZo7/+sYPrKDdE5J04p9mqOFRjnw+d1BhD4lGld0MBHj
         BPyXTpx1/Wa2KvKPGMWCaV764H8EEAPxKGx9JM38X14KGXO+axvRE/cs1LYdLFeoPae0
         mRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnS1PRqnIWad9K6sQUdO8+C2d50HB1TEH3EOrTdyoTM=;
        b=NPRG/fzHSdLSh/ejusdeMKm22SfoBl8Pte+Pj9MdJ2yQDx/riIooSqga2JFB6clqtj
         a0LeiYjw93gkEs5dXEj9o88YvfBjxCgfdTSL423hRMuNulXt3u5/MVqsW9vLAx+VDHZC
         VMPFdgA6ibA8euylLEtGYBg0K0Q7U6tHo4cIyLss6YG82IDY0fHAKhmA0FcDs9K1TnxB
         VEwkl/vYPsuakPv7Vym3jAEYAtZ588gUT+5fxQshkAZbNgGIk1M70qoDZvxdnFxzzIEf
         IfW++tEkpuQu5SSKQiJCadCO/lBl+4OEJ+uqPWqdMvSuYTDjYs2aWYwxnB8uLezGutHK
         cR1w==
X-Gm-Message-State: AOAM530fer0iJqhVeOqd4DkxNivaQRrnVkvmcjHdmxoHYbiwHhirFheX
	DWwkQQBRjdXl+btzsQPgEBAaTc7ALws=
X-Google-Smtp-Source: ABdhPJzNKkPTb9XzQwrmn7jfOqOC4rRVXH9aYteyuwvnJ3E8xbNGnkxj8luDNnC9hlIvm3F6ggwXmA==
X-Received: by 2002:a17:902:d64a:b029:e6:30a6:64e3 with SMTP id y10-20020a170902d64ab02900e630a664e3mr35369843plh.28.1617129612595;
        Tue, 30 Mar 2021 11:40:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id gm9sm3307696pjb.13.2021.03.30.11.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:40:11 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
Date: Tue, 30 Mar 2021 11:40:04 -0700
Message-Id: <20210330184006.1451315-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/devicetree

for you to fetch changes up to dcb56d61d5a8acca0a357cc603397bc0272ce4cb:

  ARM: dts: BCM5301X: Set Linksys EA9500 power LED (2021-03-29 11:43:45 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 5.13, please pull the following:

- Rafal fixes YAML warnings for the memory nodes of BCM5301X nodes and
  adds support for the NVMEM NVRAM node on Linksys and Luxul WLAN
  routers. He also fixes up the partitions for the Linksys EA9400 to
  use the newly introduced parser compatible and sets the power LED to
  its default state.

----------------------------------------------------------------
Rafał Miłecki (4):
      ARM: dts: BCM5301X: fix "reg" formatting in /memory node
      ARM: dts: BCM5301X: Describe NVMEM NVRAM on Linksys & Luxul routers
      ARM: dts: BCM5301X: Fix Linksys EA9500 partitions
      ARM: dts: BCM5301X: Set Linksys EA9500 power LED

 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        |  4 ++--
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        |  4 ++--
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |  4 ++--
 arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts    |  5 +++++
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |  4 ++--
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |  4 ++--
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |  4 ++--
 arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        |  4 ++--
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |  4 ++--
 arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |  4 ++--
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |  5 +++++
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts        |  4 ++--
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |  4 ++--
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts       |  9 ++++++--
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts        |  4 ++--
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |  4 ++--
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  4 ++--
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    | 26 +++++++++++++---------
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |  9 ++++++--
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |  9 ++++++--
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts      |  4 ++--
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |  9 ++++++--
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |  9 ++++++--
 arch/arm/boot/dts/bcm47094-netgear-r8500.dts       |  4 ++--
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts          |  4 ++--
 25 files changed, 94 insertions(+), 55 deletions(-)
