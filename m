Return-Path: <SRS0=NF2q=QD=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F11EC433F5
	for <soc@archiver.kernel.org>; Tue, 16 Nov 2021 20:14:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 04DA061AE2; Tue, 16 Nov 2021 20:14:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBF46138B;
	Tue, 16 Nov 2021 20:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCBF46138B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id z6so434621pfe.7;
        Tue, 16 Nov 2021 12:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vkZ73FnE8hvSGaDl0VRT3X3tbLp04AVI9RVdGEbEAPQ=;
        b=bdbeDULduysm+tBz6570AnksWHhm5LTNaVE3Vk+Wx9hx2BfXrwVYE1lB018/iT5Crf
         IwMQlfYo2bbKlSW8cifq7vNHobNodSwhYF6V5IL9ZYCJfj6feZu8WD9QJiXinPrHv01r
         hj65n2UqwASjQptbBQldt6v1Qz13Aa2H9AqD74AX8z5vJejphli2TAnhHMNUWtVF2n7t
         nooIvk2nwYCyixc7mKlWEbBLAErfvPEB0HUIHP7sqCuQbVuRVitwLegG9bfLScVK/tvQ
         MHNQw6keXBC+SsQOhqJ5maGWCyhAjGSKwwfQrQDilUPKTSWF+2P6R6qOSUnIcxEIIWaa
         5vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vkZ73FnE8hvSGaDl0VRT3X3tbLp04AVI9RVdGEbEAPQ=;
        b=M9tX2FDCkHtFSuGX4RPI/tqogdxf6LkOXrI+Is9kzXQ1smGcu5861wj5pmcRVtWQGJ
         kGIWoa9lgBTBJJgM+RhZ59OWAbbizgdX5c2avSOr84QVYeRteQ5Ejgx1o5ZGEjd05Ks2
         1ENMwOaCmLwG/JEC247W1bbQ7WxwKahpBEjXEkVmJViIgl8jka6KTgEzJEmxi7KVxMdJ
         vZmPqYH6QYDwOAWAHv1lB6eFAOML5cvLxJfTLWTJFcdbwiMUvVLgL42RsozKKPb1Wpvg
         TakWhwLTZoaMAXCVoHXanT0kkhFPie4LmKUoIX3Pg/p4YY5jz2S/p8jX+N48GghUXBBg
         vnxw==
X-Gm-Message-State: AOAM532AJf5nChzYym6p5OcUBcw0IzWVi4pcp9C/uqZGjU9ZsRmYKNYY
	lSLzEJ7rBSFUPo9p+lp3H6EExUY/U+4=
X-Google-Smtp-Source: ABdhPJxB/DlJWtstmHGN4fJlcjWGjIgShXAtvjrULV/QPwJbGrOyFHHEg8CYig/ALvQPm9q+AKR0TA==
X-Received: by 2002:a05:6a00:a8e:b0:47b:a658:7f4d with SMTP id b14-20020a056a000a8e00b0047ba6587f4dmr42647132pfl.82.1637093674983;
        Tue, 16 Nov 2021 12:14:34 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id on5sm3469955pjb.23.2021.11.16.12.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 12:14:34 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Christian Lamparter <chunkeey@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 5.16
Date: Tue, 16 Nov 2021 12:14:29 -0800
Message-Id: <20211116201429.2692786-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree-fixes

for you to fetch changes up to 98481f3d72fb88cb5b973153434061015f094925:

  ARM: dts: bcm2711: Fix PCIe interrupts (2021-11-15 19:09:47 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
5.16, please pull the following:

- Florian fixes the BCM5310x DTS include file to have the appropriate
  I2C controller interrupt line, and allows the BCMA GPIO controller to
  be used as an interrupt controller. Finally, the BCM2711 (Raspberry Pi
  4) PCIe Device Tree node interrupts are fixed to list the correct
  interrupt output as well as the INTB/C/D lines.

----------------------------------------------------------------
Florian Fainelli (3):
      ARM: dts: BCM5301X: Fix I2C controller interrupt
      ARM: dts: BCM5301X: Add interrupt properties to GPIO node
      ARM: dts: bcm2711: Fix PCIe interrupts

 arch/arm/boot/dts/bcm2711.dtsi  | 8 +++++++-
 arch/arm/boot/dts/bcm5301x.dtsi | 4 +++-
 2 files changed, 10 insertions(+), 2 deletions(-)
