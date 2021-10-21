Return-Path: <SRS0=0T0Z=PJ=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A13C433EF
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:17:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3974B611BD; Thu, 21 Oct 2021 15:17:44 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9D661052
	for <soc@kernel.org>; Thu, 21 Oct 2021 15:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B9D661052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f46.google.com with SMTP id z11so2015459lfj.4
        for <soc@kernel.org>; Thu, 21 Oct 2021 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CtRyggFXcz/RI+RZSAJdFk1m/ZMHHugcxXkxvKPW+eg=;
        b=1qG4vDyIEQ/GiHT9Dihtt0I48ay0Jq/+nt45F0YctIhvvhQufvUitJXaEKil5bU+Dt
         7Lra4wO83C++jEi5A78olD8ZZWEmLxculPj35zh3t9gRGQiQNN51WIpZxZdKPSrFfVRE
         DYAryz9Db4P400gNNKUVn/sT7rd9SjxeMEc9Ei0FR83t7jhS4TIh++4/lm9u0dEPbVne
         rM/CR4Y/U9IcikiYTL4h8zYtkfDGS8MV2+E1DZ9EvZ/+rqR0fMgKLE0oFCWPq3MdPCog
         4YiZf5G+tNkOaQRIUgcmF46M2/g7QthZFwyTSjgI4yfY9e3G4X0mUiTHiezYrRwMgTFA
         xvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CtRyggFXcz/RI+RZSAJdFk1m/ZMHHugcxXkxvKPW+eg=;
        b=IVyBebHeT3Po5wAmpL6HP9n6x36toHZJCjzEKnigWDSbniL2+f8teYz+TU/rB2ll6g
         j29CJfG402kNWiwLSR0TiVIhP0LYHE40ZXWFH753MRWO5N72fTy1LZMuJGSE800scG7B
         J6vD7Axma1Dkf/leFfUgwg/tDmEyMYckfK4GV82UI6Xs5IlOsMaluyA5PeFg3rKU6t1m
         a7SNTV9oH1s/FMSefV2SH0RhOosMv1HXhlC3dpB63oOSFvff5+F4G0dpURbvHgNv42D4
         0CK+x5o3e7l2jwDa4tg/evNB3zO8HzIjLU68f44u8Lp+68e/lgUyDQzTkOTXmsXf23Ym
         THPw==
X-Gm-Message-State: AOAM533z91hWYBD/cvutbFoFBcpcMxSkJEQAnMxXza5OSdojanNln9jz
	HCoZ7YjQP6B6aKGHR9Z2OjkUcw==
X-Google-Smtp-Source: ABdhPJzNgwkkDcYkQqDEOGkiFxn/k0IglKMB0mXc7n/fXSmfIuyjyAuuDnQe9l9k9iouk+8WSIha1w==
X-Received: by 2002:a05:6512:3341:: with SMTP id y1mr5908152lfd.513.1634829462309;
        Thu, 21 Oct 2021 08:17:42 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id bt10sm91113lfb.193.2021.10.21.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:17:41 -0700 (PDT)
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
	jam@semihalf.com,
	tn@semihalf.com,
	amstan@google.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v5 0/1] Add support for the Mercury+ AA1 module
Date: Thu, 21 Oct 2021 17:17:35 +0200
Message-Id: <20211021151736.2096926-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following patches add support for the Mercury+ AA1 with an
Arria 10 SoCFPGA.

This version is almost the same as v3, only difference is having
devicetree Makefile entries for arria10_* sorted.

v5:
* revert `move devicetree aliases to socfpga_arria10.dtsi`

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

Paweł Anikiel (1):
  dts: socfpga: Add Mercury+ AA1 devicetree

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 112 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts

-- 
2.25.1

