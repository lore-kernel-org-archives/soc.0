Return-Path: <SRS0=jhSe=PH=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB472C433F5
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 14:13:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A147A6128B; Tue, 19 Oct 2021 14:13:11 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 793DD610A1
	for <soc@kernel.org>; Tue, 19 Oct 2021 14:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 793DD610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lj1-f172.google.com with SMTP id w23so6438729lje.7
        for <soc@kernel.org>; Tue, 19 Oct 2021 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/25LReJpLmexJOLsg1U4LuPGd27FRP03kBeKy7B8I5o=;
        b=PtXf40cExBsKA6nV5e77WfUEMxzkT2NFQnPtC51Tu9UOotsDNjZoMbvVM/+d40IM9h
         dQmyjQ1bAXa6nMhcNsNH2cmus5iQJHjWtdU6YRrA7XdZRFtrolWVr+WjdSdYYZ/bMGyR
         W26A2vfhvBBB7zEXD299MRX57UMNCuDQjoEFPTA6SPtj3AnA2XychO6W4PieX3DNtf9n
         jcrILVHDbCcjJPYq0nLZCbndOcZUhR/nPMagLtsQ5TkMPCZHudEuRGJumsgyOWnH9bEB
         vXoR/wUCO7+ZYiW0hKWxQ2kdt2BX0zIgArk+BaLwC+pqtzMwsIsmcDx3vFNl0VGVWn5y
         Wkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/25LReJpLmexJOLsg1U4LuPGd27FRP03kBeKy7B8I5o=;
        b=maaomKWhZBiq8ivZxY9a2VZwvxESsoUWJ57Jpo4rKIQx6ZyXuH03QNfTKHkcNTPG0b
         C6iuELUbIoi0CcdTz+r3SWTMEMoP/yfmd8xH8mJCmCPdPNnDIyzWwSfreDfteZ8ArEYD
         fc4EBYS+9pOumqBxFOXJAwSchaYHDZuE2VCIE8IKeHtPQC2ARCQ5BC+toQtXB8IL52Jk
         xA1ZuLquaZ79G/PF4NT+8AEz1ZHzpi/6K34EGxnWlfa73dROaeSbL0AQbUH3+U9vFiw0
         qfAirfz+25OQlzIj2RmzmziFIh+sAs+zH/lvDFSwtrbQJ74kcDmIizywxGapbcVgUbxl
         XPIg==
X-Gm-Message-State: AOAM530/MY9B2R3JGcmWFpDBTI9W+59WLE5by4uL6s3PHdy2qXbt/+fs
	WvhFKlgfbCwmaaUNZC4qMLBtrw==
X-Google-Smtp-Source: ABdhPJzPP4EtERsJnIetXPWwwfIY3iWtk4TXNDwY/nr3BsDBbk3teRY3BsGmScoX1PK5HNNXeEvo3A==
X-Received: by 2002:a2e:6818:: with SMTP id c24mr7148268lja.471.1634652789734;
        Tue, 19 Oct 2021 07:13:09 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id d24sm1957805ljc.2.2021.10.19.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:13:09 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: dinguyen@kernel.org,
	robh+dt@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@semihalf.com,
	mw@semihalf.com,
	jam@semihalf.com,
	ka@semihalf.com,
	tn@semihalf.com,
	amstan@google.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v4 0/2] Add support for the Mercury+ AA1 module
Date: Tue, 19 Oct 2021 16:12:26 +0200
Message-Id: <20211019141228.1271617-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following patches add support for the Mercury+ AA1 with an
Arria 10 SoCFPGA.

v4:
* move devicetree aliases to socfpga_arria10.dtsi
* sort arria10 entries in arch/arm/boot/dts/Makefile

v3:
* replace i2c busno property with devicetree aliases
* reset controller patch added to Philipp Zabel's tree

v2:
* remove spi flash node
* rename memory and mdio nodes
* add gpio nodes
* add busno property to designware i2c driver

Paweł Anikiel (2):
  reset: socfpga: add empty driver allowing consumers to probe
  socfpga: dts: move arria10 aliases to socfpga_arria10.dtsi

 arch/arm/boot/dts/socfpga_arria10.dtsi       | 13 ++++++++++
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi |  7 +-----
 drivers/reset/reset-socfpga.c                | 26 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 6 deletions(-)

-- 
2.25.1

